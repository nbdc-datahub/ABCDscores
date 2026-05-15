# Medical prescription Normalized Names mapping (RxNorm) data

A list of medication data frames of 5 different categories:

- rx_ingr: Ingredient Name

- rx_pingr: Precise Ingredient Name

- rx_mingr: Multiple Ingredients Name

- rx_bn (BN): Brand Name

- rx_estuse: Estimated Use Category

`rx_config` is a tibble with configuration settings for medication score
calculations.

Columns in `rx_config`:

- med_type: character, medication type, either "otc" (over-the-counter)
  or "rx" (prescription).

- idx: character, index number as a string with leading zeros.

- catg: character, category of medication mapping, one of categories
  from `rx_map`.

- table_name: character, table name for the score variable.

- col_add: character, column name for additional filtering (if any) with
  values "1" (yes) or "0" (no) or `NA`.

- col_summary1: character, primary column name in the data frame
  containing medication RxCUI.

- use_col_add1: logical, whether to apply `col_add` filtering when
  `col_summary1` has data.

- col_summary2: character, secondary column name in the data frame
  containing medication RxCUI; used when `col_summary1` is `NA`.

- use_col_add2: logical, whether to apply `col_add` filtering when
  `col_summary2` has data.

- name: character, name of the new column to be created in the summary
  score.

Selection rule for RxCUI source columns:

- Use `col_summary1` first when it has data.

- Otherwise, use `col_summary2`.

- Apply `col_add` only when the corresponding `use_col_add*` flag is
  `TRUE` and the selected summary column has data.

Columns in `rx_config_estuse_flags`:

- time_point: character, time point of the medication data, "1yr", or
  "2wk" or "24hr".

- idx: character, index number as a string **without** leading zeros.

- table_name: character, table name for the score variable.

- name: character, name of the new column to be created in the summary
  score.

## Usage

``` r
rx_map

rx_config

rx_config_estuse_flags
```

## Format

An object of class `list` of length 5.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 570
rows and 10 columns.

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 475
rows and 4 columns.

## Details

### rx_map

In each data frame, `rx` is the RxCUI identifier, and `category` is the
value in that category.

Disclaimer: This product uses publicly available data from the U.S.
National Library of Medicine (NLM), National Institutes of Health,
Department of Health and Human Services; NLM is not responsible for the
product and does not endorse or recommend this or any other product.
