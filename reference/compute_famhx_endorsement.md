# Compute Family History \[Parent\] Endorsement indicator

Computes a binary endorsement indicator, for alcohol or drug use
computed using a set of variables. Resulting indicator is either 0
(FALSE) or 1 (TRUE), and `NA` for missing or non-responses (777, 888, or
999).

- *Notes:*

  - Following values are recoded as NA prior to any computation

    - 777

    - 888

    - 999

## Usage

``` r
compute_famhx_endorsement(data, name, var_matches, combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. The name of the summary score.

- var_matches:

  character of length one. The base name of the checkbox field that is
  used to find all corresponding columns in `data` that contain the
  responses of a participant for the check box. This parameter is passed
  onto
  [`combine_checkboxes`](https://software.nbdc-datahub.org/ABCDscores/reference/combine_checkboxes.md)
  function.

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: TRUE).

## Value

A tibble with the computed score for each participant/event.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_famhx_endorsement(
  data = data,
  name = "mh_p_famhx__alc__fath_indicator",
  var_matches = "mh_p_famhx__alc__fath_001"
)
} # }
```
