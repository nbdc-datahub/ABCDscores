# Compute all medication categories \[Parent\] \[Youth\]

This function computes all medication category mapping summary scores
based on the provided configuration in `rx_config` by mapping medication
RxCUI codes to their respective categories that are stored in
[`ABCDscores::rx_map`](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md).

It processes each row in `rx_config`. One row corresponds to one
medication category mapping score. For each row, it first checks
`col_summary1`. If `col_summary1` has data, that value is used. If
`col_summary1` is `NA`, it falls back to `col_summary2`.

It then applies `col_add` filtering only when both conditions are met:

- the corresponding flag (`use_col_add1` or `use_col_add2`) is `TRUE`,
  and

- `col_add` is provided (not `NA`).

When filtering is applied, only rows with `col_add == "1"` are retained;
otherwise, the selected RxCUI is set to `NA`.

After source selection and optional filtering, it maps the retained
RxCUI codes to their respective categories using the appropriate mapping
data frame from
[`ABCDscores::rx_map`](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md)
based on the `catg` specified in `rx_config`. The resulting category
values are then stored in a new column named as specified in the `name`
column of `rx_config`.

- *Summarized variables:* see `rx_config` for the list of variables.

## Usage

``` r
compute_ph_meds_catg_all(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)

compute_ph_p_meds_catg_all(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)

compute_ph_y_meds_catg_all(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)

compute_ph_p_dhx_catg_all(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)
```

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- rx_config:

  tbl, Configuration tibble specifying the medication category mappings
  to compute. Default is
  [`ABCDscores::rx_config`](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md).

- combine:

  logical, If `TRUE`, the computed summary scores are appended to the
  original data frame. If `FALSE`, only the summary scores are returned.
  Default is `TRUE`.

## Value

tbl. see `combine` parameter.

## Details

### Disclaimer

"This product uses publicly available data from the U.S. National
Library of Medicine (NLM), National Institutes of Health, Department of
Health and Human Services; NLM is not responsible for the product and
does not endorse or recommend this or any other product."

### Functions for specific tables

- `compute_ph_meds_catg_all()`: Computes all medication category
  mappings across all tables.

- `compute_ph_p_meds_catg_all()`: Computes all medication category
  mappings for the `ph_p_meds` table.

- `compute_ph_y_meds_catg_all()`: Computes all medication category
  mappings for the `ph_y_meds` table.

- `compute_ph_p_dhx_catg_all()`: Computes all medication category
  mappings for the `ph_p_dhx` table.

## References

The medical estimated use values and categories are generated from:
Lopez, D. A., Overholtzer, L. N., Rhee, K. E., Buchbinder, N.,
Ruiz-Orozco, G. E., Steinhilber, S., Tognoli, M., Lopez-Flores, A., &
Nagel, B. J. (2025). Classifying and visualizing medication use in the
Adolescent Brain Cognitive Development (ABCD) Study. *medRxiv*.

## See also

[rx_map](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md)
