# Compute T-score

This function computes the T-score based on the given columns, and the
provided T-score table.

## Usage

``` r
ss_tscore(
  data,
  data_norm = NULL,
  vars,
  name = "tscore",
  max_na = NULL,
  exclude = NULL,
  col_age = "age",
  col_sex = "sex",
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- data_norm:

  tbl. Data frame containing the T-score table. See details.

- vars:

  character vector. The names of the columns to be summarized.

- name:

  character. The column name of the T-score.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: NULL; no restriction on missing values).

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- col_age:

  character. The name of the age column.

- col_sex:

  character The name of sex column.

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: TRUE).

## Value

tbl. The input data frame with the T-score appended as a new column if
`combine` is TRUE, otherwise only the T-score column.

## Details

### T-score table

The `data_norm` should be a data frame containing the T-score table. The
default value `NULL` is only used for internal usage (see below). For
normal usage, the `data_norm` should be provided.

The table should have the following columns:

- `sex`: character or factor both ok. The biological sex of the
  participant. The values should be either "1" (male) or "2" (female).

- `age_min`: numeric. The minimum age of the participant.

- `age_max`: numeric. The maximum age of the participant.

- `scale_r`: numeric. The raw score of the scale.

- `scale_t`: numeric. The T-score of the scale.

For example

A tibble: n x 5

|         |         |         |         |         |
|---------|---------|---------|---------|---------|
| sex     | age_min | age_max | scale_r | scale_t |
| `<chr>` | `<dbl>` | `<dbl>` | `<dbl>` | `<dbl>` |
| 1       | 18      | 35      | 50      | 1       |
| 1       | 18      | 35      | 50.5    | 2       |
| 1       | 18      | 35      | 51      | 3       |
| 1       | 18      | 35      | 51.5    | 4       |
| ...     |         |         |         |         |

### out-range values

- If the age of the participant is out of the range of the T-score
  table, the function will return `NA`.

- If the raw score is out of the range of the T-score table, the
  function will return `NA`.

- If any of the `sex` column is not "1" or "2", the function will return
  `NA`.

- If any of the required columns has `NA`, that row will return `NA`.

### Internal usage

When used in DSM internally, the `data_norm` can be omitted. Instead,
the function will try to find the T-score table from the `list_tscore`
option, and tries to find the tscore list based on object name provided
in the `list_tscore` option. Once the object is found, the function will
automatically extract the T-score table based on the function name.

- The `list_tscore` object should present in the global environment.

- See
  [`get_tscore_tbl()`](https://software.nbdc-datahub.org/ABCDscores/reference/get_tscore_tbl.md)
  for more details on how to construct the `list_tscore`.

For example

    my_tscore <<- readRDS("aseba_tscore.rds")
    options(list_tscore = "my_tscore")
    compute_mh_x_yyyy_zz_tscore(data)

## Examples

``` r
data_norm <- tibble::tibble(
  sex = c("1", "1", "1", "1", "1"),
  age_min = 18,
  age_max = 35,
  scale_r = 0:4,
  scale_t = 20:24
)
data <- tibble::tibble(
  var1 = c(0, 1, NA, 1, 2),
  var2 = c(1, 2, 1, 2, 5),
  age = c(18, 20, 25, 99, 35),
  sex = c("1", "1", "1", "1", "1")
)
ss_tscore(
  data = data,
  data_norm = data_norm,
  max_na = 0,
  vars = c("var1", "var2")
)
#> # A tibble: 5 × 5
#>    var1  var2   age sex   tscore
#>   <dbl> <dbl> <dbl> <chr>  <int>
#> 1     0     1    18 1         21
#> 2     1     2    20 1         23
#> 3    NA     1    25 1         NA
#> 4     1     2    99 1         NA
#> 5     2     5    35 1         NA
```
