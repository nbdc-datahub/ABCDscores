# Recode levels

Recodes specified levels of a character/factor variable, e.g., to apply
reverse coding before summary score computation.

## Usage

``` r
recode_levels(data, vars, recode, temp = FALSE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be recoded.

- vars:

  character (vector). The name(s) of the column(s) to be recoded.

- recode:

  named character vector. The levels to be recoded, with the name being
  the original value and the value being the value to recode to.

- temp:

  logical. If `TRUE` creates a new column to save the recoded values.
  The new columns will be named as `temp_{vars}`.

## Value

tbl. The input data frame with the recoded variable(s).

## Examples

``` r
data <- tibble::tibble(
  var_a = c("1", "2", "3", "4", "5", NA, "999", "777"),
  var_b = c("5", "4", "3", "2", "1", "777", NA, "999")
)

# recode individual variables
data |>
  recode_levels(
    vars = "var_a",
    recode = c("999" = "0", "777" = "0")
  ) |>
  recode_levels(
    vars = "var_b",
    recode = c("999" = "6", "777" = "7")
  )
#> # A tibble: 8 × 2
#>   var_a var_b
#>   <chr> <chr>
#> 1 1     5    
#> 2 2     4    
#> 3 3     3    
#> 4 4     2    
#> 5 5     1    
#> 6 NA    7    
#> 7 0     NA   
#> 8 0     6    

# apply the same recoding to several variables
data |>
  recode_levels(
    vars = c(
      "var_a",
      "var_b"
    ),
    recode = c(
      "1" = "5",
      "2" = "4",
      "4" = "2",
      "5" = "1"
    )
  )
#> # A tibble: 8 × 2
#>   var_a var_b
#>   <chr> <chr>
#> 1 5     1    
#> 2 4     2    
#> 3 3     3    
#> 4 2     4    
#> 5 1     5    
#> 6 NA    777  
#> 7 999   NA   
#> 8 777   999  
```
