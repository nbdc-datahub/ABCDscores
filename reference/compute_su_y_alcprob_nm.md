# Compute "Alcohol Problem Index (RAPI) \[Youth\]: Number missing"

Computes the summary score `su_y_alcprob_nm` Alcohol Problem Index
(RAPI) \[Youth\]: Number missing

- *Summarized variables:*

  - `ab_p_demo__race_001___0`

  - `ab_p_demo__race_001___10`

  - `ab_p_demo__race_001___11`

  - `ab_p_demo__race_001___12`

  - `ab_p_demo__race_001___13`

  - `ab_p_demo__race_001___14`

  - `ab_p_demo__race_001___15`

  - `ab_p_demo__race_001___16`

  - `ab_p_demo__race_001___17`

  - `ab_p_demo__race_001___18`

  - `ab_p_demo__race_001___19`

  - `ab_p_demo__race_001___20`

  - `ab_p_demo__race_001___21`

  - `ab_p_demo__race_001___22`

  - `ab_p_demo__race_001___23`

  - `ab_p_demo__race_001___24`

  - `ab_p_demo__race_001___25`

  - `ab_p_demo__race_001___777`

  - `ab_p_demo__race_001___999`

  - `ab_p_demo__race_001__v01___999`

  - `ab_p_demo__race_001__v01___10`

  - `ab_p_demo__race_001__v01___11`

  - `ab_p_demo__race_001__v01___12`

  - `ab_p_demo__race_001__v01___20`

  - `ab_p_demo__race_001__v01___21`

  - `ab_p_demo__race_001__v01___22`

  - `ab_p_demo__race_001__v01___23`

  - `ab_p_demo__race_001__v01___13`

  - `ab_p_demo__race_001__v01___14`

  - `ab_p_demo__race_001__v01___15`

  - `ab_p_demo__race_001__v01___17`

  - `ab_p_demo__race_001__v01___18`

  - `ab_p_demo__race_001__v01___19`

  - `ab_p_demo__race_001__v01___16`

  - `ab_p_demo__race_001__v01___24`

  - `ab_p_demo__race_001__v01___777`

- *Excluded values:* none

## Usage

``` r
compute_su_y_alcprob_nm(data, name = "su_y_alcprob_nm", combine = TRUE)
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

[`compute_su_y_alcprob_prsum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_alcprob_prsum.md)
