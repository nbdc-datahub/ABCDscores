# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Frustration): Mean"

Computes the summary score `mh_p_eatq__frust_mean` Early Adolescent
Temperament Questionnaire \[Parent\] (Frustration): Mean

- *Summarized variables:*

  - `mh_p_eatq__frust_001`

  - `mh_p_eatq__frust_002`

  - `mh_p_eatq__frust_003`

  - `mh_p_eatq__frust_004`

  - `mh_p_eatq__frust_005`

  - `mh_p_eatq__frust_006`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 6 items missing

## Usage

``` r
vars_mh_p_eatq__frust

compute_mh_p_eatq__frust_mean(
  data,
  name = "mh_p_eatq__frust_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
)
```

## Format

vars_mh_p_eatq\_\_frust is a character vector of all column names used
to compute summary score of `mh_p_eatq__frust_mean`.

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
data <- compute_mh_p_eatq__frust_mean(data)
select(
  data,
  any_of(c("mh_p_eatq__frust_mean", vars_mh_p_eatq__frust))
)
} # }
```
