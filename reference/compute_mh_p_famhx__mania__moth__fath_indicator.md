# Compute "Family History \[Parent\] (Mania) Endorsed: Either parent"

Computes the summary score `mh_p_famhx__mania__moth__fath_indicator`
(Family History \[Parent\] (Mania) Endorsed: Either parent)

- *Excluded values:*

  - 777

  - 888

  - 999

- *Notes:*

  - Following logic is applied to compute the score:

    - father endorsed `yes` OR mother endorsed `yes` = `1`

    - father endorsed `no` AND mother endorsed `no` = `0`

    - all other cases set to `NA`

## Usage

``` r
vars_mh_p_famhx__mania__moth__fath_indicator

compute_mh_p_famhx__mania__moth__fath_indicator(
  data,
  name = "mh_p_famhx__mania__moth__fath_indicator",
  exclude = c("777", "888", "999"),
  combine = TRUE
)
```

## Format

a character vector of fields used to compute
`mh_p_famhx__mania__moth__fath_indicator`.

## Arguments

- data:

  tibble. A data frame containing the data.

- name:

  character. The name of the output column for the computed score.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: `TRUE`).

## Value

tbl. The input data frame with the summary score appended as a new
column.
