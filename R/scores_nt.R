# fmt: skip file

#   ____________________________________________________________________________
#   nt_p_yst__pmum                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_nt_p_yst__pmum_mean
#' @format vars_nt_p_yst__pmum is a character vector of all column names
#' used to compute summary score of `nt_p_yst__pmum_mean`.
vars_nt_p_yst__pmum <- c(
  "nt_p_yst__pmum_001",
  "nt_p_yst__pmum_002",
  "nt_p_yst__pmum_003",
  "nt_p_yst__pmum_004",
  "nt_p_yst__pmum_005",
  "nt_p_yst__pmum_006",
  "nt_p_yst__pmum_007",
  "nt_p_yst__pmum_008",
  "nt_p_yst__pmum_009"
)


#' Compute "Youth Screen Time \[Parent\] (Problematic Media Use): Mean
#' \[Validation: No more than 1 missing or declined\]"
#'
#' @description
#' Computes the summary score `nt_p_yst__pmum_mean`
#' Youth Screen Time \[Parent\] (Problematic Media Use): Mean \[Validation:
#' No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__pmum |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__pmum_mean <- function(
    data,
    name = "nt_p_yst__pmum_mean",
    max_na = 1,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__pmum)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_nt_p_yst__pmum,
      max_na  = max_na,
      exclude = c("777", "999"),
      combine = combine
    )
}

#' Compute "Youth Screen Time \[Parent\] (Problematic Media Use): Number
#' missing"
#'
#' @description
#' Computes the summary score `nt_p_yst__pmum_nm`
#' Youth Screen Time \[Parent\] (Problematic Media Use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__pmum |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__pmum_nm <- function(
    data,
    name = "nt_p_yst__pmum_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__pmum)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_nt_p_yst__pmum,
      exclude = c("777", "999"),
      combine = combine
    )
}

#   ____________________________________________________________________________
#   nt_p_yst__screen__wkdy                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_nt_p_yst__screen__wkdy_sum
#' @format vars_nt_p_yst__screen__wkdy is a character vector of all column names
#' used to compute summary score of `nt_p_yst__screen__wkdy`.
vars_nt_p_yst__screen__wkdy <- c(
  "nt_p_yst__wkdy__hr_001",
  "nt_p_yst__wkdy__min_001",
  "nt_p_yst__wkdy__min_001__v01"
)

#' Compute "Youth Screen Time \[Parent\] (Weekday): Number missing"
#'
#' @description
#' Computes the summary score `nt_p_yst__screen__wkdy_nm`
#' Youth Screen Time \[Parent\] (Weekday): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__screen__wkdy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__screen__wkdy_nm <- function(
    data,
    name = "nt_p_yst__screen__wkdy_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__screen__wkdy)

  data_ss <- data |>
    ss_nm(
      name = "nm_00_01",
      vars = vars_nt_p_yst__screen__wkdy |>
        stringr::str_subset("__v01", negate = TRUE),
      exclude = c("777", "999"),
      events = c("ses-00A", "ses-01A"),
      combine = TRUE
    ) |>
    ss_nm(
      name = "nm_02_03_04",
      vars = vars_nt_p_yst__screen__wkdy |>
        stringr::str_subset("__v01"),
      exclude = c("777", "999"),
      events = c("ses-02A", "ses-03A", "ses-04A"),
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~ nm_00_01,
      session_id %in% c("ses-02A", "ses-03A", "ses-04A") ~ nm_02_03_04,
      .default = NA
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute "Youth Screen Time \[Parent\] (Weekday): Sum"
#'
#' @description
#' Computes the summary score `nt_p_yst__screen__wkdy_sum`
#' Youth Screen Time \[Parent\] (Weekday): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__screen__wkdy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 item missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'  allowed (Default: 0).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__screen__wkdy_sum <- function(
    data,
    name = "nt_p_yst__screen__wkdy_sum",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__screen__wkdy)

  data_ss <- data |>
    # convertion in hours
    mutate(
      nt_p_yst__wkdy__min_001__v01 = case_when(
        nt_p_yst__wkdy__min_001__v01 %in% c("777", "999") ~
          as.numeric(nt_p_yst__wkdy__min_001__v01),
        .default = as.numeric(nt_p_yst__wkdy__min_001__v01) / 60
      ),
      nt_p_yst__wkdy__min_001 = case_when(
        nt_p_yst__wkdy__min_001 %in% c("777", "999") ~
          as.numeric(nt_p_yst__wkdy__min_001),
        .default = as.numeric(nt_p_yst__wkdy__min_001) / 60
      )
    ) |>
    ss_sum(
      name = "sum_00_01",
      vars = vars_nt_p_yst__screen__wkdy |>
        stringr::str_subset("__v01", negate = TRUE),
      max_na = max_na,
      exclude = c("777", "999"),
      events = c("ses-00A", "ses-01A"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_02_03_04",
      vars = vars_nt_p_yst__screen__wkdy |>
        stringr::str_subset("__v01"),
      max_na = max_na,
      exclude = c("777", "999"),
      events = c("ses-02A", "ses-03A", "ses-04A"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~ sum_00_01,
      session_id %in% c("ses-02A", "ses-03A", "ses-04A") ~ sum_02_03_04,
      .default = NA
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#   ____________________________________________________________________________
#   nt_p_yst__screen__wknd                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_nt_p_yst__screen__wknd_sum
#' @format vars_nt_p_yst__screen__wknd is a character vector of all column names
#' used to compute summary score of `nt_p_yst__screen__wknd`.
vars_nt_p_yst__screen__wknd <- c(
  "nt_p_yst__wknd__hr_001",
  "nt_p_yst__wknd__min_001",
  "nt_p_yst__wknd__min_001__v01"
)

#' Compute "Youth Screen Time \[Parent\] (Weekend): Number missing"
#'
#' @description
#' Computes the summary score `nt_p_yst__screen__wknd_nm`
#' Youth Screen Time \[Parent\] (Weekend): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__screen__wknd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__screen__wknd_nm <- function(
    data,
    name = "nt_p_yst__screen__wknd_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__screen__wknd)

  data_ss <- data |>
    ss_nm(
      name = "nm_00_01",
      vars = vars_nt_p_yst__screen__wknd |>
        stringr::str_subset("__v01", negate = TRUE),
      exclude = c("777", "999"),
      events = c("ses-00A", "ses-01A"),
      combine = TRUE
    ) |>
    ss_nm(
      name = "nm_02_03_04",
      vars = vars_nt_p_yst__screen__wknd |>
        stringr::str_subset("__v01"),
      exclude = c("777", "999"),
      events = c("ses-02A", "ses-03A", "ses-04A"),
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~
        nm_00_01,
      session_id %in% c("ses-02A", "ses-03A", "ses-04A") ~
        nm_02_03_04,
      .default = NA
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute "Youth Screen Time \[Parent\] (Weekend): Sum"
#'
#' @description
#' Computes the summary score `nt_p_yst__screen__wknd_sum`
#' Youth Screen Time \[Parent\] (Weekend): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_p_yst__screen__wknd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 item missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'  allowed (Default: 0).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_p_yst__screen__wknd_sum <- function(
    data,
    name = "nt_p_yst__screen__wknd_sum",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_nt_p_yst__screen__wknd)

  data_ss <- data |>
    # convertion in hours
    mutate(
      nt_p_yst__wknd__min_001__v01 = case_when(
        nt_p_yst__wknd__min_001__v01 %in% c("777", "999") ~
          as.numeric(nt_p_yst__wknd__min_001__v01),
        .default = as.numeric(nt_p_yst__wknd__min_001__v01) / 60
      ),
      nt_p_yst__wknd__min_001 = case_when(
        nt_p_yst__wknd__min_001 %in% c("777", "999") ~
          as.numeric(nt_p_yst__wknd__min_001),
        .default = as.numeric(nt_p_yst__wknd__min_001) / 60
      )
    ) |>
    ss_sum(
      name = "sum_00_01",
      vars = vars_nt_p_yst__screen__wknd |>
        stringr::str_subset("__v01", negate = TRUE),
      max_na = max_na,
      exclude = c("777", "999"),
      events = c("ses-00A", "ses-01A"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_02_03_04",
      vars = vars_nt_p_yst__screen__wknd |>
        stringr::str_subset("__v01"),
      max_na = max_na,
      exclude = c("777", "999"),
      events = c("ses-02A", "ses-03A", "ses-04A"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~ sum_00_01,
      session_id %in% c("ses-02A", "ses-03A", "ses-04A") ~ sum_02_03_04,
      .default = NA
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#   ____________________________________________________________________________
#   nt_p_yst_all                                                            ####

#' Compute all summary scores for nt_p_yst.
#' @description
#' This function computes all summary scores for the nt_p_yst form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_nt_p_yst_all(data)
#' }
compute_nt_p_yst_all <- function(data) {
  data |>
    compute_nt_p_yst__pmum_mean() |>
    compute_nt_p_yst__pmum_nm() |>
    compute_nt_p_yst__screen__wkdy_nm() |>
    compute_nt_p_yst__screen__wkdy_sum() |>
    compute_nt_p_yst__screen__wknd_nm() |>
    compute_nt_p_yst__screen__wknd_sum()
}

#   ____________________________________________________________________________
#   nt_y_stq__screen__wkdy                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_nt_y_stq__screen__wkdy_sum
#' @format vars_nt_y_stq__screen__wkdy is a character vector of all column names
#' used to compute summary score of `nt_y_stq__screen__wkdy`.
vars_nt_y_stq__screen__wkdy <- c(
  "nt_y_stq__screen__wkdy_001",
  "nt_y_stq__screen__wkdy_002",
  "nt_y_stq__screen__wkdy_003",
  "nt_y_stq__screen__wkdy_004",
  "nt_y_stq__screen__wkdy_005",
  "nt_y_stq__screen__wkdy_006",
  "nt_y_stq__screen__wkdy__hr_001",
  "nt_y_stq__screen__wkdy__min_001",
  "nt_y_stq__screen__wkdy__hr_001__v01",
  "nt_y_stq__screen__wkdy__min_001__v01",
  "nt_y_stq__screen__wkdy__hr_002",
  "nt_y_stq__screen__wkdy__min_002",
  "nt_y_stq__screen__wkdy__hr_003",
  "nt_y_stq__screen__wkdy__min_003",
  "nt_y_stq__screen__wkdy__hr_004",
  "nt_y_stq__screen__wkdy__min_004",
  "nt_y_stq__screen__wkdy__hr_005",
  "nt_y_stq__screen__wkdy__min_005",
  "nt_y_stq__screen__wkdy__hr_006",
  "nt_y_stq__screen__wkdy__min_006",
  "nt_y_stq__screen__wkdy__hr_007",
  "nt_y_stq__screen__wkdy__min_007",
  "nt_y_stq__screen__wkdy__hr_008",
  "nt_y_stq__screen__wkdy__min_008",
  "nt_y_stq__screen__wkdy__hr_009",
  "nt_y_stq__screen__wkdy__min_009"
)

#' Compute "Screen Time \[Youth\] (Weekday): Number missing"
#'
#' @description
#' Computes the summary score `nt_y_stq__screen__wkdy_nm`
#' Screen Time \[Youth\] (Weekday): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_y_stq__screen__wkdy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_y_stq__screen__wkdy_nm <- function(
    data,
    name = "nt_y_stq__screen__wkdy_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)


  vars_session <- vars_nt_y_stq__screen__wkdy %>%
    {
      list(
        vars_00_01 = stringr::str_subset(., "_hr|_min", negate = TRUE),
        vars_02 = stringr::str_subset(., "(_hr|_min)(_001$|_002$|_003$|_004$|_005$|_006$|_007$|_008$|_009$)"),
        vars_03 = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$|_009$)"),
        vars_04 = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$)")
      )
    }

  data_ss <- data |>
    ss_nm(
      name    = "nm_00_01",
      vars    = vars_session$vars_00_01,
      exclude = c("777", "999"),
      events  = c("ses-00A", "ses-01A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_02",
      vars    = vars_session$vars_02,
      exclude = c("777", "999"),
      events  = c("ses-02A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_03",
      vars    = vars_session$vars_03,
      exclude = c("777", "999"),
      events  = c("ses-03A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_04",
      vars    = vars_session$vars_04,
      exclude = c("777", "999"),
      combine = TRUE
    ) |>
    transmute(
      "{name}" := case_when(
        session_id %in% c("ses-00A", "ses-01A") ~ nm_00_01,
        session_id %in% c("ses-02A") ~ nm_02,
        session_id %in% c("ses-03A") ~ nm_03,
        session_id %in% c("ses-04A") ~ nm_04,
        .default = NA
      )
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute "Screen Time \[Youth\] (Weekday): Sum"
#'
#' @description
#' Computes the summary score `nt_y_stq__screen__wkdy_sum`
#' Screen Time \[Youth\] (Weekday): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_y_stq__screen__wkdy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* none missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'  allowed (Default: 0).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_y_stq__screen__wkdy_sum <- function(
    data,
    name = "nt_y_stq__screen__wkdy_sum",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  vars_session <- vars_nt_y_stq__screen__wkdy %>%
    {
      list(
        vars_00_01 = stringr::str_subset(., "_hr|_min", negate = TRUE),
        vars_02    = stringr::str_subset(., "(_hr|_min)(_001$|_002$|_003$|_004$|_005$|_006$|_007$|_008$|_009$)"),
        vars_03    = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$|_009$)"),
        vars_other = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$)")
      )
    }

  data_ss <- data |>
    # convertion in hours
    mutate(
      across(
        stringr::str_subset(vars_nt_y_stq__screen__wkdy, "nt_y_stq__screen__wkdy__min"),
        ~ case_when(
          .x %in% c("777", "999") ~ as.numeric(.x),
          .default = as.numeric(.x) / 60
        )
      )
    ) |>
    ss_sum(
      name = "sum_00_01",
      vars = vars_session$vars_00_01,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_02",
      vars = vars_session$vars_02,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_03",
      vars = vars_session$vars_03,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_other",
      vars = vars_session$vars_other,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    transmute(
      "{name}" := case_when(
        session_id %in% c("ses-00A", "ses-01A") ~ sum_00_01,
        session_id %in% c("ses-02A") ~ sum_02,
        session_id %in% c("ses-03A") ~ sum_03,
        .default = sum_other
      )
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#   ____________________________________________________________________________
#   nt_y_stq__screen__wknd                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_nt_y_stq__screen__wknd_sum
#' @format vars_nt_y_stq__screen__wknd is a character vector of all column names
#' used to compute summary score of `nt_y_stq__screen__wknd`.
vars_nt_y_stq__screen__wknd <- c(
  "nt_y_stq__screen__wknd_001",
  "nt_y_stq__screen__wknd_002",
  "nt_y_stq__screen__wknd_003",
  "nt_y_stq__screen__wknd_004",
  "nt_y_stq__screen__wknd_005",
  "nt_y_stq__screen__wknd_006",
  "nt_y_stq__screen__wknd__hr_001",
  "nt_y_stq__screen__wknd__min_001",
  "nt_y_stq__screen__wknd__hr_001__v01",
  "nt_y_stq__screen__wknd__min_001__v01",
  "nt_y_stq__screen__wknd__hr_002",
  "nt_y_stq__screen__wknd__min_002",
  "nt_y_stq__screen__wknd__hr_003",
  "nt_y_stq__screen__wknd__min_003",
  "nt_y_stq__screen__wknd__hr_004",
  "nt_y_stq__screen__wknd__min_004",
  "nt_y_stq__screen__wknd__hr_005",
  "nt_y_stq__screen__wknd__min_005",
  "nt_y_stq__screen__wknd__hr_006",
  "nt_y_stq__screen__wknd__min_006",
  "nt_y_stq__screen__wknd__hr_007",
  "nt_y_stq__screen__wknd__min_007",
  "nt_y_stq__screen__wknd__hr_008",
  "nt_y_stq__screen__wknd__min_008",
  "nt_y_stq__screen__wknd__hr_009",
  "nt_y_stq__screen__wknd__min_009"
)

#' Compute "Screen Time \[Youth\] (Weekend): Number missing"
#'
#' @description
#' Computes the summary score `nt_y_stq__screen__wknd_nm`
#' Screen Time \[Youth\] (Weekend): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_y_stq__screen__wknd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_y_stq__screen__wknd_nm <- function(
    data,
    name = "nt_y_stq__screen__wknd_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)


  vars_session <- vars_nt_y_stq__screen__wknd %>%
    {
      list(
        vars_00_01 = stringr::str_subset(., "_hr|_min", negate = TRUE),
        vars_02    = stringr::str_subset(., "(_hr|_min)(_001$|_002$|_003$|_004$|_005$|_006$|_007$|_008$|_009$)"),
        vars_03    = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$|_009$)"),
        vars_other = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$)")
      )
    }

  data_ss <- data |>
    ss_nm(
      name    = "nm_00_01",
      vars    = vars_session$vars_00_01,
      exclude = c("777", "999"),
      events  = c("ses-00A", "ses-01A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_02",
      vars    = vars_session$vars_02,
      exclude = c("777", "999"),
      events  = c("ses-02A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_03",
      vars    = vars_session$vars_03,
      exclude = c("777", "999"),
      events  = c("ses-03A"),
      combine = TRUE
    ) |>
    ss_nm(
      name    = "nm_other",
      vars    = vars_session$vars_other,
      exclude = c("777", "999"),
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~ nm_00_01,
      session_id %in% c("ses-02A") ~ nm_02,
      session_id %in% c("ses-03A") ~ nm_03,
      .default = nm_other
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute "Screen Time \[Youth\] (Weekend): Sum"
#'
#' @description
#' Computes the summary score `nt_y_stq__screen__wknd_sum`
#' Screen Time \[Youth\] (Weekend): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nt_y_stq__screen__wknd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* none missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'  allowed (Default: 0).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_nt_y_stq__screen__wknd_sum <- function(
    data,
    name = "nt_y_stq__screen__wknd_sum",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  vars_session <- vars_nt_y_stq__screen__wknd %>%
    {
      list(
        vars_00_01 = stringr::str_subset(., "_hr|_min", negate = TRUE),
        vars_02    = stringr::str_subset(., "(_hr|_min)(_001$|_002$|_003$|_004$|_005$|_006$|_007$|_008$|_009$)"),
        vars_03    = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$|_009$)"),
        vars_other = stringr::str_subset(., "(_hr|_min)(.+_v01$|_003$|_004$|_005$|_006$|_008$)")
      )
    }

  data_ss <- data |>
    # convertion in hours
    mutate(
      across(
        stringr::str_subset(vars_nt_y_stq__screen__wknd, "nt_y_stq__screen__wknd__min"),
        ~ case_when(
          .x %in% c("777", "999") ~ as.numeric(.x),
          .default = as.numeric(.x) / 60
        )
      )
    ) |>
    ss_sum(
      name = "sum_00_01",
      vars = vars_session$vars_00_01,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_02",
      vars = vars_session$vars_02,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_03",
      vars = vars_session$vars_03,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    ss_sum(
      name = "sum_other",
      vars = vars_session$vars_other,
      max_na = max_na,
      exclude = c("777", "999"),
      as_integer = FALSE,
      combine = TRUE
    ) |>
    transmute("{name}" := case_when(
      session_id %in% c("ses-00A", "ses-01A") ~ sum_00_01,
      session_id %in% c("ses-02A") ~ sum_02,
      session_id %in% c("ses-03A") ~ sum_03,
      .default = sum_other
    ))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#   ____________________________________________________________________________
#   compute_nt_y_stq_all                                                    ####

#' Compute all summary scores for nt_y_stq
#' @description
#' This function computes all summary scores for the nt_y_stq form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_nt_y_stq_all(data)
#' }
compute_nt_y_stq_all <- function(data) {
  data |>
    compute_nt_y_stq__screen__wkdy_nm() |>
    compute_nt_y_stq__screen__wkdy_sum() |>
    compute_nt_y_stq__screen__wknd_nm() |>
    compute_nt_y_stq__screen__wknd_sum()
}
