# Compute "Munich Chronotype Questionnaire \[Youth\] (Sleep): Loss"

Computes the summary score `ph_y_mctq__sleep_loss` Munich Chronotype
Questionnaire \[Youth\] (Sleep): Loss

- *Summarized variables:*

  - `ph_y_mctq__fd__sleep_period` (intermediate score)

  - `ph_y_mctq__sd__sleep_period` (intermediate score)

  - `ph_y_mctq__sd_count` (intermediate score)

- *Excluded values:* none

## Usage

``` r
compute_ph_y_mctq__sleep_loss(
  data,
  name = "ph_y_mctq__sleep_loss",
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_y_mctq__sleep_loss(data) |>
  select(
    any_of(c(
      "ph_y_mctq__sleep_loss"
    ))
  )
} # }
```
