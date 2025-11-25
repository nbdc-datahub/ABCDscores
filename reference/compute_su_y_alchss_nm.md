# Compute "Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Number missing"

Computes the summary score `su_y_alchss_nm` Alcohol Hangover Symptoms
Scale (HSS) \[Youth\]: Number missing

- *Summarized variables:*

  - `su_y_alchss_001`

  - `su_y_alchss_002`

  - `su_y_alchss_003`

  - `su_y_alchss_004`

  - `su_y_alchss_005`

  - `su_y_alchss_006`

  - `su_y_alchss_007`

  - `su_y_alchss_008`

  - `su_y_alchss_009`

  - `su_y_alchss_010`

  - `su_y_alchss_011`

  - `su_y_alchss_012`

  - `su_y_alchss_013`

  - `su_y_alchss_014`

  - `su_y_alchss_001__l`

  - `su_y_alchss_002__l`

  - `su_y_alchss_003__l`

  - `su_y_alchss_004__l`

  - `su_y_alchss_005__l`

  - `su_y_alchss_006__l`

  - `su_y_alchss_007__l`

  - `su_y_alchss_008__l`

  - `su_y_alchss_009__l`

  - `su_y_alchss_010__l`

  - `su_y_alchss_011__l`

  - `su_y_alchss_012__l`

  - `su_y_alchss_013__l`

  - `su_y_alchss_014__l`

- *Excluded values:* none

## Usage

``` r
compute_su_y_alchss_nm(data, name = "su_y_alchss_nm", combine = TRUE)
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

[`compute_su_y_alchss_sum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_alchss_sum.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_su_y_alchss_nm(data)
} # }
```
