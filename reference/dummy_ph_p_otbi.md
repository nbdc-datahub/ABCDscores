# Dummy function for all OBTI score functions.

Dummy function for all OBTI score functions.

## Usage

``` r
dummy_ph_p_otbi(data, name, combine, max_na, exclude)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

## Value

tbl. see `combine`.
