# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale - Negative Affect: Combines frustration, depressed mood, and aggression scales): Number missing"

Computes the summary score `mh_p_eatq__ss__negaff_nm` Early Adolescent
Temperament Questionnaire \[Parent\] (Super scale - Negative Affect:
Combines frustration, depressed mood, and aggression scales): Number
missing

- *Summarized variables:*

  - `mh_p_eatq__frust_001`

  - `mh_p_eatq__frust_002`

  - `mh_p_eatq__frust_003`

  - `mh_p_eatq__frust_004`

  - `mh_p_eatq__frust_005`

  - `mh_p_eatq__frust_006`

  - `mh_p_eatq__depm_001`

  - `mh_p_eatq__depm_002`

  - `mh_p_eatq__depm_003`

  - `mh_p_eatq__depm_004`

  - `mh_p_eatq__depm_005`

  - `mh_p_eatq__aggr_001`

  - `mh_p_eatq__aggr_002`

  - `mh_p_eatq__aggr_003`

  - `mh_p_eatq__aggr_004`

  - `mh_p_eatq__aggr_005`

  - `mh_p_eatq__aggr_006`

  - `mh_p_eatq__aggr_007`

- *Excluded values:* none

## Usage

``` r
compute_mh_p_eatq__ss__negaff_nm(
  data,
  name = "mh_p_eatq__ss__negaff_nm",
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

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_mh_p_eatq__ss__negaff_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_eatq__ss__negaff_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
data <- compute_mh_p_eatq__ss__negaff_nm(data)
} # }
```
