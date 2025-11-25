# Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Negative Urgency): Number missing"

Computes the summary score `mh_y_upps__nurg_nm` Urgency, Premeditation,
Perseverance, Sensation Seeking, Positive Urgency, Impulsive Behavior
Scale (Short Version) \[Youth\] (Negative Urgency): Number missing

- *Summarized variables:*

  - `mh_y_upps__nurg_001`

  - `mh_y_upps__nurg_002`

  - `mh_y_upps__nurg_003`

  - `mh_y_upps__nurg_004`

- *Excluded values:* none

## Usage

``` r
vars_mh_y_upps__nurg

compute_mh_y_upps__nurg_nm(
  data,
  name = "mh_y_upps__nurg_nm",
  exclude = NULL,
  combine = TRUE
)
```

## Format

`vars_mh_y_upps__nurg` is vector of all column names used to compute
summary score of `mh_y_upps__nurg` scores.

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
compute_mh_y_upps__nurg_nm(data) |>
  select(
    any_of(c("mh_y_upps__nurg_nm", vars_mh_y_upps__nurg))
  )
} # }
```
