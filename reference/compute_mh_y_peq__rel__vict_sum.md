# Compute "Peer Experiences Questionnaire \[Youth\] (Relational Victimization): Sum"

Computes the summary score `mh_y_peq__rel__vict_sum` Peer Experiences
Questionnaire \[Youth\] (Relational Victimization): Sum

- *Summarized variables:*

  - `mh_y_peq__rel__vict_001`

  - `mh_y_peq__rel__vict_002`

  - `mh_y_peq__rel__vict_003`

- *Excluded values:* none

- *Validation criterion:* none of 3 items missing

## Usage

``` r
compute_mh_y_peq__rel__vict_sum(
  data,
  name = "mh_y_peq__rel__vict_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

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

[`compute_mh_y_peq__rel__vict_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_peq__rel__vict_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_peq__rel__vict_sum(data) |>
  select(
    any_of(c("mh_y_peq__rel__vict_sum", vars_mh_y_peq__rel__vict))
  )
} # }
```
