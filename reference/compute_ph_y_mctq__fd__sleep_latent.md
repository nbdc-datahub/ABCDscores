# Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Latency"

Computes the summary score `ph_y_mctq__fd__sleep_latent` Munich
Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Latency

- *Summarized variables:*

  - `ph_y_mctq__fd_003`

- *Excluded values:* none

## Usage

``` r
compute_ph_y_mctq__fd__sleep_latent(
  data,
  name = "ph_y_mctq__fd__sleep_latent",
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
data <- compute_ph_y_mctq__fd__sleep_latent(data)
select(
  data,
  any_of(c(
    "ph_y_mctq__fd_003",
    "ph_y_mctq__fd__sleep_latent"
  ))
)
} # }
```
