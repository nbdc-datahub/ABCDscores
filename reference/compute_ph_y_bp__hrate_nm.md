# Compute "Blood Pressure \[Youth\] (Heart rate): Number missing"

Computes the summary score `ph_y_bp__hrate_nm` Blood Pressure \[Youth\]
(Heart rate): Number missing

- *Summarized variables:*

  - `ph_y_bp__hrate__r01_001`

  - `ph_y_bp__hrate__r01_002`

  - `ph_y_bp__hrate__r01_003`

  - `ph_y_bp__hrate__r02_001`

  - `ph_y_bp__hrate__r02_002`

  - `ph_y_bp__hrate__r03_001`

  - `ph_y_bp__hrate__r03_002`

- *Excluded values:* none

### Calculation

There are at most 3 possible rounds of measurements, and the calculation
is as follows:

- if round 3 is available, use it, otherwise use round 2, otherwise use
  round 1

- for round 3 and 2, there are at most 2 measurements

- for round 1, there are at most 3 measurements:

  - participants with 3 measurements, and 0 missing, nm = 0

  - participants with 2 measurements, and 1 missing, nm = 1 - 1 = 0

  - participants with 1 measurement, and 2 missing, nm = 2 - 1 = 1

  - participants with 0 measurements, and 3 missing, nm = 3 - 1 = 2

## Usage

``` r
compute_ph_y_bp__hrate_nm(data, name = "ph_y_bp__hrate_nm", combine = TRUE)
```

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

## See also

[`compute_ph_y_bp__hrate_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_y_bp__hrate_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_y_bp__hrate_nm(data) |>
  select(
    all_of(c("ph_y_bp__hrate_nm", vars_ph_y_bp__hrate))
  )
} # }
```
