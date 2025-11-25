# Get T-score table from list of tscores (Internal)

This function retrieves the tscore table from a list of tscores based on
the function name. The function should be used internally.

## Usage

``` r
get_tscore_tbl(list_tscore, func_name)
```

## Arguments

- list_tscore:

  list. List of tscores. see details.

- func_name:

  character. The name of the function.

## Value

tbl. The tscore table. If there is no match or more than one match, an
error will be thrown.

## Details

The `list_tscore` should be a list of prepared tscore tables. The list
has two layers of structure: the first layer is the name of form, and
the second layer is the keyword of the tscore table.

    list
    |- form_1
    |  |- keyword_1
    |  |- keyword_2
    |  |- ...
    |- form_2
    |  |- keyword_1
    |  |- keyword_2
    |  |- ...
    |- ...

This object is prepared by the DSM team and for internal users, please
ask the DSM team for the `rds` file.

### Forms and keywords

Forms and keywords are based on the function names. A function should
contain both the form and keyword in its name, with only one exception
being the overall score of a form, which does not have a keyword. The
function name should be in the format of
`compute_form_xx__keyword_tscore` or `compute_form_xx_tscore`. The
function name will be split by `_` and the unique keywords will be used
to search for the tscore table.

## Examples

``` r
if (FALSE) { # \dontrun{
list_tscore <- readRDS("aseba_tscore.rds")
get_tscore_tbl(list_tscore, "compute_mh_p_abcl__afs__frnd_tscore")
} # }
```
