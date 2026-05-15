# Strategy for dealing with mid-year sessions

Remove or map mid-year session records to full-year sessions according
to a chosen algorithm. Operations are performed per participant on data
prepared by
[`prepare_data_sdsu()`](https://software.nbdc-datahub.org/ABCDscores/reference/prepare_data_sdsu.md).

## Usage

``` r
map_mid_years(data, algo = NULL)
```

## Arguments

- data:

  tibble. A dataframe produced by
  [`prepare_data_sdsu()`](https://software.nbdc-datahub.org/ABCDscores/reference/prepare_data_sdsu.md).

- algo:

  character. Mapping algorithm to apply to mid‑year sessions. Allowed
  values:

  - `"next_existing_fy"`: assign a mid year to the next existing full
    year. If a participant ends with mid‑year visits, those terminal
    mid‑year records are dropped.

  - `"next_potential_fy"`: assign a mid year to the next existing full
    year when present, otherwise assign to the next forecasted full year
    (that may never materialize).

  - `"next_immediate_fy"`: assign a mid year to the next full year
    regardless of whether that full year record exists or not.

  - `"remove_my"`: drop mid-year events and keep only full-year events.
    If `NULL` (default) no mapping is performed and `data` is returned
    unchanged.

## Value

tibble. A tibble with `session_id` remapped or rows filtered.

## Examples

``` r
if (FALSE) { # \dontrun{
map_mid_years(data, algo = "next_immediate_fy")
} # }
```
