# Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Inhibition): Number missing"

Computes the summary score `mh_p_eatq__inhib_nm` Early Adolescent
Temperament Questionnaire \[Parent\] (Inhibition): Number missing

- *Summarized variables:*

  - `mh_p_eatq__inhib_001`

  - `mh_p_eatq__inhib_002`

  - `mh_p_eatq__inhib_003`

  - `mh_p_eatq__inhib_004`

  - `mh_p_eatq__inhib_005`

- *Excluded values:* none

## Usage

``` r
compute_mh_p_eatq__inhib_nm(data, name = "mh_p_eatq__inhib_nm", combine = TRUE)
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

[`compute_mh_p_eatq__inhib_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_eatq__inhib_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
data <- compute_mh_p_eatq__inhib_nm(data)
select(
  data,
  any_of(c("mh_p_eatq__inhib_nm", vars_mh_p_eatq__inhib))
)
} # }
```
