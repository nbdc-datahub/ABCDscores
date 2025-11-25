# Creates a new column by converting session_id column into a numeric

Creates a new column which contains the parsed numeric value for the
visit. Annual visits are set to integers, where 0 = baseline, 1 = year
1, and so on. Mid-years are defined as 0.5 increments of the prior
annual visits, e.g., 0.5 = between baseline and year 1, 1.5 = between
year 1 and 2, and so on.

## Usage

``` r
create_session_num(data, name = "session_num")
```

## Arguments

- data:

  tbl. Data frame containing the `session_id` column.

- name:

  character of length 1. The name of the newly created and appended
  column. Default: `session_num`

## Value

tbl. The input data frame with the `name` column added.

## Examples

``` r
# Example data
dat <- tibble::tibble(
  participant_id = c("A123", "A123", "A123", "A123"),
  session_id = c("ses-00S", "ses-00A", "ses-00M", "ses-01A"),
  a = c(1, 2, 3, 4),
  b = c(10, 11, 12, NA)
)

# Create a new column (default: `session_num`) with numeric session
create_session_num(
  dat
)
#> # A tibble: 4 × 5
#>   participant_id session_id session_num     a     b
#>   <chr>          <chr>            <dbl> <dbl> <dbl>
#> 1 A123           ses-00S           NA       1    10
#> 2 A123           ses-00A            0       2    11
#> 3 A123           ses-00M            0.5     3    12
#> 4 A123           ses-01A            1       4    NA

# Create a new column called `num` that contains the session numbers
create_session_num(
  dat,
  name = "num"
)
#> # A tibble: 4 × 5
#>   participant_id session_id   num     a     b
#>   <chr>          <chr>      <dbl> <dbl> <dbl>
#> 1 A123           ses-00S     NA       1    10
#> 2 A123           ses-00A      0       2    11
#> 3 A123           ses-00M      0.5     3    12
#> 4 A123           ses-01A      1       4    NA
```
