#   ____________________________________________________________________________
#   ph_p_dhx_birthweight                                                    ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_dhx_birthweight
#' @format vars_ph_p_dhx_birthweight is a character vector of all column names
#' used to compute summary score of `ph_p_dhx_birthweight`.
vars_ph_p_dhx_birthweight <- c(
  "ph_p_dhx_002__01",
  "ph_p_dhx_002__02"
)

#' Compute "Developmental History \[Parent\]: Youth birth weight"
#'
#' @description
#' Computes the summary score `ph_p_dhx_birthweight`
#' Developmental History \[Parent\]: Youth birth weight
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_dhx_birthweight |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 999
#'    - any value less than 0
#'
#' - *Notes:*
#'   - Computed using only baseline (`ses-00A`) and four-year (`ses-04A`) data
#'   - The following transformations were made prior to computing the score:
#'     - if `ph_p_dhx_002__01` < 2, set it to 2
#'     - if `ph_p_dhx_002__01` > 15, set it to 15
#'     - if `ph_p_dhx_002__02` > 15 / 16, set it to 15 / 16
#'   - The following decisions were made based on discordance between baseline
#'   and four-year data:
#'     - if discordance is <= 1, take baseline weight
#'     - if discordance is > 1 and baseline weight is > 4, take baseline weight
#'     - else if discordance is > 1, take four-year weight
#'     - else if baseline weight is missing, take four-year weight
#'     - else, take baseline weight
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#'    NOTE: Only baseline and year 4 data has been used for this summary score.
#' @param name character, Name of the new column to be created. Default is
#'    the name in description, but users can change it.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#'    the input data frame. If `FALSE`, the summary score will be returned as a
#'    separate data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_dhx_birthweight <- function(
    data,
    name = "ph_p_dhx_birthweight",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data_ss <- data |>
    # take only baseline and four-year data
    filter(
      session_id %in% c("ses-00A", "ses-04A")
    ) |>
    recode_levels(
      vars = "session_id",
      recode = c(
        "ses-00A" = "baseline",
        "ses-04A" = "fouryear"
      )
    ) |>
    mutate(
      # convert ounces to lbs
      ph_p_dhx_002__02 = ph_p_dhx_002__02 / 16,
      # correct outliers
      var1 = case_when(
        ph_p_dhx_002__01 < 0 ~ NA,
        ph_p_dhx_002__01 == 999 ~ NA,
        ph_p_dhx_002__01 < 2 ~ 2,
        ph_p_dhx_002__01 > 15 ~ 15,
        .default = ph_p_dhx_002__01
      ),
      var2 = case_when(
        ph_p_dhx_002__02 < 0 ~ NA,
        ph_p_dhx_002__02 == 999 ~ NA,
        ph_p_dhx_002__02 > 15 / 16 ~ 15 / 16,
        .default = ph_p_dhx_002__02
      ),
      weight = if_else(
        !is.na(var1),
        rowSums(across(c(var1, var2)), na.rm = TRUE) |> round(2),
        NA
      )
    ) |>
    group_by(
      participant_id,
      session_id
    ) |>
    reframe(
      weight = unique(na.omit(weight))
    ) |>
    tidyr::pivot_wider(
      names_from = session_id,
      values_from = weight
    ) |>
    mutate(
      disco = abs(baseline - fouryear)
    ) |>
    mutate(
      !!name := case_when(
        # both baseline and four-year exists
        disco <= 1 ~
          baseline,
        disco > 1 &
          baseline > 4 ~
          baseline,
        disco > 1 ~
          fouryear,
        # either baseline or fouryear, or both, do not exist
        is.na(baseline) ~
          fouryear,
        .default = baseline
      )
    ) |>
    select(
      participant_id,
      !!name
    )

  if (combine) {
    left_join(data, data_ss, join_by(participant_id))
  } else {
    data_ss[[name]]
  }
}

#   ____________________________________________________________________________
#   dummy func for params                                                   ####

#' Dummy function for all OBTI score functions.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score column.
#' @param combine logical. If `TRUE` (default), the summary score is
#'    is appended as a new column to the input data frame. If `FALSE`, the
#'    summary score is returned as a separate one-column data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'    allowed. `NULL` means no limit.
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. see `combine`.
#'
#' @keywords internal
dummy_ph_p_otbi <- function(data, name, combine, max_na, exclude) {}

#   ____________________________________________________________________________
#   ph_p_otbi                                                               ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi_nm
#' @format vars_ph_p_otbi is a character vector of
#' all column names used to compute summary score of `ph_p_otbi_nm`.
#'
vars_ph_p_otbi <- list(
  # baseline
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi_002",
    "ph_p_otbi_003",
    "ph_p_otbi_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt_003"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__rpt_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Number of
#' missing gating items"
#'
#' @description
#' Computes the summary score `ph_p_otbi_nm`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Number of missing
#' gating items
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi_nm <- function(
    data,
    name = "ph_p_otbi_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  conditions_baseline <- c(
    "is.na(ph_p_otbi_001)",
    "is.na(ph_p_otbi_002)",
    "is.na(ph_p_otbi_003)",
    "is.na(ph_p_otbi_004)",
    "is.na(ph_p_otbi_005)",
    "is.na(ph_p_otbi__loc__add_001)",
    "is.na(ph_p_otbi__rpt_001)",
    "ph_p_otbi__rpt_001 == 1 & is.na(ph_p_otbi__rpt_002)",
    "ph_p_otbi__rpt_002 == 1 & is.na(ph_p_otbi__rpt_003)"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "is.na(ph_p_otbi_001__l)",
    "is.na(ph_p_otbi_002__l)",
    "is.na(ph_p_otbi_003__l)",
    "is.na(ph_p_otbi_004__l)",
    "is.na(ph_p_otbi_005__l) & ph_p_otbi_005__l_present == TRUE",
    "is.na(ph_p_otbi__loc__add_001__l)",
    "is.na(ph_p_otbi__rpt_001__l)"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__loc__30m_count                                               ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__loc__30m_count
#' @format vars_ph_p_otbi__loc__30m_count is a character vector of all column
#' names used to compute summary score of `ph_p_otbi__loc__30m_count`.
vars_ph_p_otbi__loc__30m_count <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi__loc_001",
    "ph_p_otbi_002",
    "ph_p_otbi__loc_002",
    "ph_p_otbi_003",
    "ph_p_otbi__loc_003",
    "ph_p_otbi_004",
    "ph_p_otbi__loc_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__loc__add_001__03",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__loc__add_001__03__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness - Over 30 minutes): Count"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc__30m_count`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness - Over 30 minutes): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__loc__30m_count) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc__30m_count <- function(
    data,
    name = "ph_p_otbi__loc__30m_count",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 > 1",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 > 1",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 > 1",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 > 1",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 > 1",
    "ph_p_otbi__loc__add_001__03",
    "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 > 1"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l > 1",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l > 1",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l > 1",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l > 1",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l > 1 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__03__l",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l > 1"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__loc__30m_count[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__loc__30m_count[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness - Over 30 minutes): Number missing"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc__30m_nm`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness - Over 30 minutes): Number missing
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__loc__30m_count()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc__30m_nm <- function(
    data,
    name = "ph_p_otbi__loc__30m_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & is.na(ph_p_otbi__loc_001)",
    "ph_p_otbi_002 == 1 & is.na(ph_p_otbi__loc_002)",
    "ph_p_otbi_003 == 1 & is.na(ph_p_otbi__loc_003)",
    "ph_p_otbi_004 == 1 & is.na(ph_p_otbi__loc_004)",
    "ph_p_otbi_005 == 1 & is.na(ph_p_otbi__loc_005)",
    "ph_p_otbi__loc__add_001 == 1 & is.na(ph_p_otbi__loc__add_001__03)",
    "ph_p_otbi__rpt_001 == 1 & is.na(ph_p_otbi__rpt__loc_001)"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & is.na(ph_p_otbi__loc_001__l)",
    "ph_p_otbi_002__l == 1 & is.na(ph_p_otbi__loc_002__l)",
    "ph_p_otbi_003__l == 1 & is.na(ph_p_otbi__loc_003__l)",
    "ph_p_otbi_004__l == 1 & is.na(ph_p_otbi__loc_004__l)",
    "ph_p_otbi_005__l_present == TRUE &
        ph_p_otbi_005__l == 1 & is.na(ph_p_otbi__loc_005__l)",
    "ph_p_otbi__loc__add_001__l == 1 & is.na(ph_p_otbi__loc__add_001__03__l)",
    "ph_p_otbi__rpt_001__l == 1 & is.na(ph_p_otbi__rpt__loc_001__l)"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__loc__30m_count[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__loc__30m_count[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__loc_count                                                    ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__loc_count
#' @format vars_ph_p_otbi__loc_count is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__loc_count`.
vars_ph_p_otbi__loc_count <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi__loc_001",
    "ph_p_otbi_002",
    "ph_p_otbi__loc_002",
    "ph_p_otbi_003",
    "ph_p_otbi__loc_003",
    "ph_p_otbi_004",
    "ph_p_otbi__loc_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__loc__add_001__01",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt__loc__daz_002",
    "ph_p_otbi__rpt_003",
    "ph_p_otbi__rpt__loc__daz_003"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__loc__add_001__01__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Count"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc_count`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__loc_count) |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc_count <- function(
    data,
    name = "ph_p_otbi__loc_count",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 > 0",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 > 0",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 > 0",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 > 0",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 > 0",
    "ph_p_otbi__loc__add_001__01",
    "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 > 0",
    "ph_p_otbi__rpt_002 == 1 & ph_p_otbi__rpt__loc__daz_002 == 2",
    "ph_p_otbi__rpt_003 == 1 & ph_p_otbi__rpt__loc__daz_003 == 2"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l > 0",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l > 0",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l > 0",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l > 0",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l > 0 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__01__l",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l > 0"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__loc_count[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__loc_count[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Number missing"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc_nm`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Number missing
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__loc_count()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc_nm <- function(
    data,
    name = "ph_p_otbi__loc_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & is.na(ph_p_otbi__loc_001)",
    "ph_p_otbi_002 == 1 & is.na(ph_p_otbi__loc_002)",
    "ph_p_otbi_003 == 1 & is.na(ph_p_otbi__loc_003)",
    "ph_p_otbi_004 == 1 & is.na(ph_p_otbi__loc_004)",
    "ph_p_otbi_005 == 1 & is.na(ph_p_otbi__loc_005)",
    "ph_p_otbi__loc__add_001 == 1 & is.na(ph_p_otbi__loc__add_001__01)",
    "ph_p_otbi__rpt_001 == 1 & is.na(ph_p_otbi__rpt__loc_001)",
    "ph_p_otbi__rpt_002 == 1 & is.na(ph_p_otbi__rpt__loc__daz_002)",
    "ph_p_otbi__rpt_003 == 1 & is.na(ph_p_otbi__rpt__loc__daz_003)"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & is.na(ph_p_otbi__loc_001__l)",
    "ph_p_otbi_002__l == 1 & is.na(ph_p_otbi__loc_002__l)",
    "ph_p_otbi_003__l == 1 & is.na(ph_p_otbi__loc_003__l)",
    "ph_p_otbi_004__l == 1 & is.na(ph_p_otbi__loc_004__l)",
    "ph_p_otbi_005__l_present == TRUE &
      ph_p_otbi_005__l == 1 & is.na(ph_p_otbi__loc_005__l)",
    "ph_p_otbi__loc__add_001__l == 1 & is.na(ph_p_otbi__loc__add_001__01__l)",
    "ph_p_otbi__rpt_001__l == 1 & is.na(ph_p_otbi__rpt__loc_001__l)"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__loc_count[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__loc_count[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__rpt_count                                                    ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__rpt_count
#' @format vars_ph_p_otbi__rpt_count is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__rpt_count`.
vars_ph_p_otbi__rpt_count <- list(
  baseline = c(
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt_003"
  ),
  longitudinal = c(
    "ph_p_otbi__rpt_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Repeated
#' injuries): Count"
#'
#' @description
#' Computes the summary score `ph_p_otbi__rpt_count`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Repeated injuries):
#' Count \[Validation: No more than 2 missing or declined at baseline
#' and no more than 0 missing or declined at non-baseline events\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__rpt_count) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:*
#'    - maximally 2 item missing at baseline event
#'    - maximally 0 item missing at non-baseline events
#'
#' @inheritParams dummy_ph_p_otbi
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 2).
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__rpt_count <- function(
    data,
    name = "ph_p_otbi__rpt_count",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    ss_sum(
      name    = "baseline",
      vars    = vars_ph_p_otbi__rpt_count[["baseline"]],
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    ss_sum(
      name    = "longitudinal",
      vars    = vars_ph_p_otbi__rpt_count[["longitudinal"]],
      max_na  = 0,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        as.integer(.data[[name]])
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Repeated
#' injuries): Number missing"
#'
#' @description
#' Computes the summary score `ph_p_otbi__rpt_nm`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Repeated injuries):
#' Number missing
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__rpt_count()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__rpt_nm <- function(
    data,
    name = "ph_p_otbi__rpt_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "is.na(ph_p_otbi__rpt_001)",
    "ph_p_otbi__rpt_001 == 1 & is.na(ph_p_otbi__rpt_002)",
    "ph_p_otbi__rpt_002 == 1 & is.na(ph_p_otbi__rpt_003)"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__rpt_count[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    ss_nm(
      name    = "longitudinal",
      vars    = vars_ph_p_otbi__rpt_count[["longitudinal"]],
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__loc_tbiage                                                   ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__loc_tbiage
#' @format vars_ph_p_otbi__loc_tbiage is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__loc_tbiage`.
vars_ph_p_otbi__loc_tbiage <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi__loc_001",
    "ph_p_otbi__age_001",
    "ph_p_otbi_002",
    "ph_p_otbi__loc_002",
    "ph_p_otbi__age_002",
    "ph_p_otbi_003",
    "ph_p_otbi__loc_003",
    "ph_p_otbi__age_003",
    "ph_p_otbi_004",
    "ph_p_otbi__loc_004",
    "ph_p_otbi__age_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__age_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__loc__add_001__04",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001",
    "ph_p_otbi__rpt__age_001a",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt__loc__daz_002",
    "ph_p_otbi__rpt__age_002a",
    "ph_p_otbi__rpt_003",
    "ph_p_otbi__rpt__loc__daz_003",
    "ph_p_otbi__rpt__age_003a"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi__age_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi__age_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi__age_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi__age_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__age_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__loc__add_001__04__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l",
    "ph_p_otbi__rpt__age_001a__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Age of first injury with LOC"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc_tbiage`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Age of first injury with LOC
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__loc_tbiage) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'    - any reported age less than or equal to 0
#'
#' - *Notes:*
#'   - The output is set to `NA` for the following cases:
#'     - minimum age is less than 0
#'     - minimum age is higher than age at visit
#'     - no head or neck injury/impact is reported
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc_tbiage <- function(
    data,
    name = "ph_p_otbi__loc_tbiage",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(
    data,
    c(unlist(vars_ph_p_otbi__loc_tbiage), "ph_p_otbi_age", "session_id")
  )

  data_ss <- data |>
    mutate(
      across(
        all_of(unlist(vars_ph_p_otbi__loc_tbiage)),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        )
      )
    ) |>
    mutate(
      baseline = pmin(
        if_else(
          ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 > 0,
          ph_p_otbi__age_001,
          NA_real_
        ),
        if_else(
          ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 > 0,
          ph_p_otbi__age_002,
          NA_real_
        ),
        if_else(
          ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 > 0,
          ph_p_otbi__age_003,
          NA_real_
        ),
        if_else(
          ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 > 0,
          ph_p_otbi__age_004,
          NA_real_
        ),
        if_else(
          ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 > 0,
          ph_p_otbi__age_005,
          NA_real_
        ),
        if_else(
          ph_p_otbi__loc__add_001 == 1,
          ph_p_otbi__loc__add_001__04,
          NA_real_
        ),
        if_else(
          ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 > 0,
          ph_p_otbi__rpt__age_001a,
          NA_real_
        ),
        if_else(
          ph_p_otbi__rpt_002 == 1 & ph_p_otbi__rpt__loc__daz_002 == 2,
          ph_p_otbi__rpt__age_002a,
          NA_real_
        ),
        if_else(
          ph_p_otbi__rpt_003 == 1 & ph_p_otbi__rpt__loc__daz_003 == 2,
          ph_p_otbi__rpt__age_003a,
          NA_real_
        ),
        na.rm = TRUE
      ),
      longitudinal = pmin(
        if_else(
          ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l > 0,
          ph_p_otbi__age_001__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l > 0,
          ph_p_otbi__age_002__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l > 0,
          ph_p_otbi__age_003__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l > 0,
          ph_p_otbi__age_004__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l > 0,
          ph_p_otbi__age_005__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi__loc__add_001__l == 1,
          ph_p_otbi__loc__add_001__04__l,
          NA_real_
        ),
        if_else(
          ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l > 0,
          ph_p_otbi__rpt__age_001a__l,
          NA_real_
        ),
        na.rm = TRUE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := case_when(
        tmp_tbi1a == TRUE ~ NA_real_,
        .data[[name]] < 0 | .data[[name]] > ph_p_otbi_age ~ NA_real_,
        .default = .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Age of first injury with LOC - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc__tbiage_nm`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): Age of first injury with LOC - Number missing
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Notes:*
#'    - The output is set to `NA` when no head or neck injury/impact is reported
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__loc_tbiage()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc__tbiage_nm <- function(
    data,
    name = "ph_p_otbi__loc__tbiage_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi__loc_001 > 0 & is.na(ph_p_otbi__age_001)",
    "ph_p_otbi__loc_002 > 0 & is.na(ph_p_otbi__age_002)",
    "ph_p_otbi__loc_003 > 0 & is.na(ph_p_otbi__age_003)",
    "ph_p_otbi__loc_004 > 0 & is.na(ph_p_otbi__age_004)",
    "ph_p_otbi__loc_005 > 0 & is.na(ph_p_otbi__age_005)",
    "ph_p_otbi__loc__add_001 == 1 & is.na(ph_p_otbi__loc__add_001__04)",
    "ph_p_otbi__rpt__loc_001 > 0 & is.na(ph_p_otbi__rpt__age_001a)",
    "ph_p_otbi__rpt__loc__daz_002 == 2 & is.na(ph_p_otbi__rpt__age_002a)",
    "ph_p_otbi__rpt__loc__daz_003 == 2 & is.na(ph_p_otbi__rpt__age_003a)"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi__loc_001__l > 0 & is.na(ph_p_otbi__age_001__l)",
    "ph_p_otbi__loc_002__l > 0 & is.na(ph_p_otbi__age_002__l)",
    "ph_p_otbi__loc_003__l > 0 & is.na(ph_p_otbi__age_003__l)",
    "ph_p_otbi__loc_004__l > 0 & is.na(ph_p_otbi__age_004__l)",
    "ph_p_otbi__loc_005__l > 0 & is.na(ph_p_otbi__age_005__l)",
    "ph_p_otbi__loc__add_001__l == 1 & is.na(ph_p_otbi__loc__add_001__04__l)",
    "ph_p_otbi__rpt__loc_001__l > 0 & is.na(ph_p_otbi__rpt__age_001a__l)"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__loc_tbiage[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    ss_count(
      name    = "longitudinal",
      vars    = vars_ph_p_otbi__loc_tbiage[["longitudinal"]],
      cond    = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name
    ) |>
    compute_ph_p_otbi__tbi1a(name = "tmp_tbi1a") |>
    transmute(
      !!name := if_else(
        tmp_tbi1a == TRUE,
        NA_integer_,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__loc_before15                                                 ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__loc_before15
#' @format vars_ph_p_otbi__loc_before15 is a character vector of all column
#' names used to compute summary score of `ph_p_otbi__loc_before15`.
vars_ph_p_otbi__loc_before15 <- vars_ph_p_otbi__loc_tbiage

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): LOC before the age of 15"
#'
#' @description
#' Computes the summary score `ph_p_otbi__loc_before15`
#' Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of
#' consciousness): LOC before the age of 15
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__loc_before15) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__loc_tbiage()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi__loc_before15 <- function(
    data,
    name = "ph_p_otbi__loc_before15",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_p_otbi__loc_tbiage(name = "temp_tbiage") |>
    transmute(
      !!name := case_when(
        is.na(temp_tbiage) ~ NA_character_,
        # needs fix; works currently ----
        # should be `temp_tbiage >= 0`
        temp_tbiage >= "0" & temp_tbiage < 15 ~ "1",
        .default = "0"
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__tbi1a                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__tbi1a
#' @format vars_ph_p_otbi__tbi1a is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__tbi1a`.
vars_ph_p_otbi__tbi1a <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi_002",
    "ph_p_otbi_003",
    "ph_p_otbi_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__rpt_001"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__rpt_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: No head or neck
#' injury/impact"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi1a`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: No head or neck
#' injury/impact
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi1a) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi1a <- function(
    data,
    name = "ph_p_otbi__tbi1a",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1",
    "ph_p_otbi_002 == 1",
    "ph_p_otbi_003 == 1",
    "ph_p_otbi_004 == 1",
    "ph_p_otbi_005 == 1",
    "ph_p_otbi__loc__add_001 == 1",
    "ph_p_otbi__rpt_001 == 1"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1",
    "ph_p_otbi_002__l == 1",
    "ph_p_otbi_003__l == 1",
    "ph_p_otbi_004__l == 1",
    "ph_p_otbi_005__l == 1 & ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__l == 1",
    "ph_p_otbi__rpt_001__l == 1"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi1a[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        FALSE,
        TRUE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi1a[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        FALSE,
        TRUE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__tbi1b                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__tbi1b
#' @format vars_ph_p_otbi__tbi1b is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__tbi1b`.
vars_ph_p_otbi__tbi1b <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi_002",
    "ph_p_otbi_003",
    "ph_p_otbi_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_001",
    "ph_p_otbi__loc_002",
    "ph_p_otbi__loc_003",
    "ph_p_otbi__loc_004",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__daz_001",
    "ph_p_otbi__daz_002",
    "ph_p_otbi__daz_003",
    "ph_p_otbi__daz_004",
    "ph_p_otbi__daz_005",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001",
    "ph_p_otbi__rpt__daz_001",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt__loc__daz_002",
    "ph_p_otbi__rpt_003",
    "ph_p_otbi__rpt__loc__daz_003"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__daz_001__l",
    "ph_p_otbi__daz_002__l",
    "ph_p_otbi__daz_003__l",
    "ph_p_otbi__daz_004__l",
    "ph_p_otbi__daz_005__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l",
    "ph_p_otbi__rpt__daz_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Improbable TBI"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi1b`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Improbable TBI
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi1b) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi1b <- function(
    data,
    name = "ph_p_otbi__tbi1b",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- paste(
    c(
      "ph_p_otbi_001 == 1 &
          ph_p_otbi__loc_001 < 1 &
          ph_p_otbi__daz_001 != 1",
      "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 < 1 &
          ph_p_otbi__daz_002 != 1",
      "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 < 1 &
          ph_p_otbi__daz_003 != 1",
      "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 < 1 &
          ph_p_otbi__daz_004 != 1",
      "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 < 1 &
          ph_p_otbi__daz_005 != 1",
      "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 < 1 &
          ph_p_otbi__rpt__daz_001 != 1",
      "ph_p_otbi__rpt_002 ==1 & ph_p_otbi__rpt__loc__daz_002 < 1",
      "ph_p_otbi__rpt_003 ==1 & ph_p_otbi__rpt__loc__daz_003 < 1"
    )
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l < 1 &
        ph_p_otbi__daz_001__l != 1",
    "ph_p_otbi_002__l == 1 &  ph_p_otbi__loc_002__l < 1 &
        ph_p_otbi__daz_002__l != 1",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l < 1 &
        ph_p_otbi__daz_003__l != 1",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l < 1 &
        ph_p_otbi__daz_004__l != 1",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l < 1 &
        ph_p_otbi__daz_005__l != 1 &
        ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l < 1 &
        ph_p_otbi__rpt__daz_001__l != 1"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi1b[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        TRUE,
        FALSE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi1b[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        TRUE,
        FALSE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__tbi2                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__tbi2
#' @format vars_ph_p_otbi__tbi2 is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__tbi2`.
vars_ph_p_otbi__tbi2 <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi_002",
    "ph_p_otbi_003",
    "ph_p_otbi_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_001",
    "ph_p_otbi__loc_002",
    "ph_p_otbi__loc_003",
    "ph_p_otbi__loc_004",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__daz_001",
    "ph_p_otbi__daz_002",
    "ph_p_otbi__daz_003",
    "ph_p_otbi__daz_004",
    "ph_p_otbi__daz_005",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001",
    "ph_p_otbi__rpt__daz_001",
    "ph_p_otbi__rpt_002",
    "ph_p_otbi__rpt__loc__daz_002",
    "ph_p_otbi__rpt_003",
    "ph_p_otbi__rpt__loc__daz_003"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__daz_001__l",
    "ph_p_otbi__daz_002__l",
    "ph_p_otbi__daz_003__l",
    "ph_p_otbi__daz_004__l",
    "ph_p_otbi__daz_005__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l",
    "ph_p_otbi__rpt__daz_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Possible mild
#' TBI"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi2`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Possible mild TBI
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi2) |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi2 <- function(
    data,
    name = "ph_p_otbi__tbi2",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 < 1 &
      ph_p_otbi__daz_001 == 1",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 < 1 &
      ph_p_otbi__daz_002 == 1",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 < 1 &
      ph_p_otbi__daz_003 == 1",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 < 1 &
      ph_p_otbi__daz_004 == 1",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 < 1 &
      ph_p_otbi__daz_005 == 1",
    "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 < 1 &
      ph_p_otbi__rpt__daz_001 == 1",
    "ph_p_otbi__rpt_002 == 1 & ph_p_otbi__rpt__loc__daz_002 == 1",
    "ph_p_otbi__rpt_003 == 1 & ph_p_otbi__rpt__loc__daz_003 == 1"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 &
      ph_p_otbi__loc_001__l < 1 & ph_p_otbi__daz_001__l == 1",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l < 1 &
      ph_p_otbi__daz_002__l == 1",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l < 1 &
      ph_p_otbi__daz_003__l == 1",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l < 1 &
      ph_p_otbi__daz_004__l == 1",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l < 1 &
      ph_p_otbi__daz_005__l == 1 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l < 1 &
      ph_p_otbi__rpt__daz_001__l == 1"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi2[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        TRUE,
        FALSE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi2[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        TRUE,
        FALSE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi__tbi3                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi__tbi3
#' @format vars_ph_p_otbi__tbi3 is a character vector of all column names
#' used to compute summary score of `ph_p_otbi__tbi3`.
vars_ph_p_otbi__tbi3 <- list(
  baseline = c(
    "ph_p_otbi_001",
    "ph_p_otbi_002",
    "ph_p_otbi_003",
    "ph_p_otbi_004",
    "ph_p_otbi_005",
    "ph_p_otbi__loc_001",
    "ph_p_otbi__loc_002",
    "ph_p_otbi__loc_003",
    "ph_p_otbi__loc_004",
    "ph_p_otbi__loc_005",
    "ph_p_otbi__loc__add_001",
    "ph_p_otbi__loc__add_001__02",
    "ph_p_otbi__loc__add_001__03",
    "ph_p_otbi__rpt_001",
    "ph_p_otbi__rpt__loc_001"
  ),
  longitudinal = c(
    "ph_p_otbi_001__l",
    "ph_p_otbi_002__l",
    "ph_p_otbi_003__l",
    "ph_p_otbi_004__l",
    "ph_p_otbi_005__l",
    "ph_p_otbi__loc_001__l",
    "ph_p_otbi__loc_002__l",
    "ph_p_otbi__loc_003__l",
    "ph_p_otbi__loc_004__l",
    "ph_p_otbi__loc_005__l",
    "ph_p_otbi__loc__add_001__l",
    "ph_p_otbi__loc__add_001__02__l",
    "ph_p_otbi__loc__add_001__03__l",
    "ph_p_otbi__rpt_001__l",
    "ph_p_otbi__rpt__loc_001__l"
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Mild TBI"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi3`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Mild TBI
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi3) |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi3 <- function(
    data,
    name = "ph_p_otbi__tbi3",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 &
      ph_p_otbi__loc_001 == 1",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 == 1",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 == 1",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 == 1",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 == 1",
    "ph_p_otbi__loc__add_001 == 1 &
      ph_p_otbi__loc__add_001__02 <= 30 & ph_p_otbi__loc__add_001__03 < 1",
    "ph_p_otbi__rpt_001 == 1 &
      ph_p_otbi__rpt__loc_001 == 1"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l == 1",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l == 1",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l == 1",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l == 1",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l == 1 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__l == 1 & ph_p_otbi__loc__add_001__02__l <= 30 &
      ph_p_otbi__loc__add_001__03__l < 1",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l == 1"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi3[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        TRUE,
        FALSE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi3[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        TRUE,
        FALSE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Moderate TBI"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi4`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Moderate TBI
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi3) |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__tbi3()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi4 <- function(
    data,
    name = "ph_p_otbi__tbi4",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 == 2",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 == 2",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 == 2",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 == 2",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 == 2",
    "ph_p_otbi__loc__add_001 == 1 & ph_p_otbi__loc__add_001__02 > 30 &
      ph_p_otbi__loc__add_001__02 < 1440 &
      ph_p_otbi__loc__add_001__03 > 0",
    "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 == 2"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l == 2",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l == 2",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l == 2",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l == 2",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l == 2 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__l == 1 & ph_p_otbi__loc__add_001__02__l > 30 &
      ph_p_otbi__loc__add_001__02__l < 1440 &
      ph_p_otbi__loc__add_001__03__l > 0",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l == 2"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi3[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        TRUE,
        FALSE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi3[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        TRUE,
        FALSE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Severe TBI"
#'
#' @description
#' Computes the summary score `ph_p_otbi__tbi5`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Severe TBI
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ph_p_otbi__tbi3) |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_otbi__tbi3()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @autoglobal
#' @keywords internal
compute_ph_p_otbi__tbi5 <- function(
    data,
    name = "ph_p_otbi__tbi5",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  conditions_baseline <- c(
    "ph_p_otbi_001 == 1 & ph_p_otbi__loc_001 == 3",
    "ph_p_otbi_002 == 1 & ph_p_otbi__loc_002 == 3",
    "ph_p_otbi_003 == 1 & ph_p_otbi__loc_003 == 3",
    "ph_p_otbi_004 == 1 & ph_p_otbi__loc_004 == 3",
    "ph_p_otbi_005 == 1 & ph_p_otbi__loc_005 == 3",
    "ph_p_otbi__loc__add_001 == 1 & ph_p_otbi__loc__add_001__02 >= 1440 &
      ph_p_otbi__loc__add_001__03 > 0",
    "ph_p_otbi__rpt_001 == 1 & ph_p_otbi__rpt__loc_001 == 3"
  )
  ph_p_otbi_005__l_session <- c(
    "ses-01A",
    "ses-02A",
    "ses-03A"
  )
  conditions_longitudinal <- c(
    "ph_p_otbi_001__l == 1 & ph_p_otbi__loc_001__l == 3",
    "ph_p_otbi_002__l == 1 & ph_p_otbi__loc_002__l == 3",
    "ph_p_otbi_003__l == 1 & ph_p_otbi__loc_003__l == 3",
    "ph_p_otbi_004__l == 1 & ph_p_otbi__loc_004__l == 3",
    "ph_p_otbi_005__l == 1 & ph_p_otbi__loc_005__l == 3 &
      ph_p_otbi_005__l_present == TRUE",
    "ph_p_otbi__loc__add_001__l == 1 & ph_p_otbi__loc__add_001__02__l >= 1440 &
      ph_p_otbi__loc__add_001__03__l > 0",
    "ph_p_otbi__rpt_001__l == 1 & ph_p_otbi__rpt__loc_001__l == 3"
  )

  data_ss <- data |>
    ss_count(
      name    = "baseline",
      vars    = vars_ph_p_otbi__tbi3[["baseline"]],
      cond    = conditions_baseline,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      baseline = if_else(
        baseline > 0,
        TRUE,
        FALSE
      )
    ) |>
    mutate(
      ph_p_otbi_005__l_present = if_else(
        session_id %in% ph_p_otbi_005__l_session,
        TRUE,
        FALSE
      )
    ) |>
    ss_count(
      name = "longitudinal",
      vars = vars_ph_p_otbi__tbi3[["longitudinal"]],
      vars_temp = "ph_p_otbi_005__l_present",
      cond = conditions_longitudinal,
      exclude = exclude,
      combine = TRUE
    ) |>
    mutate(
      longitudinal = if_else(
        longitudinal > 0,
        TRUE,
        FALSE
      )
    ) |>
    combine_cols(
      col_1      = "baseline",
      col_2      = "longitudinal",
      name       = name,
      keep_other = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   ph_p_otbi_tbiworst                                                      ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_otbi_tbiworst
#' @format vars_ph_p_otbi_tbiworst is a character vector of all column names
#' used to compute summary score of `ph_p_otbi_tbiworst`.
vars_ph_p_otbi_tbiworst <- unique(
  c(
    unlist(vars_ph_p_otbi__tbi1a),
    unlist(vars_ph_p_otbi__tbi1b),
    unlist(vars_ph_p_otbi__tbi2),
    unlist(vars_ph_p_otbi__tbi3)
  )
)

#' Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Worst injury
#' overall"
#'
#' @description
#' Computes the summary score `ph_p_otbi_tbiworst`
#' Ohio State Traumatic Brain Injury Screen \[Parent\]: Worst injury overall
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_otbi_tbiworst |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Notes:*
#'   - Computed using the following summary scores:
#'      - ph_p_otbi__tbi1a
#'      - ph_p_otbi__tbi1b
#'      - ph_p_otbi__tbi2
#'      - ph_p_otbi__tbi3
#'      - ph_p_otbi__tbi4
#'      - ph_p_otbi__tbi5
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @param keep_summaries logical. If `TRUE`, intermediate columns created to
#'    compute the summary score will be retained. If `FALSE`, the intermediate
#'    columns will be removed. Default set to `FALSE`.
#'
#' @return tbl. The input data frame with the summary score(s) appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_otbi_tbiworst <- function(
    data,
    name = "ph_p_otbi_tbiworst",
    keep_summaries = FALSE,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  temp_vars <- c(
    "ph_p_otbi__tbi1a",
    "ph_p_otbi__tbi1b",
    "ph_p_otbi__tbi2",
    "ph_p_otbi__tbi3",
    "ph_p_otbi__tbi4",
    "ph_p_otbi__tbi5"
  )

  data_ss <- data |>
    # compute the summaries required
    compute_ph_p_otbi__tbi1a() |>
    compute_ph_p_otbi__tbi1b() |>
    compute_ph_p_otbi__tbi2() |>
    compute_ph_p_otbi__tbi3() |>
    compute_ph_p_otbi__tbi4() |>
    compute_ph_p_otbi__tbi5() |>
    # compute tbiworst
    mutate(
      !!name := case_when(
        ph_p_otbi__tbi5 == TRUE ~ "5", # Severe TBI
        ph_p_otbi__tbi4 == TRUE ~ "4", # Moderate TBI
        ph_p_otbi__tbi3 == TRUE ~ "3", # Mild TBI
        ph_p_otbi__tbi2 == TRUE ~ "2", # Possible mild TBI
        ph_p_otbi__tbi1b == TRUE ~ "1", # Improbable TBI
        ph_p_otbi__tbi1a == TRUE ~ "0", # No head or neck injury/impact
        .default = NA_character_
      )
    ) |>
    select(
      !!name,
      all_of(temp_vars)
    )

  if (!keep_summaries) {
    data_ss <- data_ss |>
      select(
        !!name
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   (ALL) ph_p_otbi                                                         ####

#' Compute all the ph_p_otbi scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
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
#' compute_ph_p_otbi_all(data)
#' }
compute_ph_p_otbi_all <- function(data) {
  data |>
    compute_ph_p_otbi_nm() |>
    compute_ph_p_otbi__loc__30m_count() |>
    compute_ph_p_otbi__loc__30m_nm() |>
    compute_ph_p_otbi__loc_count() |>
    compute_ph_p_otbi__loc_nm() |>
    compute_ph_p_otbi__rpt_count() |>
    compute_ph_p_otbi__rpt_nm() |>
    compute_ph_p_otbi__loc_tbiage() |>
    compute_ph_p_otbi__loc__tbiage_nm() |>
    compute_ph_p_otbi__loc_before15() |>
    compute_ph_p_otbi_tbiworst()
}

#   ____________________________________________________________________________
#   ph_y_pds__m                                                             ####

#' @export
#' @autoglobal
#' @rdname compute_ph_y_pds__m_mean
#' @format vars_ph_y_pds__m is a character vector of all column names
#' used to compute summary score of `ph_y_pds__m_mean` and
#' `ph_y_pds__m_nm`.
vars_ph_y_pds__m <- c(
  "ph_y_pds_001",
  "ph_y_pds_002",
  "ph_y_pds_003",
  "ph_y_pds__m_001",
  "ph_y_pds__m_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Male): Mean"
#'
#' @description
#' Computes the summary score `ph_y_pds__m_mean`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Male): Mean \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__m |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 1 item missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__m_mean <- function(
    data,
    name = "ph_y_pds__m_mean",
    combine = TRUE,
    exclude = c("777", "999"),
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_ph_y_pds__m,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Male): Number missing"
#'
#' @description
#' Computes the summary score `ph_y_pds__m_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Male): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__m |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_y_pds__m_mean()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__m_nm <- function(
    data,
    name = "ph_y_pds__m_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_y_pds__m,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_y_pds__m_categ                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ph_y_pds__m_categ
#' @format vars_ph_y_pds__m is a character vector of all column names
#' used to compute summary score of `ph_y_pds__m_categ` and
#' `ph_y_pds__m__categ_nm`.
vars_ph_y_pds__m_categ <- c(
  "ph_y_pds_002",
  "ph_y_pds__m_001",
  "ph_y_pds__m_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Male): Approximate tanner stages"
#'
#' @description
#' Computes the summary score `ph_y_pds__m_categ`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Male): Approximate tanner stages \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__m_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__m_categ <- function(
    data,
    name = "ph_y_pds__m_categ",
    combine = TRUE,
    exclude = c("777", "999"),
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ph_y_pds__m_categ)

  data_ss <- data |>
    ss_sum(
      name    = "tmp_sum",
      vars    = vars_ph_y_pds__m_categ,
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    ss_max(
      name    = "tmp_max",
      vars    = vars_ph_y_pds__m_categ,
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    transmute(
      !!name := case_when(
        tmp_sum == 3 ~ "1", # Pre pubertal
        tmp_sum %in% c(4:5) & tmp_max <= 2 ~ "2", # Early pubertal
        tmp_sum %in% c(6:8) & tmp_max <= 3 ~ "3", # Mid pubertal
        tmp_sum %in% c(9:11) & tmp_max <= 4 ~ "4", # Late pubertal
        tmp_sum == 12 ~ "5", # Post pubertal
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Male): Approximate tanner stages - Number missing"
#'
#' @description
#' Computes the summary score `ph_y_pds__m__categ_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Male): Approximate tanner stages - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__m_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_y_pds__m_categ()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__m__categ_nm <- function(
    data,
    name = "ph_y_pds__m__categ_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_y_pds__m_categ,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_y_pds__f                                                             ####

#' @export
#' @autoglobal
#' @rdname compute_ph_y_pds__f_mean
#' @format vars_ph_y_pds__f is a character vector of all column names
#' used to compute summary score of `ph_y_pds__f_mean` and
#' `ph_y_pds__f_nm`.
vars_ph_y_pds__f <- c(
  "ph_y_pds_001",
  "ph_y_pds_002",
  "ph_y_pds_003",
  "ph_y_pds__f_001",
  "ph_y_pds__f_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Female): Mean"
#'
#' @description
#' Computes the summary score `ph_y_pds__f_mean`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Female): Mean \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__f |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 1 item missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__f_mean <- function(
    data,
    name = "ph_y_pds__f_mean",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- data |>
    recode_levels(
      vars = "ph_y_pds__f_002",
      recode = c(
        "0" = "1",
        "1" = "4"
      )
    ) |>
    ss_mean(
      name    = name,
      vars    = vars_ph_y_pds__f,
      max_na  = max_na,
      exclude = exclude,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Female): Number missing"
#'
#' @description
#' Computes the summary score `ph_y_pds__f_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Female): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__f |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_y_pds__f_mean()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__f_nm <- function(
    data,
    name = "ph_y_pds__f_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_y_pds__f,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_y_pds__f_categ                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ph_y_pds__f_categ
#' @format vars_ph_y_pds__f is a character vector of all column names
#' used to compute summary score of `ph_y_pds__f_categ` and
#' `ph_y_pds__f__categ_nm`.
vars_ph_y_pds__f_categ <- c(
  "ph_y_pds_002",
  "ph_y_pds__f_001",
  "ph_y_pds__f_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Female): Approximate tanner stages"
#'
#' @description
#' Computes the summary score `ph_y_pds__f_categ`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Female): Approximate tanner stages \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__f_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__f_categ <- function(
    data,
    name = "ph_y_pds__f_categ",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ph_y_pds__f_categ)

  data_ss <- data |>
    ss_sum(
      name    = "tmp_sum",
      vars    = c("ph_y_pds_002", "ph_y_pds__f_001"),
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    transmute(
      !!name := case_when(
        tmp_sum == 2 & ph_y_pds__f_002 == 0 ~ "1", # Pre pubertal
        tmp_sum == 3 & ph_y_pds__f_002 == 0 ~ "2", # Early pubertal
        tmp_sum >= 4 & ph_y_pds__f_002 == 0 ~ "3", # Mid pubertal
        tmp_sum <= 7 & ph_y_pds__f_002 == 1 ~ "4", # Late pubertal
        tmp_sum == 8 & ph_y_pds__f_002 == 1 ~ "5", # Post pubertal
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Youth\] (Female): Approximate tanner stages - Number missing"
#'
#' @description
#' Computes the summary score `ph_y_pds__f__categ_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\]
#' (Female): Approximate tanner stages - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_y_pds__f_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_y_pds__f_categ()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_y_pds__f__categ_nm <- function(
    data,
    name = "ph_y_pds__f__categ_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_y_pds__f_categ,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) ph_y_pds                                                          ####

#' Compute all the `ph_y_pds` summary scores
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
#' compute_ph_y_pds_all(data)
#' }
compute_ph_y_pds_all <- function(data) {
  data |>
    compute_ph_y_pds__m_mean() |>
    compute_ph_y_pds__m_nm() |>
    compute_ph_y_pds__m_categ() |>
    compute_ph_y_pds__m__categ_nm() |>
    compute_ph_y_pds__f_mean() |>
    compute_ph_y_pds__f_nm() |>
    compute_ph_y_pds__f_categ() |>
    compute_ph_y_pds__f__categ_nm()
}

#   ____________________________________________________________________________
#   ph_p_pds__m                                                             ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_pds__m_mean
#' @format vars_ph_p_pds__m is a character vector of all column names
#' used to compute summary score of `ph_p_pds__m_mean` and
#' `ph_p_pds__m_nm`.
vars_ph_p_pds__m <- c(
  "ph_p_pds_001",
  "ph_p_pds_002",
  "ph_p_pds_003",
  "ph_p_pds__m_001",
  "ph_p_pds__m_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Male): Mean"
#'
#' @description
#' Computes the summary score `ph_p_pds__m_mean`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Male): Mean \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__m |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 1 item missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__m_mean <- function(
    data,
    name = "ph_p_pds__m_mean",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_ph_p_pds__m,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Male): Number missing"
#'
#' @description
#' Computes the summary score `ph_p_pds__m_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Male): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__m |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_pds__m_mean()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__m_nm <- function(
    data,
    name = "ph_p_pds__m_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_pds__m,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_p_pds__m_categ                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_pds__m_categ
#' @format vars_ph_p_pds__m is a character vector of all column names
#' used to compute summary score of `ph_p_pds__m_categ` and
#' `ph_p_pds__m__categ_nm`.
vars_ph_p_pds__m_categ <- c(
  "ph_p_pds_002",
  "ph_p_pds__m_001",
  "ph_p_pds__m_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Male): Approximate tanner stages"
#'
#' @description
#' Computes the summary score `ph_p_pds__m_categ`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Male): Approximate tanner stages \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__m_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__m_categ <- function(
    data,
    name = "ph_p_pds__m_categ",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ph_p_pds__m_categ)

  data_ss <- data |>
    ss_sum(
      name    = "tmp_sum",
      vars    = vars_ph_p_pds__m_categ,
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    ss_max(
      name    = "tmp_max",
      vars    = vars_ph_p_pds__m_categ,
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    transmute(
      !!name := case_when(
        tmp_sum == 3 ~ "1", # Pre pubertal
        tmp_sum %in% c(4:5) & tmp_max <= 2 ~ "2", # Early pubertal
        tmp_sum %in% c(6:8) & tmp_max <= 3 ~ "3", # Mid pubertal
        tmp_sum %in% c(9:11) & tmp_max <= 4 ~ "4", # Late pubertal
        tmp_sum == 12 ~ "5", # Post pubertal
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Male): Approximate tanner stages - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_pds__m__categ_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Male): Approximate tanner stages - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__m_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_pds__m_categ()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__m__categ_nm <- function(
    data,
    name = "ph_p_pds__m__categ_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_pds__m_categ,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_p_pds__f                                                             ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_pds__f_mean
#' @format vars_ph_p_pds__f is a character vector of all column names
#' used to compute summary score of `ph_p_pds__f_mean` and
#' `ph_p_pds__f_nm`.
vars_ph_p_pds__f <- c(
  "ph_p_pds_001",
  "ph_p_pds_002",
  "ph_p_pds_003",
  "ph_p_pds__f_001",
  "ph_p_pds__f_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Female): Mean"
#'
#' @description
#' Computes the summary score `ph_p_pds__f_mean`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Female): Mean \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__f |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 1 item missing
#'
#' - *Notes:*
#'   - Values in `ph_p_pds__f_002` were recoded:
#'      - "0" --> "1",
#'      - "1" --> "4"
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__f_mean <- function(
    data,
    name = "ph_p_pds__f_mean",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- data |>
    recode_levels(
      vars = "ph_p_pds__f_002",
      recode = c(
        "0" = "1",
        "1" = "4"
      )
    ) |>
    ss_mean(
      name    = name,
      vars    = vars_ph_p_pds__f,
      max_na  = max_na,
      exclude = exclude,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Female): Number missing"
#'
#' @description
#' Computes the summary score `ph_p_pds__f_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Female): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__f |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_pds__f_mean()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__f_nm <- function(
    data,
    name = "ph_p_pds__f_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_pds__f,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   ph_p_pds__f_categ                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_pds__f_categ
#' @format vars_ph_p_pds__f is a character vector of all column names
#' used to compute summary score of `ph_p_pds__f_categ` and
#' `ph_p_pds__f__categ_nm`.
vars_ph_p_pds__f_categ <- c(
  "ph_p_pds_002",
  "ph_p_pds__f_001",
  "ph_p_pds__f_002"
)

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Female): Approximate tanner stages"
#'
#' @description
#' Computes the summary score `ph_p_pds__f_categ`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Female): Approximate tanner stages \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__f_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__f_categ <- function(
    data,
    name = "ph_p_pds__f_categ",
    exclude = c("777", "999"),
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ph_p_pds__f_categ)

  data_ss <- data |>
    ss_sum(
      name    = "tmp_sum",
      vars    = c("ph_p_pds_002", "ph_p_pds__f_001"),
      max_na  = max_na,
      exclude = exclude,
      combine = TRUE
    ) |>
    transmute(
      !!name := case_when(
        tmp_sum == 2 & ph_p_pds__f_002 == 0 ~ "1", # Pre pubertal
        tmp_sum == 3 & ph_p_pds__f_002 == 0 ~ "2", # Early pubertal
        tmp_sum >= 4 & ph_p_pds__f_002 == 0 ~ "3", # Mid pubertal
        tmp_sum <= 7 & ph_p_pds__f_002 == 1 ~ "4", # Late pubertal
        tmp_sum == 8 & ph_p_pds__f_002 == 1 ~ "5", # Post pubertal
        .default = NA
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Pubertal Development Scale & Menstrual Cycle Survey History
#' \[Parent\] (Female): Approximate tanner stages - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_pds__f__categ_nm`
#' Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\]
#' (Female): Approximate tanner stages - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_pds__f_categ |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams dummy_ph_p_otbi
#'
#' @seealso [compute_ph_p_pds__f_categ()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_pds__f__categ_nm <- function(
    data,
    name = "ph_p_pds__f__categ_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_pds__f_categ,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) ph_p_pds                                                          ####

#' Compute all the `ph_p_pds` summary scores
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
#' compute_ph_p_pds_all(data)
#' }
compute_ph_p_pds_all <- function(data) {
  data |>
    compute_ph_p_pds__m_mean() |>
    compute_ph_p_pds__m_nm() |>
    compute_ph_p_pds__m_categ() |>
    compute_ph_p_pds__m__categ_nm() |>
    compute_ph_p_pds__f_mean() |>
    compute_ph_p_pds__f_nm() |>
    compute_ph_p_pds__f_categ() |>
    compute_ph_p_pds__f__categ_nm()
}

# ph_p_cna ----------------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_p_cna_sum
#' @format vars_ph_p_cna is a character vector of all column names
#' used to compute summary scores of `ph_p_cna`.
vars_ph_p_cna <- c(
  "ph_p_cna_001",
  "ph_p_cna_002",
  "ph_p_cna_003",
  "ph_p_cna_004",
  "ph_p_cna_005",
  "ph_p_cna_006",
  "ph_p_cna_007",
  "ph_p_cna_008",
  "ph_p_cna_009",
  "ph_p_cna_010",
  "ph_p_cna_011",
  "ph_p_cna_012",
  "ph_p_cna_013",
  "ph_p_cna_014"
)

#' Compute "Child Nutrition Assessment \[Parent\]: Sum \[Validation: No more than
#' 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_cna_sum`
#' Child Nutrition Assessment \[Parent\]: Sum \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_cna |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param max_na integer, Maximum number of missing values allowed in the
#' summary score. `NULL` means no limit.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#' the input data frame. If `FALSE`, the summary score will be returned as a
#' separate data frame.
#' @param exclude character, Values to be excluded from the summary score.
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_cna_sum(data) |>
#'   select(
#'     all_of(c("ph_p_cna_sum", vars_ph_p_cna))
#'   )
#' }
compute_ph_p_cna_sum <- function(
    data,
    name = "ph_p_cna_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_cna,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Child Nutrition Assessment \[Parent\]: Sum \[Validation: No more than
#' 0 missing or declined\]"
#' @description
#' Computes the summary score `ph_p_cna_sum`
#' Child Nutrition Assessment \[Parent\]: Sum \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_cna |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_cna_nm(data) |>
#'   select(
#'     all_of(c("ph_p_cna_nm", vars_ph_p_cna))
#'   )
#' }
compute_ph_p_cna_nm <- function(
    data,
    name = "ph_p_cna_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_cna,
      exclude = exclude
    )
}

#' Compute all the `ph_p_cna` summary scores
#' @description
#' This is a high-level function that computes all summary scores in this table.
#' Make sure the `data` contains all the necessary columns.
#'
#' @param data tbl. Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_cna(data)
#' }
#'
compute_ph_p_cna_all <- function(data) {
  data |>
    compute_ph_p_cna_sum() |>
    compute_ph_p_cna_nm()
}


# ph_y_anthr__height ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_y_anthr__height_mean
#' @format vars_ph_y_anthr__height is a character vector of all column names
#' used to compute summary scores of `ph_y_anthr__height`.
vars_ph_y_anthr__height <- c(
  "ph_y_anthr__height__r01_001",
  "ph_y_anthr__height__r02_001",
  "ph_y_anthr__height__r03_001"
)

#' Compute "Anthropometrics \[Youth\] (Height): Mean"
#' @description
#' Computes the summary score `ph_y_anthr__height_mean`
#' Anthropometrics \[Youth\] (Height): Mean
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_anthr__height |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' #### Calculation
#' There are at most 3 possible measurements, and the calculation is as follows:
#'
#' - 0 missing, find the max and min of the three, and take the average of
#' the min and max. Then compare the average to the third value.
#'     - third value < average -> mean(min, third value)
#'     - third value > average -> mean(max, third value)
#'     - third value = average -> third value
#' - 1 missing, mean of the rest two
#' - 2 missing, use the last one
#' - 3 missing, NA
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_anthr__height_mean(data) |>
#'   select(
#'     all_of(c("ph_y_anthr__height_mean", vars_ph_y_anthr__height))
#'   )
#' }
compute_ph_y_anthr__height_mean <- function(
    data,
    name = "ph_y_anthr__height_mean",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(all_of(vars_ph_y_anthr__height), ~ as.numeric(as.character(.x))),
      temp_max = pmax(!!!syms(vars_ph_y_anthr__height), na.rm = TRUE),
      temp_min = pmin(!!!syms(vars_ph_y_anthr__height), na.rm = TRUE),
      temp_med = apply(
        select(data, all_of(vars_ph_y_anthr__height)),
        1,
        median,
        na.rm = TRUE
      ),
      n_values = rowSums(!is.na(select(data, all_of(vars_ph_y_anthr__height)))),
      !!name := case_when(
        n_values == 0 ~ NA_real_,
        n_values == 1 ~ temp_max,
        n_values == 2 ~ temp_med,
        n_values == 3 ~ case_when(
          (temp_med - temp_min) < (temp_max - temp_med) ~
            rowMeans(pick(c(temp_min, temp_med))),
          (temp_max - temp_med) < (temp_med - temp_min) ~
            rowMeans(pick(c(temp_max, temp_med))),
          (temp_max - temp_med) == (temp_med - temp_min) ~
            temp_med
        )
      )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Anthropometrics \[Youth\] (Height): Number missing"
#' @description
#' Computes the summary score `ph_y_anthr__height_nm`
#' Anthropometrics \[Youth\] (Height): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_anthr__height |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_ph_y_anthr__height_mean()]
#' @examples
#' \dontrun{
#' compute_ph_y_anthr__height_nm(data) |>
#'   select(
#'     all_of(c("ph_y_anthr__height_nm", vars_ph_y_anthr__height))
#'   )
#' }
compute_ph_y_anthr__height_nm <- function(
    data,
    name = "ph_y_anthr__height_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_ph_y_anthr__height
    )
}

# ph_y_anthr__weight ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_y_anthr__weight_mean
#' @format vars_ph_y_anthr__weight is a character vector of all column names
#' used to compute summary scores of `ph_y_anthr__weight`.
vars_ph_y_anthr__weight <- c(
  "ph_y_anthr__weight__r01_001",
  "ph_y_anthr__weight__r02_001",
  "ph_y_anthr__weight__r03_001"
)

#' Compute "Anthropometrics \[Youth\] (Weight): Mean"
#' @description
#' Computes the summary score `ph_y_anthr__weight_mean`
#' Anthropometrics \[Youth\] (Weight): Mean
#'
#' - *Summarized variables:*
#' ```{r, echo=FALSE, results='asis'}
#' vars_ph_y_anthr__weight |> md_bullet(2, TRUE)
#' ```
#' - *Excluded values:* none
#'
#' #### Calculation
#' There are at most 3 possible measurements, and the calculation is as follows:
#'
#' - 0 missing, find the max and min of the three, and take the average of
#' the min and max. Then compare the average to the third value.
#'     - third value < average -> mean(min, third value)
#'     - third value > average -> mean(max, third value)
#'     - third value = average -> third value
#' - 1 missing, mean of the rest two
#' - 2 missing, use the last one
#' - 3 missing, NA
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_anthr__weight_mean(data) |>
#'   select(
#'     all_of(c("ph_y_anthr__weight_mean", vars_ph_y_anthr__weight))
#'   )
#' }
compute_ph_y_anthr__weight_mean <- function(
    data,
    name = "ph_y_anthr__weight_mean",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(all_of(vars_ph_y_anthr__weight), ~ as.numeric(as.character(.x))),
      temp_max = pmax(!!!syms(vars_ph_y_anthr__weight), na.rm = TRUE),
      temp_min = pmin(!!!syms(vars_ph_y_anthr__weight), na.rm = TRUE),
      temp_med = apply(
        select(data, all_of(vars_ph_y_anthr__weight)),
        1,
        median,
        na.rm = TRUE
      ),
      n_values = rowSums(!is.na(select(data, all_of(vars_ph_y_anthr__weight)))),
      !!name := case_when(
        n_values == 0 ~ NA_real_,
        n_values == 1 ~ temp_max,
        n_values == 2 ~ temp_med,
        n_values == 3 ~ case_when(
          (temp_med - temp_min) < (temp_max - temp_med) ~
            rowMeans(pick(c(temp_min, temp_med))),
          (temp_max - temp_med) < (temp_med - temp_min) ~
            rowMeans(pick(c(temp_max, temp_med))),
          (temp_max - temp_med) == (temp_med - temp_min) ~
            temp_med
        )
      )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Anthropometrics \[Youth\] (Weight): Number missing"
#' @description
#' Computes the summary score `ph_y_anthr__weight_nm`
#' Anthropometrics \[Youth\] (Weight): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_anthr__weight |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_ph_y_anthr__weight_mean()]
#' @examples
#' \dontrun{
#' compute_ph_y_anthr__weight_nm(data) |>
#'   select(
#'     all_of(c("ph_y_anthr__weight_nm", vars_ph_y_anthr__weight))
#'   )
#' }
compute_ph_y_anthr__weight_nm <- function(
    data,
    name = "ph_y_anthr__weight_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_ph_y_anthr__weight
    )
}

#' Compute all the youth anthropometric measurements.
#' @description
#' This is a high-level function that computes all summary scores in this table.
#' Make sure the `data` contains all the necessary columns.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_anthr_all(data)
#' }
compute_ph_y_anthr_all <- function(data) {
  data |>
    compute_ph_y_anthr__height_mean() |>
    compute_ph_y_anthr__height_nm() |>
    compute_ph_y_anthr__weight_mean() |>
    compute_ph_y_anthr__weight_nm()
}

# ph_y_bp__sys ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_y_bp__sys_mean
#' @format vars_ph_y_bp__sys is a character vector of all column names
#' used to compute summary scores of `ph_y_bp__sys`.
vars_ph_y_bp__sys <- c(
  "ph_y_bp__sys__r01_001",
  "ph_y_bp__sys__r01_002",
  "ph_y_bp__sys__r01_003",
  "ph_y_bp__sys__r02_001",
  "ph_y_bp__sys__r02_002",
  "ph_y_bp__sys__r03_001",
  "ph_y_bp__sys__r03_002"
)

#' Compute "Blood Pressure \[Youth\] (Systolic): Mean"
#' @description
#' Computes the summary score `ph_y_bp__sys_mean`
#' Blood Pressure \[Youth\] (Systolic): Mean
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__sys |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_bp__sys_mean(data) |>
#'   select(
#'     all_of(c("ph_y_bp__sys_mean", vars_ph_y_bp__sys))
#'   )
#' }
compute_ph_y_bp__sys_mean <- function(
    data,
    name = "ph_y_bp__sys_mean",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__sys),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" := case_when(
        !is.na(ph_y_bp__sys__r03_001) ~ rowMeans(
          pick(
            matches("sys__r03")
          ),
          na.rm = TRUE
        ),
        !is.na(ph_y_bp__sys__r02_001) ~ rowMeans(
          pick(
            matches("sys__r02")
          ),
          na.rm = TRUE
        ),
        .default = rowMeans(
          pick(
            matches("sys__r01")
          ),
          na.rm = TRUE
        )
      ),
      "{name}" := if_else(
        is.nan(.data[[name]]),
        NA_real_,
        .data[[name]]
      )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Blood Pressure \[Youth\] (Systolic): Number missing"
#' @description
#' Computes the summary score `ph_y_bp__sys_nm`
#' Blood Pressure \[Youth\] (Systolic): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__sys |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' #### Calculation
#' There are at most 3 possible rounds of measurements,
#' and the calculation is as follows:
#' - if round 3 is available, use it, otherwise use round 2,
#' otherwise use round 1
#' - for round 3 and 2, there are at most 2 measurements
#' - for round 1, there are at most 3 measurements:
#'     - participants with 3 measurements, and 0 missing, nm = 0
#'     - participants with 2 measurements, and 1 missing, nm = 1 - 1 = 0
#'     - participants with 1 measurement, and 2 missing, nm = 2 - 1 = 1
#'     - participants with 0 measurements, and 3 missing, nm = 3 - 1 = 2
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_ph_y_bp__sys_mean()]
#' @examples
#' \dontrun{
#' compute_ph_y_bp__sys_nm(data) |>
#'   select(
#'     all_of(c("ph_y_bp__sys_nm", vars_ph_y_bp__sys))
#'   )
#' }
compute_ph_y_bp__sys_nm <- function(
    data,
    name = "ph_y_bp__sys_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__sys),
        ~ as.numeric(as.character(.x))
      ),
    ) %>%
    mutate(
      "{name}" := case_when(
        !is.na(ph_y_bp__sys__r03_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__sys__r03_001,
                ph_y_bp__sys__r03_002
              )
            )
          ),
        !is.na(ph_y_bp__sys__r02_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__sys__r02_001,
                ph_y_bp__sys__r02_002
              )
            )
          ),
        .default = if_else(
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__sys__r01_001,
                ph_y_bp__sys__r01_002,
                ph_y_bp__sys__r01_003
              )
            )
          ) == 0,
          0,
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__sys__r01_001,
                ph_y_bp__sys__r01_002,
                ph_y_bp__sys__r01_003
              )
            )
          ) - 1
        )
      ) |>
        as.integer()
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

# ph_y_bp__dia ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_y_bp__dia_mean
#' @format vars_ph_y_bp__dia is a character vector of all column names
#' used to compute summary scores of `ph_y_bp__dia`.
vars_ph_y_bp__dia <- c(
  "ph_y_bp__dia__r01_001",
  "ph_y_bp__dia__r01_002",
  "ph_y_bp__dia__r01_003",
  "ph_y_bp__dia__r02_001",
  "ph_y_bp__dia__r02_002",
  "ph_y_bp__dia__r03_001",
  "ph_y_bp__dia__r03_002"
)

#' Compute "Blood Pressure \[Youth\] (Diastolic): Mean"
#' @description
#' Computes the summary score `ph_y_bp__dia_mean`
#' Blood Pressure \[Youth\] (Diastolic): Mean
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__dia |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_bp__dia_mean(data) |>
#'   select(
#'     all_of(c("ph_y_bp__dia_mean", vars_ph_y_bp__dia))
#'   )
#' }
compute_ph_y_bp__dia_mean <- function(
    data,
    name = "ph_y_bp__dia_mean",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__dia),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" := case_when(
        !is.na(ph_y_bp__dia__r03_001) ~ rowMeans(
          pick(
            matches("dia__r03")
          ),
          na.rm = TRUE
        ),
        !is.na(ph_y_bp__dia__r02_001) ~ rowMeans(
          pick(
            matches("dia__r02")
          ),
          na.rm = TRUE
        ),
        .default = rowMeans(
          pick(
            matches("dia__r01")
          ),
          na.rm = TRUE
        )
      ),
      "{name}" := if_else(
        is.nan(.data[[name]]),
        NA_real_,
        .data[[name]]
      )
    ) |>
    select(all_of(name))
  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Blood Pressure \[Youth\] (Diastolic): Number missing"
#' @description
#' Computes the summary score `ph_y_bp__dia_nm`
#' Blood Pressure \[Youth\] (Diastolic): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__dia |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' #### Calculation
#' There are at most 3 possible rounds of measurements,
#' and the calculation is as follows:
#' - if round 3 is available, use it, otherwise use round 2,
#' otherwise use round 1
#' - for round 3 and 2, there are at most 2 measurements
#' - for round 1, there are at most 3 measurements:
#'     - participants with 3 measurements, and 0 missing, nm = 0
#'     - participants with 2 measurements, and 1 missing, nm = 1 - 1 = 0
#'     - participants with 1 measurement, and 2 missing, nm = 2 - 1 = 1
#'     - participants with 0 measurements, and 3 missing, nm = 3 - 1 = 2
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_ph_y_bp__dia_mean()]
#' @examples
#' \dontrun{
#' compute_ph_y_bp__dia_nm(data) |>
#'   select(
#'     all_of(c("ph_y_bp__dia_nm", vars_ph_y_bp__dia))
#'   )
#' }
compute_ph_y_bp__dia_nm <- function(
    data,
    name = "ph_y_bp__dia_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__dia),
        ~ as.numeric(as.character(.x))
      ),
    ) %>%
    mutate(
      "{name}" := case_when(
        !is.na(ph_y_bp__dia__r03_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__dia__r03_001,
                ph_y_bp__dia__r03_002
              )
            )
          ),
        !is.na(ph_y_bp__dia__r02_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__dia__r02_001,
                ph_y_bp__dia__r02_002
              )
            )
          ),
        .default = if_else(
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__dia__r01_001,
                ph_y_bp__dia__r01_002,
                ph_y_bp__dia__r01_003
              )
            )
          ) == 0,
          0,
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__dia__r01_001,
                ph_y_bp__dia__r01_002,
                ph_y_bp__dia__r01_003
              )
            )
          ) - 1
        )
      ) |>
        as.integer()
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

# ph_y_bp__hrate ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_ph_y_bp__hrate_mean
#' @format vars_ph_y_bp__hrate is a character vector of all column names
#' used to compute summary scores of `ph_y_bp__hrate`.
vars_ph_y_bp__hrate <- c(
  "ph_y_bp__hrate__r01_001",
  "ph_y_bp__hrate__r01_002",
  "ph_y_bp__hrate__r01_003",
  "ph_y_bp__hrate__r02_001",
  "ph_y_bp__hrate__r02_002",
  "ph_y_bp__hrate__r03_001",
  "ph_y_bp__hrate__r03_002"
)

#' Compute "Blood Pressure \[Youth\] (Heart rate): Mean"
#' @description
#' Computes the summary score `ph_y_bp__hrate_mean`
#' Blood Pressure \[Youth\] (Heart rate): Mean
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__hrate |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_bp__hrate_mean(data) |>
#'   select(
#'     all_of(c("ph_y_bp__hrate_mean", vars_ph_y_bp__hrate))
#'   )
#' }
compute_ph_y_bp__hrate_mean <- function(
    data,
    name = "ph_y_bp__hrate_mean",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__hrate),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" := case_when(
        !is.na(ph_y_bp__hrate__r03_001) ~ rowMeans(
          pick(
            matches("hrate__r03")
          ),
          na.rm = TRUE
        ),
        !is.na(ph_y_bp__hrate__r02_001) ~ rowMeans(
          pick(
            matches("hrate__r02")
          ),
          na.rm = TRUE
        ),
        .default = rowMeans(
          pick(
            matches("hrate__r01")
          ),
          na.rm = TRUE
        )
      ),
      "{name}" := if_else(
        is.nan(.data[[name]]),
        NA_real_,
        .data[[name]]
      )
    ) |>
    select(all_of(name))
  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Blood Pressure \[Youth\] (Heart rate): Number missing"
#' @description
#' Computes the summary score `ph_y_bp__hrate_nm`
#' Blood Pressure \[Youth\] (Heart rate): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_y_bp__hrate |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' #### Calculation
#' There are at most 3 possible rounds of measurements,
#' and the calculation is as follows:
#' - if round 3 is available, use it, otherwise use round 2,
#' otherwise use round 1
#' - for round 3 and 2, there are at most 2 measurements
#' - for round 1, there are at most 3 measurements:
#'     - participants with 3 measurements, and 0 missing, nm = 0
#'     - participants with 2 measurements, and 1 missing, nm = 1 - 1 = 0
#'     - participants with 1 measurement, and 2 missing, nm = 2 - 1 = 1
#'     - participants with 0 measurements, and 3 missing, nm = 3 - 1 = 2
#' @inherit compute_ph_p_cna_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_ph_y_bp__hrate_mean()]
#' @examples
#' \dontrun{
#' compute_ph_y_bp__hrate_nm(data) |>
#'   select(
#'     all_of(c("ph_y_bp__hrate_nm", vars_ph_y_bp__hrate))
#'   )
#' }
compute_ph_y_bp__hrate_nm <- function(
    data,
    name = "ph_y_bp__hrate_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ph_y_bp__hrate),
        ~ as.numeric(as.character(.x))
      ),
    ) %>%
    mutate(
      "{name}" := case_when(
        !is.na(ph_y_bp__hrate__r03_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__hrate__r03_001,
                ph_y_bp__hrate__r03_002
              )
            )
          ),
        !is.na(ph_y_bp__hrate__r02_001) ~
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__hrate__r02_001,
                ph_y_bp__hrate__r02_002
              )
            )
          ),
        .default = if_else(
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__hrate__r01_001,
                ph_y_bp__hrate__r01_002,
                ph_y_bp__hrate__r01_003
              )
            )
          ) == 0,
          0,
          rowSums(
            is.na(
              select(
                .,
                ph_y_bp__hrate__r01_001,
                ph_y_bp__hrate__r01_002,
                ph_y_bp__hrate__r01_003
              )
            )
          ) - 1
        )
      ) |>
        as.integer()
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute all the youth blood pressure measurements.
#' @description
#' This is a high-level function that computes all summary scores in this table.
#' Make sure the `data` contains all the necessary columns.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_bp_all(data)
#' }
compute_ph_y_bp_all <- function(data) {
  data |>
    compute_ph_y_bp__sys_mean() |>
    compute_ph_y_bp__sys_nm() |>
    compute_ph_y_bp__dia_mean() |>
    compute_ph_y_bp__dia_nm() |>
    compute_ph_y_bp__hrate_mean() |>
    compute_ph_y_bp__hrate_nm()
}


#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed start):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__bed__start__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed start):
#' Time \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_001__02`
#'     - `ph_y_mctq__fd_001__01a`
#'     - `ph_y_mctq__fd_001__01b`
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__bed__start__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_001__02",
#'     "ph_y_mctq__fd_001__01a",
#'     "ph_y_mctq__fd_001__01b",
#'     "ph_y_mctq__fd__bed__start__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__bed__start__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__bed__start__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_001__01a",
      col_hrs_b = "ph_y_mctq__fd_001__01b",
      col_minute = "ph_y_mctq__fd_001__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed start):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__bed__start__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed start):
#' Time \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_001__02`
#'     - `ph_y_mctq__fd_001__01a`
#'     - `ph_y_mctq__fd_001__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__bed__start__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_001__02",
#'     "ph_y_mctq__fd_001__01a",
#'     "ph_y_mctq__fd_001__01b",
#'     "ph_y_mctq__fd__bed__start__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__bed__start__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__bed__start__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_001__01a",
      col_hrs_b = "ph_y_mctq__fd_001__01b",
      col_minute = "ph_y_mctq__fd_001__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep):
#' Latency"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep_latent`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Latency
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_003`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep_latent(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_003",
#'     "ph_y_mctq__fd__sleep_latent"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep_latent <- function(
    data,
    name = "ph_y_mctq__fd__sleep_latent",
    combine = TRUE) {
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c(
      "ph_y_mctq__fd_003"
    )
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__fd_003")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          ph_y_mctq__fd_003 < 11 ~ ph_y_mctq__fd_003,
          ph_y_mctq__fd_003 < 15 ~ (15 + 5 * (ph_y_mctq__fd_003 - 11)),
          ph_y_mctq__fd_003 < 18 ~ (40 + 10 * (ph_y_mctq__fd_003 - 15)),
          ph_y_mctq__fd_003 < 22 ~ (75 + 15 * (ph_y_mctq__fd_003 - 18)),
          .default = (180 + 60 * (ph_y_mctq__fd_003 - 22))
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep):
#' Inertia"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep_inertia`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Inertia
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_006`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep_inertia(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_006",
#'     "ph_y_mctq__fd__sleep_inertia"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep_inertia <- function(
    data,
    name = "ph_y_mctq__fd__sleep_inertia",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c(
      "ph_y_mctq__fd_006"
    )
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__fd_006")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          !is.na(ph_y_mctq__fd_006) & ph_y_mctq__fd_006 < 11 ~
            ph_y_mctq__fd_006,
          !is.na(ph_y_mctq__fd_006) & ph_y_mctq__fd_006 < 15 ~
            15 + 5 * (ph_y_mctq__fd_006 - 11),
          !is.na(ph_y_mctq__fd_006) & ph_y_mctq__fd_006 < 18 ~
            40 + 10 * (ph_y_mctq__fd_006 - 15),
          !is.na(ph_y_mctq__fd_006) & ph_y_mctq__fd_006 < 22 ~
            75 + 15 * (ph_y_mctq__fd_006 - 18),
          .default = 180 + 60 * (ph_y_mctq__fd_006 - 22)
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep start):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__start__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep start): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_002__02`
#'     - `ph_y_mctq__fd_002__01a`
#'     - `ph_y_mctq__fd_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep__start__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_002__02",
#'     "ph_y_mctq__fd_002__01a",
#'     "ph_y_mctq__fd_002__01b",
#'     "ph_y_mctq__fd__sleep__start__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep__start__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__start__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_002__01a",
      col_hrs_b = "ph_y_mctq__fd_002__01b",
      col_minute = "ph_y_mctq__fd_002__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep end):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__end__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep end): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_005__02`
#'     - `ph_y_mctq__fd_005__01a`
#'     - `ph_y_mctq__fd_005__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep__end__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_005__02",
#'     "ph_y_mctq__fd_005__01a",
#'     "ph_y_mctq__fd_005__01b",
#'     "ph_y_mctq__fd__sleep__end__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep__end__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__end__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_005__01a",
      col_hrs_b = "ph_y_mctq__fd_005__01b",
      col_minute = "ph_y_mctq__fd_005__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep start):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__start__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep start): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_002__02`
#'     - `ph_y_mctq__fd_002__01a`
#'     - `ph_y_mctq__fd_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep__start__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_002__02",
#'     "ph_y_mctq__fd_002__01a",
#'     "ph_y_mctq__fd_002__01b",
#'     "ph_y_mctq__fd__sleep__start__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep__start__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__start__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_002__01a",
      col_hrs_b = "ph_y_mctq__fd_002__01b",
      col_minute = "ph_y_mctq__fd_002__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep end):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__end__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep end): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_005__02`
#'     - `ph_y_mctq__fd_005__01a`
#'     - `ph_y_mctq__fd_005__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep__end__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_005__02",
#'     "ph_y_mctq__fd_005__01a",
#'     "ph_y_mctq__fd_005__01b",
#'     "ph_y_mctq__fd__sleep__end__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep__end__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__end__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__fd_005__01a",
      col_hrs_b = "ph_y_mctq__fd_005__01b",
      col_minute = "ph_y_mctq__fd_005__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep
#' wakenings after sleep onset): Sum"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__waso_sum`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep wakenings
#' after sleep onset): Sum
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_004`
#'     - `ph_y_mctq__fd_004__01`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__fd__sleep__waso_sum(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__fd_004",
#'     "ph_y_mctq__fd_004__01",
#'     "ph_y_mctq__fd__sleep__waso_sum"
#'   ))
#' )
#' }
compute_ph_y_mctq__fd__sleep__waso_sum <- function(
    data,
    name = "ph_y_mctq__fd__sleep__waso_sum",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c("ph_y_mctq__fd_004", "ph_y_mctq__fd_004__01")
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__fd_004", "ph_y_mctq__fd_004__01")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          is.na(ph_y_mctq__fd_004) & is.na(ph_y_mctq__fd_004__01) ~ NA_real_,
          !is.na(ph_y_mctq__fd_004) & ph_y_mctq__fd_004 > 0 ~
            case_when(
              !is.na(ph_y_mctq__fd_004__01) & ph_y_mctq__fd_004__01 < 11 ~
                ph_y_mctq__fd_004__01,
              !is.na(ph_y_mctq__fd_004__01) & ph_y_mctq__fd_004__01 < 15 ~
                10 + 5 * (ph_y_mctq__fd_004__01 - 10),
              !is.na(ph_y_mctq__fd_004__01) & ph_y_mctq__fd_004__01 < 18 ~
                30 + 10 * (ph_y_mctq__fd_004__01 - 14),
              !is.na(ph_y_mctq__fd_004__01) & ph_y_mctq__fd_004__01 < 22 ~
                60 + 15 * (ph_y_mctq__fd_004__01 - 17),
              .default = 120 + 60 * (ph_y_mctq__fd_004__01 - 21)
            ),
          .default = 0
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] ( School Schedule start):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__school__start__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] ( School Schedule start): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__school_002__02`
#'     - `ph_y_mctq__school_002__01a`
#'     - `ph_y_mctq__school_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__school__start__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__school_002__02",
#'     "ph_y_mctq__school_002__01a",
#'     "ph_y_mctq__school_002__01b",
#'     "ph_y_mctq__school__start__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__school__start__36h_t <- function(
    data,
    name = "ph_y_mctq__school__start__36h_t",
    combine = TRUE) {
  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__school_002__01a",
      col_hrs_b = "ph_y_mctq__school_002__01b",
      col_minute = "ph_y_mctq__school_002__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] ( School Schedule leave):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__school__leave__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] ( School Schedule leave): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__school_003__02`
#'     - `ph_y_mctq__school_003__01a`
#'     - `ph_y_mctq__school_003__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__school__leave__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__school_003__02",
#'     "ph_y_mctq__school_003__01a",
#'     "ph_y_mctq__school_003__01b",
#'     "ph_y_mctq__school__leave__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__school__leave__36h_t <- function(
    data,
    name = "ph_y_mctq__school__leave__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__school_003__01a",
      col_hrs_b = "ph_y_mctq__school_003__01b",
      col_minute = "ph_y_mctq__school_003__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] ( School Schedule start):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__school__start__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] ( School Schedule start): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__school_002__02`
#'     - `ph_y_mctq__school_002__01a`
#'     - `ph_y_mctq__school_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__school__start__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__school_002__02",
#'     "ph_y_mctq__school_002__01a",
#'     "ph_y_mctq__school_002__01b",
#'     "ph_y_mctq__school__start__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__school__start__24h_t <- function(
    data,
    name = "ph_y_mctq__school__start__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__school_002__01a",
      col_hrs_b = "ph_y_mctq__school_002__01b",
      col_minute = "ph_y_mctq__school_002__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] ( School Schedule leave):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__school__leave__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] ( School Schedule leave): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__school_003__02`
#'     - `ph_y_mctq__school_003__01a`
#'     - `ph_y_mctq__school_003__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__school__leave__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__school_003__02",
#'     "ph_y_mctq__school_003__01a",
#'     "ph_y_mctq__school_003__01b",
#'     "ph_y_mctq__school__leave__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__school__leave__24h_t <- function(
    data,
    name = "ph_y_mctq__school__leave__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__school_003__01a",
      col_hrs_b = "ph_y_mctq__school_003__01b",
      col_minute = "ph_y_mctq__school_003__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day): Count"
#' @description
#' Computes the summary score `ph_y_mctq__sd_count`
#' Munich Chronotype Questionnaire \[Youth\] (School Day): Count
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__school_001`
#'     - `ph_y_mctq__school_001__01`
#'     - `ph_y_mctq__school_001__v01` (>= 7.0.0)
#'     - `ph_y_mctq__school_001__01__v1` (>= 7.0.0)
#' - *Excluded values:* none
#'
#' @details
#' In data release before 7.0 and 7.0.0 of the ABCDscores package,
#' the variables `ph_y_mctq__school_001__v01` and
#' `ph_y_mctq__school_001__01__v1` were
#' not available. In this case, the function will create
#' these variables internally and fill them with `NA` values.
#' After 7.0.0, these variables are expected to be present.
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd_count(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__school_001",
#'     "ph_y_mctq__school_001__01",
#'     "ph_y_mctq__school_001__v01",
#'     "ph_y_mctq__school_001__01__v1",
#'     "ph_y_mctq__sd_count"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd_count <- function(
    data,
    name = "ph_y_mctq__sd_count",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)

  data_aug <- data
  if (utils::packageVersion("ABCDscores") < "7.0.0") {
    optional_cols <- c(
      "ph_y_mctq__school_001__v01",
      "ph_y_mctq__school_001__01__v1"
    )
    missing_optional <- setdiff(optional_cols, names(data))

    if (length(missing_optional) > 0) {
      na_cols <- setNames(
        rep(list(NA_real_), length(missing_optional)),
        missing_optional
      )
      data_aug <- data_aug |>
        mutate(!!!na_cols)
    }
  }

  chk::check_names(
    data_aug,
    c(
      "ph_y_mctq__school_001",
      "ph_y_mctq__school_001__01",
      "ph_y_mctq__school_001__v01",
      "ph_y_mctq__school_001__01__v1"
    )
  )
  check_col_names(data_aug, name)

  data_ss <- data_aug |>
    mutate(
      across(
        all_of(
          c(
            "ph_y_mctq__school_001",
            "ph_y_mctq__school_001__01",
            "ph_y_mctq__school_001__v01",
            "ph_y_mctq__school_001__01__v1"
          )
        ),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          ph_y_mctq__school_001 == 0 &
            is.na(ph_y_mctq__school_001__01) &
            ph_y_mctq__school_001__v01 == 0 &
            is.na(ph_y_mctq__school_001__01__v1) ~ 0,
          .default = pmax(
            ph_y_mctq__school_001__01,
            ph_y_mctq__school_001__01__v1,
            na.rm = TRUE
          )
        ) |>
        as.integer()
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed
#' start): Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__bed__start__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - In bed start):
#' Time \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_001__02`
#'     - `ph_y_mctq__sd_001__01a`
#'     - `ph_y_mctq__sd_001__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__bed__start__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_001__02",
#'     "ph_y_mctq__sd_001__01a",
#'     "ph_y_mctq__sd_001__01b",
#'     "ph_y_mctq__sd__bed__start__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__bed__start__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__bed__start__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_001__01a",
      col_hrs_b = "ph_y_mctq__sd_001__01b",
      col_minute = "ph_y_mctq__sd_001__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed
#' start): Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__bed__start__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - In bed start):
#' Time \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_001__02`
#'     - `ph_y_mctq__sd_001__01a`
#'     - `ph_y_mctq__sd_001__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__bed__start__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_001__02",
#'     "ph_y_mctq__sd_001__01a",
#'     "ph_y_mctq__sd_001__01b",
#'     "ph_y_mctq__sd__bed__start__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__bed__start__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__bed__start__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_001__01a",
      col_hrs_b = "ph_y_mctq__sd_001__01b",
      col_minute = "ph_y_mctq__sd_001__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep):
#' Inertia"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep_inertia`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep): Inertia
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_006`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep_inertia(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_006",
#'     "ph_y_mctq__sd__sleep_inertia"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep_inertia <- function(
    data,
    name = "ph_y_mctq__sd__sleep_inertia",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c("ph_y_mctq__sd_006")
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__sd_006")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          !is.na(ph_y_mctq__sd_006) & ph_y_mctq__sd_006 < 11 ~
            ph_y_mctq__sd_006,
          !is.na(ph_y_mctq__sd_006) & ph_y_mctq__sd_006 < 15 ~
            15 + 5 * (ph_y_mctq__sd_006 - 11),
          !is.na(ph_y_mctq__sd_006) & ph_y_mctq__sd_006 < 18 ~
            40 + 10 * (ph_y_mctq__sd_006 - 15),
          !is.na(ph_y_mctq__sd_006) & ph_y_mctq__sd_006 < 22 ~
            75 + 15 * (ph_y_mctq__sd_006 - 18),
          .default = 180 + 60 * (ph_y_mctq__sd_006 - 22)
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep):
#' Latency"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep_latent`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep): Latency
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_003`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep_latent(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_003",
#'     "ph_y_mctq__sd__sleep_latent"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep_latent <- function(
    data,
    name = "ph_y_mctq__sd__sleep_latent",
    combine = TRUE) {
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c("ph_y_mctq__sd_003")
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__sd_003")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          !is.na(ph_y_mctq__sd_003) & ph_y_mctq__sd_003 < 11 ~
            ph_y_mctq__sd_003,
          !is.na(ph_y_mctq__sd_003) & ph_y_mctq__sd_003 < 15 ~
            15 + 5 * (ph_y_mctq__sd_003 - 11),
          !is.na(ph_y_mctq__sd_003) & ph_y_mctq__sd_003 < 18 ~
            40 + 10 * (ph_y_mctq__sd_003 - 15),
          !is.na(ph_y_mctq__sd_003) & ph_y_mctq__sd_003 < 22 ~
            75 + 15 * (ph_y_mctq__sd_003 - 18),
          .default = 180 + 60 * (ph_y_mctq__sd_003 - 22)
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep
#' start): Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__start__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep start):
#' Time \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_002__02`
#'     - `ph_y_mctq__sd_002__01a`
#'     - `ph_y_mctq__sd_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep__start__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_002__02",
#'     "ph_y_mctq__sd_002__01a",
#'     "ph_y_mctq__sd_002__01b",
#'     "ph_y_mctq__sd__sleep__start__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep__start__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__start__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_002__01a",
      col_hrs_b = "ph_y_mctq__sd_002__01b",
      col_minute = "ph_y_mctq__sd_002__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep end):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__end__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep end): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_005__02`
#'     - `ph_y_mctq__sd_005__01a`
#'     - `ph_y_mctq__sd_005__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep__end__36h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_005__02",
#'     "ph_y_mctq__sd_005__01a",
#'     "ph_y_mctq__sd_005__01b",
#'     "ph_y_mctq__sd__sleep__end__36h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep__end__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__end__36h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_005__01a",
      col_hrs_b = "ph_y_mctq__sd_005__01b",
      col_minute = "ph_y_mctq__sd_005__02",
      scale = "36h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep
#' start): Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__start__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep start):
#' Time \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_002__02`
#'     - `ph_y_mctq__sd_002__01a`
#'     - `ph_y_mctq__sd_002__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep__start__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_002__02",
#'     "ph_y_mctq__sd_002__01a",
#'     "ph_y_mctq__sd_002__01b",
#'     "ph_y_mctq__sd__sleep__start__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep__start__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__start__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_002__01a",
      col_hrs_b = "ph_y_mctq__sd_002__01b",
      col_minute = "ph_y_mctq__sd_002__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep end):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__end__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep end): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_005__02`
#'     - `ph_y_mctq__sd_005__01a`
#'     - `ph_y_mctq__sd_005__01b`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep__end__24h_t(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_005__02",
#'     "ph_y_mctq__sd_005__01a",
#'     "ph_y_mctq__sd_005__01b",
#'     "ph_y_mctq__sd__sleep__end__24h_t"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep__end__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__end__24h_t",
    combine = TRUE) {
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    convert_time_mctq(
      name = name,
      col_hrs_a = "ph_y_mctq__sd_005__01a",
      col_hrs_b = "ph_y_mctq__sd_005__01b",
      col_minute = "ph_y_mctq__sd_005__02",
      scale = "24h"
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep
#' wakenings after sleep onset): Sum"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__waso_sum`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep wakenings
#' after sleep onset): Sum
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_004`
#'     - `ph_y_mctq__sd_004__01`
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_ph_y_mctq__sd__sleep__waso_sum(data)
#' select(
#'   data,
#'   any_of(c(
#'     "ph_y_mctq__sd_004",
#'     "ph_y_mctq__sd_004__01",
#'     "ph_y_mctq__sd__sleep__waso_sum"
#'   ))
#' )
#' }
compute_ph_y_mctq__sd__sleep__waso_sum <- function(
    data,
    name = "ph_y_mctq__sd__sleep__waso_sum",
    combine = TRUE) {
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c("ph_y_mctq__sd_004", "ph_y_mctq__sd_004__01")
  )
  check_col_names(data, name)

  data_ss <- data |>
    mutate(
      across(
        all_of(c("ph_y_mctq__sd_004", "ph_y_mctq__sd_004__01")),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" :=
        case_when(
          is.na(ph_y_mctq__sd_004) & is.na(ph_y_mctq__sd_004__01) ~ NA_real_,
          !is.na(ph_y_mctq__sd_004) & ph_y_mctq__sd_004 > 0 ~
            case_when(
              !is.na(ph_y_mctq__sd_004__01) & ph_y_mctq__sd_004__01 < 11 ~
                ph_y_mctq__sd_004__01,
              !is.na(ph_y_mctq__sd_004__01) & ph_y_mctq__sd_004__01 < 15 ~
                10 + 5 * (ph_y_mctq__sd_004__01 - 10),
              !is.na(ph_y_mctq__sd_004__01) & ph_y_mctq__sd_004__01 < 18 ~
                30 + 10 * (ph_y_mctq__sd_004__01 - 14),
              !is.na(ph_y_mctq__sd_004__01) & ph_y_mctq__sd_004__01 < 22 ~
                60 + 15 * (ph_y_mctq__sd_004__01 - 17),
              .default = 120 + 60 * (ph_y_mctq__sd_004__01 - 21)
            ),
          .default = 0
        ) / 60
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep onset):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__onset__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep onset): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__start__36h_t`(intermediate score)
#'     - `ph_y_mctq__fd__sleep_latent` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep__onset__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep__onset__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep__onset__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__onset__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__start__36h_t(
      name = "ph_y_mctq__fd__sleep__start__36h_t_internal",
    ) |>
    compute_ph_y_mctq__fd__sleep_latent(
      name = "ph_y_mctq__fd__sleep_latent_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__start__36h_t_internal +
        ph_y_mctq__fd__sleep_latent_internal +
        if_else(
          (
            ph_y_mctq__fd__sleep__start__36h_t_internal +
              ph_y_mctq__fd__sleep_latent_internal
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed end):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__bed__end__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed end): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_inertia` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__bed__end__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__bed__end__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__bed__end__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__bed__end__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep_inertia(
      name = "ph_y_mctq__fd__sleep_inertia_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__end__36h_t(
      name = "ph_y_mctq__fd__sleep__end__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__end__36h_t_internal +
        ph_y_mctq__fd__sleep_inertia_internal +
        if_else(
          (
            ph_y_mctq__fd__sleep__end__36h_t_internal +
              ph_y_mctq__fd__sleep_inertia_internal
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep onset):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__onset__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep onset): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__start__24h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_latent` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep__onset__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep__onset__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep__onset__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__onset__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__start__24h_t(
      name = "ph_y_mctq__fd__sleep__start__24h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep_latent(
      name = "ph_y_mctq__fd__sleep_latent_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__start__24h_t_internal +
        ph_y_mctq__fd__sleep_latent_internal +
        if_else(
          (
            ph_y_mctq__fd__sleep__start__24h_t_internal +
              ph_y_mctq__fd__sleep_latent_internal
          ) >= 24,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed end):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__bed__end__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed end): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__end__24h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_inertia` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__bed__end__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__bed__end__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__bed__end__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__bed__end__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep_inertia(
      name = "ph_y_mctq__fd__sleep_inertia_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__end__24h_t(
      name = "ph_y_mctq__fd__sleep__end__24h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__end__24h_t_internal +
        ph_y_mctq__fd__sleep_inertia_internal +
        if_else(
          (
            ph_y_mctq__fd__sleep__end__24h_t_internal +
              ph_y_mctq__fd__sleep_inertia_internal
          ) >= 24,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day): Count"
#' @description
#' Computes the summary score `ph_y_mctq__fd_count`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day): Count
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_count` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd_count(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd_count"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd_count <- function(
    data,
    name = "ph_y_mctq__fd_count",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd_count(
      name = "ph_y_mctq__sd_count_internal"
    ) |>
    mutate(
      "{name}" := as.integer(7 - ph_y_mctq__sd_count_internal)
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep
#' onset): Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__onset__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep onset):
#' Time \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__start__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_latent` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep__onset__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep__onset__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep__onset__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__onset__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__start__36h_t(
      name = "ph_y_mctq__sd__sleep__start__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_latent(
      name = "ph_y_mctq__sd__sleep_latent_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__start__36h_t_internal +
        ph_y_mctq__sd__sleep_latent_internal +
        if_else(
          (
            ph_y_mctq__sd__sleep__start__36h_t_internal +
              ph_y_mctq__sd__sleep_latent_internal
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed end):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__bed__end__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - In bed end):
#' Time \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_inertia` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__bed__end__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__bed__end__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__bed__end__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__bed__end__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep_inertia(
      name = "ph_y_mctq__sd__sleep_inertia_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__end__36h_t(
      name = "ph_y_mctq__sd__sleep__end__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__end__36h_t_internal +
        ph_y_mctq__sd__sleep_inertia_internal +
        if_else(
          (
            ph_y_mctq__sd__sleep__end__36h_t_internal +
              ph_y_mctq__sd__sleep_inertia_internal
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep
#' onset): Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__onset__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep onset):
#' Time \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__start__24h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_latent` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep__onset__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep__onset__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep__onset__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__onset__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__start__24h_t(
      name = "ph_y_mctq__sd__sleep__start__24h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_latent(
      name = "ph_y_mctq__sd__sleep_latent_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__start__24h_t_internal +
        ph_y_mctq__sd__sleep_latent_internal +
        if_else(
          (
            ph_y_mctq__sd__sleep__start__24h_t_internal +
              ph_y_mctq__sd__sleep_latent_internal
          ) >= 24,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed end):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__bed__end__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - In bed end):
#' Time \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__end__24h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_inertia` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__bed__end__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__bed__end__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__bed__end__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__bed__end__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep_inertia(
      name = "ph_y_mctq__sd__sleep_inertia_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__end__24h_t(
      name = "ph_y_mctq__sd__sleep__end__24h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__end__24h_t_internal +
        ph_y_mctq__sd__sleep_inertia_internal +
        if_else(
          (
            ph_y_mctq__sd__sleep__end__24h_t_internal +
              ph_y_mctq__sd__sleep_inertia_internal
          ) >= 24,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep):
#' Duration"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep_dur`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Duration
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__waso_sum` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep_dur(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep_dur"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep_dur <- function(
    data,
    name = "ph_y_mctq__fd__sleep_dur",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__end__36h_t(
      name = "ph_y_mctq__fd__sleep__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__waso_sum(
      name = "ph_y_mctq__fd__sleep__waso_sum_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__end__36h_t_internal -
        ph_y_mctq__fd__sleep__onset__36h_t_internal -
        if_else(
          is.na(ph_y_mctq__fd__sleep__waso_sum_internal),
          0,
          ph_y_mctq__fd__sleep__waso_sum_internal
        ) +
        if_else(
          ph_y_mctq__fd__sleep__end__36h_t_internal <
            ph_y_mctq__fd__sleep__onset__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep):
#' Period"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep_period`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep): Period
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep_period(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep_period"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep_period <- function(
    data,
    name = "ph_y_mctq__fd__sleep_period",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__end__36h_t(
      name = "ph_y_mctq__fd__sleep__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__end__36h_t_internal -
        ph_y_mctq__fd__sleep__onset__36h_t_internal +
        if_else(
          ph_y_mctq__fd__sleep__end__36h_t_internal <
            ph_y_mctq__fd__sleep__onset__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed): Sum"
#' @description
#' Computes the summary score `ph_y_mctq__fd__bed_sum`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - In bed): Sum
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__bed__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__bed__start__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__bed_sum(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__bed_sum"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__bed_sum <- function(
    data,
    name = "ph_y_mctq__fd__bed_sum",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__bed__end__36h_t(
      name = "ph_y_mctq__fd__bed__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__bed__start__36h_t(
      name = "ph_y_mctq__fd__bed__start__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__bed__end__36h_t_internal -
        ph_y_mctq__fd__bed__start__36h_t_internal +
        if_else(
          ph_y_mctq__fd__bed__end__36h_t_internal <
            ph_y_mctq__fd__bed__start__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep):
#' Duration"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep_dur`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep): Duration
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__waso_sum` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep_dur(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep_dur"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep_dur <- function(
    data,
    name = "ph_y_mctq__sd__sleep_dur",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)
  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__end__36h_t(
      name = "ph_y_mctq__sd__sleep__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__onset__36h_t(
      name = "ph_y_mctq__sd__sleep__onset__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__waso_sum(
      name = "ph_y_mctq__sd__sleep__waso_sum_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__end__36h_t_internal -
        ph_y_mctq__sd__sleep__onset__36h_t_internal -
        if_else(
          is.na(ph_y_mctq__sd__sleep__waso_sum_internal),
          0,
          ph_y_mctq__sd__sleep__waso_sum_internal
        ) +
        if_else(
          ph_y_mctq__sd__sleep__end__36h_t_internal <
            ph_y_mctq__sd__sleep__onset__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep):
#' Period"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep_period`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep): Period
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__onset__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep_period(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep_period"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep_period <- function(
    data,
    name = "ph_y_mctq__sd__sleep_period",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__end__36h_t(
      name = "ph_y_mctq__sd__sleep__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__onset__36h_t(
      name = "ph_y_mctq__sd__sleep__onset__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__end__36h_t_internal -
        ph_y_mctq__sd__sleep__onset__36h_t_internal +
        if_else(
          ph_y_mctq__sd__sleep__end__36h_t_internal <
            ph_y_mctq__sd__sleep__onset__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - In bed):
#' Sum"
#' @description
#' Computes the summary score `ph_y_mctq__sd__bed_sum`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - In bed): Sum
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__bed__end__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__bed__start__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__bed_sum(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__bed_sum"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__bed_sum <- function(
    data,
    name = "ph_y_mctq__sd__bed_sum",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__bed__end__36h_t(
      name = "ph_y_mctq__sd__bed__end__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__bed__start__36h_t(
      name = "ph_y_mctq__sd__bed__start__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__bed__end__36h_t_internal -
        ph_y_mctq__sd__bed__start__36h_t_internal +
        if_else(
          ph_y_mctq__sd__bed__end__36h_t_internal <
            ph_y_mctq__sd__bed__start__36h_t_internal,
          24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep mid):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__mid__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep mid): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__onset__24h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_dur` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep__mid__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep__mid__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep__mid__24h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__mid__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__onset__24h_t(
      name = "ph_y_mctq__fd__sleep__onset__24h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep_period(
      name = "ph_y_mctq__fd__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        round(
          ph_y_mctq__fd__sleep__onset__24h_t_internal +
            (ph_y_mctq__fd__sleep_period_internal) / 2 +
            if_else(
              (
                ph_y_mctq__fd__sleep__onset__24h_t_internal +
                  ph_y_mctq__fd__sleep_period_internal / 2
              ) >= 24,
              -24,
              0
            ),
          4
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep mid):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__fd__sleep__mid__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (Free Day - Sleep mid): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_period` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__fd__sleep__mid__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__fd__sleep__mid__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__fd__sleep__mid__36h_t <- function(
    data,
    name = "ph_y_mctq__fd__sleep__mid__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal2"
    ) |>
    compute_ph_y_mctq__fd__sleep_period(
      name = "ph_y_mctq__fd__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
        (ph_y_mctq__fd__sleep_period_internal / 2) +
        if_else(
          (
            ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
              (ph_y_mctq__fd__sleep_period_internal / 2)
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep mid):
#' Time \[24 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__mid__24h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep mid): Time
#' \[24 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__onset__24h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_dur` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep__mid__24h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep__mid__24h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep__mid__24h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__mid__24h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__onset__24h_t(
      name = "ph_y_mctq__sd__sleep__onset__24h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_period(
      name = "ph_y_mctq__sd__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        round(
          ph_y_mctq__sd__sleep__onset__24h_t_internal +
            (ph_y_mctq__sd__sleep_period_internal) / 2 +
            if_else(
              (
                ph_y_mctq__sd__sleep__onset__24h_t_internal +
                  ph_y_mctq__sd__sleep_period_internal / 2
              ) >= 24,
              -24,
              0
            ),
          4
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Sleep): Duration"
#' @description
#' Computes the summary score `ph_y_mctq__sleep_dur`
#' Munich Chronotype Questionnaire \[Youth\] (Sleep): Duration
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_count` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_dur` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_dur` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sleep_dur(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sleep_dur"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sleep_dur <- function(
    data,
    name = "ph_y_mctq__sleep_dur",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd_count(
      name = "ph_y_mctq__sd_count_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_dur(
      name = "ph_y_mctq__sd__sleep_dur_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep_dur(
      name = "ph_y_mctq__fd__sleep_dur_internal"
    ) |>
    mutate(
      "{name}" :=
        (
          ph_y_mctq__sd_count_internal * ph_y_mctq__sd__sleep_dur_internal +
            (7 - ph_y_mctq__sd_count_internal) * ph_y_mctq__fd__sleep_dur_internal
        ) / 7
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Sleep): Loss"
#' @description
#' Computes the summary score `ph_y_mctq__sleep_loss`
#' Munich Chronotype Questionnaire \[Youth\] (Sleep): Loss
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep_period` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_period` (intermediate score)
#'     - `ph_y_mctq__sd_count` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sleep_loss(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sleep_loss"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sleep_loss <- function(
    data,
    name = "ph_y_mctq__sleep_loss",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep_period(
      name = "ph_y_mctq__fd__sleep_period_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_period(
      name = "ph_y_mctq__sd__sleep_period_internal"
    ) |>
    compute_ph_y_mctq__sd_count(
      name = "ph_y_mctq__sd_count_internal"
    ) |>
    mutate(
      "{name}" :=
        abs(
          ph_y_mctq__fd__sleep_period_internal -
            ph_y_mctq__sd__sleep_period_internal
        ) *
          (7 - ph_y_mctq__sd_count_internal) * ph_y_mctq__sd_count_internal / 7
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep mid):
#' Time \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__sd__sleep__mid__36h_t`
#' Munich Chronotype Questionnaire \[Youth\] (School Day - Sleep mid): Time
#' \[36 hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_period` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sd__sleep__mid__36h_t(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sd__sleep__mid__36h_t"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sd__sleep__mid__36h_t <- function(
    data,
    name = "ph_y_mctq__sd__sleep__mid__36h_t",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__onset__36h_t(
      name = "ph_y_mctq__sd__sleep__onset__36h_t_internal2"
    ) |>
    compute_ph_y_mctq__sd__sleep_period(
      name = "ph_y_mctq__sd__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        ph_y_mctq__sd__sleep__onset__36h_t_internal2 +
        (ph_y_mctq__sd__sleep_period_internal / 2) +
        if_else(
          (
            ph_y_mctq__sd__sleep__onset__36h_t_internal2 +
              (ph_y_mctq__sd__sleep_period_internal / 2)
          ) >= 36,
          -24,
          0
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Sleep): Period"
#' @description
#' Computes the summary score `ph_y_mctq__sleep_period`
#' Munich Chronotype Questionnaire \[Youth\] (Sleep): Period
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd_count` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_period` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_period` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__sleep_period(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__sleep_period"
#'     ))
#'   )
#' }
compute_ph_y_mctq__sleep_period <- function(
    data,
    name = "ph_y_mctq__sleep_period",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd_count(
      name = "ph_y_mctq__sd_count_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_period(
      name = "ph_y_mctq__sd__sleep_period_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep_period(
      name = "ph_y_mctq__fd__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        (
          ph_y_mctq__sd_count_internal *
            ph_y_mctq__sd__sleep_period_internal +
            (7 - ph_y_mctq__sd_count_internal) *
              ph_y_mctq__fd__sleep_period_internal
        ) / 7
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Raw: Chronotype): Time
#' \[36 hour adjusted\]"
#' @description
#' Computes the summary score `ph_y_mctq__raw__36h_chrono`
#' Munich Chronotype Questionnaire \[Youth\] (Raw: Chronotype): Time \[36
#' hour adjusted\]
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep_dur` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_dur` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__sleep_dur` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__raw__36h_chrono(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__raw__36h_chrono"
#'     ))
#'   )
#' }
compute_ph_y_mctq__raw__36h_chrono <- function(
    data,
    name = "ph_y_mctq__raw__36h_chrono",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep_dur(
      name = "ph_y_mctq__fd__sleep_dur_internal2"
    ) |>
    compute_ph_y_mctq__sd__sleep_dur(
      name = "ph_y_mctq__sd__sleep_dur_internal2"
    ) |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t(
      name = "ph_y_mctq__fd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal2"
    ) |>
    compute_ph_y_mctq__sleep_dur(
      name = "ph_y_mctq__sleep_dur_internal"
    ) |>
    mutate(
      "{name}" :=
        if_else(
          ph_y_mctq__fd__sleep_dur_internal2 <=
            ph_y_mctq__sd__sleep_dur_internal2,
          ph_y_mctq__fd__sleep__mid__36h_t_internal,
          ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
            ph_y_mctq__sleep_dur_internal / 2 +
            if_else(
              (
                ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
                  ph_y_mctq__sleep_dur_internal / 2
              ) >= 36,
              -24,
              0
            )
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Chronotype): Time"
#' @description
#' Computes the summary score `ph_y_mctq_chrono`
#' Munich Chronotype Questionnaire \[Youth\] (Chronotype): Time
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd_007`
#'     - `ph_y_mctq__fd__sleep_period` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_period` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__sleep_period` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq_chrono(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq_chrono"
#'     ))
#'   )
#' }
compute_ph_y_mctq_chrono <- function(
    data,
    name = "ph_y_mctq_chrono",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep_period(
      name = "ph_y_mctq__fd__sleep_period_internal2"
    ) |>
    compute_ph_y_mctq__sd__sleep_period(
      name = "ph_y_mctq__sd__sleep_period_internal2"
    ) |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t(
      name = "ph_y_mctq__fd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal2"
    ) |>
    compute_ph_y_mctq__sleep_period(
      name = "ph_y_mctq__sleep_period_internal"
    ) |>
    mutate(
      "{name}" :=
        if_else(
          ph_y_mctq__fd_007 == 0,
          if_else(
            ph_y_mctq__fd__sleep_period_internal2 <=
              ph_y_mctq__sd__sleep_period_internal2,
            ph_y_mctq__fd__sleep__mid__36h_t_internal,
            ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
              ph_y_mctq__sleep_period_internal / 2 +
              if_else(
                (
                  ph_y_mctq__fd__sleep__onset__36h_t_internal2 +
                    ph_y_mctq__sleep_period_internal / 2
                ) >= 36,
                -24,
                0
              )
          ),
          NA_real_
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Social Jetlag: Relative):
#' Time"
#' @description
#' Computes the summary score `ph_y_mctq__socjl_rel`
#' Munich Chronotype Questionnaire \[Youth\] (Social Jetlag: Relative):
#' Time
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__mid__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__socjl_rel(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__socjl_rel"
#'     ))
#'   )
#' }
compute_ph_y_mctq__socjl_rel <- function(
    data,
    name = "ph_y_mctq__socjl_rel",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t(
      name = "ph_y_mctq__fd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__mid__36h_t(
      name = "ph_y_mctq__sd__sleep__mid__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        case_when(
          (
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          ) > 12 ~
            (
              ph_y_mctq__fd__sleep__mid__36h_t_internal -
                ph_y_mctq__sd__sleep__mid__36h_t_internal
            ) - 24,
          (
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          ) < -12 ~
            (
              ph_y_mctq__fd__sleep__mid__36h_t_internal -
                ph_y_mctq__sd__sleep__mid__36h_t_internal
            ) + 24,
          .default = (
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          )
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\] (Social Jetlag: Absolute):
#' Time"
#' @description
#' Computes the summary score `ph_y_mctq__socjl_absl`
#' Munich Chronotype Questionnaire \[Youth\] (Social Jetlag: Absolute):
#' Time
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__fd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__mid__36h_t` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq__socjl_absl(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq__socjl_absl"
#'     ))
#'   )
#' }
compute_ph_y_mctq__socjl_absl <- function(
    data,
    name = "ph_y_mctq__socjl_absl",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t(
      name = "ph_y_mctq__fd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep__mid__36h_t(
      name = "ph_y_mctq__sd__sleep__mid__36h_t_internal"
    ) |>
    mutate(
      "{name}" :=
        if_else(
          abs(
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          ) > 12,
          24 - abs(
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          ),
          abs(
            ph_y_mctq__fd__sleep__mid__36h_t_internal -
              ph_y_mctq__sd__sleep__mid__36h_t_internal
          )
        )
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Munich Chronotype Questionnaire \[Youth\]: Outlier"
#' @description
#' Computes the summary score `ph_y_mctq_outlier`
#' Munich Chronotype Questionnaire \[Youth\]: Outlier
#'
#' - *Summarized variables:*
#'     - `ph_y_mctq__sd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__onset__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__fd__sleep__mid__36h_t` (intermediate score)
#'     - `ph_y_mctq__sd__sleep_dur` (intermediate score)
#'     - `ph_y_mctq__fd__sleep_dur` (intermediate score)
#' - *Excluded values:* none
#'
#' @inheritParams compute_ph_y_mctq__fd__bed__start__36h_t
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_y_mctq_outlier(data) |>
#'   select(
#'     any_of(c(
#'       "ph_y_mctq_outlier"
#'     ))
#'   )
#' }
compute_ph_y_mctq_outlier <- function(
    data,
    name = "ph_y_mctq_outlier",
    combine = TRUE) {
  chk::check_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    compute_ph_y_mctq__sd__sleep__onset__36h_t(
      name = "ph_y_mctq__sd__sleep__onset__36h_t_internal3"
    ) |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t(
      name = "ph_y_mctq__fd__sleep__onset__36h_t_internal3"
    ) |>
    compute_ph_y_mctq__sd__sleep__mid__36h_t(
      name = "ph_y_mctq__sd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t(
      name = "ph_y_mctq__fd__sleep__mid__36h_t_internal"
    ) |>
    compute_ph_y_mctq__sd__sleep_dur(
      name = "ph_y_mctq__sd__sleep_dur_internal"
    ) |>
    compute_ph_y_mctq__fd__sleep_dur(
      name = "ph_y_mctq__fd__sleep_dur_internal"
    ) |>
    mutate(
      "{name}" :=
        if_else(
          ph_y_mctq__sd__sleep__onset__36h_t_internal3 > 30 |
            ph_y_mctq__sd__sleep__onset__36h_t_internal3 < 18 |
            ph_y_mctq__fd__sleep__onset__36h_t_internal3 > 30 |
            ph_y_mctq__fd__sleep__onset__36h_t_internal3 < 18 |
            ph_y_mctq__sd__sleep__mid__36h_t_internal < 24 |
            ph_y_mctq__fd__sleep__mid__36h_t_internal < 24 |
            ph_y_mctq__sd__sleep_dur_internal <= 0 |
            ph_y_mctq__fd__sleep_dur_internal <= 0,
          1,
          0
        ) |>
        as.character()
    ) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute all the MCTQ variables
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @details
#' Make sure the `data` is the full set of all variables from MCTQ.
#' @examples
#' \dontrun{
#' compute_ph_y_mctq_all(data)
#' }
compute_ph_y_mctq_all <- function(data) {
  data |>
    compute_ph_y_mctq__fd__bed__start__36h_t() |>
    compute_ph_y_mctq__fd__bed__start__24h_t() |>
    compute_ph_y_mctq__fd__sleep_latent() |>
    compute_ph_y_mctq__fd__sleep_inertia() |>
    compute_ph_y_mctq__fd__sleep__start__36h_t() |>
    compute_ph_y_mctq__fd__sleep__end__36h_t() |>
    compute_ph_y_mctq__fd__sleep__start__24h_t() |>
    compute_ph_y_mctq__fd__sleep__end__24h_t() |>
    compute_ph_y_mctq__fd__sleep__waso_sum() |>
    compute_ph_y_mctq__school__start__36h_t() |>
    compute_ph_y_mctq__school__leave__36h_t() |>
    compute_ph_y_mctq__school__start__24h_t() |>
    compute_ph_y_mctq__school__leave__24h_t() |>
    compute_ph_y_mctq__sd_count() |>
    compute_ph_y_mctq__sd__bed__start__36h_t() |>
    compute_ph_y_mctq__sd__bed__start__24h_t() |>
    compute_ph_y_mctq__sd__sleep_inertia() |>
    compute_ph_y_mctq__sd__sleep_latent() |>
    compute_ph_y_mctq__sd__sleep__start__36h_t() |>
    compute_ph_y_mctq__sd__sleep__end__36h_t() |>
    compute_ph_y_mctq__sd__sleep__start__24h_t() |>
    compute_ph_y_mctq__sd__sleep__end__24h_t() |>
    compute_ph_y_mctq__sd__sleep__waso_sum() |>
    compute_ph_y_mctq__fd__sleep__onset__36h_t() |>
    compute_ph_y_mctq__fd__bed__end__36h_t() |>
    compute_ph_y_mctq__fd__sleep__onset__24h_t() |>
    compute_ph_y_mctq__fd__bed__end__24h_t() |>
    compute_ph_y_mctq__fd_count() |>
    compute_ph_y_mctq__sd__sleep__onset__36h_t() |>
    compute_ph_y_mctq__sd__bed__end__36h_t() |>
    compute_ph_y_mctq__sd__sleep__onset__24h_t() |>
    compute_ph_y_mctq__sd__bed__end__24h_t() |>
    compute_ph_y_mctq__fd__sleep_dur() |>
    compute_ph_y_mctq__fd__sleep_period() |>
    compute_ph_y_mctq__fd__bed_sum() |>
    compute_ph_y_mctq__sd__sleep_dur() |>
    compute_ph_y_mctq__sd__sleep_period() |>
    compute_ph_y_mctq__sd__bed_sum() |>
    compute_ph_y_mctq__fd__sleep__mid__24h_t() |>
    compute_ph_y_mctq__fd__sleep__mid__36h_t() |>
    compute_ph_y_mctq__sd__sleep__mid__24h_t() |>
    compute_ph_y_mctq__sleep_dur() |>
    compute_ph_y_mctq__sleep_loss() |>
    compute_ph_y_mctq__sd__sleep__mid__36h_t() |>
    compute_ph_y_mctq__sleep_period() |>
    compute_ph_y_mctq__raw__36h_chrono() |>
    compute_ph_y_mctq_chrono() |>
    compute_ph_y_mctq__socjl_rel() |>
    compute_ph_y_mctq__socjl_absl() |>
    compute_ph_y_mctq_outlier()
}

#' Convert MCTQ time data to 24h or 36 format
#'
#' @description
#' Utility function to convert MCTQ survey responses to 24h or 36h format times.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the new column with the summary score.
#' @param col_hrs_a character. The name of the column with the first time.
#'
#'  1, 4 AM | 2, 5 AM | 3, 6 AM | 4, 7 AM | 5, 8 AM | 6, 9 AM | 7, 10 AM |
#'  8, 11 AM | 9, 12 PM | 10, 1 PM | 11, 2 PM | 12, 3 PM | 13, 4 PM
#' @param col_hrs_b  character. The name of the column with the second time.
#'
#' 1, 5 PM | 2, 6 PM | 3, 7 PM | 4, 8 PM | 5, 9 PM | 6, 10 PM | 7, 11 PM |
#' 8, 12 AM | 9, 1 AM | 10, 2 AM | 11, 3 AM
#' @param col_minute character. The name of the column with the minutes. If the
#' column value is `NA`, the minute is set to 0.
#'
#' 1, 0 minutes | 2, 5 minutes | 3, 10 minutes |
#' 4, 15 minutes | 5, 20 minutes | 6, 25 minutes |
#' 7, 30 minutes | 8, 35 minutes | 9, 40 minutes |
#' 10, 45 minutes | 11, 50 minutes | 12, 55 minutes
#' @param scale character. The scale of the time format. Default is "24h".
#' The other option is "36h".
#' @details
#' Expect values 0 <= value < 24 for 24h format.
#' Expect values 12 <= value < 36 for 36h format.
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'  column.
#' @export
#' @autoglobal
#' @examples
#' col_hrs_a <- "ph_y_mctq__fd_001__01a"
#' col_hrs_b <- "ph_y_mctq__fd_001__01b"
#' col_minute <- "ph_y_mctq__fd_001__02"
#' name <- "ph_y_mctq__fd__bed__start__24h_t"
#' data <- dplyr::tibble(
#'   ph_y_mctq__fd_001__01a = c(NA, NA, NA, NA, NA, 1, 7, 3, NA),
#'   ph_y_mctq__fd_001__01b = c(6, 7, 8, 8, 10, NA, NA, NA, NA),
#'   ph_y_mctq__fd_001__02 = c(1, 1, 1, 7, 7, 1, 4, 1, NA)
#' )
#' convert_time_mctq(data, name, col_hrs_a, col_hrs_b, col_minute)
#' name <- "ph_y_mctq__fd__bed__start__36h_t"
#' convert_time_mctq(data, name, col_hrs_a, col_hrs_b, col_minute, "36h")
convert_time_mctq <- function(
    data,
    name,
    col_hrs_a,
    col_hrs_b,
    col_minute,
    scale = "24h") {
  chk::chk_data(data)
  chk::chk_character(col_hrs_a)
  chk::chk_character(col_hrs_b)
  chk::chk_character(col_minute)
  chk::chk_character(name)
  chk::check_names(data, c(col_hrs_a, col_hrs_b, col_minute))
  chk::chk_subset(scale, c("24h", "36h"))

  data_out <- data |>
    mutate(
      across(
        all_of(c(col_hrs_a, col_hrs_b, col_minute)),
        ~ as.numeric(as.character(.x))
      ),
      "{name}" := round(
        case_when(
          !is.na(.data[[col_hrs_a]]) ~ .data[[col_hrs_a]] + 3,
          .data[[col_hrs_b]] < 8 ~ .data[[col_hrs_b]] + 16,
          .default = .data[[col_hrs_b]] - 8
        ) + if_else(
          is.na(.data[[col_minute]]),
          0,
          (.data[[col_minute]] - 1) / 12
        ),
        4
      )
    )

  if (scale == "36h") {
    data_out <- data_out |>
      mutate(
        "{name}" := if_else(
          .data[[name]] < 12,
          .data[[name]] + 24,
          .data[[name]]
        )
      )
  }
  data_out
}

#   ____________________________________________________________________________
#   ph_p_sds                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds_sum` and `ph_p_sds_nm`.
vars_ph_p_sds_sum <- c(
  "ph_p_sds__dims_001",
  "ph_p_sds__dims_002",
  "ph_p_sds__dims_003",
  "ph_p_sds__dims_004",
  "ph_p_sds__dims_005",
  "ph_p_sds__swtd_001",
  "ph_p_sds__swtd_002",
  "ph_p_sds__swtd_003",
  "ph_p_sds__hyphy_001",
  "ph_p_sds__dims_006",
  "ph_p_sds__dims_007",
  "ph_p_sds__swtd_004",
  "ph_p_sds__sbd_001",
  "ph_p_sds__sbd_002",
  "ph_p_sds__sbd_003",
  "ph_p_sds__hyphy_002",
  "ph_p_sds__da_001",
  "ph_p_sds__swtd_005",
  "ph_p_sds__swtd_006",
  "ph_p_sds__da_002",
  "ph_p_sds__da_003",
  "ph_p_sds__does_001",
  "ph_p_sds__does_002",
  "ph_p_sds__does_003",
  "ph_p_sds__does_004",
  "ph_p_sds__does_005"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Total): Sum \[Validation: No
#' more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds_sum`
#' Sleep Disturbance Scale \[Parent\] (Total): Sum \[Validation: No more than 0
#' missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds_sum |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param max_na integer, Maximum number of missing values allowed in the
#' summary score. `NULL` means no limit.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#' the input data frame. If `FALSE`, the summary score will be returned as a
#' separate data frame.
#' @param exclude character, Values to be excluded from the summary score.
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds_sum", vars_ph_p_sds_sum))
#'   )
#' }
compute_ph_p_sds_sum <- function(
    data,
    name = "ph_p_sds_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds_sum,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Total) - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_sds_nm`
#' Sleep Disturbance Scale \[Parent\] (Total) - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds_sum |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds_nm <- function(
    data,
    name = "ph_p_sds_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds_sum,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__da_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__da_sum` and `ph_p_sds__da_nm`.
vars_ph_p_sds__da <- c(
  "ph_p_sds__da_001",
  "ph_p_sds__da_002",
  "ph_p_sds__da_003"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorder of arousal): Sum
#' \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__da_sum`
#' Sleep Disturbance Scale \[Parent\] (Disorder of arousal): Sum
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__da |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__da_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__da_sum", vars_ph_p_sds__da))
#'   )
#' }
compute_ph_p_sds__da_sum <- function(
    data,
    name = "ph_p_sds__da_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__da,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorder of arousal) - Number
#' missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__da_nm`
#' Sleep Disturbance Scale \[Parent\] (Disorder of arousal) - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__da |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__da_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__da_nm <- function(
    data,
    name = "ph_p_sds__da_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__da,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__does_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__does_sum` and `ph_p_sds__does_nm`.
vars_ph_p_sds__does <- c(
  "ph_p_sds__does_001",
  "ph_p_sds__does_002",
  "ph_p_sds__does_003",
  "ph_p_sds__does_004",
  "ph_p_sds__does_005"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorders of excessive
#' somnolence): Sum \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__does_sum`
#' Sleep Disturbance Scale \[Parent\] (Disorders of excessive somnolence): Sum
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__does |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__does_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__does_sum", vars_ph_p_sds__does))
#'   )
#' }
compute_ph_p_sds__does_sum <- function(
    data,
    name = "ph_p_sds__does_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__does,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorders of excessive
#' somnolence) - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__does_nm`
#' Sleep Disturbance Scale \[Parent\] (Disorders of excessive somnolence) -
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__does |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__does_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__does_nm <- function(
    data,
    name = "ph_p_sds__does_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__does,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__hyphy_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__hyphy_sum` and `ph_p_sds__hyphy_nm`.
vars_ph_p_sds__hyphy <- c(
  "ph_p_sds__hyphy_001",
  "ph_p_sds__hyphy_002"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep hyperhydrosis): Sum
#' \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__hyphy_sum`
#' Sleep Disturbance Scale \[Parent\] (Sleep hyperhydrosis): Sum
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__hyphy |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__hyphy_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__hyphy_sum", vars_ph_p_sds__hyphy))
#'   )
#' }
compute_ph_p_sds__hyphy_sum <- function(
    data,
    name = "ph_p_sds__hyphy_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__hyphy,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep hyperhydrosis) - Number
#' missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__hyphy_nm`
#' Sleep Disturbance Scale \[Parent\] (Sleep hyperhydrosis) - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__hyphy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__hyphy_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__hyphy_nm <- function(
    data,
    name = "ph_p_sds__hyphy_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__hyphy,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__sbd_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__sbd_sum` and `ph_p_sds__sbd_nm`.
vars_ph_p_sds__sbd <- c(
  "ph_p_sds__sbd_001",
  "ph_p_sds__sbd_002",
  "ph_p_sds__sbd_003"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep breathing disorders): Sum
#' \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__sbd_sum`
#' Sleep Disturbance Scale \[Parent\] (Sleep breathing disorders): Sum
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__sbd |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__sbd_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__sbd_sum", vars_ph_p_sds__sbd))
#'   )
#' }
compute_ph_p_sds__sbd_sum <- function(
    data,
    name = "ph_p_sds__sbd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__sbd,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep breathing disorders) - Number
#' missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__sbd_nm`
#' Sleep Disturbance Scale \[Parent\] (Sleep breathing disorders) - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__sbd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__sbd_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__sbd_nm <- function(
    data,
    name = "ph_p_sds__sbd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__sbd,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__swtd_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__swtd_sum` and `ph_p_sds__swtd_nm`.
vars_ph_p_sds__swtd <- c(
  "ph_p_sds__swtd_001",
  "ph_p_sds__swtd_002",
  "ph_p_sds__swtd_003",
  "ph_p_sds__swtd_004",
  "ph_p_sds__swtd_005",
  "ph_p_sds__swtd_006"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep-wake transition
#' disorders): Sum \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__swtd_sum`
#' Sleep Disturbance Scale \[Parent\] (Sleep-wake transition disorders): Sum
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__swtd |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__swtd_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__swtd_sum", vars_ph_p_sds__swtd))
#'   )
#' }
compute_ph_p_sds__swtd_sum <- function(
    data,
    name = "ph_p_sds__swtd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__swtd,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Sleep-wake transition
#' disorders) - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__swtd_nm`
#' Sleep Disturbance Scale \[Parent\] (Sleep-wake transition disorders) - Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__swtd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__swtd_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__swtd_nm <- function(
    data,
    name = "ph_p_sds__swtd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__swtd,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_ph_p_sds__dims_sum
#' @format character vector of all column names
#' used to compute summary scores of `ph_p_sds__dims_sum` and `ph_p_sds__dims_nm`.
vars_ph_p_sds__dims <- c(
  "ph_p_sds__dims_001",
  "ph_p_sds__dims_002",
  "ph_p_sds__dims_003",
  "ph_p_sds__dims_004",
  "ph_p_sds__dims_005",
  "ph_p_sds__dims_006",
  "ph_p_sds__dims_007"
)

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorders of initiating and
#' maintaining sleep): Sum \[Validation: No more than 0 missing or declined\]"
#'
#' @description
#' Computes the summary score `ph_p_sds__dims_sum`
#' Sleep Disturbance Scale \[Parent\] (Disorders of initiating and maintaining
#' sleep): Sum \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_ph_p_sds__dims |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 items missing
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_ph_p_sds__dims_sum(data) |>
#'   select(
#'     all_of(c("ph_p_sds__dims_sum", vars_ph_p_sds__dims))
#'   )
#' }
compute_ph_p_sds__dims_sum <- function(
    data,
    name = "ph_p_sds__dims_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      combine = combine,
      name    = name,
      vars    = vars_ph_p_sds__dims,
      max_na  = max_na,
      exclude = exclude
    )
}

#' Compute "Sleep Disturbance Scale \[Parent\] (Disorders of initiating and
#' maintaining sleep) - Number missing"
#'
#' @description
#' Computes the summary score `ph_p_sds__dims_nm`
#' Sleep Disturbance Scale \[Parent\] (Disorders of initiating and maintaining
#' sleep) - Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ph_p_sds__dims |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inheritParams compute_ph_p_sds_sum
#'
#' @seealso [compute_ph_p_sds__dims_sum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ph_p_sds__dims_nm <- function(
    data,
    name = "ph_p_sds__dims_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_ph_p_sds__dims,
      exclude = exclude,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) ph_p_sds                                                          ####

#' Compute all the `ph_p_sds` summary scores
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
#' compute_ph_p_sds_all(data)
#' }
compute_ph_p_sds_all <- function(data) {
  data |>
    compute_ph_p_sds_sum() |>
    compute_ph_p_sds_nm() |>
    compute_ph_p_sds__da_sum() |>
    compute_ph_p_sds__da_nm() |>
    compute_ph_p_sds__does_sum() |>
    compute_ph_p_sds__does_nm() |>
    compute_ph_p_sds__hyphy_sum() |>
    compute_ph_p_sds__hyphy_nm() |>
    compute_ph_p_sds__sbd_sum() |>
    compute_ph_p_sds__sbd_nm() |>
    compute_ph_p_sds__swtd_sum() |>
    compute_ph_p_sds__swtd_nm() |>
    compute_ph_p_sds__dims_sum() |>
    compute_ph_p_sds__dims_nm()
}
