# Compute "Anthropometrics \[Parent\] (Height): Father's height (in)"

Computes the summary score `ph_p_anthr__fath_height__in` Anthropometrics
\[Parent\] (Height): Father's height (in)

- *Summarized variables:*

  - `ph_p_anthr__height__fath_001`

  - `ph_p_anthr__height__fath_001__01`

- *Excluded values:* None

- *Validation criterion:* None

## Usage

``` r
vars_ph_p_anthr__height

compute_ph_p_anthr__fath_height__in(
  data,
  name = "ph_p_anthr__fath_height__in",
  combine = TRUE
)
```

## Format

character vector of all column names used to compute summary scores of
`ph_p_anthr__fath_height__in` and `ph_p_anthr__moth_height__in`.

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

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_p_anthr__fath_height__in(data) |>
  select(
    all_of(c("ph_p_anthr__fath_height__in", vars_ph_p_anthr__height))
  )
} # }
```
