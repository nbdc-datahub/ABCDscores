# Compute "Anthropometrics \[Youth\] (Weight): Mean"

Computes the summary score `ph_y_anthr__weight_mean` Anthropometrics
\[Youth\] (Weight): Mean

- *Summarized variables:* \* `ph_y_anthr__weight__r01_001`

  - `ph_y_anthr__weight__r02_001`

  - `ph_y_anthr__weight__r03_001`

- *Excluded values:* none

### Calculation

There are at most 3 possible measurements, and the calculation is as
follows:

- 0 missing, find the max and min of the three, and take the average of
  the min and max. Then compare the average to the third value.

  - third value \< average -\> mean(min, third value)

  - third value \> average -\> mean(max, third value)

  - third value = average -\> third value

- 1 missing, mean of the rest two

- 2 missing, use the last one

- 3 missing, NA

## Usage

``` r
vars_ph_y_anthr__weight

compute_ph_y_anthr__weight_mean(
  data,
  name = "ph_y_anthr__weight_mean",
  combine = TRUE
)
```

## Format

vars_ph_y_anthr\_\_weight is a character vector of all column names used
to compute summary scores of `ph_y_anthr__weight`.

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_y_anthr__weight_mean(data) |>
  select(
    all_of(c("ph_y_anthr__weight_mean", vars_ph_y_anthr__weight))
  )
} # }
```
