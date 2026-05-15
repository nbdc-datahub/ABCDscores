# Compute "Family History \[Parent\] (Alcohol) Endorsed: Parents overall"

Computes the summary score `mh_p_famhx__alc__moth__fath_score` (Family
History \[Parent\] (Alcohol) Endorsed: Parents overall)

- *Notes:*

  - Following values are recoded as NA prior to any computation

    - 777

    - 888

    - 999

  - Following logic is applied to compute the score:

    - father endorsed `no` AND mother endorsed `no` = `0`

    - father endorsed `yes` AND mother endorsed `no` = `1`

    - father endorsed `no` AND mother endorsed `yes` = `2`

    - father endorsed `yes` AND mother endorsed `yes` = `3`

    - father endorsed `NA` AND mother endorsed `yes` = `4`

    - father endorsed `yes` AND mother endorsed `NA` = `5`

    - all other cases set to `NA`

## Usage

``` r
vars_mh_p_famhx__alc__moth__fath_score

compute_mh_p_famhx__alc__moth__fath_score(
  data,
  name = "mh_p_famhx__alc__moth__fath_score",
  combine = TRUE
)
```

## Format

a character vector of base name of the check boxes used to compute
`mh_p_famhx__alc__moth__fath_score`.

## Arguments

- data:

  tibble. A data frame containing the data.

- name:

  character. The name of the output column for the computed score.

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: `TRUE`).

## Value

tbl. The input data frame with the summary score appended as a new
column.
