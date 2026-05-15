# Compute all medication estimated use flags \[Parent\] \[Youth\]

This function computes all medication estimated use flag summary scores
based on the provided configuration in `rx_config_estuse_flags` and the
computed medication categories from `rx_config`.

It first calls
[`compute_ph_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md)
to obtain the medication category mappings of all `estuse` categories.
Then, for each row in `rx_config_estuse_flags`, it checks if any of the
corresponding medication category mapping scores (from both OTC and RX
medications) match the specified `idx` category index. If a match is
found, it assigns a value of "1" to indicate estimated use; otherwise,
it assigns "0". The resulting estimated use flags are stored in new
columns named as specified in the `name` column of
`rx_config_estuse_flags`.

- *Summarized variables:* see `rx_config` for the list of variables.

## Usage

``` r
compute_ph_meds_estuse_flags_all(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)

compute_ph_p_meds_estuse_flags_all(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)

compute_ph_y_meds_estuse_flags_all(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
)
```

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- rx_config_estuse_flags:

  tbl, Configuration tibble specifying the estimated use flag mappings
  to compute. Default is
  [`ABCDscores::rx_config_estuse_flags`](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md).

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

- `compute_ph_meds_estuse_flags_all()`: Computes all medication
  estimated use flags across all tables.

- `compute_ph_p_meds_estuse_flags_all()`: Computes all medication
  estimated use flags for the `ph_p_meds` table.

- `compute_ph_y_meds_estuse_flags_all()`: Computes all medication
  estimated use flags for the `ph_y_meds` table.

## References

The medical estimated use values and categories are generated from:
Lopez, D. A., Overholtzer, L. N., Rhee, K. E., Buchbinder, N.,
Ruiz-Orozco, G. E., Steinhilber, S., Tognoli, M., Lopez-Flores, A., &
Nagel, B. J. (2025). Classifying and visualizing medication use in the
Adolescent Brain Cognitive Development (ABCD) Study. *medRxiv*.

## See also

[`compute_ph_meds_catg_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_meds_catg_all.md),
[rx_map](https://software.nbdc-datahub.org/ABCDscores/reference/rx_map.md)
