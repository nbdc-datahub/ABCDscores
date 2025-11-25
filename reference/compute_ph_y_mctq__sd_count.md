# Compute "Munich Chronotype Questionnaire \[Youth\] (School Day): Count"

Computes the summary score `ph_y_mctq__sd_count` Munich Chronotype
Questionnaire \[Youth\] (School Day): Count

- *Summarized variables:*

  - `ph_y_mctq__school_001`

  - `ph_y_mctq__school_001__01`

  - `ph_y_mctq__school_001__v01` (\>= 7.0.0)

  - `ph_y_mctq__school_001__01__v1` (\>= 7.0.0)

- *Excluded values:* none

## Usage

``` r
compute_ph_y_mctq__sd_count(data, name = "ph_y_mctq__sd_count", combine = TRUE)
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

## Details

In data release before 7.0 and 7.0.0 of the ABCDscores package, the
variables `ph_y_mctq__school_001__v01` and
`ph_y_mctq__school_001__01__v1` were not available. In this case, the
function will create these variables internally and fill them with `NA`
values. After 7.0.0, these variables are expected to be present.

## Examples

``` r
if (FALSE) { # \dontrun{
data <- compute_ph_y_mctq__sd_count(data)
select(
  data,
  any_of(c(
    "ph_y_mctq__school_001",
    "ph_y_mctq__school_001__01",
    "ph_y_mctq__school_001__v01",
    "ph_y_mctq__school_001__01__v1",
    "ph_y_mctq__sd_count"
  ))
)
} # }
```
