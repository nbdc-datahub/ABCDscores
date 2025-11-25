# Check an output field and assign NA when input variables all have NAs

Checks the specified output column in a data frame and assigns NA to its
value depending on the missingness of a set of input columns. If
`allow_missingness = TRUE`, the output column is set to NA only when
*all* the specified input columns are NA. If
`allow_missingness = FALSE`, the output column is set to NA when *any*
of the input columns are NA. This function is useful for propagating
missingness from input variables to a derived output.

## Usage

``` r
check_assign_na(data, output, input, allow_missingness = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- output:

  character of length 1. The name of the first variable/column.

- input:

  character. The name of the second variable/column.

- allow_missingness:

  logical. Default set to TRUE. If TRUE, `output` field is set to `NA`
  only when ALL the fields in `input` have missingness. If FALSE,
  `output` is set to `NA` when ANY of the `input` fields have
  missingness.

## Value

tbl. The input data frame with the `output` column modified.

## Examples

``` r
# Example data
dat <- tibble::tibble(
  a = c(1, NA, 3),
  b = c(NA, NA, 2),
  c = c(1, 2, 3),
  out = c(10, 11, 12)
)

# Assign NA to out when all of a and b are NA
check_assign_na(
  dat,
  output = "out", input = c("a", "b"), allow_missingness = TRUE
)
#> # A tibble: 3 × 4
#>       a     b     c   out
#>   <dbl> <dbl> <dbl> <dbl>
#> 1     1    NA     1    10
#> 2    NA    NA     2    NA
#> 3     3     2     3    12

# Assign NA to out when any of a and b are NA
check_assign_na(
  dat,
  output = "out", input = c("a", "b"), allow_missingness = FALSE
)
#> # A tibble: 3 × 4
#>       a     b     c   out
#>   <dbl> <dbl> <dbl> <dbl>
#> 1     1    NA     1    NA
#> 2    NA    NA     2    NA
#> 3     3     2     3    12
```
