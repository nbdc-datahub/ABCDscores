# Prepare data for applying mid-year strategy

Clean and prepare data for Static and Dynamic Substance Use (SDSU)
scoring:

- derive `session_type` ("A" for annual, "M" for mid-year),

- compute `session_date` and `session_age`,

- fill missing session dates within each participant and sort by filled
  date,

- map mid-year sessions to the next observed annual session
  (`session_id_mapped`),

- compute `last_session_id`, `forecast_next_annual`, and
  `session_id_mapped_forecast`.

## Usage

``` r
prepare_data_sdsu(data)
```

## Arguments

- data:

  tibble. Dataset with columns from several tables (e.g. `su_y_lowuse`,
  `su_y_sui`, `su_y_mypi`, `su_y_mysu`, `su_y_tlfb`) and containing at
  minimum `participant_id`, `session_id`, `ab_g_dyn__visit_dtt`,
  `ab_g_dyn__visit_age`, and `su_y_mypi_dtt`.

## Value

tibble. Input tibble with added/modified columns: `session_type`,
`session_date`, `session_date_filled`, `session_id_mapped`,
`last_session_id`, `forecast_next_annual`, and
`session_id_mapped_forecast`.

## Examples

``` r
if (FALSE) { # \dontrun{
prepare_data_sdsu(dplyr::tibble(
  participant_id = "sub-1",
  session_id = "ses-01A",
  ab_g_dyn__visit_dtt = as.Date("2020-01-01"),
  su_y_mypi_dtt = as.Date(NA)
))
} # }
```
