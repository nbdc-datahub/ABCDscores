# Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed): Sum"

Computes the summary score `ph_y_mctq__sd__bed_sum` Munich Chronotype
Questionnaire \[Youth\] (School Day - In bed): Sum

- *Summarized variables:*

  - `ph_y_mctq__sd__bed__end__36h_t` (intermediate score)

  - `ph_y_mctq__sd__bed__start__36h_t` (intermediate score)

- *Excluded values:* none

## Usage

``` r
compute_ph_y_mctq__sd__bed_sum(
  data,
  name = "ph_y_mctq__sd__bed_sum",
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
compute_ph_y_mctq__sd__bed_sum(data) |>
  select(
    any_of(c(
      "ph_y_mctq__sd__bed_sum"
    ))
  )
} # }
```
