# Compute "Anthropometrics \[Youth\] (Height): Number missing"

Computes the summary score `ph_y_anthr__height_nm` Anthropometrics
\[Youth\] (Height): Number missing

- *Summarized variables:*

  - `ph_y_anthr__height__r01_001`

  - `ph_y_anthr__height__r02_001`

  - `ph_y_anthr__height__r03_001`

- *Excluded values:* none

## Usage

``` r
compute_ph_y_anthr__height_nm(
  data,
  name = "ph_y_anthr__height_nm",
  combine = TRUE
)
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

[`compute_ph_y_anthr__height_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_y_anthr__height_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_y_anthr__height_nm(data) |>
  select(
    all_of(c("ph_y_anthr__height_nm", vars_ph_y_anthr__height))
  )
} # }
```
