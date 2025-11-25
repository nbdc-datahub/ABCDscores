# Combine columns

Combines two columns into one. The name of the first column is used for
the new column, the second column is removed. Used for cases where
different versions of the same variable exist that have to be combined
before computing a summary score.

## Usage

``` r
combine_cols(data, col_1, col_2, name = NULL, keep_other = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- col_1:

  character. The name of the first variable/column.

- col_2:

  character. The name of the second variable/column.

- name:

  character. The name of the field with the combined data. By default,
  `name = NULL`, the combined data field is named the same as `col_1`.

- keep_other:

  logical. Whether to combine the combined column with the input data
  frame (Default: TRUE).

## Value

tbl. The input data frame with the combined column and the second column
removed. The name of the combined column is the same as `col_1`, or
user-specified in the `name` argument.

## Examples

``` r
data <- tibble::tibble(
  var_id = c("A", "B", "C"),
  var_orig = c(1, NA, 3),
  var_alt = c(NA, 2, 4)
)

data |>
  combine_cols(
    col_1 = "var_orig",
    col_2 = "var_alt"
  )
#> # A tibble: 3 × 2
#>   var_id var_orig
#>   <chr>     <dbl>
#> 1 A             1
#> 2 B             2
#> 3 C             3

data |>
  combine_cols(
    "var_orig",
    "var_alt",
    name = "out"
  )
#> # A tibble: 3 × 2
#>   var_id   out
#>   <chr>  <dbl>
#> 1 A          1
#> 2 B          2
#> 3 C          3

data |>
  combine_cols(
    "var_orig",
    "var_alt",
    name = "out",
    keep_other = FALSE
  )
#> # A tibble: 3 × 1
#>     out
#>   <dbl>
#> 1     1
#> 2     2
#> 3     3
```
