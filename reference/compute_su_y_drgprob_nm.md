# Compute "Drug Problem Index (DAPI) \[Youth\]: Number missing"

Computes the summary score `su_y_drgprob_nm` Drug Problem Index (DAPI)
\[Youth\]: Number missing

- *Summarized variables:*

  - `su_y_drgprob_001`

  - `su_y_drgprob_002`

  - `su_y_drgprob_003`

  - `su_y_drgprob_004`

  - `su_y_drgprob_005`

  - `su_y_drgprob_006`

  - `su_y_drgprob_007`

  - `su_y_drgprob_008`

  - `su_y_drgprob_009`

  - `su_y_drgprob_010`

  - `su_y_drgprob_012`

  - `su_y_drgprob_013`

  - `su_y_drgprob_014`

  - `su_y_drgprob_015`

  - `su_y_drgprob_016`

  - `su_y_drgprob_017`

  - `su_y_drgprob_018`

- *Excluded values:* none

## Usage

``` r
compute_su_y_drgprob_nm(data, name = "su_y_drgprob_nm", combine = TRUE)
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

[`compute_su_y_drgprob_prsum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_drgprob_prsum.md)
