#' Sample dataset of Timeline Followback assessment
#'
#' Sample TLFB data for testing and examples.
#'
#' @name data_tlfb_sample
#' @keywords internal datasets
"data_tlfb_sample"

#' Configuration for Timeline Followback calculations
#'
#' Settings for processing TLFB substance use data.
#'
#' @name tlfb_config
#' @keywords internal datasets
"tlfb_config"

#' Configuration for Substance Use Interview calculations
#'
#' Settings for processing SUI substance use data.
#'
#' @name sui_config
#' @keywords internal datasets
"sui_config"


#' Configuration for Static and Dynamic Substance Use calculations
#'
#' Settings for processing Static and Dynamic Substance Use data.
#'
#' @name sdsu_config
#' @keywords internal datasets
"sdsu_config"

#' Medical prescription Normalized Names mapping (RxNorm) data
#'
#' @description
#'
#' A list of medication data frames of 5 different categories:
#' - rx_ingr: Ingredient Name
#' - rx_pingr: Precise Ingredient Name
#' - rx_mingr: Multiple Ingredients Name
#' - rx_bn (BN): Brand Name
#' - rx_estuse: Estimated Use Category
#'
#' `rx_config` is a tibble with configuration settings for medication
#' score calculations.
#'
#' Columns in `rx_config`:
#'
#' - med_type: character, medication type, either "otc" (over-the-counter) or
#' "rx" (prescription).
#' - idx: character, index number as a string with leading zeros.
#' - catg: character, category of medication mapping,
#' one of categories from `rx_map`.
#' - table_name: character, table name for the score variable.
#' - col_add: character, column name for additional filtering (if any) with
#' values "1" (yes) or "0" (no) or `NA`.
#' - col_summary1: character, primary column name in the data frame containing
#' medication RxCUI.
#' - use_col_add1: logical, whether to apply `col_add` filtering when
#' `col_summary1` has data.
#' - col_summary2: character, secondary column name in the data frame
#' containing medication RxCUI; used when `col_summary1` is `NA`.
#' - use_col_add2: logical, whether to apply `col_add` filtering when
#' `col_summary2` has data.
#' - name: character, name of the new column to be created in the summary score.
#'
#' Selection rule for RxCUI source columns:
#' - Use `col_summary1` first when it has data.
#' - Otherwise, use `col_summary2`.
#' - Apply `col_add` only when the corresponding `use_col_add*` flag is `TRUE`
#' and the selected summary column has data.
#'
#'
#' Columns in `rx_config_estuse_flags`:
#' - time_point: character, time point of the medication data,
#' "1yr", or "2wk" or "24hr".
#' - idx: character, index number as a string **without** leading zeros.
#' - table_name: character, table name for the score variable.
#' - name: character, name of the new column to be created in the summary score.
#'
#' @details
#' #### rx_map
#' In each data frame, `rx` is the RxCUI identifier, and `category` is the
#' value in that category.
#'
#' Disclaimer: This product uses publicly available data from the U.S.
#' National Library of Medicine (NLM), National Institutes of Health,
#' Department of Health and Human Services; NLM is not responsible for
#' the product and does not endorse or recommend this or any other product.
#'
#' @name rx_map
#' @keywords internal datasets
"rx_map"

#' @rdname rx_map
"rx_config"

#' @rdname rx_map
"rx_config_estuse_flags"

#' Configuration for parent Family history calculations
#'
#' Settings for processing family history of substance use data.
#'
#' @format A data frame with 96 rows and 4 columns:
#' \describe{
#'   \item{name}{Name of the summary scores to be computed.}
#'   \item{input_vars}{
#'      Prefix or basename of the checkbox field used to compute
#'      the summary score. The prefix provided in `input_vars` is used to
#'      identify all fields associated with the checkbox, one column per
#'      checkbox option; matches the regex `^{input_vars}*`.
#'    }
#'   \item{fun}{The function used to compute the summary score.}
#'   \item{call}{
#'      The complete call to the function specified in `fun`,
#'      displaying the values of different parameters used in the function.
#'    }
#' }
#'
#' @name famhx_config
#' @keywords internal datasets
"famhx_config"
