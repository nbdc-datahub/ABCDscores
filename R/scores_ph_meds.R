# RxNorm ------------------------------------------------------------------

#' Compute all medication categories \[Parent\] \[Youth\]
#' @description
#' This function computes all medication category mapping summary scores
#' based on the provided configuration in `rx_config` by mapping medication
#' RxCUI codes to their respective categories that are stored in
#' `ABCDscores::rx_map`.
#'
#' It processes each row in `rx_config`. One row corresponds to one medication
#' category mapping score. For each row, it first checks `col_summary1`. If
#' `col_summary1` has data, that value is used. If `col_summary1` is `NA`, it
#' falls back to `col_summary2`.
#'
#' It then applies `col_add` filtering only when both conditions are met:
#' - the corresponding flag (`use_col_add1` or `use_col_add2`) is `TRUE`, and
#' - `col_add` is provided (not `NA`).
#'
#' When filtering is applied, only rows with `col_add == "1"` are retained;
#' otherwise, the selected RxCUI is set to `NA`.
#'
#' After source selection and optional filtering, it maps the retained RxCUI
#' codes to their respective
#' categories using the appropriate mapping data frame from `ABCDscores::rx_map`
#' based on the `catg` specified in `rx_config`. The resulting category values
#' are then stored in a new column named as specified in the `name` column of
#' `rx_config`.
#'
#' - *Summarized variables:* see `rx_config` for the list of variables.
#'
#' @seealso [rx_map]
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param rx_config tbl, Configuration tibble specifying the medication
#'  category mappings to compute. Default is `ABCDscores::rx_config`.
#' @param combine logical, If `TRUE`, the computed summary scores are
#' appended to the original data frame. If `FALSE`, only the summary scores
#' are returned. Default is `TRUE`.
#'
#' @details
#' ### Disclaimer
#'
#' "This product uses publicly available data from the U.S. National Library
#' of Medicine (NLM), National Institutes of Health, Department of Health and
#' Human Services; NLM is not responsible for the product and does not endorse
#' or recommend this or any other product."
#'
#' ### Functions for specific tables
#'
#' - `compute_ph_meds_catg_all()`: Computes all medication category
#' mappings across all tables.
#' - `compute_ph_p_meds_catg_all()`: Computes all medication category
#' mappings for the `ph_p_meds` table.
#' - `compute_ph_y_meds_catg_all()`: Computes all medication category
#' mappings for the `ph_y_meds` table.
#' - `compute_ph_p_dhx_catg_all()`: Computes all medication category
#' mappings for the `ph_p_dhx` table.
#'
#' @references The medical estimated use values and categories are generated
#' from: Lopez, D. A., Overholtzer, L. N., Rhee, K. E., Buchbinder, N.,
#' Ruiz-Orozco, G. E., Steinhilber, S., Tognoli, M., Lopez-Flores, A., &
#' Nagel, B. J. (2025). Classifying and visualizing medication use in the
#' Adolescent Brain Cognitive Development (ABCD) Study. *medRxiv*.
#' @returns tbl. see `combine` parameter.
#' @export
#' @autoglobal
compute_ph_meds_catg_all <- function(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::check_names(
    data,
    c(
      rx_config$col_add,
      rx_config$col_summary1,
      rx_config$col_summary2
    ) |>
      unique() |>
      na.omit()
  )
  check_col_names(data, rx_config$name)
  chk::chk_data(rx_config)
  chk::check_names(
    rx_config,
    c(
      "catg", "table_name", "col_add",
      "col_summary1", "use_col_add1",
      "col_summary2", "use_col_add2",
      "name"
    )
  )
  chk::chk_logical(combine)


  data_ss <- purrr::pmap_dfc(
    rx_config,
    \(catg, col_add,
      col_summary1, use_col_add1,
      col_summary2, use_col_add2,
      name, ...) {
      rx1 <- if (!is.na(col_summary1)) {
        as.character(data[[col_summary1]])
      } else {
        rep(NA_character_, nrow(data))
      }
      rx2 <- if (!is.na(col_summary2)) {
        as.character(data[[col_summary2]])
      } else {
        rep(NA_character_, nrow(data))
      }

      use_first <- !is.na(rx1)
      rx <- if_else(use_first, rx1, rx2)
      use_col_add <- if_else(
        use_first,
        coalesce(use_col_add1, FALSE),
        coalesce(use_col_add2, FALSE)
      )

      gate <- if (!is.na(col_add)) {
        as.character(data[[col_add]])
      } else {
        rep(NA_character_, nrow(data))
      }

      gate_required <- use_col_add & !is.na(col_add)
      keep_rx <- !gate_required | (!is.na(gate) & gate == "1")

      tibble(rx = if_else(keep_rx, rx, NA_character_)) |>
        left_join(ABCDscores::rx_map[[paste0("rx_", catg)]], by = "rx") |>
        rename(!!name := category) |>
        select(-rx)
    },
    .progress = TRUE
  )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @rdname compute_ph_meds_catg_all
#' @export
#' @autoglobal
compute_ph_p_meds_catg_all <- function(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::check_names(
    rx_config,
    c(
      "catg", "table_name", "col_add",
      "col_summary1", "use_col_add1",
      "col_summary2", "use_col_add2",
      "name"
    )
  )

  rx_config <- rx_config |>
    filter(table_name == "ph_p_meds")
  compute_ph_meds_catg_all(
    data = data,
    rx_config = rx_config,
    combine = combine
  )
}

#' @rdname compute_ph_meds_catg_all
#' @export
#' @autoglobal
compute_ph_y_meds_catg_all <- function(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::check_names(
    rx_config,
    c(
      "catg", "table_name", "col_add",
      "col_summary1", "use_col_add1",
      "col_summary2", "use_col_add2",
      "name"
    )
  )

  rx_config <- rx_config |>
    filter(table_name == "ph_y_meds")
  compute_ph_meds_catg_all(
    data = data,
    rx_config = rx_config,
    combine = combine
  )
}

#' @rdname compute_ph_meds_catg_all
#' @export
#' @autoglobal
compute_ph_p_dhx_catg_all <- function(
  data,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::check_names(
    rx_config,
    c(
      "catg", "table_name", "col_add",
      "col_summary1", "use_col_add1",
      "col_summary2", "use_col_add2",
      "name"
    )
  )

  rx_config <- rx_config |>
    filter(table_name == "ph_p_dhx")
  compute_ph_meds_catg_all(
    data = data,
    rx_config = rx_config,
    combine = combine
  )
}

#' Compute all medication estimated use flags \[Parent\] \[Youth\]
#' @description
#' This function computes all medication estimated use flag summary scores
#' based on the provided configuration in `rx_config_estuse_flags` and the
#' computed medication categories from `rx_config`.
#'
#' It first calls `compute_ph_meds_catg_all()` to obtain the medication category
#' mappings of all `estuse` categories. Then, for each row in
#' `rx_config_estuse_flags`, it checks if any of the corresponding medication
#' category mapping scores (from both OTC and RX medications) match the
#' specified `idx` category index. If a match is found, it assigns a value of
#' "1" to indicate estimated use; otherwise, it assigns "0". The resulting
#' estimated use flags are stored in new columns named as specified in the
#' `name` column of `rx_config_estuse_flags`.
#'
#' - *Summarized variables:* see `rx_config` for the list of variables.
#'
#' @seealso [compute_ph_meds_catg_all()], [rx_map]
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param rx_config_estuse_flags tbl, Configuration tibble specifying the
#'  estimated use flag mappings to compute. Default is
#'  `ABCDscores::rx_config_estuse_flags`.
#' @param rx_config tbl, Configuration tibble specifying the medication
#'  category mappings to compute. Default is `ABCDscores::rx_config`.
#' @param combine logical, If `TRUE`, the computed summary scores are
#' appended to the original data frame. If `FALSE`, only the summary scores
#' are returned. Default is `TRUE`.
#'
#' @details
#' ### Disclaimer
#'
#' "This product uses publicly available data from the U.S. National Library
#' of Medicine (NLM), National Institutes of Health, Department of Health and
#' Human Services; NLM is not responsible for the product and does not endorse
#' or recommend this or any other product."
#'
#' ### Functions for specific tables
#'
#' - `compute_ph_meds_estuse_flags_all()`: Computes all medication estimated
#' use flags across all tables.
#' - `compute_ph_p_meds_estuse_flags_all()`: Computes all medication estimated
#' use flags for the `ph_p_meds` table.
#' - `compute_ph_y_meds_estuse_flags_all()`: Computes all medication estimated
#' use flags for the `ph_y_meds` table.
#' @references The medical estimated use values and categories are generated
#' from: Lopez, D. A., Overholtzer, L. N., Rhee, K. E., Buchbinder, N.,
#' Ruiz-Orozco, G. E., Steinhilber, S., Tognoli, M., Lopez-Flores, A., &
#' Nagel, B. J. (2025). Classifying and visualizing medication use in the
#' Adolescent Brain Cognitive Development (ABCD) Study. *medRxiv*.
#' @returns tbl. see `combine` parameter.
#' @export
#' @autoglobal
compute_ph_meds_estuse_flags_all <- function(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  idx_input <- stringr::str_pad(seq_len(15), 3, pad = "0")

  chk::check_data(rx_config_estuse_flags)
  chk::check_names(
    rx_config_estuse_flags,
    c("time_point", "table_name", "idx", "name")
  )
  chk::chk_data(data)
  check_col_names(
    data,
    rx_config_estuse_flags$name
  )
  chk::chk_logical(combine)

  rx_config_estuse <- rx_config |>
    filter(catg == "estuse")
  data_catg <- compute_ph_meds_catg_all(
    data = data |>
      select(-any_of(rx_config_estuse$name)),
    rx_config = rx_config_estuse,
    combine = FALSE
  )

  data_ss <- purrr::pmap_dfc(
    rx_config_estuse_flags,
    \(time_point, idx, name, ...) {
      data_catg |>
        transmute(
          !!name := ifelse(
            if_any(
              any_of(c(
                glue::glue("ph_p_meds__otc__{time_point}_estuse__{idx_input}"),
                glue::glue("ph_p_meds__rx__{time_point}_estuse__{idx_input}")
              )),
              ~ coalesce(as.character(.x), "") == idx
            ),
            "1", "0"
          )
        )
    },
    .progress = TRUE
  )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @rdname compute_ph_meds_estuse_flags_all
#' @export
#' @autoglobal
compute_ph_p_meds_estuse_flags_all <- function(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(rx_config_estuse_flags)
  chk::check_names(
    rx_config_estuse_flags,
    c("time_point", "table_name", "idx", "name")
  )

  rx_config_estuse_flags <- rx_config_estuse_flags |>
    filter(table_name == "ph_p_meds")
  rx_config <- rx_config |>
    filter(table_name == "ph_p_meds")
  compute_ph_meds_estuse_flags_all(
    data = data,
    rx_config_estuse_flags = rx_config_estuse_flags,
    rx_config = rx_config,
    combine = combine
  )
}

#' @rdname compute_ph_meds_estuse_flags_all
#' @export
#' @autoglobal
compute_ph_y_meds_estuse_flags_all <- function(
  data,
  rx_config_estuse_flags = ABCDscores::rx_config_estuse_flags,
  rx_config = ABCDscores::rx_config,
  combine = TRUE
) {
  chk::chk_data(rx_config_estuse_flags)
  chk::check_names(
    rx_config_estuse_flags,
    c("time_point", "table_name", "idx", "name")
  )

  rx_config_estuse_flags <- rx_config_estuse_flags |>
    filter(table_name == "ph_y_meds")
  rx_config <- rx_config |>
    filter(table_name == "ph_y_meds")
  compute_ph_meds_estuse_flags_all(
    data = data,
    rx_config_estuse_flags = rx_config_estuse_flags,
    rx_config = rx_config,
    combine = combine
  )
}
