# Compute "Sleep Disturbance Scale \[Parent\] (Disorders of excessive somnolence): Sum \[Validation: No more than 0 missing or declined\]"

Computes the summary score `ph_p_sds__does_sum` Sleep Disturbance Scale
\[Parent\] (Disorders of excessive somnolence): Sum \[Validation: No
more than 0 missing or declined\]

- *Summarized variables:*

  - `ph_p_sds__does_001`

  - `ph_p_sds__does_002`

  - `ph_p_sds__does_003`

  - `ph_p_sds__does_004`

  - `ph_p_sds__does_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 items missing

## Usage

``` r
vars_ph_p_sds__does

compute_ph_p_sds__does_sum(
  data,
  name = "ph_p_sds__does_sum",
  max_na = 0,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

character vector of all column names used to compute summary scores of
`ph_p_sds__does_sum` and `ph_p_sds__does_nm`.

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- max_na:

  integer, Maximum number of missing values allowed in the summary
  score. `NULL` means no limit.

- exclude:

  character, Values to be excluded from the summary score.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_p_sds__does_sum(data) |>
  select(
    all_of(c("ph_p_sds__does_sum", vars_ph_p_sds__does))
  )
} # }
```
