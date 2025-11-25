# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Shyness): Mean"

Computes the summary score `mh_p_eatq__shy_mean` Early Adolescent
Temperament Questionnaire \[Parent\] (Shyness): Mean

- *Summarized variables:*

  - `mh_p_eatq__shy_001`

  - `mh_p_eatq__shy_002`

  - `mh_p_eatq__shy_003`

  - `mh_p_eatq__shy_004`

  - `mh_p_eatq__shy_005`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_mh_p_eatq__shy

compute_mh_p_eatq__shy_mean(
  data,
  name = "mh_p_eatq__shy_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
)
```

## Format

vars_mh_p_eatq\_\_shy is a character vector of all column names used to
compute summary score of `mh_p_eatq__shy_mean`.

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- max_na:

  integer, Maximum number of missing values allowed in the summary
  score. `NULL` means no limit.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

- revert:

  logical, If `TRUE`, the summary score will be reverse scored.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
data <- compute_mh_p_eatq__shy_mean(data)
select(
  data,
  any_of(c(
    "mh_p_eatq__shy_mean",
    vars_mh_p_eatq__shy
  ))
)
} # }
```
