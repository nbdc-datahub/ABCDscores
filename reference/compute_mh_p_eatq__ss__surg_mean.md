# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale - Surgency: Combines surgency, fear (reverse coded), and shyness (reverse coded) scales): Mean \[Validation: No more than 0 missing or declined\]"

Computes the summary score `mh_p_eatq__ss__surg_mean` Early Adolescent
Temperament Questionnaire \[Parent\] (Super scale - Surgency: Combines
surgency, fear (reverse coded), and shyness (reverse coded) scales):
Mean \[Validation: No more than 0 missing or declined\]

- *Summarized variables:*

  - `mh_p_eatq__surg_mean`

  - `mh_p_eatq__fear_mean` (revert)

  - `mh_p_eatq__shy_mean` (revert)

- *Excluded values:* none

## Usage

``` r
compute_mh_p_eatq__ss__surg_mean(
  data,
  name = "mh_p_eatq__ss__surg_mean",
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

Surgency = Surgency, Fear (reverse scored), Shyness (reverse scored)

In the super scale calculation, no NA is allowed.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_eatq__ss__surg_mean(data) |>
  select(
    any_of(c(
      "mh_p_eatq__ss__surg_mean"
    ))
  )
} # }
```
