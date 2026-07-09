#' Compute Family History \[Parent\] Endorsement indicator
#'
#' @description
#' Computes a binary endorsement indicator, for alcohol or drug use
#' computed using a set of variables.
#' Resulting indicator is either 0 (FALSE) or 1 (TRUE), and
#' `NA` for missing or non-responses (777, 888, or 999).
#'
#' - *Notes:*
#'   - Following values are recoded as NA prior to any computation
#'      - 777
#'      - 888
#'      - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param var_matches character of length one. The base name of the checkbox
#'   field that is used to find all corresponding columns in `data` that
#'   contain the responses of a participant for the check box. This parameter
#'   is passed onto \code{\link[ABCDscores]{combine_checkboxes}} function.
#' @param combine logical. Whether to combine the summary score column with the
#'  input data frame (Default: TRUE).
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_famhx_endorsement(
#'   data = data,
#'   name = "mh_p_famhx__alc__fath_indicator",
#'   var_matches = "mh_p_famhx__alc__fath_001"
#' )
#' }
#' @export
#' @autoglobal
compute_famhx_endorsement <- function(
    data,
    name,
    var_matches,
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(var_matches)
  chk::chk_scalar(var_matches)

  sub_ncols <- data |>
    select(
      all_of(
        matches(var_matches)
      )
    ) |>
    ncol()

  if (sub_ncols == 0) {
    cli::cli_abort(
      message = c(
        "x" = "`data` have no columns starting with `{var_matches}`.",
        "Check that `data` has all the needed columns!"
      )
    )
  }

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

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__alc__moth__fath_indicator
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__alc__moth__fath_indicator`.
vars_mh_p_famhx__alc__moth__fath_indicator <- c(
  "mh_p_famhx__alc__fath_001",
  "mh_p_famhx__alc__moth_001"
)

#' Compute "Family History \[Parent\] (Alcohol) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__alc__moth__fath_indicator`
#' (Family History \[Parent\] (Alcohol) Endorsed: Either parent)
#'
#' - *Notes:*
#'   - Following values are recoded as NA prior to any computation
#'      - 777
#'      - 888
#'      - 999
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @param data tibble. A data frame containing the data.
#' @param name character. The name of the output column for the computed score.
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: `TRUE`).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__alc__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__alc__moth__fath_indicator",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))

  sub_ncols <- data |>
    select(
      all_of(
        matches(vars_mh_p_famhx__alc__moth__fath_indicator)
      )
    ) |>
    ncol()

  if (sub_ncols == 0) {
    cli::cli_abort(
      message = c(
        "x" = "`data` have no columns starting with `{vars_mh_p_famhx__alc__moth__fath_indicator}`.",
        "Check that `data` has the needed columns!"
      )
    )
  }

  config_sub <- ABCDscores::famhx_config |>
    filter(
      input_vars %in% vars_mh_p_famhx__alc__moth__fath_indicator
    )

  check_col_names(data, config_sub$name)

  data_ss <- purrr::map_dfc(
    config_sub$call,
    ~ eval(parse(text = .x))
  ) |>
    transmute(
      !!name := case_when(
        mh_p_famhx__alc__fath_indicator == 1 |
          mh_p_famhx__alc__moth_indicator == 1 ~ 1,
        mh_p_famhx__alc__fath_indicator == 0 &
          mh_p_famhx__alc__moth_indicator == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__drg__moth__fath_indicator
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__drg__moth__fath_indicator`.
vars_mh_p_famhx__drg__moth__fath_indicator <- c(
  "mh_p_famhx__drg__fath_001",
  "mh_p_famhx__drg__moth_001"
)

#' Compute "Family History \[Parent\] (Drug Use) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__drg__moth__fath_indicator`
#' (Family History \[Parent\] (Drug Use) Endorsed: Either parent)
#'
#' - *Notes:*
#'   - Following values are recoded as NA prior to any computation
#'      - 777
#'      - 888
#'      - 999
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__alc__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__drg__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__drg__moth__fath_indicator",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))

  sub_ncols <- data |>
    select(
      all_of(
        matches(vars_mh_p_famhx__drg__moth__fath_indicator)
      )
    ) |>
    ncol()

  if (sub_ncols == 0) {
    cli::cli_abort(
      message = c(
        "x" = "`data` have no columns starting with `{vars_mh_p_famhx__drg__moth__fath_indicator}`.",
        "Check that `data` has the needed columns!"
      )
    )
  }

  config_sub <- ABCDscores::famhx_config |>
    filter(
      input_vars %in% vars_mh_p_famhx__drg__moth__fath_indicator
    )

  check_col_names(data, config_sub$name)

  data_ss <- purrr::map_dfc(
    config_sub$call,
    ~ eval(parse(text = .x))
  ) |>
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

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__dep__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__dep__moth__fath_indicator`.
vars_mh_p_famhx__dep__moth__fath_indicator <- c(
  "mh_p_famhx__dep__fath_001",
  "mh_p_famhx__dep__moth_001"
)

#' Compute "Family History \[Parent\] (Depression) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__dep__moth__fath_indicator`
#' (Family History \[Parent\] (Depression) Endorsed: Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__alc__moth__fath_indicator
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__dep__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__dep__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__dep__moth__fath_indicator)

  vars <- vars_mh_p_famhx__dep__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__mania__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__mania__moth__fath_indicator`.
vars_mh_p_famhx__mania__moth__fath_indicator <- c(
  "mh_p_famhx__mania__fath_001",
  "mh_p_famhx__mania__moth_001"
)

#' Compute "Family History \[Parent\] (Mania) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__mania__moth__fath_indicator`
#' (Family History \[Parent\] (Mania) Endorsed: Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__mania__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__mania__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__mania__moth__fath_indicator)

  vars <- vars_mh_p_famhx__mania__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__halluc__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__halluc__moth__fath_indicator`.
vars_mh_p_famhx__halluc__moth__fath_indicator <- c(
  "mh_p_famhx__halluc__fath_001",
  "mh_p_famhx__halluc__moth_001"
)

#' Compute "Family History \[Parent\] (Hallucinations) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__halluc__moth__fath_indicator`
#' (Family History \[Parent\] (Hallucinations) Endorsed: Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__halluc__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__halluc__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__halluc__moth__fath_indicator)

  vars <- vars_mh_p_famhx__halluc__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__troub__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__troub__moth__fath_indicator`.
vars_mh_p_famhx__troub__moth__fath_indicator <- c(
  "mh_p_famhx__troub__fath_001",
  "mh_p_famhx__troub__moth_001"
)

#' Compute "Family History \[Parent\] (Trouble/Problems) Endorsed: Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__troub__moth__fath_indicator`
#' (Family History \[Parent\] (Trouble/Problems) Endorsed: Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__troub__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__troub__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__troub__moth__fath_indicator)

  vars <- vars_mh_p_famhx__troub__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__nerve__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__nerve__moth__fath_indicator`.
vars_mh_p_famhx__nerve__moth__fath_indicator <- c(
  "mh_p_famhx__nerve__fath_001",
  "mh_p_famhx__nerve__moth_001"
)

#' Compute "Family History \[Parent\] (Nerves/Nervous Breakdown) Endorsed:
#'  Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__nerve__moth__fath_indicator`
#' (Family History \[Parent\] (Nerves/Nervous Breakdown) Endorsed:
#' Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__nerve__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__nerve__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__nerve__moth__fath_indicator)

  vars <- vars_mh_p_famhx__nerve__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__doc__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__doc__moth__fath_indicator`.
vars_mh_p_famhx__doc__moth__fath_indicator <- c(
  "mh_p_famhx__doc__fath_001",
  "mh_p_famhx__doc__moth_001"
)

#' Compute "Family History \[Parent\] (Doctor Visit)) Endorsed:
#'  Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__doc__moth__fath_indicator`
#' (Family History \[Parent\] (Doctor Visit)) Endorsed:
#' Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__doc__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__doc__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__doc__moth__fath_indicator)

  vars <- vars_mh_p_famhx__doc__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__hosp__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__hosp__moth__fath_indicator`.
vars_mh_p_famhx__hosp__moth__fath_indicator <- c(
  "mh_p_famhx__hosp__fath_001",
  "mh_p_famhx__hosp__moth_001"
)

#' Compute "Family History \[Parent\] (Hospitalized)) Endorsed:
#'  Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__hosp__moth__fath_indicator`
#' (Family History \[Parent\] (Hospitalized)) Endorsed:
#' Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__hosp__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__hosp__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__hosp__moth__fath_indicator)

  vars <- vars_mh_p_famhx__hosp__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__suic__moth__fath_indicator
#' @format a character vector of fields used to compute
#'  `mh_p_famhx__suic__moth__fath_indicator`.
vars_mh_p_famhx__suic__moth__fath_indicator <- c(
  "mh_p_famhx__suic__fath_001",
  "mh_p_famhx__suic__moth_001"
)

#' Compute "Family History \[Parent\] (Suicide)) Endorsed:
#'  Either parent"
#'
#' @description
#' Computes the summary score `mh_p_famhx__suic__moth__fath_indicator`
#' (Family History \[Parent\] (Suicide)) Endorsed:
#' Either parent)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `yes` OR mother endorsed `yes`  = `1`
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__suic__moth__fath_indicator <- function(
    data,
    name = "mh_p_famhx__suic__moth__fath_indicator",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__suic__moth__fath_indicator)

  vars <- vars_mh_p_famhx__suic__moth__fath_indicator

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 1 | .data[[vars[2]]] == 1 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__alc__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__alc__moth__fath_score`.
vars_mh_p_famhx__alc__moth__fath_score <- c(
  "mh_p_famhx__alc__fath_001",
  "mh_p_famhx__alc__moth_001"
)

#' Compute "Family History \[Parent\] (Alcohol) Endorsed: Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__alc__moth__fath_score`
#' (Family History \[Parent\] (Alcohol) Endorsed: Parents overall)
#'
#' - *Notes:*
#'   - Following values are recoded as NA prior to any computation
#'      - 777
#'      - 888
#'      - 999
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @param data tibble. A data frame containing the data.
#' @param name character. The name of the output column for the computed score.
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: `TRUE`).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__alc__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__alc__moth__fath_score",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))

  sub_ncols <- data |>
    select(
      all_of(
        matches(vars_mh_p_famhx__alc__moth__fath_score)
      )
    ) |>
    ncol()

  if (sub_ncols == 0) {
    cli::cli_abort(
      message = c(
        "x" = "`data` have no columns starting with `{vars_mh_p_famhx__alc__moth__fath_score}`.",
        "Check that `data` has the needed columns!"
      )
    )
  }

  config_sub <- ABCDscores::famhx_config |>
    filter(
      input_vars %in% vars_mh_p_famhx__alc__moth__fath_score
    )

  check_col_names(data, config_sub$name)

  data_ss <- purrr::map_dfc(
    config_sub$call,
    ~ eval(parse(text = .x))
  ) |>
    transmute(
      !!name := case_when(
        mh_p_famhx__alc__fath_indicator == 0 &
          mh_p_famhx__alc__moth_indicator == 0 ~ 0,
        mh_p_famhx__alc__fath_indicator == 1 &
          mh_p_famhx__alc__moth_indicator == 0 ~ 1,
        mh_p_famhx__alc__fath_indicator == 0 &
          mh_p_famhx__alc__moth_indicator == 1 ~ 2,
        mh_p_famhx__alc__fath_indicator == 1 &
          mh_p_famhx__alc__moth_indicator == 1 ~ 3,
        is.na(mh_p_famhx__alc__fath_indicator) &
          mh_p_famhx__alc__moth_indicator == 1 ~ 4,
        mh_p_famhx__alc__fath_indicator == 1 &
          is.na(mh_p_famhx__alc__moth_indicator) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__drg__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__drg__moth__fath_score`.
vars_mh_p_famhx__drg__moth__fath_score <- c(
  "mh_p_famhx__drg__fath_001",
  "mh_p_famhx__drg__moth_001"
)

#' Compute "Family History \[Parent\] (Drug Use) Endorsed: Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__drg__moth__fath_score`
#' (Family History \[Parent\] (Drug Use) Endorsed: Parents overall)
#'
#' - *Notes:*
#'   - Following values are recoded as NA prior to any computation
#'      - 777
#'      - 888
#'      - 999
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__alc__moth__fath_score
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__drg__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__drg__moth__fath_score",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))

  sub_ncols <- data |>
    select(
      all_of(
        matches(vars_mh_p_famhx__drg__moth__fath_score)
      )
    ) |>
    ncol()

  if (sub_ncols == 0) {
    cli::cli_abort(
      message = c(
        "x" = "`data` have no columns starting with `{vars_mh_p_famhx__drg__moth__fath_score}`.",
        "Check that `data` has the needed columns!"
      )
    )
  }

  config_sub <- ABCDscores::famhx_config |>
    filter(
      input_vars %in% vars_mh_p_famhx__drg__moth__fath_score
    )

  check_col_names(data, config_sub$name)

  data_ss <- purrr::map_dfc(
    config_sub$call,
    ~ eval(parse(text = .x))
  ) |>
    transmute(
      !!name := case_when(
        mh_p_famhx__drg__fath_indicator == 0 &
          mh_p_famhx__drg__moth_indicator == 0 ~ 0,
        mh_p_famhx__drg__fath_indicator == 1 &
          mh_p_famhx__drg__moth_indicator == 0 ~ 1,
        mh_p_famhx__drg__fath_indicator == 0 &
          mh_p_famhx__drg__moth_indicator == 1 ~ 2,
        mh_p_famhx__drg__fath_indicator == 1 &
          mh_p_famhx__drg__moth_indicator == 1 ~ 3,
        is.na(mh_p_famhx__drg__fath_indicator) &
          mh_p_famhx__drg__moth_indicator == 1 ~ 4,
        mh_p_famhx__drg__fath_indicator == 1 &
          is.na(mh_p_famhx__drg__moth_indicator) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__dep__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__dep__moth__fath_score`.
vars_mh_p_famhx__dep__moth__fath_score <- c(
  "mh_p_famhx__dep__fath_001",
  "mh_p_famhx__dep__moth_001"
)

#' Compute "Family History \[Parent\] (Depression) Endorsed: Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__dep__moth__fath_score`
#' (Family History \[Parent\] (Depression) Endorsed: Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__dep__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__dep__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__dep__moth__fath_score)

  vars <- vars_mh_p_famhx__dep__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__mania__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__mania__moth__fath_score`.
vars_mh_p_famhx__mania__moth__fath_score <- c(
  "mh_p_famhx__mania__fath_001",
  "mh_p_famhx__mania__moth_001"
)

#' Compute "Family History \[Parent\] (Mania) Endorsed: Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__mania__moth__fath_score`
#' (Family History \[Parent\] (Mania) Endorsed: Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__mania__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__mania__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__mania__moth__fath_score)

  vars <- vars_mh_p_famhx__mania__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__halluc__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__halluc__moth__fath_score`.
vars_mh_p_famhx__halluc__moth__fath_score <- c(
  "mh_p_famhx__halluc__fath_001",
  "mh_p_famhx__halluc__moth_001"
)

#' Compute "Family History \[Parent\] (Hallucinations) Endorsed: Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__halluc__moth__fath_score`
#' (Family History \[Parent\] (Hallucinations) Endorsed: Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__halluc__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__halluc__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__halluc__moth__fath_score)

  vars <- vars_mh_p_famhx__halluc__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__troub__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__troub__moth__fath_score`.
vars_mh_p_famhx__troub__moth__fath_score <- c(
  "mh_p_famhx__troub__fath_001",
  "mh_p_famhx__troub__moth_001"
)

#' Compute "Family History \[Parent\] (Trouble/Problems) Endorsed:
#'  Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__troub__moth__fath_score`
#' (Family History \[Parent\] (Trouble/Problems) Endorsed:
#'  Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__troub__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__troub__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__troub__moth__fath_score)

  vars <- vars_mh_p_famhx__troub__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__nerve__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__nerve__moth__fath_score`.
vars_mh_p_famhx__nerve__moth__fath_score <- c(
  "mh_p_famhx__nerve__fath_001",
  "mh_p_famhx__nerve__moth_001"
)

#' Compute "Family History \[Parent\] (Nerves/Nervous Breakdown) Endorsed:
#'  Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__nerve__moth__fath_score`
#' (Family History \[Parent\] (Nerves/Nervous Breakdown) Endorsed:
#'  Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__nerve__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__nerve__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__nerve__moth__fath_score)

  vars <- vars_mh_p_famhx__nerve__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__doc__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__doc__moth__fath_score`.
vars_mh_p_famhx__doc__moth__fath_score <- c(
  "mh_p_famhx__doc__fath_001",
  "mh_p_famhx__doc__moth_001"
)

#' Compute "Family History \[Parent\] (Doctor Visit) Endorsed:
#'  Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__doc__moth__fath_score`
#' (Family History \[Parent\] (Doctor Visit) Endorsed:
#'  Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__doc__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__doc__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__doc__moth__fath_score)

  vars <- vars_mh_p_famhx__doc__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__hosp__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__hosp__moth__fath_score`.
vars_mh_p_famhx__hosp__moth__fath_score <- c(
  "mh_p_famhx__hosp__fath_001",
  "mh_p_famhx__hosp__moth_001"
)

#' Compute "Family History \[Parent\] (Hospitalized) Endorsed:
#'  Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__hosp__moth__fath_score`
#' (Family History \[Parent\] (Hospitalized) Endorsed:
#'  Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__hosp__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__hosp__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__hosp__moth__fath_score)

  vars <- vars_mh_p_famhx__hosp__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_famhx__suic__moth__fath_score
#' @format a character vector of base name of the check boxes used to compute
#'  `mh_p_famhx__suic__moth__fath_score`.
vars_mh_p_famhx__suic__moth__fath_score <- c(
  "mh_p_famhx__suic__fath_001",
  "mh_p_famhx__suic__moth_001"
)

#' Compute "Family History \[Parent\] (Suicide) Endorsed:
#'  Parents overall"
#'
#' @description
#' Computes the summary score `mh_p_famhx__suic__moth__fath_score`
#' (Family History \[Parent\] (Suicide) Endorsed:
#'  Parents overall)
#'
#' - *Excluded values:*
#'    - 777
#'    - 888
#'    - 999
#'
#' - *Notes:*
#'   - Following logic is applied to compute the score:
#'      - father endorsed `no` AND mother endorsed `no`   = `0`
#'      - father endorsed `yes` AND mother endorsed `no`  = `1`
#'      - father endorsed `no` AND mother endorsed `yes`  = `2`
#'      - father endorsed `yes` AND mother endorsed `yes` = `3`
#'      - father endorsed `NA` AND mother endorsed `yes`  = `4`
#'      - father endorsed `yes` AND mother endorsed `NA`  = `5`
#'      - all other cases set to `NA`
#'
#' @inheritParams compute_mh_p_famhx__dep__moth__fath_indicator
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
compute_mh_p_famhx__suic__moth__fath_score <- function(
    data,
    name = "mh_p_famhx__suic__moth__fath_score",
    exclude = c("777", "888", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_famhx__suic__moth__fath_score)

  vars <- vars_mh_p_famhx__suic__moth__fath_score

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude, NA, .x
        ) |>
          as.character() |>
          as.integer()
      )
    ) |>
    transmute(
      !!name := case_when(
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 0 ~ 0,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 0 ~ 1,
        .data[[vars[1]]] == 0 & .data[[vars[2]]] == 1 ~ 2,
        .data[[vars[1]]] == 1 & .data[[vars[2]]] == 1 ~ 3,
        is.na(.data[[vars[1]]]) & .data[[vars[2]]] == 1 ~ 4,
        .data[[vars[1]]] == 1 & is.na(.data[[vars[2]]]) ~ 5,
        .default = NA
      ) |>
        as.integer()
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute all the `mh_p_famhx` summary scores
#'
#' @description
#' This is a high-level function that computes all summary scores in this table.
#' Make sure the `data` contains all the necessary columns.
#'
#' @param data tbl. Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_mh_p_famhx_all(data)
#' }
compute_mh_p_famhx_all <- function(data) {
  data_with_ss <- data |>
    compute_mh_p_famhx__alc__moth__fath_indicator() |>
    compute_mh_p_famhx__drg__moth__fath_indicator() |>
    compute_mh_p_famhx__dep__moth__fath_indicator() |>
    compute_mh_p_famhx__mania__moth__fath_indicator() |>
    compute_mh_p_famhx__halluc__moth__fath_indicator() |>
    compute_mh_p_famhx__troub__moth__fath_indicator() |>
    compute_mh_p_famhx__nerve__moth__fath_indicator() |>
    compute_mh_p_famhx__doc__moth__fath_indicator() |>
    compute_mh_p_famhx__hosp__moth__fath_indicator() |>
    compute_mh_p_famhx__suic__moth__fath_indicator() |>
    compute_mh_p_famhx__alc__moth__fath_score() |>
    compute_mh_p_famhx__drg__moth__fath_score() |>
    compute_mh_p_famhx__dep__moth__fath_score() |>
    compute_mh_p_famhx__mania__moth__fath_score() |>
    compute_mh_p_famhx__halluc__moth__fath_score() |>
    compute_mh_p_famhx__troub__moth__fath_score() |>
    compute_mh_p_famhx__nerve__moth__fath_score() |>
    compute_mh_p_famhx__doc__moth__fath_score() |>
    compute_mh_p_famhx__hosp__moth__fath_score() |>
    compute_mh_p_famhx__suic__moth__fath_score()

  data_ss <- purrr::map_dfc(
    ABCDscores::famhx_config$call,
    ~ eval(parse(text = .x))
  )

  bind_cols(
    data_with_ss,
    data_ss
  )
}
