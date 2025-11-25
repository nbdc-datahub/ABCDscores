# Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep mid): Time \[36 hour adjusted\]"

Computes the summary score `ph_y_mctq__sd__sleep__mid__36h_t` Munich
Chronotype Questionnaire \[Youth\] (School Day - Sleep mid): Time \[36
hour adjusted\]

- *Summarized variables:*

  - `ph_y_mctq__sd__sleep__onset__36h_t` (intermediate score)

  - `ph_y_mctq__sd__sleep_period` (intermediate score)

- *Excluded values:* none

## Usage

``` r
compute_ph_y_mctq__sd__sleep__mid__36h_t(
  data,
  name = "ph_y_mctq__sd__sleep__mid__36h_t",
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
compute_ph_y_mctq__sd__sleep__mid__36h_t(data) |>
  select(
    any_of(c(
      "ph_y_mctq__sd__sleep__mid__36h_t"
    ))
  )
} # }
```
