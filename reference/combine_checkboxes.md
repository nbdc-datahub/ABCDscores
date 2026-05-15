# Combine checkbox variables into a single list column

Takes a group of checkbox-style variables, have a common prefix and
numeric suffixes representing options, and combines them into a single
list column where each element is a vector of selected options
(numbers).

This function expects the input data to include `participant_id` and
`session_id` columns, which are used to group responses. For each
participant and session, it collects all checkbox numbers that were
selected as a single list. The resulting column can be renamed via the
`name` parameter.

## Usage

``` r
combine_checkboxes(data, var_basename, var_sep = "___", name = NULL)
```

## Arguments

- data:

  tbl. Data frame containing the participant responses.

- var_basename:

  character of length 1. The base name of the checkbox field.

- var_sep:

  character of length 1. The string separating the base name of the
  checkbox and the checkbox value. Default is `"___"`. In the default
  scenario, all checkbox columns to be collapsed are expected in the
  format, `{ var_basename }___{ value }`, where three underscores
  separate the checkbox basename and the checkbox value.

- name:

  character of length 1 or `NULL`. Optional. The name of the output
  column that will store the combined checkbox selections. If `NULL`,
  the value of `var_basename` is used as the output column name.

## Value

tbl. The input data frame with an additional column containing a list of
integers corresponding to the selected checkbox options for each
participant and session.

## Examples

``` r
# Example data
dat <- tibble::tibble(
  participant_id = c(1, 1, 2),
  session_id = c(1, 2, 1),
  q1___1 = c(1, NA, 0),
  q1___2 = c(0, 1, 1),
  q1___3 = c(NA, NA, 0)
)

# Combine q1 checkboxes into a single list column
combine_checkboxes(dat, var_basename = "q1")
#> # A tibble: 3 × 6
#>   participant_id session_id q1___1 q1___2 q1___3 q1       
#>            <dbl>      <dbl>  <dbl>  <dbl>  <dbl> <list>   
#> 1              1          1      1      0     NA <int [1]>
#> 2              1          2     NA      1     NA <int [1]>
#> 3              2          1      0      1      0 <int [1]>

# Combine and rename the output column
combine_checkboxes(dat, var_basename = "q1", name = "q1_combined")
#> # A tibble: 3 × 6
#>   participant_id session_id q1___1 q1___2 q1___3 q1_combined
#>            <dbl>      <dbl>  <dbl>  <dbl>  <dbl> <list>     
#> 1              1          1      1      0     NA <int [1]>  
#> 2              1          2     NA      1     NA <int [1]>  
#> 3              2          1      0      1      0 <int [1]>  
```
