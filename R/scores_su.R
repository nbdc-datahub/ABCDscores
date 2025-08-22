# fmt: skip file

#' @export
#' @autoglobal
#' @rdname compute_su_y_alchss_sum
#' @format vars_su_y_alchss is a table of all column names
#' used to compute summary score of `su_y_alchss`.
vars_su_y_alchss <- tibble(
  baseline = c(
    "su_y_alchss_001",
    "su_y_alchss_002",
    "su_y_alchss_003",
    "su_y_alchss_004",
    "su_y_alchss_005",
    "su_y_alchss_006",
    "su_y_alchss_007",
    "su_y_alchss_008",
    "su_y_alchss_009",
    "su_y_alchss_010",
    "su_y_alchss_011",
    "su_y_alchss_012",
    "su_y_alchss_013",
    "su_y_alchss_014"
  ),
  longitudinal = c(
    "su_y_alchss_001__l",
    "su_y_alchss_002__l",
    "su_y_alchss_003__l",
    "su_y_alchss_004__l",
    "su_y_alchss_005__l",
    "su_y_alchss_006__l",
    "su_y_alchss_007__l",
    "su_y_alchss_008__l",
    "su_y_alchss_009__l",
    "su_y_alchss_010__l",
    "su_y_alchss_011__l",
    "su_y_alchss_012__l",
    "su_y_alchss_013__l",
    "su_y_alchss_014__l"
  )
)

#' @noRd
combine_cols_alchss <- function(data, vars) {
  purrr::map2_dfc(
    vars$baseline,
    vars$longitudinal,
    ~ combine_cols(data, col_1 = .x, col_2 = .y, keep_other = FALSE)
  )
}

#' Compute "Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Sum"
#' @description
#' Computes the summary score `su_y_alchss_sum`
#' Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Sum
#'
#' - *Summarized variables:*
#'     ```{r, echo=FALSE, results='asis'}
#'     vars_su_y_alchss |> unlist() |> md_bullet(2, TRUE)
#'     ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param max_na integer, Maximum number of missing values allowed in the
#' summary score.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#' the input data frame. If `FALSE`, the summary score will be returned as a
#' separate data frame.
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_su_y_alchss_sum(data)
#' }
compute_su_y_alchss_sum <- function(data,
                                    name = "su_y_alchss_sum",
                                    max_na = 0,
                                    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    combine_cols_alchss(vars_su_y_alchss) |>
    ss_sum(
      name    = name,
      vars    = vars_su_y_alchss$baseline,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Count"
#' @description
#' Computes the summary score `su_y_alchss_count`
#' Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Count
#'
#' - *Summarized variables:*
#'     ```{r, echo=FALSE, results='asis'}
#'     vars_su_y_alchss |> unlist() |> md_bullet(2, TRUE)
#'     ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit compute_su_y_alchss_sum references params return
#' @export
#' @autoglobal
#' @seealso [compute_su_y_alchss_sum()]
#' @examples
#' \dontrun{
#' compute_su_y_alchss_count(data) |> View()
#' }
compute_su_y_alchss_count <- function(data,
                                      name = "su_y_alchss_count",
                                      max_na = 0,
                                      combine = TRUE) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    combine_cols_alchss(vars_su_y_alchss) |>
    recode_levels(
      vars = vars_su_y_alchss$baseline,
      recode = c(
        "1" = "1",
        "2" = "1",
        "3" = "1",
        "4" = "1"
      )
    ) |>
    mutate(
      "{name}" := if_else(
        rowSums(across(everything(), is.na)) > max_na,
        NA_real_,
        rowSums(
          across(everything(), ~ as.numeric(.x)),
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

#' Compute "Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Number missing"
#' @description
#' Computes the summary score `su_y_alchss_nm`
#' Alcohol Hangover Symptoms Scale (HSS) \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alchss |> unlist() |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit compute_su_y_alchss_sum references params return
#' @export
#' @autoglobal
#' @seealso [compute_su_y_alchss_sum()]
#' @examples
#' \dontrun{
#' compute_su_y_alchss_nm(data)
#' }
compute_su_y_alchss_nm <- function(data,
                                   name = "su_y_alchss_nm",
                                   combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    combine_cols_alchss(vars_su_y_alchss) |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alchss$baseline,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

# all
#' Compute all Alcohol Hangover Symptoms Scale (HSS) Youth summary scores
#' @description
#' compute all summary scores of Alcohol Hangover Symptoms Scale (HSS) Youth
#' @inherit compute_su_y_alchss_sum references params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_su_y_alchss_all(data)
#' }
compute_su_y_alchss_all <- function(data) {
  data |>
    compute_su_y_alchss_sum() |>
    compute_su_y_alchss_count() |>
    compute_su_y_alchss_nm()
}

#   ____________________________________________________________________________
#   su_y_alcsre__6mo                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcsre__6mo_mean
#' @format vars_su_y_alcsre__6mo is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_alcsre__6mo` (`_mean`, `_count`, `_nm`).
vars_su_y_alcsre__6mo <- c(
  "su_y_alcsre__6mo_001",
  "su_y_alcsre__6mo_002",
  "su_y_alcsre__6mo_003",
  "su_y_alcsre__6mo_004"
)

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Last 6 months): Mean
#' \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__6mo_mean`
#' Alcohol Subject Response and Effects \[Youth\] (Last 6 months): Mean
#' \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__6mo |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__6mo_mean <- function(
    data,
    name = "su_y_alcsre__6mo_mean",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__6mo)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data |>
    ss_mean_pos(
      name    = name,
      vars    = vars_su_y_alcsre__6mo,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Last 6 months):
#' Count \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__6mo_count`
#' Alcohol Subject Response and Effects \[Youth\] (Last 6 months): Count
#' \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__6mo |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__6mo_count <- function(
    data,
    name = "su_y_alcsre__6mo_count",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__6mo)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_count_cond(
      name = name,
      vars = vars_su_y_alcsre__6mo,
      cond = paste0(vars_su_y_alcsre__6mo, " > 0"),
      combine = combine,
      max_na = max_na
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Last 6 months):
#' Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcsre__6mo_nm`
#' Alcohol Subject Response and Effects \[Youth\] (Last 6 months): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__6mo |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_alcsre__6mo_nm <- function(
    data,
    name = "su_y_alcsre__6mo_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__6mo)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcsre__6mo,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_alcsre__first5                                                     ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcsre__first5_mean
#' @format vars_su_y_alcsre__first5 is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_alcsre__first5` (`_mean`, `_count`, `_nm`).
vars_su_y_alcsre__first5 <- c(
  "su_y_alcsre__first5_001",
  "su_y_alcsre__first5_002",
  "su_y_alcsre__first5_003",
  "su_y_alcsre__first5_004"
)

#' Compute "Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Mean \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__first5_mean`
#' Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Mean \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__first5 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__first5_mean <- function(
    data,
    name = "su_y_alcsre__first5_mean",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__first5)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data |>
    ss_mean_pos(
      name    = name,
      vars    = vars_su_y_alcsre__first5,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Count \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__first5_count`
#' Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Count \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__first5 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__first5_count <- function(
    data,
    name = "su_y_alcsre__first5_count",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__first5)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_count_cond(
      name = name,
      vars = vars_su_y_alcsre__first5,
      cond = paste0(vars_su_y_alcsre__first5, " > 0"),
      max_na = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcsre__first5_nm`
#' Alcohol Subject Response and Effects \[Youth\] (First 5 times ever
#' drank): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__first5 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_alcsre__first5_nm <- function(
    data,
    name = "su_y_alcsre__first5_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__first5)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcsre__first5,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_alcsre__hvy                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcsre__hvy_mean
#' @format vars_su_y_alcsre__hvy is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_alcsre__hvy` (`_mean`, `_count`, `_nm`).
vars_su_y_alcsre__hvy <- c(
  "su_y_alcsre__hvy_001",
  "su_y_alcsre__hvy_002",
  "su_y_alcsre__hvy_003",
  "su_y_alcsre__hvy_004"
)

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Mean \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__hvy_mean`
#' Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Mean \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__hvy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__hvy_mean <- function(
    data,
    name = "su_y_alcsre__hvy_mean",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__hvy)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean_pos(
      name    = name,
      vars    = vars_su_y_alcsre__hvy,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Count \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_alcsre__hvy_count`
#' Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Count \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__hvy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcsre__hvy_count <- function(
    data,
    name = "su_y_alcsre__hvy_count",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__hvy)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_count_cond(
      name = name,
      vars = vars_su_y_alcsre__hvy,
      cond = paste0(vars_su_y_alcsre__hvy, " > 0"),
      max_na = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcsre__hvy_nm`
#' Alcohol Subject Response and Effects \[Youth\] (Heaviest drinking
#' period): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcsre__hvy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_alcsre__hvy_nm <- function(
    data,
    name = "su_y_alcsre__hvy_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_alcsre__hvy)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcsre__hvy,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   compute_su_y_alcsre_all                                                 ####

#' Compute all summary scores for su_y_alcsre.
#' @description
#' This function computes all summary scores for the su_y_alcsre form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_su_y_alcsre_all(data)
#' }
compute_su_y_alcsre_all <- function(data) {
  data |>
    compute_su_y_alcsre__6mo_mean() |>
    compute_su_y_alcsre__6mo_count() |>
    compute_su_y_alcsre__6mo_nm() |>
    compute_su_y_alcsre__first5_mean() |>
    compute_su_y_alcsre__first5_count() |>
    compute_su_y_alcsre__first5_nm() |>
    compute_su_y_alcsre__hvy_mean() |>
    compute_su_y_alcsre__hvy_count() |>
    compute_su_y_alcsre__hvy_nm()
}

#   ____________________________________________________________________________
#   su_y_alcexp__neg                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcexp__neg_prsum
#' @format vars_su_y_alcexp__neg is a character vector of all column names
#' used to compute summary score of `su_y_alcexp__neg_prsum` and
#' `su_y_alcexp__neg_nm`
vars_su_y_alcexp__neg <- c(
  "su_y_alcexp__neg_001",
  "su_y_alcexp__neg_002",
  "su_y_alcexp__neg_003"
)

#' Compute "Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of negative
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_alcexp__neg_prsum`
#' Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of negative
#' expectancies): Prorated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#'    the name in description, but users can change it.
#' @param combine logical, If `TRUE` (default), the summary score will be appended to
#'    the input data frame. If `FALSE`, the summary score for each participant
#'    will be returned as a separate data frame. (Default: TRUE)
#' @param max_na numeric, positive whole number. Number of missing items
#'    allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcexp__neg_prsum <- function(
    data,
    name = "su_y_alcexp__neg_prsum",
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_alcexp__neg,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of negative
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcexp__neg_nm`
#' Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of negative
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_alcexp__neg_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcexp__neg_nm <- function(
    data,
    name = "su_y_alcexp__neg_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcexp__neg,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_alcexp__pos                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcexp__pos_prsum
#' @format vars_su_y_alcexp__pos is a character vector of all column names
#' used to compute summary score of `su_y_alcexp__pos_prsum` and
#' `su_y_alcexp__pos_nm`.
vars_su_y_alcexp__pos <- c(
  "su_y_alcexp__pos_001",
  "su_y_alcexp__pos_002",
  "su_y_alcexp__pos_003"
)

#' Compute "Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of positive
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_alcexp__pos_prsum`
#' Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of positive
#' expectancies): Prorated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 3 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcexp__pos_prsum <- function(
    data,
    name = "su_y_alcexp__pos_prsum",
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_alcexp__pos,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of positive
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcexp__pos_nm`
#' Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of positive
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_alcexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_nm
#'
#' @seealso [compute_su_y_alcexp__pos_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcexp__pos_nm <- function(
    data,
    name = "su_y_alcexp__pos_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcexp__pos,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_alcexp                                                       ####

#' Compute all the su_y_alcexp scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_alcexp_all(data)
#' }
compute_su_y_alcexp_all <- function(data) {
  data |>
    compute_su_y_alcexp__neg_prsum() |>
    compute_su_y_alcexp__neg_nm() |>
    compute_su_y_alcexp__pos_prsum() |>
    compute_su_y_alcexp__pos_nm()
}

#   ____________________________________________________________________________
#   su_y_cigexp__pos                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_cigexp__pos_prsum
#' @format vars_su_y_cigexp__pos is a character vector of all column names
#' used to compute summary score of `su_y_cigexp__pos_prsum` and
#' `su_y_cigexp__pos_nm`.
vars_su_y_cigexp__pos <- c(
  "su_y_cigexp__pos_001",
  "su_y_cigexp__pos_002",
  "su_y_cigexp__pos_003",
  "su_y_cigexp__pos_004"
)

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_cigexp__pos_prsum`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Prorated sum
#'
#' Note: all 0s are changed to NAs prior to calculating pro-rated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 0
#'
#' - *Validation criterion:* maximally 2 of 4 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__pos_prsum <- function(
    data,
    name = "su_y_cigexp__pos_prsum",
    combine = TRUE,
    exclude = c("0"),
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_cigexp__pos,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Prorated sum (v01)"
#'
#' @description
#' Computes the summary score `su_y_cigexp__pos_prsum__v01`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Prorated sum (v01) \[Validation: No more than 2
#' missing or declined\]
#'
#' Note: all 0s are changed to 1s prior to calculating pro-rated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 2 of 4 items missing
#'
#' - *Notes:*
#'   - Values in all input variables were recoded:
#'      - "0" --> "1"
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_cigexp__pos_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__pos_prsum__v01 <- function(
    data,
    name = "su_y_cigexp__pos_prsum__v01",
    combine = TRUE,
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_su_y_cigexp__pos),
        ~ as.character(.x)
      )
    ) |>
    recode_levels(
      vars = vars_su_y_cigexp__pos,
      recode = c(
        "0" = "1"
      )
    ) |>
    mutate(
      across(
        all_of(vars_su_y_cigexp__pos),
        ~ as.integer(.x)
      )
    ) |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_cigexp__pos,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_cigexp__pos_nm`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_cigexp__pos_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__pos_nm <- function(
    data,
    name = "su_y_cigexp__pos_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_cigexp__pos,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_cigexp__neg                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_cigexp__neg_prsum
#' @format vars_su_y_cigexp__neg is a character vector of all column names
#' used to compute summary score of `su_y_cigexp__neg_prsum` and
#' `su_y_cigexp__neg_nm`.
vars_su_y_cigexp__neg <- c(
  "su_y_cigexp__neg_001",
  "su_y_cigexp__neg_002"
)

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_cigexp__neg_prsum`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Prorated sum \[Validation: No more than 0
#' missing or declined\]
#'
#' Note: all 0s are changed to NAs prior to calculating pro-rated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 0
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__neg_prsum <- function(
    data,
    name = "su_y_cigexp__neg_prsum",
    combine = TRUE,
    exclude = c("0"),
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_cigexp__neg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Prorated sum (v01)"
#'
#' @description
#' Computes the summary score `su_y_cigexp__neg_prsum__v01`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Prorated sum (v01)
#'
#' Note: all 0s are changed to 1s prior to calculating pro-rated sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_cigexp__neg_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__neg_prsum__v01 <- function(
    data,
    name = "su_y_cigexp__neg_prsum__v01",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_su_y_cigexp__neg),
        ~ as.character(.x)
      )
    ) |>
    recode_levels(
      vars = vars_su_y_cigexp__neg,
      recode = c(
        "0" = "1"
      )
    ) |>
    mutate(
      across(
        all_of(vars_su_y_cigexp__neg),
        ~ as.integer(.x)
      )
    ) |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_cigexp__neg,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_cigexp__neg_nm`
#' Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_cigexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_nm
#'
#' @seealso [compute_su_y_cigexp__neg_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_cigexp__neg_nm <- function(
    data,
    name = "su_y_cigexp__neg_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_cigexp__neg,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_cigexp                                                       ####

#' Compute all the su_y_cigexp scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_cigexp_all(data)
#' }
compute_su_y_cigexp_all <- function(data) {
  data |>
    compute_su_y_cigexp__pos_prsum() |>
    compute_su_y_cigexp__pos_prsum__v01() |>
    compute_su_y_cigexp__pos_nm() |>
    compute_su_y_cigexp__neg_prsum() |>
    compute_su_y_cigexp__neg_prsum__v01() |>
    compute_su_y_cigexp__neg_nm()
}

#   ____________________________________________________________________________
#   su_y_nicvapeexp__pos                                                    ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_nicvapeexp__pos_prsum
#' @format vars_su_y_nicvapeexp__pos is a character vector of all column names
#' used to compute summary score of `su_y_nicvapeexp__pos_prsum` and
#' `su_y_nicvapeexp__pos_nm`.
vars_su_y_nicvapeexp__pos <- c(
  "su_y_nicvapeexp__pos_001",
  "su_y_nicvapeexp__pos_002",
  "su_y_nicvapeexp__pos_003",
  "su_y_nicvapeexp__pos_004"
)

#' Compute "ENDS Expectancies \[Youth\] (Strength of positive expectancies):
#' Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_nicvapeexp__pos_prsum`
#' ENDS Expectancies \[Youth\] (Strength of positive expectancies):
#' Prorated sum \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicvapeexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 2 of 4 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicvapeexp__pos_prsum <- function(
    data,
    name = "su_y_nicvapeexp__pos_prsum",
    combine = TRUE,
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_nicvapeexp__pos,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "ENDS Expectancies \[Youth\] (Strength of positive expectancies):
#' Number missing"
#'
#' @description
#' Computes the summary score `su_y_nicvapeexp__pos_nm`
#' ENDS Expectancies \[Youth\] (Strength of positive expectancies): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicvapeexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_nm
#'
#' @seealso [compute_su_y_nicvapeexp__pos_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicvapeexp__pos_nm <- function(
    data,
    name = "su_y_nicvapeexp__pos_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_nicvapeexp__pos,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_nicvapeexp__neg                                                    ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_nicvapeexp__neg_prsum
#' @format vars_su_y_nicvapeexp__neg is a character vector of all column names
#' used to compute summary score of `su_y_nicvapeexp__neg_prsum` and
#' `su_y_nicvapeexp__neg_nm`
vars_su_y_nicvapeexp__neg <- c(
  "su_y_nicvapeexp__neg_001",
  "su_y_nicvapeexp__neg_002",
  "su_y_nicvapeexp__neg_003",
  "su_y_nicvapeexp__neg_004"
)

#' Compute "ENDS Expectancies \[Youth\] (Strength of negative expectancies):
#' Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_nicvapeexp__neg_prsum`
#' ENDS Expectancies \[Youth\] (Strength of negative expectancies):
#' Prorated sum \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicvapeexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 2 of 4 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicvapeexp__neg_prsum <- function(
    data,
    name = "su_y_nicvapeexp__neg_prsum",
    combine = TRUE,
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_nicvapeexp__neg,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "ENDS Expectancies \[Youth\] (Strength of negative expectancies):
#' Number missing"
#'
#' @description
#' Computes the summary score `su_y_nicvapeexp__neg_nm`
#' ENDS Expectancies \[Youth\] (Strength of negative expectancies): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicvapeexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_nm
#'
#' @seealso [compute_su_y_nicvapeexp__neg_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicvapeexp__neg_nm <- function(
    data,
    name = "su_y_nicvapeexp__neg_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_nicvapeexp__neg,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_nicvapeexp                                                   ####

#' Compute all the su_y_nicvapeexp scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_nicvapeexp_all(data)
#' }
compute_su_y_nicvapeexp_all <- function(data) {
  data |>
    compute_su_y_nicvapeexp__pos_prsum() |>
    compute_su_y_nicvapeexp__pos_nm() |>
    compute_su_y_nicvapeexp__neg_prsum() |>
    compute_su_y_nicvapeexp__neg_nm()
}

#   ____________________________________________________________________________
#   su_y_mjexp__pos                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjexp__pos_prsum
#' @format vars_su_y_mjexp__pos is a character vector of all column names
#' used to compute summary score of `su_y_mjexp__pos_prsum`
#' and `su_y_mjexp__pos_nm`
vars_su_y_mjexp__pos <- c(
  "su_y_mjexp__pos_001",
  "su_y_mjexp__pos_002",
  "su_y_mjexp__pos_003"
)

#' Compute "Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of positive
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_mjexp__pos_prsum`
#' Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of positive
#' expectancies): Prorated sum \[Validation: No more than 1
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 3 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjexp__pos_prsum <- function(
    data,
    name = "su_y_mjexp__pos_prsum",
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_mjexp__pos,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of positive
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_mjexp__pos_nm`
#' Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of positive
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjexp__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_nm
#'
#' @seealso [compute_su_y_mjexp__pos_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjexp__pos_nm <- function(
    data,
    name = "su_y_mjexp__pos_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjexp__pos,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_mjexp__neg                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjexp__neg_prsum
#' @format vars_su_y_mjexp__neg is a character vector of all column names
#' used to compute summary score of `su_y_mjexp__neg_prsum` and
#' `su_y_mjexp__neg_nm`.
vars_su_y_mjexp__neg <- c(
  "su_y_mjexp__neg_001",
  "su_y_mjexp__neg_002",
  "su_y_mjexp__neg_003"
)

#' Compute "Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of negative
#' expectancies): Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_mjexp__neg_prsum`
#' Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of negative
#' expectancies): Prorated sum \[Validation: No more than 1
#' missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 3 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjexp__neg_prsum <- function(
    data,
    name = "su_y_mjexp__neg_prsum",
    combine = TRUE,
    max_na = 1) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_mjexp__neg,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of negative
#' expectancies): Number missing"
#'
#' @description
#' Computes the summary score `su_y_mjexp__neg_nm`
#' Marijuana Expectancies (MEEQ-B) \[Youth\] (Strength of negative
#' expectancies): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjexp__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_mjexp__neg_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjexp__neg_nm <- function(
    data,
    name = "su_y_mjexp__neg_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjexp__neg,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_mjexp                                                        ####

#' Compute all the su_y_mjexp scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_mjexp_all(data)
#' }
compute_su_y_mjexp_all <- function(data) {
  data |>
    compute_su_y_mjexp__pos_prsum() |>
    compute_su_y_mjexp__pos_nm() |>
    compute_su_y_mjexp__neg_prsum() |>
    compute_su_y_mjexp__neg_nm()
}

#   ____________________________________________________________________________
#   (ALL) EXP SCORES                                                        ####

#' Compute all the SU youth exp scores
#'
#' @description
#' A single function to compute all EXP scores in SU domain.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @keywords internal
compute_su_y_exp_all <- function(data) {
  data |>
    compute_su_y_alcexp_all() |>
    compute_su_y_cigexp_all() |>
    compute_su_y_nicvapeexp_all() |>
    compute_su_y_mjexp_all()
}

#   ____________________________________________________________________________
#   su_y_mjsre                                                              ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjsre_sum
#' @format vars_su_y_mjsre is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_mjsre` (`_sum`, `_nm`).
vars_su_y_mjsre <- c(
  "su_y_mjsre__pos_001",
  "su_y_mjsre__pos_002",
  "su_y_mjsre__pos_003",
  "su_y_mjsre__neg_001",
  "su_y_mjsre__neg_002",
  "su_y_mjsre__neg_003",
  "su_y_mjsre__neg_004",
  "su_y_mjsre__neg_005",
  "su_y_mjsre__neg_006",
  "su_y_mjsre__neg_007",
  "su_y_mjsre__neg_008"
)

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (Total): Sum -
#' Positive score inverted \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_mjsre_sum`
#' Marijuana Subjective Response and Effects \[Youth\] (Total): Sum -
#' Positive score inverted \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjsre_sum <- function(
    data,
    name = "su_y_mjsre_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_recoded <- data |>
    recode_levels(
      vars_su_y_mjsre[stringr::str_detect(vars_su_y_mjsre, "__neg")],
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    )

  data_ss <- data_recoded |>
    ss_sum(
      name    = "su_y_mjsre__pos_sum",
      vars    = vars_su_y_mjsre[stringr::str_detect(vars_su_y_mjsre, "__pos")],
      max_na  = max_na,
      exclude = NULL
    ) |>
    ss_sum(
      name    = "su_y_mjsre__neg_sum",
      vars    = vars_su_y_mjsre[stringr::str_detect(vars_su_y_mjsre, "__neg")],
      max_na  = max_na,
      exclude = NULL
    ) |>
    mutate("{name}" := su_y_mjsre__pos_sum + su_y_mjsre__neg_sum) |>
    select(all_of(name))

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (NA): Number
#' missing"
#'
#' @description
#' Computes the summary score `su_y_mjsre_nm`
#' Marijuana Subjective Response and Effects \[Youth\] (NA): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_mjsre_nm <- function(
    data,
    name = "su_y_mjsre_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjsre,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_mjsre__pos                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjsre__pos_sum
#' @format vars_su_y_mjsre__pos is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_mjsre__pos` (`_sum`, `_nm`).
vars_su_y_mjsre__pos <- c(
  "su_y_mjsre__pos_001",
  "su_y_mjsre__pos_002",
  "su_y_mjsre__pos_003"
)

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (Positive): Sum
#' \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_mjsre__pos_sum`
#' Marijuana Subjective Response and Effects \[Youth\] (Positive): Sum
#' \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjsre__pos_sum <- function(
    data,
    name = "su_y_mjsre__pos_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_su_y_mjsre__pos,
      max_na  = max_na,
      exclude = NULL,
      combine = combine
    )
}

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (Positive):
#' Number missing"
#'
#' @description
#' Computes the summary score `su_y_mjsre__pos_nm`
#' Marijuana Subjective Response and Effects \[Youth\] (Positive): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_mjsre__pos_nm <- function(
    data,
    name = "su_y_mjsre__pos_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjsre__pos,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_mjsre__neg                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjsre__neg_sum
#' @format vars_su_y_mjsre__neg is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_mjsre__neg` (`_sum`, `_nm`).
vars_su_y_mjsre__neg <- c(
  "su_y_mjsre__neg_001",
  "su_y_mjsre__neg_002",
  "su_y_mjsre__neg_003",
  "su_y_mjsre__neg_004",
  "su_y_mjsre__neg_005",
  "su_y_mjsre__neg_006",
  "su_y_mjsre__neg_007",
  "su_y_mjsre__neg_008"
)

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (Negative): Sum
#' \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_mjsre__neg_sum`
#' Marijuana Subjective Response and Effects \[Youth\] (Negative): Sum
#' \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjsre__neg_sum <- function(
    data,
    name = "su_y_mjsre__neg_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_su_y_mjsre__neg,
      max_na  = max_na,
      exclude = NULL,
      combine = combine
    )
}

#' Compute "Marijuana Subjective Response and Effects \[Youth\] (Negative):
#' Number missing"
#'
#' @description
#' Computes the summary score `su_y_mjsre__neg_nm`
#' Marijuana Subjective Response and Effects \[Youth\] (Negative): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjsre__neg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_mjsre__neg_nm <- function(
    data,
    name = "su_y_mjsre__neg_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjsre__neg,
      exclude = NULL,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   compute_su_y_mjsre_all                                                  ####


#' Compute all summary scores for su_y_mjsre.
#' @description
#' This function computes all summary scores for the su_y_mjsre form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_su_y_mjsre_all(data)
#' }
compute_su_y_mjsre_all <- function(data) {
  data |>
    compute_su_y_mjsre_sum() |>
    compute_su_y_mjsre_nm() |>
    compute_su_y_mjsre__pos_sum() |>
    compute_su_y_mjsre__pos_nm() |>
    compute_su_y_mjsre__neg_sum() |>
    compute_su_y_mjsre__neg_nm()
}

#   ____________________________________________________________________________
#   su_y_nicsre__chew                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_nicsre__chew_sum
#' @format vars_su_y_nicsre__chew is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_nicsre__chew` (`_sum`, `_nm`).
vars_su_y_nicsre__chew <- c(
  "su_y_nicsre__chew__pos_001",
  "su_y_nicsre__chew__neg_001"
)

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first smokeless tobacco or chew use): Sum -
#' Negative score inverted \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_nicsre__chew_sum`
#' Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first smokeless tobacco or chew use): Sum -
#' Negative score inverted \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__chew |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicsre__chew_sum <- function(
    data,
    name = "su_y_nicsre__chew_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__chew)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_recoded <- data |>
    recode_levels(
      vars = "su_y_nicsre__chew__neg_001",
      recode = c(
        "1" = "4",
        "2" = "3",
        "3" = "2",
        "1" = "4"
      )
    )

  data_ss <- data_recoded |>
    ss_sum(
      name    = name,
      vars    = vars_su_y_nicsre__chew,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first smokeless tobacco or chew use): Number missing"
#'
#' @description
#' Computes the summary score `su_y_nicsre__chew_nm`
#' Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first smokeless tobacco or chew use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__chew |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_nicsre__chew_nm <- function(
    data,
    name = "su_y_nicsre__chew_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__chew)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_nicsre__chew,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_nicsre__cig                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_nicsre__cig_sum
#' @format vars_su_y_nicsre__cig is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_nicsre__cig` (`_sum`, `_nm`).
vars_su_y_nicsre__cig <- c(
  "su_y_nicsre__cig__pos_001",
  "su_y_nicsre__cig__neg_001"
)

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first cigarette use): Sum - Negative score
#' inverted \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_nicsre__cig_sum`
#' Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first cigarette use): Sum - Negative score
#' inverted \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__cig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicsre__cig_sum <- function(
    data,
    name = "su_y_nicsre__cig_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__cig)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_recoded <- data |>
    recode_levels(
      vars = "su_y_nicsre__cig__neg_001",
      recode = c(
        "1" = "4",
        "2" = "3",
        "3" = "2",
        "1" = "4"
      )
    )

  data_ss <- data_recoded |>
    ss_sum(
      name    = name,
      vars    = vars_su_y_nicsre__cig,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first cigarette use): Number missing"
#'
#' @description
#' Computes the summary score `su_y_nicsre__cig_nm`
#' Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first cigarette use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__cig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_nicsre__cig_nm <- function(
    data,
    name = "su_y_nicsre__cig_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__cig)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_nicsre__cig,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   su_y_nicsre__vape                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_nicsre__vape_sum
#' @format vars_su_y_nicsre__vape is a character vector of
#'    all column names used to compute summary scores of
#'    `compute_su_y_nicsre__vape` (`_sum`, `_nm`).
vars_su_y_nicsre__vape <- c(
  "su_y_nicsre__vape__pos_001",
  "su_y_nicsre__vape__pos_001__v01",
  "su_y_nicsre__vape__neg_001",
  "su_y_nicsre__vape__neg_001__v01"
)

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first vape use): Sum - Negative score
#' inverted \[Validation: None missing or declined\]"
#'
#' @description
#' Computes the summary score `su_y_nicsre__vape_sum`
#' Nicotine Subjective Response and Effects \[Youth\] (Intensity of
#' positive and negative effects of first vape use): Sum - Negative score
#' inverted \[Validation: None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__vape |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_su_y_nicsre__vape_sum <- function(
    data,
    name = "su_y_nicsre__vape_sum",
    combine = TRUE,
    max_na = 0) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__vape)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_recoded <- data |>
    recode_levels(
      vars = c(
        "su_y_nicsre__vape__neg_001",
        "su_y_nicsre__vape__neg_001__v01"
      ),
      recode = c(
        "1" = "4",
        "2" = "3",
        "3" = "2",
        "1" = "4"
      )
    )

  data_ss <- data_recoded |>
    ss_sum(
      name    = "score_baseline",
      vars    = c("su_y_nicsre__vape__pos_001", "su_y_nicsre__vape__neg_001"),
      max_na  = max_na,
      events  = "ses-00A"
    ) |>
    ss_sum(
      name    = "score_other_events",
      vars    = c("su_y_nicsre__vape__pos_001__v01", "su_y_nicsre__vape__neg_001__v01"),
      max_na  = max_na,
      events  = setdiff(data$session_id, "ses-00A")
    ) |>
    transmute(
      "{name}" := if_else(
        session_id == "ses-00A",
        score_baseline,
        score_other_events
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first vape use): Number missing"
#'
#' @description
#' Computes the summary score `su_y_nicsre__vape_nm`
#' Nicotine Subjective Response and Effects \[Youth\] (Positive and
#' negative effects of first vape use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_nicsre__vape |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
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
compute_su_y_nicsre__vape_nm <- function(
    data,
    name = "su_y_nicsre__vape_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_nicsre__vape)

  data_ss <- data |>
    ss_nm(
      name = "score_baseline",
      vars = c(
        "su_y_nicsre__vape__pos_001",
        "su_y_nicsre__vape__neg_001"
      ),
      events = "ses-00A"
    ) |>
    ss_nm(
      name = "score_other_events",
      vars = c(
        "su_y_nicsre__vape__pos_001__v01",
        "su_y_nicsre__vape__neg_001__v01"
      ),
      events = setdiff(data$session_id, "ses-00A")
    ) |>
    transmute(
      "{name}" := if_else(
        session_id == "ses-00A",
        score_baseline,
        score_other_events
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   compute_su_y_nicsre_all                                                 ####

#' Compute all summary scores for su_y_nicsre.
#' @description
#' This function computes all summary scores for the su_y_nicsre form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_su_y_nicsre_all(data)
#' }
compute_su_y_nicsre_all <- function(data) {
  data |>
    compute_su_y_nicsre__chew_sum() |>
    compute_su_y_nicsre__chew_nm() |>
    compute_su_y_nicsre__cig_sum() |>
    compute_su_y_nicsre__cig_nm() |>
    compute_su_y_nicsre__vape_sum() |>
    compute_su_y_nicsre__vape_nm()
}

#   ____________________________________________________________________________
#   su_y_alcprob                                                            ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_alcprob_prsum
#' @format vars_su_y_alcprob is a table with pairs of baseline and longitudinal
#'  redcap fields used to compute summary score of `su_y_alcprob_prsum` and
#' `su_y_alcprob_nm`.
vars_su_y_alcprob <- tibble::tribble(
  ~baseline_choice, ~longitudinal_choice,
  "su_y_alcprob_001", "su_y_alcprob_001__l",
  "su_y_alcprob_002", "su_y_alcprob_002__l",
  "su_y_alcprob_003", "su_y_alcprob_003__l",
  "su_y_alcprob_004", "su_y_alcprob_004__l",
  "su_y_alcprob_005", "su_y_alcprob_005__l",
  "su_y_alcprob_006", "su_y_alcprob_006__l",
  "su_y_alcprob_007", "su_y_alcprob_007__l",
  "su_y_alcprob_008", "su_y_alcprob_008__l",
  "su_y_alcprob_009", "su_y_alcprob_009__l",
  "su_y_alcprob_010", "su_y_alcprob_010__l",
  "su_y_alcprob_012", "su_y_alcprob_012__l",
  "su_y_alcprob_016", "su_y_alcprob_016__l",
  "su_y_alcprob_017", "su_y_alcprob_017__l",
  "su_y_alcprob_018", "su_y_alcprob_018__l"
)

#' Compute "Alcohol Problem Index (RAPI) \[Youth\]: Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_alcprob_prsum`
#' Alcohol Problem Index (RAPI) \[Youth\]: Prorated sum \[Validation: No more
#' than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_su_y_alcprob) |> unique() |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 2 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcprob_prsum <- function(
    data,
    name = "su_y_alcprob_prsum",
    combine = TRUE,
    max_na = 2) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- purrr::map2_dfc(
    vars_su_y_alcprob$baseline_choice,
    vars_su_y_alcprob$longitudinal_choice,
    # combine baseline and longitudinal data
    function(x, y) {
      combine_cols(
        data = data,
        col_1 = x,
        col_2 = y,
        keep_other = FALSE
      )
    }
  ) |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_alcprob$baseline_choice,
      max_na  = max_na,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Alcohol Problem Index (RAPI) \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `su_y_alcprob_nm`
#' Alcohol Problem Index (RAPI) \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ab_g_stc__cohort_race__nih) |> unique() |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_alcprob_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_alcprob_nm <- function(
    data,
    name = "su_y_alcprob_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- purrr::map2_dfc(
    vars_su_y_alcprob$baseline_choice,
    vars_su_y_alcprob$longitudinal_choice,
    # combine baseline and longitudinal data
    function(x, y) {
      combine_cols(
        data = data,
        col_1 = x,
        col_2 = y,
        keep_other = FALSE
      )
    }
  ) |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_alcprob$baseline_choice,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   (ALL) su_y_alcprob                                                      ####

#' Compute all the su_y_alcprob scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_alcprob_all(data)
#' }
compute_su_y_alcprob_all <- function(data) {
  data |>
    compute_su_y_alcprob_prsum() |>
    compute_su_y_alcprob_nm()
}

#   ____________________________________________________________________________
#   su_y_mjprob                                                             ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_mjprob_prsum
#' @format vars_su_y_mjprob is a character vector of all column names
#' used to compute summary score of `su_y_mjprob_prsum` and
#' `su_y_mjprob_nm`.
vars_su_y_mjprob <- c(
  "su_y_mjprob_001",
  "su_y_mjprob_002",
  "su_y_mjprob_003",
  "su_y_mjprob_004",
  "su_y_mjprob_005",
  "su_y_mjprob_006",
  "su_y_mjprob_007",
  "su_y_mjprob_008",
  "su_y_mjprob_009",
  "su_y_mjprob_010",
  "su_y_mjprob_011",
  "su_y_mjprob_012",
  "su_y_mjprob_016",
  "su_y_mjprob_017",
  "su_y_mjprob_018"
)

#' Compute "Marijuana Problem Index (MAPI) \[Youth\]: Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_mjprob_prsum`
#' Marijuana Problem Index (MAPI) \[Youth\]: Prorated sum \[Validation: No more
#' than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjprob |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 3 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjprob_prsum <- function(
    data,
    name = "su_y_mjprob_prsum",
    combine = TRUE,
    max_na = 3) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_mjprob,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Marijuana Problem Index (MAPI) \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `su_y_mjprob_nm`
#' Marijuana Problem Index (MAPI) \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_mjprob |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_mjprob_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_mjprob_nm <- function(
    data,
    name = "su_y_mjprob_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_mjprob,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_mjprob                                                       ####

#' Compute all the su_y_mjprob scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_mjprob_all(data)
#' }
compute_su_y_mjprob_all <- function(data) {
  data |>
    compute_su_y_mjprob_prsum() |>
    compute_su_y_mjprob_nm()
}

#   ____________________________________________________________________________
#   su_y_drgprob                                                            ####

#' @export
#' @autoglobal
#' @rdname compute_su_y_drgprob_prsum
#' @format vars_su_y_drgprob is a character vector of all column names
#' used to compute summary score of `su_y_drgprob_prsum` and
#' `su_y_drgprob_nm`.
vars_su_y_drgprob <- c(
  "su_y_drgprob_001",
  "su_y_drgprob_002",
  "su_y_drgprob_003",
  "su_y_drgprob_004",
  "su_y_drgprob_005",
  "su_y_drgprob_006",
  "su_y_drgprob_007",
  "su_y_drgprob_008",
  "su_y_drgprob_009",
  "su_y_drgprob_010",
  "su_y_drgprob_012",
  "su_y_drgprob_013",
  "su_y_drgprob_014",
  "su_y_drgprob_015",
  "su_y_drgprob_016",
  "su_y_drgprob_017",
  "su_y_drgprob_018"
)

#' Compute "Drug Problem Index (DAPI) \[Youth\]: Prorated sum"
#'
#' @description
#' Computes the summary score `su_y_drgprob_prsum`
#' Drug Problem Index (DAPI) \[Youth\]: Prorated sum \[Validation: No more
#' than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_drgprob |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 3 items missing
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_drgprob_prsum <- function(
    data,
    name = "su_y_drgprob_prsum",
    combine = TRUE,
    max_na = 3) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_prsum(
      name    = name,
      vars    = vars_su_y_drgprob,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Drug Problem Index (DAPI) \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `su_y_drgprob_nm`
#' Drug Problem Index (DAPI) \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_drgprob |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_su_y_alcexp__neg_prsum
#'
#' @seealso [compute_su_y_drgprob_prsum()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_su_y_drgprob_nm <- function(
    data,
    name = "su_y_drgprob_nm",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_su_y_drgprob,
      combine = combine
    )
}

#   ____________________________________________________________________________
#   (ALL) su_y_drgprob                                                      ####

#' Compute all the su_y_drgprob scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' \dontrun{
#' compute_su_y_drgprob_all(data)
#' }
compute_su_y_drgprob_all <- function(data) {
  data |>
    compute_su_y_drgprob_prsum() |>
    compute_su_y_drgprob_nm()
}

#   ____________________________________________________________________________
#   (ALL) PROB SCORES                                                       ####

#' Compute all the SU youth prob scores
#'
#' @description
#' A single function to compute all PROB scores in SU domain.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#'
#' @keywords internal
compute_su_y_prob_all <- function(data) {
  data |>
    compute_su_y_alcprob_all() |>
    compute_su_y_mjprob_all() |>
    compute_su_y_drgprob_all()
}

#   ____________________________________________________________________________
#   Caffeine Use Questionnaire                                              ####

#' Compute caffeine use questionnaire internal function
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created
#' @param type character. Type of caffeine use (e.g., "coffee").
#' @param denominator numeric. Denominator for serving size calculation.
#' @param round character. Rounding option (e.g., "__01", "__02", "__03").
#' @noRd
#' @keywords internal
#' @autoglobal
compute_caff_weekly <- function(data, name, type, denominator, round) {
  var_num <- paste0("su_y_caff__", type, "_001", round, "__01")
  var_freq <- paste0("su_y_caff__", type, "_001", round, "__02")
  var_size <- paste0("su_y_caff__", type, "_001", round, "__03")

  if (is.null(denominator)) {
    data_serving <- data |>
      mutate(
        serving = .data[[var_num]]
      )
  } else {
    data_serving <- data |>
      mutate(
        serving = .data[[var_num]] * .data[[var_size]] / denominator,
      )
  }

  data_serving |>
    mutate(
      "{name}" := case_when(
        .data[[var_num]] == 0 ~ 0,
        .data[[var_freq]] == 1 ~ serving * 7,
        .data[[var_freq]] == 2 ~ serving,
        .data[[var_freq]] == 3 ~ serving / 4,
        .default = NA
      ) |>
        round(2)
    ) |>
    select(
      -serving
    )
}

## coffee ----------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__coffee_sum
#' @format vars_su_y_caff__coffee is a character vector of all column names used
#'   to compute `compute_su_y_caff__coffee_sum`.
vars_su_y_caff__coffee <- c(
  "su_y_caff__coffee_001",
  "su_y_caff__coffee_001__01__01",
  "su_y_caff__coffee_001__01__02",
  "su_y_caff__coffee_001__01__03",
  "su_y_caff__coffee_001__02__01",
  "su_y_caff__coffee_001__02__02",
  "su_y_caff__coffee_001__02__03",
  "su_y_caff__coffee_001__03__01",
  "su_y_caff__coffee_001__03__02",
  "su_y_caff__coffee_001__03__03",
  "su_y_caff__coffee_001__04__01",
  "su_y_caff__coffee_001__04__02",
  "su_y_caff__coffee_001__04__03",
  "su_y_caff__coffee_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Coffee):
#' Sum \[Validation: None\]"
#' @description
#' Computes the summary score `su_y_caff__coffee_sum`
#' Caffeine Use Questionnaire \[Youth\] (Coffee): Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__coffee |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_su_y_caff__coffee_sum <- function(
    data,
    name = "su_y_caff__coffee_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__coffee)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__coffee),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "coffee", 8, "__01") |>
    compute_caff_weekly("tmp_2", "coffee", 8, "__02") |>
    compute_caff_weekly("tmp_3", "coffee", 8, "__03") |>
    compute_caff_weekly("tmp_4", "coffee", 8, "__04") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__coffee_001) ~ su_y_caff__coffee_001,
        !is.na(su_y_caff__coffee_001__l) ~ su_y_caff__coffee_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## energy drink ----------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__energy__drink_sum
#' @format vars_su_y_caff__energy__drink is a character vector
#' of all column names used to compute `compute_su_y_caff__energy__drink_sum`.
vars_su_y_caff__energy__drink <- c(
  "su_y_caff__energy__drink_001__01__01",
  "su_y_caff__energy__drink_001__01__02",
  "su_y_caff__energy__drink_001__01__03",
  "su_y_caff__energy__drink_001__02__01",
  "su_y_caff__energy__drink_001__02__02",
  "su_y_caff__energy__drink_001__02__03",
  "su_y_caff__energy__drink_001__03__01",
  "su_y_caff__energy__drink_001__03__02",
  "su_y_caff__energy__drink_001__03__03",
  "su_y_caff__energy__drink_001__04__01",
  "su_y_caff__energy__drink_001__04__02",
  "su_y_caff__energy__drink_001__04__03"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Energy drink):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__energy__drink_sum`
#' Caffeine Use Questionnaire \[Youth\] (Energy drink):
#' Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__energy__drink |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__energy__drink_sum <- function(
    data,
    name = "su_y_caff__energy__drink_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__energy__drink)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__energy__drink),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "energy__drink", 8, "__01") |>
    compute_caff_weekly("tmp_2", "energy__drink", 8, "__02") |>
    compute_caff_weekly("tmp_3", "energy__drink", 8, "__03") |>
    compute_caff_weekly("tmp_4", "energy__drink", 8, "__04") |>
    mutate(
      "{name}" := case_when(
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## energy shot -----------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__energy__shot_sum
#' @format vars_su_y_caff__energy__shot is a character vector of all column
#' names used to compute `compute_su_y_caff__energy__shot_sum`.
vars_su_y_caff__energy__shot <- c(
  "su_y_caff__energy__shot_001__01",
  "su_y_caff__energy__shot_001__02"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Energy shot):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__energy__shot_sum`
#' Caffeine Use Questionnaire \[Youth\] (Energy shot): Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__energy__shot |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__energy__shot_sum <- function(
    data,
    name = "su_y_caff__energy__shot_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__energy__shot)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__energy__shot),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "energy__shot", NULL, "") |>
    mutate(
      "{name}" := case_when(
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## energy ----------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__energy_sum
#' @format vars_su_y_caff__energy is a character vector of all column names used
#'   to compute `compute_su_y_caff__energy_sum`.
vars_su_y_caff__energy <- c(
  "su_y_caff__energy_001",
  "su_y_caff__energy_001__l",
  "su_y_caff__energy__shot_001__01",
  "su_y_caff__energy__shot_001__02",
  "su_y_caff__energy__drink_001__01__01",
  "su_y_caff__energy__drink_001__01__02",
  "su_y_caff__energy__drink_001__01__03",
  "su_y_caff__energy__drink_001__02__01",
  "su_y_caff__energy__drink_001__02__02",
  "su_y_caff__energy__drink_001__02__03",
  "su_y_caff__energy__drink_001__03__01",
  "su_y_caff__energy__drink_001__03__02",
  "su_y_caff__energy__drink_001__03__03",
  "su_y_caff__energy__drink_001__04__01",
  "su_y_caff__energy__drink_001__04__02",
  "su_y_caff__energy__drink_001__04__03"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Energy):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__energy_sum`
#' Caffeine Use Questionnaire \[Youth\] (Energy): Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__energy |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__energy_sum <- function(
    data,
    name = "su_y_caff__energy_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__energy)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__energy),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_drink_1", "energy__drink", 8, "__01") |>
    compute_caff_weekly("tmp_drink_2", "energy__drink", 8, "__02") |>
    compute_caff_weekly("tmp_drink_3", "energy__drink", 8, "__03") |>
    compute_caff_weekly("tmp_drink_4", "energy__drink", 8, "__04") |>
    compute_caff_weekly("tmp_shot", "energy__shot", NULL, "") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__energy_001) ~ su_y_caff__energy_001,
        !is.na(su_y_caff__energy_001__l) ~ su_y_caff__energy_001__l,
        is.na(tmp_drink_1) & is.na(tmp_shot) ~ NA,
        .default = rowSums(across(matches("^tmp_")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## espresso --------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__espres_sum
#' @format vars_su_y_caff__espres is a character vector of all column names used
#'   to compute `compute_su_y_caff__espres_sum`.
vars_su_y_caff__espres <- c(
  "su_y_caff__espres_001",
  "su_y_caff__espres_001__01",
  "su_y_caff__espres_001__02",
  "su_y_caff__espres_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Espresso):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__espres_sum`
#' Caffeine Use Questionnaire \[Youth\] (Espresso): Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__espres |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__espres_sum <- function(
    data,
    name = "su_y_caff__espres_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__espres)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__espres),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "espres", NULL, "") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__espres_001) ~ su_y_caff__espres_001,
        !is.na(su_y_caff__espres_001__l) ~ su_y_caff__espres_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## other -----------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__oth_sum
#' @format vars_su_y_caff__oth is a character vector of all column names used
#'   to compute `compute_su_y_caff__oth_sum`.
vars_su_y_caff__oth <- c(
  "su_y_caff__oth_001__01",
  "su_y_caff__oth_001__02",
  "su_y_caff__oth_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Other):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__oth_sum`
#' Caffeine Use Questionnaire \[Youth\] (Other): Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__oth |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__oth_sum <- function(
    data,
    name = "su_y_caff__oth_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__oth)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__oth),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "oth", NULL, "") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__oth_001__l) ~ su_y_caff__oth_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## soda ------------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__soda_sum
#' @format vars_su_y_caff__soda is a character vector of all column names used
#'   to compute `compute_su_y_caff__soda_sum`.
vars_su_y_caff__soda <- c(
  "su_y_caff__soda_001",
  "su_y_caff__soda_001__01__01",
  "su_y_caff__soda_001__01__02",
  "su_y_caff__soda_001__01__03",
  "su_y_caff__soda_001__02__01",
  "su_y_caff__soda_001__02__02",
  "su_y_caff__soda_001__02__03",
  "su_y_caff__soda_001__03__01",
  "su_y_caff__soda_001__03__02",
  "su_y_caff__soda_001__03__03",
  "su_y_caff__soda_001__04__01",
  "su_y_caff__soda_001__04__02",
  "su_y_caff__soda_001__04__03",
  "su_y_caff__soda_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Soda):
#' Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__soda_sum`
#' Caffeine Use Questionnaire \[Youth\] (Soda) : Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__soda |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__soda_sum <- function(
    data,
    name = "su_y_caff__soda_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__soda)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__soda),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "soda", 12, "__01") |>
    compute_caff_weekly("tmp_2", "soda", 12, "__02") |>
    compute_caff_weekly("tmp_3", "soda", 12, "__03") |>
    compute_caff_weekly("tmp_4", "soda", 12, "__04") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__soda_001) ~ su_y_caff__soda_001,
        !is.na(su_y_caff__soda_001__l) ~ su_y_caff__soda_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## supplement ------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__suppl_sum
#' @format vars_su_y_caff__suppl is a character vector of all column names used
#'   to compute `compute_su_y_caff__suppl_sum`.
vars_su_y_caff__suppl <- c(
  "su_y_caff__suppl_001__01__01",
  "su_y_caff__suppl_001__01__02",
  "su_y_caff__suppl_001__02__01",
  "su_y_caff__suppl_001__02__02",
  "su_y_caff__suppl_001__03__01",
  "su_y_caff__suppl_001__03__02",
  "su_y_caff__suppl_001__04__01",
  "su_y_caff__suppl_001__04__02",
  "su_y_caff__suppl_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Caffeine supplements):
#'  Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__suppl_sum`
#' Caffeine Use Questionnaire \[Youth\] (Caffeine supplements):
#' Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__suppl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__suppl_sum <- function(
    data,
    name = "su_y_caff__suppl_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__suppl)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__suppl),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "suppl", NULL, "__01") |>
    compute_caff_weekly("tmp_2", "suppl", NULL, "__02") |>
    compute_caff_weekly("tmp_3", "suppl", NULL, "__03") |>
    compute_caff_weekly("tmp_4", "suppl", NULL, "__04") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__suppl_001__l) ~ su_y_caff__suppl_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## tea -------------------------------------------------------------------------

#' @export
#' @rdname compute_su_y_caff__tea_sum
#' @format vars_su_y_caff__tea is a character vector of all column names used
#'   to compute `compute_su_y_caff__tea_sum`.
vars_su_y_caff__tea <- c(
  "su_y_caff__tea_001",
  "su_y_caff__tea_001__01__01",
  "su_y_caff__tea_001__01__02",
  "su_y_caff__tea_001__01__03",
  "su_y_caff__tea_001__02__01",
  "su_y_caff__tea_001__02__02",
  "su_y_caff__tea_001__02__03",
  "su_y_caff__tea_001__03__01",
  "su_y_caff__tea_001__03__02",
  "su_y_caff__tea_001__03__03",
  "su_y_caff__tea_001__04__01",
  "su_y_caff__tea_001__04__02",
  "su_y_caff__tea_001__04__03",
  "su_y_caff__tea_001__l"
)

#' Compute "Caffeine Use Questionnaire \[Youth\] (Tea) : Sum \[Validation: None\]"
#'
#' @description
#' Computes the summary score `su_y_caff__tea_sum`
#' Caffeine Use Questionnaire \[Youth\] (Tea) : Sum \[Validation: None\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_su_y_caff__tea |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none
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
compute_su_y_caff__tea_sum <- function(
    data,
    name = "su_y_caff__tea_sum",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  check_col_names(data, name)
  chk::check_names(data, vars_su_y_caff__tea)
  chk::chk_flag(combine)

  data_ss <- data |>
    transmute(
      across(
        all_of(vars_su_y_caff__tea),
        as.numeric
      )
    ) |>
    compute_caff_weekly("tmp_1", "tea", 8, "__01") |>
    compute_caff_weekly("tmp_2", "tea", 8, "__02") |>
    compute_caff_weekly("tmp_3", "tea", 8, "__03") |>
    compute_caff_weekly("tmp_4", "tea", 8, "__04") |>
    mutate(
      "{name}" := case_when(
        !is.na(su_y_caff__tea_001) ~ su_y_caff__tea_001,
        !is.na(su_y_caff__tea_001__l) ~ su_y_caff__tea_001__l,
        is.na(tmp_1) ~ NA,
        .default = rowSums(across(matches("^tmp_\\d")), na.rm = TRUE)
      )
    ) |>
    select(
      all_of(name)
    )

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

## (ALL) caff scores -----------------------------------------------------------

#' Compute all the SU youth caff scores
#'
#' @description
#' A single function to compute all caff scores in SU domain.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @keywords internal
compute_su_y_caff_all <- function(data) {
  data |>
    compute_su_y_caff__coffee_sum() |>
    compute_su_y_caff__energy__drink_sum() |>
    compute_su_y_caff__energy__shot_sum() |>
    compute_su_y_caff__energy_sum() |>
    compute_su_y_caff__espres_sum() |>
    compute_su_y_caff__oth_sum() |>
    compute_su_y_caff__soda_sum() |>
    compute_su_y_caff__suppl_sum() |>
    compute_su_y_caff__tea_sum()
}
