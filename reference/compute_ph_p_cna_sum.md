# Compute "Child Nutrition Assessment \[Parent\]: Sum \[Validation: No more than 0 missing or declined\]"

Computes the summary score `ph_p_cna_sum` Child Nutrition Assessment
\[Parent\]: Sum \[Validation: No more than 0 missing or declined\]

- *Summarized variables:*

  - `ph_p_cna_001`

  - `ph_p_cna_002`

  - `ph_p_cna_003`

  - `ph_p_cna_004`

  - `ph_p_cna_005`

  - `ph_p_cna_006`

  - `ph_p_cna_007`

  - `ph_p_cna_008`

  - `ph_p_cna_009`

  - `ph_p_cna_010`

  - `ph_p_cna_011`

  - `ph_p_cna_012`

  - `ph_p_cna_013`

  - `ph_p_cna_014`

- *Excluded values:*

  - 999

  - 777

- *Validation criterion:* maximally 0 of 14 items missing

## Usage

``` r
vars_ph_p_cna

compute_ph_p_cna_sum(
  data,
  name = "ph_p_cna_sum",
  max_na = 0,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

vars_ph_p_cna is a character vector of all column names used to compute
summary scores of `ph_p_cna`.

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

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_p_cna_sum(data) |>
  select(
    all_of(c("ph_p_cna_sum", vars_ph_p_cna))
  )
} # }
```
