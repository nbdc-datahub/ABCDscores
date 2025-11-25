# Compute "Emotion Regulation Questionnaire \[Youth\] (Suppression): Number missing"

Computes the summary score `mh_y_erq__suppr_nm` Emotion Regulation
Questionnaire \[Youth\] (Suppression): Number missing

- *Summarized variables:*

  - `mh_y_erq__suppr_001`

  - `mh_y_erq__suppr_002`

  - `mh_y_erq__suppr_003`

- *Excluded values:*

  - 777

## Usage

``` r
compute_mh_y_erq__suppr_nm(
  data,
  name = "mh_y_erq__suppr_nm",
  exclude = c("777"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_erq__suppr_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_erq__suppr_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_erq__suppr_nm(data) |>
  select(
    any_of(c("mh_y_erq__suppr_nm", vars_mh_y_erq__suppr))
  )
} # }
```
