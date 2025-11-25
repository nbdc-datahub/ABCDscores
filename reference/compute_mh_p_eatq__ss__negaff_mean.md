# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale - Negative Affect: Combines frustration, depressed mood, and aggression scales): Mean"

Computes the summary score `mh_p_eatq__ss__negaff_mean` Early Adolescent
Temperament Questionnaire \[Parent\] (Super scale - Negative Affect:
Combines frustration, depressed mood, and aggression scales): Mean

- *Summarized variables:*

  - `mh_p_eatq__frust_mean`

  - `mh_p_eatq__depm_mean`

  - `mh_p_eatq__aggr_mean`

- *Excluded values:* none

## Usage

``` r
compute_mh_p_eatq__ss__negaff_mean(
  data,
  name = "mh_p_eatq__ss__negaff_mean",
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

Negative Affect = Frustration, Depressive Mood, Aggression

In the super scale calculation, no NA is allowed.

## Examples

``` r
if (FALSE) { # \dontrun{
data |>
  compute_mh_p_eatq__ss__negaff_mean() |>
  select(
    any_of(c(
      "mh_p_eatq__ss__negaff_mean"
    ))
  )
} # }
```
