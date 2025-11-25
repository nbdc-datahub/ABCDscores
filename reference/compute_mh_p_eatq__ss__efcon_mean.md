# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale - Effortful control: Combines attention, inhibition, and activation scales): Mean"

Computes the summary score `mh_p_eatq__ss__efcon_mean` Early Adolescent
Temperament Questionnaire \[Parent\] (Super scale - Effortful control:
Combines attention, inhibition, and activation scales): Mean

- *Summarized variables:*

  - `mh_p_eatq__attn_mean`

  - `mh_p_eatq__inhib_mean`

  - `mh_p_eatq__actv_mean`

- *Excluded values:* none

## Usage

``` r
compute_mh_p_eatq__ss__efcon_mean(
  data,
  name = "mh_p_eatq__ss__efcon_mean",
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

  logical, append the new computed column to the end of original tibble?
  Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Details

Effortful Control = Attention, Inhibitory Control, Activation Control

In the super scale calculation, no NA is allowed.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_eatq__ss__efcon_mean(data) |>
  select(
    any_of(c(
      "mh_p_eatq__ss__efcon_mean",
    ))
  )
} # }
```
