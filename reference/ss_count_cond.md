# Compute the number or count of matching conditions

Computes the number of conditions (provided as a character
vector`cond`), involving the input variables `vars`, that were found to
be `TRUE`. Options available to exclude certain values from the input
variables (provided as a character vector `exclude`).

## Usage

``` r
ss_count_cond(data, name, vars, exclude = NULL, combine = FALSE, cond, max_na)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. The name of the summary score.

- vars:

  character vector. The names of the columns to be summarized.

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: FALSE).

- cond:

  character vector. Each specified condition, involving the values of
  specific input fields, gets tested for `1` (`TRUE`) or `0` (`FALSE`).
  If a condition is specified as `"field_name"`, the numeric value in
  the field is counted and could be greater than 1. Whereas other
  conditions when met can get a value of `1` or `0`. The summary score
  is a sum over all the values obtained from testing each condition
  specified in `cond`.

- max_na:

  numeric, positive whole number. Number of missing items allowed.

## Value

tbl. The input data frame with the summary score appended as a new
column.
