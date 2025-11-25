# Create static variable, one per participant, using longitudinal responses

Update an existing field to include longitudinal responses. Use data for
each `id` from the first available `event` and set that value for all
`event` rows.

## Usage

``` r
make_static(
  data,
  id = "participant_id",
  event = "session_id",
  exclude = NULL,
  var_in,
  var_out
)
```

## Arguments

- data:

  Dataframe with fields specified in `id`, `event`, and `var`.

- id:

  character of length 1. Name of field that contains the IDs for which
  we need to assess the longitudinal data.

- event:

  character of length 1. Name of field that contains the (longitudinal)
  event IDs.

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- var_in:

  character of length 1. Name of the field that contains the
  longitudinal values or responses.

- var_out:

  character of length 1. Name of the new field that contains one static
  value per `id` computed from the longitudinal values or responses in
  `var_in`.

## Value

Dataframe with two columns: `id` and `var_out`

## Examples

``` r
data <- tibble::tribble(
  ~"id", ~"event", ~"values",
  "A", 1, NA,
  "A", 2, 2,
  "A", 3, 3,
  "B", 1, NA,
  "B", 2, NA,
  "B", 3, 1
)

make_static(
  data,
  var_in = "values",
  var_out = "static_nothing_excluded",
  id = "id",
  event = "event"
)
#> # A tibble: 2 × 2
#>   id    static_nothing_excluded
#>   <chr>                   <dbl>
#> 1 A                           2
#> 2 B                           1

make_static(
  data,
  var_in = "values",
  var_out = "static_excluding_1and2",
  exclude = c("1", "2"),
  id = "id",
  event = "event"
)
#> # A tibble: 2 × 2
#>   id    static_excluding_1and2
#>   <chr>                  <dbl>
#> 1 A                          3
#> 2 B                         NA
```
