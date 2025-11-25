# Compute "School Risk & Protective Factors \[Youth\] (School disengagement): Number missing"

Computes the summary score `fc_y_srpf__dis_nm` (School Risk & Protective
Factors \[Youth\] (School disengagement): Number missing)

- *Summarized variables:*

  - `fc_y_srpf__dis_001`

  - `fc_y_srpf__dis_002`

- *Excluded values:* none

## Usage

``` r
compute_fc_y_srpf__dis_nm(data, name = "fc_y_srpf__dis_nm", combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_fc_y_srpf__dis_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_y_srpf__dis_mean.md)
