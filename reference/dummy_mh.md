# Dummy function for all MH summary score functions.

Dummy function for all MH summary score functions.

## Usage

``` r
dummy_mh(data, name, max_na, combine, exclude, event, events)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- event:

  character. Event (session ID) to be used.

- events:

  character vector. Event (session ID) to be used.

## Value

tbl. see `combine`.
