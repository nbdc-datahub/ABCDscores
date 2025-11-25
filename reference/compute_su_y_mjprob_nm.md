# Compute "Marijuana Problem Index (MAPI) \[Youth\]: Number missing"

Computes the summary score `su_y_mjprob_nm` Marijuana Problem Index
(MAPI) \[Youth\]: Number missing

- *Summarized variables:*

  - `su_y_mjprob_001`

  - `su_y_mjprob_002`

  - `su_y_mjprob_003`

  - `su_y_mjprob_004`

  - `su_y_mjprob_005`

  - `su_y_mjprob_006`

  - `su_y_mjprob_007`

  - `su_y_mjprob_008`

  - `su_y_mjprob_009`

  - `su_y_mjprob_010`

  - `su_y_mjprob_011`

  - `su_y_mjprob_012`

  - `su_y_mjprob_016`

  - `su_y_mjprob_017`

  - `su_y_mjprob_018`

- *Excluded values:* none

## Usage

``` r
compute_su_y_mjprob_nm(data, name = "su_y_mjprob_nm", combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE` (default), the summary score will be appended to
  the input data frame. If `FALSE`, the summary score for each
  participant will be returned as a separate data frame. (Default: TRUE)

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_su_y_mjprob_prsum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_mjprob_prsum.md)
