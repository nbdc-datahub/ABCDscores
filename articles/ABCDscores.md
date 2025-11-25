# ABCDscores

## Setup

After installing the package, you can load it with:

``` r
library(ABCDscores)
#> Welcome to the `ABCDscores` package! For more information, visit: https://software.nbdc-datahub.org/ABCDscores/
#> This package is developed by the ABCD Data Analysis, Informatics & Resource Center (DAIRC) at the J. Craig Venter Institute (JCVI).
#> If `ABCDscores` is helpful to your research, please cite:
#> Zhang, L., Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C. J., Dale, A. M., & Linkersdörfer, J. (2025). ABCDscores: An R package for computing summary scores in the ABCD Study. bioRxiv. https://doi.org/10.1101/2025.09.04.674066
```

Alternatively you can call functions directly, without loading the
package, using `::`, e.g., `ABCDscores::name_of_function(...)`

### Data preparation

To compute summary scores, you’ll need to have downloaded data from the
ABCD Study^(®). To request access to the data, visit the [NIH Brain
Development Cohorts (NBDC) Data Hub](https://www.nbdc-datahub.org/) Once
you have access, you can use different tools to access and download the
data; they are described in more detail in the [ABCD data
documentation](https://docs.abcdstudy.org/latest/tools/tools.html).

Here we assume that you created a dataset containing the variables you
want to summarize in [DEAP](https://abcd.deapscience.com/) and
downloaded it in the `rds` format. Afterwards, unzip the
`dataset.rds.zip` file to the working directory (or move the zip file to
the working directory and use `utils::unzip("dataset.rds.zip")` to
extract all files). The unzipped files should consist of a `dataset.rds`
file and an Excel file with the data dictionary and categorical levels.

Load the data into R using the following command:

``` r
data <- readRDS("dataset.rds")
```

## Computing summary scores

### Score naming convention

Before computing summary scores, it is important to understand the
structure and nomenclature of the functions in the package:

- For any given summary score, the function to compute it is named
  `compute_<score_name>()`. For example, the function to compute the
  score `fc_p_psb_mean` is named
  [`compute_fc_p_psb_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_psb_mean.md).[¹](#fn1)
- For any given measure/table, there exists a high-level
  `compute_<table_name>_all()` function that computes all scores for
  that measure/table. For example, the function to compute all scores
  for the `fc_p_psb` measure/table is named
  [`compute_fc_p_psb_all()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_psb_all.md).
- For any given summary score function, certain columns—the columns that
  are being summarized and in some cases additional columns like age or
  sex—are required to be present in the data for the score to be
  computed. The function documentation lists the required columns for a
  given function. In addition, the columns that a summary score function
  summarizes are typically provided as a character vector named
  `vars_<measure_name>`. For example, the vector with the columns that
  are summarized by the `fc_p_psb_mean` function is named
  `vars_fc_p_psb`.

The [references
page](https://software.nbdc-datahub.org/ABCDscores/reference/index.html)
provides a list of all available functions and their parameters.

### Basic usage

After reading in the data, we can start to compute summary scores. As an
example, we will demonstrate how to compute the two summary scores for
the `fc_p_psb` measure/table (`fc_p_psb_mean` and `fc_p_psb_nm`) in two
different ways:

1.  using the specific functions to compute one score at a time
2.  using the `_all()` function to compute all scores for the
    measure/table at once.

When we refer to the documentation for
[`compute_fc_p_psb_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_psb_mean.md),
we see that it requires the following variables: `fc_p_psb_001`,
`fc_p_psb_002`, and `fc_p_psb_003`. If these variables are part of the
dataset created in and downloaded from
[DEAP](https://abcd.deapscience.com/), they should be present in the
data after reading in `dataset.rds` as demonstrated above.

Here, for demonstration purposes, we will create a dummy data frame with
these columns:

``` r
data <- tibble::tibble(
  fc_p_psb_001 = c("1", "2", "3", "4", "5"),
  fc_p_psb_002 = c("1", NA, "3", "4", NA),
  fc_p_psb_003 = c("1", "2", "2", "4", NA)
)
data
#> # A tibble: 5 × 3
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003
#>   <chr>        <chr>        <chr>       
#> 1 1            1            1           
#> 2 2            NA           2           
#> 3 3            3            2           
#> 4 4            4            4           
#> 5 5            NA           NA
```

For most summary score functions, only the `data` argument (input data
frame) is required, i.e., we can just use the function like this:

``` r
compute_fc_p_psb_mean(data)
#> # A tibble: 5 × 4
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_mean
#>   <chr>        <chr>        <chr>                <dbl>
#> 1 1            1            1                     1   
#> 2 2            NA           2                    NA   
#> 3 3            3            2                     2.67
#> 4 4            4            4                     4   
#> 5 5            NA           NA                   NA
```

We can do the same using `fc_p_psb_nm()`:

``` r
compute_fc_p_psb_nm(data)
#> # A tibble: 5 × 4
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_nm
#>   <chr>        <chr>        <chr>              <int>
#> 1 1            1            1                      0
#> 2 2            NA           2                      1
#> 3 3            3            2                      0
#> 4 4            4            4                      0
#> 5 5            NA           NA                     2
```

We can also compute both scores at the same time by chaining the
function calls using the pipe operator:

``` r
data |>
  compute_fc_p_psb_mean() |>
  compute_fc_p_psb_nm()
#> # A tibble: 5 × 5
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_mean fc_p_psb_nm
#>   <chr>        <chr>        <chr>                <dbl>       <int>
#> 1 1            1            1                     1              0
#> 2 2            NA           2                    NA              1
#> 3 3            3            2                     2.67           0
#> 4 4            4            4                     4              0
#> 5 5            NA           NA                   NA              2
```

Lastly, if we want to compute all scores for the measure with one
function call, we can use the `compute_<table_name>_all()` function for
the `fc_p_psb` table:

``` r
compute_fc_p_psb_all(data)
#> # A tibble: 5 × 5
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_mean fc_p_psb_nm
#>   <chr>        <chr>        <chr>                <dbl>       <int>
#> 1 1            1            1                     1              0
#> 2 2            NA           2                    NA              1
#> 3 3            3            2                     2.67           0
#> 4 4            4            4                     4              0
#> 5 5            NA           NA                   NA              2
```

### Important parameters and customization

#### `data`

The `data` argument is the input data frame that contains the columns
required to compute the score. The required columns are documented in
the function documentation for each score.

#### `name`

The `name` argument is used to specify the name of the output score. The
default default value for this parameter is the official name of the
column in the released data, but it can be overridden by users with a
custom name.

``` r
compute_fc_p_psb_mean(data, name = "my_custom_name")
#> # A tibble: 5 × 4
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 my_custom_name
#>   <chr>        <chr>        <chr>                 <dbl>
#> 1 1            1            1                      1   
#> 2 2            NA           2                     NA   
#> 3 3            3            2                      2.67
#> 4 4            4            4                      4   
#> 5 5            NA           NA                    NA
```

For example, this is useful when the data frame specified in `data`
contains the official summary score that one is trying to reproduce. In
this case, the user is required to specify a different name; otherwise
the function will return an error.

#### `combine`

The `combine` argument is used to specify whether to combine the output
score with the input data frame. The default value is `TRUE`, which
means the output score is appended as a new column on the right hand
side of the input data frame. If the argument is set to `FALSE`, the
output score is returned as a single-column data frame:

``` r
compute_fc_p_psb_mean(data, combine = FALSE)
#> # A tibble: 5 × 1
#>   fc_p_psb_mean
#>           <dbl>
#> 1          1   
#> 2         NA   
#> 3          2.67
#> 4          4   
#> 5         NA
```

#### `max_na`

The `max_na` argument is used to specify the maximum number of missing
values across all summarized variables a given row (or
participant/event) can have for the summary score to still be computed.
If the number of missing values in a row exceeds the specified value,
the score for that row is set to `NA`. Depending on the summary score,
the number of missing values allowed may vary and not all summary score
functions have this argument.

- `NULL`: No limit on missing values.
- `0`: No missing values allowed.
- `1`: At most one missing value allowed.
- …

For most summary scores in the ABCD data resource, `max_na` is set to a
number that ensures that \>=80% of the variables that the given score
summarizes have a non-missing value. Users can use the `max_na` argument
if they want to compute the summary score in a more lenient or more
restrictive manner.

As an example, let’s explore how the summary score changes when we set
`max_na` argument to `1` (above we used the default, which in the case
of
[`compute_fc_p_psb_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_psb_mean.md)
is `0`). Now a score is computed for the second row which has one
missing value but not for the last row which has two missing values:

``` r
compute_fc_p_psb_mean(data, max_na = 1)
#> # A tibble: 5 × 4
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_mean
#>   <chr>        <chr>        <chr>                <dbl>
#> 1 1            1            1                     1   
#> 2 2            NA           2                     2   
#> 3 3            3            2                     2.67
#> 4 4            4            4                     4   
#> 5 5            NA           NA                   NA
```

When we change `max_na` to `2`, a score is also computed for the last
row:

``` r
compute_fc_p_psb_mean(data, max_na = 2)
#> # A tibble: 5 × 4
#>   fc_p_psb_001 fc_p_psb_002 fc_p_psb_003 fc_p_psb_mean
#>   <chr>        <chr>        <chr>                <dbl>
#> 1 1            1            1                     1   
#> 2 2            NA           2                     2   
#> 3 3            3            2                     2.67
#> 4 4            4            4                     4   
#> 5 5            NA           NA                    5
```

#### `exclude`

The `exclude` argument is used to specify values that should be excluded
from the computation of the score. Some specific values in the data
might be considered as missing values, e.g., coded non-responses like
“Don’t know” (`999`), “Decline to answer” (`777`), etc. This argument
allows the user to specify these values so that they are treated as
missing values during the computation of the score (importantly, the
`max_na` argument applies to all values that are either missing, `NA`,
or specified as values to be excluded using the `exclude` argument). Not
all score functions have this argument.

In this example we use another score function
`compute_mh_p_abcl__afs__frnd_sum` which has the `exclude` argument. We
first construct a dummy data frame:

``` r
data <- tibble::tibble(
  mh_p_abcl__frnd_001 = c(1, 2, 3, 4, 5),
  mh_p_abcl__frnd_002 = c(1, 777, 3, 4, 777),
  mh_p_abcl__frnd_003 = c(1, 2, NA, 4, 777),
  mh_p_abcl__frnd_004 = c(1, 2, 3, 4, 999),
)
data
#> # A tibble: 5 × 4
#>   mh_p_abcl__frnd_001 mh_p_abcl__frnd_002 mh_p_abcl__frnd_003
#>                 <dbl>               <dbl>               <dbl>
#> 1                   1                   1                   1
#> 2                   2                 777                   2
#> 3                   3                   3                  NA
#> 4                   4                   4                   4
#> 5                   5                 777                 777
#> # ℹ 1 more variable: mh_p_abcl__frnd_004 <dbl>
```

When we compute the score, only the 1, 4 rows are computed, because
other rows contain `777` or `999` or `NA` values.

``` r
compute_mh_p_abcl__afs__frnd_sum(data, exclude = c("777", "999"))
#> # A tibble: 5 × 5
#>   mh_p_abcl__frnd_001 mh_p_abcl__frnd_002 mh_p_abcl__frnd_003
#>                 <dbl>               <dbl>               <dbl>
#> 1                   1                   1                   1
#> 2                   2                 777                   2
#> 3                   3                   3                  NA
#> 4                   4                   4                   4
#> 5                   5                 777                 777
#> # ℹ 2 more variables: mh_p_abcl__frnd_004 <dbl>, mh_p_abcl__afs__frnd_sum <int>
```

We can also exclude custom values, for example, we can exclude `4`, and
then only the first row is computed.

``` r
compute_mh_p_abcl__afs__frnd_sum(data, exclude = c("777", "999", "4"))
#> # A tibble: 5 × 5
#>   mh_p_abcl__frnd_001 mh_p_abcl__frnd_002 mh_p_abcl__frnd_003
#>                 <dbl>               <dbl>               <dbl>
#> 1                   1                   1                   1
#> 2                   2                 777                   2
#> 3                   3                   3                  NA
#> 4                   4                   4                   4
#> 5                   5                 777                 777
#> # ℹ 2 more variables: mh_p_abcl__frnd_004 <dbl>, mh_p_abcl__afs__frnd_sum <int>
```

### Utility functions

The `compute_<score_name>()` functions are the main functions to compute
summary scores, with one summary score function for each score (besides
a few exceptions that are documented in the other
[vignettes](https://software.nbdc-datahub.org/ABCDscores/articles/)).
However, to be more concise, the main functions often use utility
functions. These utility functions are not necessarily meant to be used
directly by users of this package, but they are documented and exported
for transparency and reproducibility. For the documentation of these
functions, see the [reference
page](https://software.nbdc-datahub.org/ABCDscores/reference/index.html).

------------------------------------------------------------------------

1.  There are a few exceptions to this rule—the summary scores in the
    tables `su_y_sui` and `su_y_tlfb` are computed using higher level
    functions as explained in the
    [SUI](https://software.nbdc-datahub.org/ABCDscores/articles/sui.html)
    and
    [TLFB](https://software.nbdc-datahub.org/ABCDscores/articles/tlfb.html)
    vignettes.
