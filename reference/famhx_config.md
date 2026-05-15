# Configuration for parent Family history calculations

Settings for processing family history of substance use data.

## Usage

``` r
famhx_config
```

## Format

A data frame with 96 rows and 4 columns:

- name:

  Name of the summary scores to be computed.

- input_vars:

  Prefix or basename of the checkbox field used to compute the summary
  score. The prefix provided in `input_vars` is used to identify all
  fields associated with the checkbox, one column per checkbox option;
  matches the regex `^{input_vars}*`.

- fun:

  The function used to compute the summary score.

- call:

  The complete call to the function specified in `fun`, displaying the
  values of different parameters used in the function.
