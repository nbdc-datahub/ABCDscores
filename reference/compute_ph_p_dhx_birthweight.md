# Compute "Developmental History \[Parent\]: Youth birth weight"

Computes the summary score `ph_p_dhx_birthweight` Developmental History
\[Parent\]: Youth birth weight

- *Summarized variables:*

  - `ph_p_dhx_002__01`

  - `ph_p_dhx_002__02`

- *Excluded values:*

  - 999

  - any value less than 0

- *Notes:*

  - Computed using only baseline (`ses-00A`) and four-year (`ses-04A`)
    data

  - The following transformations were made prior to computing the
    score:

    - if `ph_p_dhx_002__01` \< 2, set it to 2

    - if `ph_p_dhx_002__01` \> 15, set it to 15

    - if `ph_p_dhx_002__02` \> 15 / 16, set it to 15 / 16

  - The following decisions were made based on discordance between
    baseline and four-year data:

    - if discordance is \<= 1, take baseline weight

    - if discordance is \> 1 and baseline weight is \> 4, take baseline
      weight

    - else if discordance is \> 1, take four-year weight

    - else if baseline weight is missing, take four-year weight

    - else, take baseline weight

## Usage

``` r
vars_ph_p_dhx_birthweight

compute_ph_p_dhx_birthweight(
  data,
  name = "ph_p_dhx_birthweight",
  combine = TRUE
)
```

## Format

vars_ph_p_dhx_birthweight is a character vector of all column names used
to compute summary score of `ph_p_dhx_birthweight`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized. NOTE: Only
  baseline and year 4 data has been used for this summary score.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.
