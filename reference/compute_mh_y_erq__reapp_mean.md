# Compute "Emotion Regulation Questionnaire \[Youth\] (Reappraisal): Mean"

Computes the summary score `mh_y_erq__reapp_mean` Emotion Regulation
Questionnaire \[Youth\] (Reappraisal): Mean

- *Summarized variables:*

  - `mh_y_erq__reapp_001`

  - `mh_y_erq__reapp_002`

  - `mh_y_erq__reapp_003`

- *Excluded values:*

  - 777

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_mh_y_erq__reapp

compute_mh_y_erq__reapp_mean(
  data,
  name = "mh_y_erq__reapp_mean",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
)
```

## Format

`vars_mh_y_erq__reapp` is vector of all column names used to compute
summary score of `mh_y_erq__reapp` scores.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_erq__reapp_mean(data) |>
  select(
    any_of(c("mh_y_erq__reapp_mean", vars_mh_y_erq__reapp))
  )
} # }
```
