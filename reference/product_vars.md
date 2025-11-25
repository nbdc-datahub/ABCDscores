# Retain values based on conditions

Creates new variables by applying conditions to specified columns
(`fork_vars`) and retaining or modifying values from other columns
(`vars`) based on `keep_values`. Generates new variables with `_product`
suffix.

## Usage

``` r
product_vars(data, fork_vars, vars, keep_values)
```

## Arguments

- data:

  A data frame containing the input data

- fork_vars:

  Character vector of column names to use as logical conditions,
  evaluated against `keep_values`

- vars:

  Character vector of column names whose values will be retained or
  modified based on conditions in `fork_vars`

- keep_values:

  Vector of values in `fork_vars` to consider as "true" for retaining
  values in `vars`

## Value

A data frame with new `_product` suffixed variables. Excludes
intermediate logical columns.

## Examples

``` r
product_vars(
  data = tibble::tibble(
    var_av = c("1", "2", "3", "4", "5", NA, "999", "777"),
    var_al = c("5", "4", "3", "2", "1", "777", NA, "999"),
    var_bv = c("1", "1", "36", "2", "1", NA, "999", "777"),
    var_bl = c("5", "2", "2", "2", "1", "777", NA, "999")
  ),
  fork_vars = c("var_al", "var_bl"),
  vars = c("var_av", "var_bv"),
  keep_values = "2"
)
#> # A tibble: 8 × 6
#>   var_av var_al var_bv var_bl var_av_product var_bv_product
#>   <chr>  <chr>  <chr>  <chr>  <chr>          <chr>         
#> 1 1      5      1      5      NA             NA            
#> 2 2      4      1      2      NA             1             
#> 3 3      3      36     2      NA             36            
#> 4 4      2      2      2      4              2             
#> 5 5      1      1      1      NA             NA            
#> 6 NA     777    NA     777    NA             NA            
#> 7 999    NA     999    NA     NA             NA            
#> 8 777    999    777    999    NA             NA            
```
