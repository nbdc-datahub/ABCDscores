# Compute "Experiences with Unfair Treatment \[Youth\] (Ethnicity): Number missing"

Computes the summary score `fc_y_eut__ethn_nm` (Experiences with Unfair
Treatment \[Youth\] (Ethnicity): Number missing)

- *Summarized variables:*

  - `fc_y_eut__ethn_001a`

  - `fc_y_eut__ethn_001b`

  - `fc_y_eut__ethn_001c`

  - `fc_y_eut__ethn_001d`

  - `fc_y_eut__ethn_002`

  - `fc_y_eut__ethn_003a`

  - `fc_y_eut__ethn_003b`

  - `fc_y_eut__ethn_003c`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_fc_y_eut__ethn_nm(data, name = "fc_y_eut__ethn_nm", combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_fc_y_eut__ethn_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_y_eut__ethn_mean.md)
