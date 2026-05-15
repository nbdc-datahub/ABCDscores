# Medication use and history

## Introduction

Medication information collected in the ABCD Study is rich but
fragmented across over-the-counter (OTC), prescription (RX), and
detailed history tables. The functions in this package translate raw
`RxCUI` (RxNorm Concept Unique Identifier) into analytic summary scores
by combining the shared configuration objects described in `rx_map`.

> 1.  This product uses publicly available data from the U.S. National
>     Library of Medicine (NLM), National Institutes of Health,
>     Department of Health and Human Services; NLM is not responsible
>     for the product and does not endorse or recommend this or any
>     other product.
> 2.  This package includes NLM RxNorm information as of *October 2025*.
> 3.  The medication estimated use values and categories are generated
>     from the following reference: Lopez, D. A., Overholtzer, L. N.,
>     Rhee, K. E., Buchbinder, N., Ruiz-Orozco, G. E., Steinhilber, S.,
>     Tognoli, M., Lopez-Flores, A., & Nagel, B. J. (2025). Classifying
>     and visualizing medication use in the Adolescent Brain Cognitive
>     Development (ABCD) Study. *medRxiv*.

This vignette outlines how to:

- inspect the configuration tibbles that drive medication scoring,
- map raw `RxCUI` values to ingredient, brand, and estimated use
  categories, and
- compute estimated use flags that align with the ABCD tabulated
  datasets.

``` r

library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(tidyr)
library(glue)
library(ABCDscores)
#> Welcome to the `ABCDscores` package! For more information, visit: https://software.nbdc-datahub.org/ABCDscores/
#> This package is developed by the ABCD Data Analysis, Informatics & Resource Center (DAIRC) at the J. Craig Venter Institute (JCVI).
#> If `ABCDscores` is helpful to your research, please cite:
#> Zhang, L., Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C. J., Dale, A. M., & Linkersdörfer, J. (2025). ABCDscores: An R package for computing summary scores in the ABCD Study. bioRxiv. https://doi.org/10.1101/2025.09.04.674066
```

## Medication configuration objects

The exported objects documented in `data.R` supply everything the
scoring functions need:

- `rx_map`: list of five lookup tables (`rx_ingr`, `rx_pingr`,
  `rx_mingr`, `rx_bn`, `rx_estuse`) pairing `RxCUI` values with labels
  or categories.
- `rx_config`: per-variable instructions indicating which table,
  filtering column, primary/secondary `RxCUI` source columns, and output
  name used when translating a `RxCUI` to a category.
- `rx_config_estuse_flags`: a mapping from estimated use categories to
  the flag variables distributed in the ABCD tabulated files.

Each row of `rx_config` specifies a primary `RxCUI` source column
(`col_summary1`) and a secondary source column (`col_summary2`) used
when `col_summary1` is `NA`. The optional gate column (`col_add`) is
applied only when the corresponding flag (`use_col_add1` or
`use_col_add2`) is `TRUE` and the selected source column has data. Here
is a preview of the first six rows:

The estimated use flag configuration is similarly compact but ties the
estimated-use indices back to the public summary score names.

## Category mapping helpers

There is one general-purpose helper plus table-specific wrappers:

- [`compute_ph_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md)
  maps every row in a supplied `rx_config` tibble.
- [`compute_ph_p_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md),
  [`compute_ph_y_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md),
  and
  [`compute_ph_p_dhx_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md)
  pre-filter the configuration for the parent medication, youth
  medication, and parent pregnancy detailed-history tables.

The helpers validate both the incoming data and the configuration
columns before dynamically joining the appropriate `rx_map` lookup and
renaming the `category` field to the destination score name.

### Minimal example

The following toy data set uses one OTC slot (`idx == "001"`) and
includes explicit scenario rows to cover the branch logic in
[`compute_ph_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md):

- primary source used without gating (1yr),
- primary source used without gating (2wk),
- fallback source used with gating pass,
- fallback source used with gating fail,
- primary source used with gating pass,
- primary source used with gating fail, and
- both sources missing.

For each scenario row, only one of `col_summary1`/`col_summary2` is
populated (or both are `NA`), matching the intended input pattern.

### Logic flow

``` text
Start: data + every row in rx_config
  |
  +--> col_summary1 has value?
        |
        +--> Yes: rx = col_summary1
        |      |
        |      +--> use_col_add1 is TRUE and col_add is available?
        |              |
        |              +--> Yes: col_add == "1" ?
        |              |       |
        |              |       +--> Yes: keep rx
        |              |       +--> No:  rx = NA
        |              |
        |              +--> No: keep rx
        |
        +--> No: col_summary2 has value?
               |
               +--> Yes: rx = col_summary2
               |      |
               |      +--> use_col_add2 is TRUE and col_add is available?
               |              |
               |              +--> Yes: col_add == "1" ?
               |              |       |
               |              |       +--> Yes: keep rx
               |              |       +--> No:  rx = NA
               |              |
               |              +--> No: keep rx
               |
               +--> No: rx = NA

Final step: map rx to category via rx_map and write score column
```

``` r

demo_rx <- tibble(
  scenario = c(
    "primary_no_gate",
    "fallback_gate_pass_2wk",
    "fallback_gate_fail_2wk",
    "primary_no_gate_2wk",
    "primary_gate_pass_24hr",
    "primary_gate_fail_24hr",
    "both_sources_na"
  ),
  participant_id = paste0("sub-", sprintf("%04d", seq_len(7))),
  session_id = rep("ses-00A", 7),
  ph_p_meds__otc__id_001 = c(
    NA_character_, NA_character_, NA_character_,
    "203302", NA_character_, NA_character_, NA_character_
  ),
  ph_p_meds__otc__id_001__v01 = c(
    "161", "73", "73",
    NA_character_, "58930", "58930", NA_character_
  ),
  ph_p_meds__otc_001__01 = c("0", "1", "0", "0", "1", "1", "1"),
  ph_p_meds__otc_001__01__06 = c("0", "0", "0", "0", "1", "0", "1")
)

rx_config_subset <- ABCDscores::rx_config |>
  filter(
    table_name == "ph_p_meds",
    med_type == "otc",
    idx == "001",
    catg %in% c("ingr", "estuse")
  )

demo_rx_res <- demo_rx |>
  compute_ph_meds_catg_all(rx_config = rx_config_subset)

demo_rx_res |>
  select(
    scenario,
    ph_p_meds__otc__id_001,
    ph_p_meds__otc__id_001__v01,
    ph_p_meds__otc_001__01,
    ph_p_meds__otc_001__01__06,
    ph_p_meds__otc__1yr_ingr__001,
    ph_p_meds__otc__1yr_estuse__001,
    ph_p_meds__otc__2wk_ingr__001,
    ph_p_meds__otc__2wk_estuse__001,
    ph_p_meds__otc__24hr_estuse__001
  ) |>
  reactable::reactable(
    striped = TRUE,
    defaultColDef = reactable::colDef(minWidth = 140),
    columns = list(
      scenario = reactable::colDef(width = 200)
    ),
    theme = reactable_theme
  )
```

[`compute_ph_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md)
automatically handles the joining, renaming, and optional column binding
(`combine = TRUE` by default). Setting `combine = FALSE` returns only
the newly created summary scores so they can be merged later with a
row-wise key such as `participant_id`/`session_id`.

## Estimated use flags

The estimated use workflow builds on the category mapping step by first
creating a set of `estuse` category columns (one per configuration slot)
and then scanning each participant record for any category that matches
the `idx` requested by `rx_config_estuse_flags`.

`scores_ph_rx.R` wraps this logic inside:

- [`compute_ph_meds_estuse_flags_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_estuse_flags_all.md)
- [`compute_ph_p_meds_estuse_flags_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_estuse_flags_all.md)
- [`compute_ph_y_meds_estuse_flags_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_estuse_flags_all.md)

To keep the example short, we recreate the core logic for a single
estimated use code (“75”) and a single OTC/RX slot. As with the previous
example, we include the gate indicators referenced by `col_add` for
completeness, but the configuration subset below limits to rows without
gating (`use_col_add1` and `use_col_add2` are `FALSE`). Some entries are
guarded by multiple indicators (for example `ph_p_meds__otc_001__01` and
`ph_p_meds__otc_001__01__06`), so both are added to the toy data in case
you drop those filters.

``` r

demo_estuse <- tibble(
  participant_id = c("sub-0001", "sub-0002", "sub-0003"),
  session_id = c("ses-00A", "ses-00A", "ses-01A"),
  ph_p_meds__otc__id_001 = c(NA_character_, NA_character_, "73"),
  ph_p_meds__otc__id_001__v01 = c("161", "73", NA_character_),
  ph_p_meds__rx__id_001 = c(NA_character_, "103", NA_character_),
  ph_p_meds__rx__id_001__v01 = c("103", NA_character_, "90")
)

rx_config_estuse_subset <- ABCDscores::rx_config |>
  filter(
    col_summary1 %in% c("ph_p_meds__otc__id_001__v01", "ph_p_meds__rx__id_001__v01"),
    col_summary2 %in% c("ph_p_meds__otc__id_001", "ph_p_meds__rx__id_001"),
    catg == "estuse",
    !coalesce(use_col_add1, FALSE),
    !coalesce(use_col_add2, FALSE)
  )
rx_config_estuse_flags_subset <- ABCDscores::rx_config_estuse_flags |>
  filter(name == "ph_p_meds__1yr_estuse___75")

demo_estuse_catg <- compute_ph_meds_catg_all(
  data = demo_estuse,
  rx_config = rx_config_estuse_subset
) |>
  compute_ph_meds_estuse_flags_all(
    rx_config_estuse_flags = rx_config_estuse_flags_subset,
    rx_config = rx_config_estuse_subset
  )

demo_estuse_catg |>
  reactable::reactable(
    striped = TRUE,
    defaultColDef = reactable::colDef(minWidth = 160),
    theme = reactable_theme
  )
```

## Applying the helpers to ABCD data

When working with the actual ABCD tabulated extracts, the raw data
frames for `ph_p_meds`, `ph_y_meds`, and `ph_p_dhx` already contain the
hundreds of source columns referenced in `rx_config`. A typical
end-to-end workflow looks like:

``` r

# read the parent medication table
ph_p_meds <- arrow::read_parquet("ph_p_meds.parquet")

# create all parent medication categories and estimated use flags
ph_p_meds_scores <- ph_p_meds |>
  compute_ph_p_meds_catg_all() |>
  compute_ph_p_meds_estuse_flags_all()
```
