# Compute "Peer Experiences Questionnaire \[Youth\] (Reputational Victimization): Number missing"

Computes the summary score `mh_y_peq__rep__vict_nm` Peer Experiences
Questionnaire \[Youth\] (Reputational Victimization): Number missing

- *Summarized variables:*

  - `mh_y_peq__rep__vict_001`

  - `mh_y_peq__rep__vict_002`

  - `mh_y_peq__rep__vict_003`

- *Excluded values:* none

## Usage

``` r
vars_mh_y_peq__rep__vict

compute_mh_y_peq__rep__vict_nm(
  data,
  name = "mh_y_peq__rep__vict_nm",
  exclude = NULL,
  combine = TRUE
)
```

## Format

`vars_mh_y_peq__rep__vict` is vector of all column names used to compute
summary score of `mh_y_peq__rep__vict` scores.

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

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_peq__rep__vict_nm(data) |>
  select(
    any_of(c("mh_y_peq__rep__vict_nm", vars_mh_y_peq__rep__vict))
  )
} # }
```
