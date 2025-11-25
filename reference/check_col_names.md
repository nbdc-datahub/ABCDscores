# Check if a column name already exists in a data frame

This function checks if a column name already exists in a data frame. If
the column name already exists, the function will abort with an error.

## Usage

``` r
check_col_names(data, names)
```

## Arguments

- data:

  tbl. Data frame to check for the column name.

- names:

  character vector, The name(s) of the column to check for.

## Value

NULL. The function will abort with an error if the column name already
exists.

## Examples

``` r
data <- tibble::tibble(a = NA, b = NA, c = NA)
try({
  check_col_names(data, c("a", "b", "c"))
  check_col_names(data, c("a", "d"))
})
#> Error in check_col_names(data, c("a", "b", "c")) : 
#>   ✖ The data frame already has column(s) named `a, b, and c`.
#> Please specify different column name(s)!
```
