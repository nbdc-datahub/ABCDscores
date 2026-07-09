# Family History (FAMHX) summary scores

## Introduction

The Family History (FAMHX) survey is a parent survey used to collect
information about endorsement of substance use and mental health history
of the participant’s family members.

### ❗Data requirements

> **Where to get data?**
>
> The FAMHX item-level data is available to authorized users of the
> [NBDC Data Hub](https://nbdc-datahub.org) as part of the tabulated
> data resource. Please refer to the [Get
> started](https://software.nbdc-datahub.org/ABCDscores/articles/ABCDscores.md)
> page for general information on how to assemble and download a
> dataset.

For the computation of the FAMHX summary scores, one needs to have
access to the `mh_p_famhx` table.

## FAMHX summary score functions

We compute two types of FAMHX summary scores (format:
`mh_p_famhx_xxxxx`):

1.  Summarize the endorsements from one family member (input field)  
      
    We developed one basic function,
    [`compute_famhx_endorsement()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_famhx_endorsement.md)
    that can be used to compute all FAMHX summary scores by changing the
    value of the `var_matches` parameter, which sets the input variable
    used to compute the summary score, the name of which is set by
    changing the value of the `name` parameter.  
      
    Note: The single input field maps to multiple columns / fields in
    the release data because each option is provided as its own
    column.  
      
2.  Summarize the endorsements from multiple family members (input
    fields)  
      
    For this set of scores, we first use the
    [`compute_famhx_endorsement()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_famhx_endorsement.md)
    to compute the endorsement indicators for each input variable and
    then summarize over the multiple endorsements to compute a score.
    These FAMHX scores are listed below.

### One family member (input field)

The following table gives an overview of the FAMHX summary scores that
are computed from one family member (input field), the associated name
of the input field and the function call that produces the score:

The primary computation in the
[`compute_famhx_endorsement()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_famhx_endorsement.md)
is the following, where,

> `data` = either the entire `mh_p_famhx` table or a subset containing
> all the necessary fields as shown above.  
>   
> [`combine_checkboxes()`](https://software.nbdc-datahub.org/ABCDscores/reference/combine_checkboxes.md)
> = function that combines the multiple columns for an input field, each
> representing one option, into a single column

``` r

data_ss <- data |>
  combine_checkboxes(
    var_basename = var_matches,
    name = "tmp_values"
  ) |>
  transmute(
    !!name := case_when(
      purrr::map_int(tmp_values, length) == 0 ~ NA,
      purrr::map_lgl(tmp_values, ~ 777 %in% .x) ~ NA,
      purrr::map_lgl(tmp_values, ~ 888 %in% .x) ~ NA,
      purrr::map_lgl(tmp_values, ~ 999 %in% .x) ~ NA,
      purrr::map_lgl(tmp_values, ~ 0 %in% .x) ~ 0,
      .default = 1
    ) |>
      as.integer()
  )
```

The classification logic applied to the combined, single field can be
read as:

- If no response was provided, or the responses included `777`, `888`,
  or `999`, the indicator is set to `NA`
- If the responses included the value `0`, the indicator is set to `0`
- For all other cases, the indicator is set to `1`

### Multiple family members (input fields)

For some of the FAMHX scores (shown below), multiple family members
(input fields) were summarized to create one endorsement summary score.

#### Example

For example, here are the primary computation steps in the
[`compute_mh_p_famhx__drg__moth__fath_indicator()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_famhx__drg__moth__fath_indicator.md)
function that computes the `mh_p_famhx__drg__moth__fath_indicator`
score, which aggregates over two individual indicators,
`mh_p_famhx__drg__fath_indicator` and `mh_p_famhx__drg__moth_indicator`.

``` r

# Subset the famhx_config file to obtain the
# metadata corresponding to the relevant input fields
config_sub <- ABCDscores::famhx_config |>
  filter(
    input_vars %in% c(
      "mh_p_famhx__drg__fath_001",
      "mh_p_famhx__drg__moth_001"
    )
  )

# Compute the `mh_p_famhx__drg__moth__fath_indicator` score
data_ss <- purrr::map_dfc(
  ## Step 1: compute indicators corresponding to each input field
  config_sub$call,
  ~ eval(parse(text = .x))
) |>
  ## Step 2: aggregate the individual indicators
  transmute(
    !!name := case_when(
      mh_p_famhx__drg__fath_indicator == 1 |
        mh_p_famhx__drg__moth_indicator == 1 ~ 1,
      mh_p_famhx__drg__fath_indicator == 0 &
        mh_p_famhx__drg__moth_indicator == 0 ~ 0,
      .default = NA
    ) |>
      as.integer()
  )
```

The aggregation logic applied above can be read as:

- If either `mh_p_famhx__drg__fath_indicator == 1` or
  `mh_p_famhx__drg__moth_indicator == 1`, set indicator to `1`.
- If both `mh_p_famhx__drg__fath_indicator` and
  `mh_p_famhx__drg__moth_indicator` are 0, set indicator to `0`.
- For all other cases, the indicator is set to `NA`
