# Compute "Anthropometrics \[Parent\] (Height): Father's height (cm)"

Computes the summary score `ph_p_anthr__fath_height__cm` Anthropometrics
\[Parent\] (Height): Father's height (cm)

- *Summarized variables:*

  - `ph_p_anthr__height__fath_001`

  - `ph_p_anthr__height__fath_001__01`

- *Excluded values:* None

- *Validation criterion:* None

## Usage

``` r
compute_ph_p_anthr__fath_height__cm(
  data,
  name = "ph_p_anthr__fath_height__cm",
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

## See also

[`compute_ph_p_anthr__fath_height__in()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_anthr__fath_height__in.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_ph_p_anthr__fath_height__cm(data) |>
  select(
    all_of(c("ph_p_anthr__fath_height__cm", vars_ph_p_anthr__height))
  )
} # }
```
