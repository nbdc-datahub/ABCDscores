# Compute "Blood Pressure \[Youth\] (Systolic): Mean"

Computes the summary score `ph_y_bp__sys_mean` Blood Pressure \[Youth\]
(Systolic): Mean

- *Summarized variables:*

  - `ph_y_bp__sys__r01_001`

  - `ph_y_bp__sys__r01_002`

  - `ph_y_bp__sys__r01_003`

  - `ph_y_bp__sys__r02_001`

  - `ph_y_bp__sys__r02_002`

  - `ph_y_bp__sys__r03_001`

  - `ph_y_bp__sys__r03_002`

- *Excluded values:* none

## Usage

``` r
vars_ph_y_bp__sys

compute_ph_y_bp__sys_mean(data, name = "ph_y_bp__sys_mean", combine = TRUE)
```

## Format

vars_ph_y_bp\_\_sys is a character vector of all column names used to
compute summary scores of `ph_y_bp__sys`.

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
compute_ph_y_bp__sys_mean(data) |>
  select(
    all_of(c("ph_y_bp__sys_mean", vars_ph_y_bp__sys))
  )
} # }
```
