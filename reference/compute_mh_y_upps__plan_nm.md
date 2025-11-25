# Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of Planning): Number missing"

Computes the summary score `mh_y_upps__plan_nm` Urgency, Premeditation,
Perseverance, Sensation Seeking, Positive Urgency, Impulsive Behavior
Scale (Short Version) \[Youth\] (Lack of Planning): Number missing

- *Summarized variables:*

  - `mh_y_upps__plan_001`

  - `mh_y_upps__plan_002`

  - `mh_y_upps__plan_003`

  - `mh_y_upps__plan_004`

- *Excluded values:* none

## Usage

``` r
vars_mh_y_upps__plan

compute_mh_y_upps__plan_nm(
  data,
  name = "mh_y_upps__plan_nm",
  exclude = NULL,
  combine = TRUE
)
```

## Format

`vars_mh_y_upps__plan` is vector of all column names used to compute
summary score of `mh_y_upps__plan` scores.

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
compute_mh_y_upps__plan_nm(data) |>
  select(
    any_of(c("mh_y_upps__plan_nm", vars_mh_y_upps__plan))
  )
} # }
```
