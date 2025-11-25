#   ____________________________________________________________________________
#   fc_p_fes__cohes                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__cohes_mean
#' @format vars_fc_p_fes__cohes is a character vector of all column names
#' used to compute summary score of `fc_p_fes__cohes`.
vars_fc_p_fes__cohes <- c(
  "fc_p_fes__cohes_001",
  "fc_p_fes__cohes_002",
  "fc_p_fes__cohes_003",
  "fc_p_fes__cohes_004",
  "fc_p_fes__cohes_005",
  "fc_p_fes__cohes_006",
  "fc_p_fes__cohes_007",
  "fc_p_fes__cohes_008",
  "fc_p_fes__cohes_009"
)


#' Compute "Family Environment Scale \[Parent\] (Cohesion): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__cohes_mean`
#' (Family Environment Scale \[Parent\] (Cohesion): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__cohes |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the input
#' data frame. If `FALSE`, the summary score is returned as a separate data
#' frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__cohes_mean <- function(
    data,
    name = "fc_p_fes__cohes_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__cohes,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Cohesion): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__cohes_nm`
#' (Family Environment Scale \[Parent\] (Cohesion): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__cohes |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the input
#' data frame. If `FALSE`, the summary score is returned as a separate data
#' frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__cohes_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__cohes_nm <- function(
    data,
    name = "fc_p_fes__cohes_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__cohes,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_fes__confl                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__confl_mean
#' @format vars_fc_p_fes__confl is a character vector of all column names
#' used to compute summary score of `fc_p_fes__confl`.
vars_fc_p_fes__confl <- c(
  "fc_p_fes__confl_001",
  "fc_p_fes__confl_002",
  "fc_p_fes__confl_003",
  "fc_p_fes__confl_004",
  "fc_p_fes__confl_005",
  "fc_p_fes__confl_006",
  "fc_p_fes__confl_007",
  "fc_p_fes__confl_008",
  "fc_p_fes__confl_009"
)


#' Compute "Family Environment Scale \[Parent\] (Conflict): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__confl_mean`
#' (Family Environment Scale \[Parent\] (Conflict): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__confl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the input
#' data frame. If `FALSE`, the summary score is returned as a separate data
#' frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__confl_mean <- function(
    data,
    name = "fc_p_fes__confl_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__confl,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Conflict): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__confl_nm`
#' (Family Environment Scale \[Parent\] (Conflict): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__confl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name
#' in the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#'  data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__confl_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__confl_nm <- function(
    data,
    name = "fc_p_fes__confl_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__confl,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_fes__expr                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__expr_mean
#' @format vars_fc_p_fes__expr is a character vector of all column names
#' used to compute summary score of `fc_p_fes__expr`.
vars_fc_p_fes__expr <- c(
  "fc_p_fes__expr_001",
  "fc_p_fes__expr_002",
  "fc_p_fes__expr_003",
  "fc_p_fes__expr_004",
  "fc_p_fes__expr_005",
  "fc_p_fes__expr_006",
  "fc_p_fes__expr_007",
  "fc_p_fes__expr_008",
  "fc_p_fes__expr_009"
)


#' Compute "Family Environment Scale \[Parent\] (Expression): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__expr_mean`
#' (Family Environment Scale \[Parent\] (Expression): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__expr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#'  the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__expr_mean <- function(
    data,
    name = "fc_p_fes__expr_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__expr,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Expression): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__expr_nm`
#' (Family Environment Scale \[Parent\] (Expression): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__expr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__expr_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__expr_nm <- function(
    data,
    name = "fc_p_fes__expr_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__expr,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_fes__intelcult                                                     ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__intelcult_mean
#' @format vars_fc_p_fes__intelcult is a character vector of all column names
#' used to compute summary score of `fc_p_fes__intelcult`.
vars_fc_p_fes__intelcult <- c(
  "fc_p_fes__intelcult_001",
  "fc_p_fes__intelcult_002",
  "fc_p_fes__intelcult_003",
  "fc_p_fes__intelcult_004",
  "fc_p_fes__intelcult_005",
  "fc_p_fes__intelcult_006",
  "fc_p_fes__intelcult_007",
  "fc_p_fes__intelcult_008",
  "fc_p_fes__intelcult_009"
)


#' Compute "Family Environment Scale \[Parent\] (Intellectual and cultural): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__intelcult_mean`
#' (Family Environment Scale \[Parent\] (Intellectual and cultural): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__intelcult |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the input
#' data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__intelcult_mean <- function(
    data,
    name = "fc_p_fes__intelcult_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__intelcult,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Intellectual and cultural):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__intelcult_nm`
#' (Family Environment Scale \[Parent\] (Intellectual and cultural): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__intelcult |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__intelcult_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__intelcult_nm <- function(
    data,
    name = "fc_p_fes__intelcult_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__intelcult,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_fes__org                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__org_mean
#' @format vars_fc_p_fes__org is a character vector of all column names
#' used to compute summary score of `fc_p_fes__org`.
vars_fc_p_fes__org <- c(
  "fc_p_fes__org_001",
  "fc_p_fes__org_002",
  "fc_p_fes__org_003",
  "fc_p_fes__org_004",
  "fc_p_fes__org_005",
  "fc_p_fes__org_006",
  "fc_p_fes__org_007",
  "fc_p_fes__org_008",
  "fc_p_fes__org_009"
)


#' Compute "Family Environment Scale \[Parent\] (Organization): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__org_mean`
#' (Family Environment Scale \[Parent\] (Organization): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__org |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name
#' in the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__org_mean <- function(
    data,
    name = "fc_p_fes__org_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__org,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Organization): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__org_nm`
#' (Family Environment Scale \[Parent\] (Organization): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__org |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name
#' in the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__org_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__org_nm <- function(
    data,
    name = "fc_p_fes__org_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__org,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_fes__rec                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_fes__rec_mean
#' @format vars_fc_p_fes__rec is a character vector of all column names
#' used to compute summary score of `fc_p_fes__rec`.
vars_fc_p_fes__rec <- c(
  "fc_p_fes__rec_001",
  "fc_p_fes__rec_002",
  "fc_p_fes__rec_003",
  "fc_p_fes__rec_004",
  "fc_p_fes__rec_005",
  "fc_p_fes__rec_006",
  "fc_p_fes__rec_007",
  "fc_p_fes__rec_008",
  "fc_p_fes__rec_009"
)


#' Compute "Family Environment Scale \[Parent\] (Activity and recreational): Mean"
#'
#' @description
#' Computes the summary score `fc_p_fes__rec_mean`
#' (Family Environment Scale \[Parent\] (Activity and recreational): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__rec |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__rec_mean <- function(
    data,
    name = "fc_p_fes__rec_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__rec,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Parent\] (Activity and recreational):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_fes__rec_nm`
#' (Family Environment Scale \[Parent\] (Activity and recreational): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_fes__rec |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_fes__rec_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_fes__rec_nm <- function(
    data,
    name = "fc_p_fes__rec_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_fes__rec,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__indselfrel                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__indselfrel_mean
#' @format vars_fc_p_vs__indselfrel is a character vector of all column names
#' used to compute summary score of `fc_p_vs__indselfrel`.
vars_fc_p_vs__indselfrel <- c(
  "fc_p_vs__indselfrel_001",
  "fc_p_vs__indselfrel_002",
  "fc_p_vs__indselfrel_003",
  "fc_p_vs__indselfrel_004",
  "fc_p_vs__indselfrel_005"
)


#' Compute "Values Scale \[Parent\] (Independence and
#'   self-reliance): Mean"
#'
#' @description
#' Computes the summary score `fc_p_vs__indselfrel_mean`
#' (Values Scale \[Parent\] (Independence and
#' self-reliance): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__indselfrel |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__indselfrel_mean <- function(
    data,
    name = "fc_p_vs__indselfrel_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__indselfrel,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Parent\] (Independence and
#'   self-reliance): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_vs__indselfrel_nm`
#' (Values Scale \[Parent\] (Independence and
#' self-reliance): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__indselfrel |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_vs__indselfrel_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__indselfrel_nm <- function(
    data,
    name = "fc_p_vs__indselfrel_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__indselfrel,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__obl                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__obl_mean
#' @format vars_fc_p_vs__obl is a character vector of all column names
#' used to compute summary score of `fc_p_vs__obl`.
vars_fc_p_vs__obl <- c(
  "fc_p_vs__obl_001",
  "fc_p_vs__obl_002",
  "fc_p_vs__obl_003",
  "fc_p_vs__obl_004",
  "fc_p_vs__obl_005"
)


#' Compute "Values Scale \[Parent\] (Family obligation):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_p_vs__obl_mean`
#' (Values Scale \[Parent\] (Family obligation): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__obl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in the
#' description.
#' @param combine logical. If `TRUE`, the summary score is appended to the input
#' data frame. If `FALSE`, the summary score is returned as a separate data
#' frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__obl_mean <- function(
    data,
    name = "fc_p_vs__obl_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__obl,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Parent\] (Family obligation):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_vs__obl_nm`
#' (Values Scale \[Parent\] (Family obligation): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__obl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_vs__obl_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__obl_nm <- function(
    data,
    name = "fc_p_vs__obl_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__obl,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__ref                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__ref_mean
#' @format vars_fc_p_vs__ref is a character vector of all column names
#' used to compute summary score of `fc_p_vs__ref`.
vars_fc_p_vs__ref <- c(
  "fc_p_vs__ref_001",
  "fc_p_vs__ref_002",
  "fc_p_vs__ref_003",
  "fc_p_vs__ref_004",
  "fc_p_vs__ref_005"
)


#' Compute "Values Scale \[Parent\] (Family as
#'   referent): Mean"
#'
#' @description
#' Computes the summary score `fc_p_vs__ref_mean`
#' (Values Scale \[Parent\] (Family as referent): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__ref |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__ref_mean <- function(
    data,
    name = "fc_p_vs__ref_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__ref,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Parent\] (Family as
#'   referent): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_vs__ref_nm`
#' (Values Scale \[Parent\] (Family as referent): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__ref |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_vs__ref_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__ref_nm <- function(
    data,
    name = "fc_p_vs__ref_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__ref,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__relig                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__relig_mean
#' @format vars_fc_p_vs__relig is a character vector of all column names
#' used to compute summary score of `fc_p_vs__relig`.
vars_fc_p_vs__relig <- c(
  "fc_p_vs__relig_001",
  "fc_p_vs__relig_002",
  "fc_p_vs__relig_003",
  "fc_p_vs__relig_004",
  "fc_p_vs__relig_005",
  "fc_p_vs__relig_006",
  "fc_p_vs__relig_007"
)


#' Compute "Values Scale \[Parent\] (Religion): Mean"
#'
#' @description
#' Computes the summary score `fc_p_vs__relig_mean`
#' (Values Scale \[Parent\] (Religion): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__relig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__relig_mean <- function(
    data,
    name = "fc_p_vs__relig_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__relig,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Parent\] (Religion): Number
#'   missing"
#'
#' @description
#' Computes the summary score `fc_p_vs__relig_nm`
#' (Values Scale \[Parent\] (Religion): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__relig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_vs__relig_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__relig_nm <- function(
    data,
    name = "fc_p_vs__relig_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__relig,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__supp                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__supp_mean
#' @format a character vector of all column names
#' used to compute summary score of `fc_p_vs__supp`.
vars_fc_p_vs__supp <- c(
  "fc_p_vs__supp_001",
  "fc_p_vs__supp_002",
  "fc_p_vs__supp_003",
  "fc_p_vs__supp_004",
  "fc_p_vs__supp_005",
  "fc_p_vs__supp_006"
)


#' Compute "Values Scale \[Parent\] (Family support):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_p_vs__supp_mean`
#' (Values Scale \[Parent\] (Family support): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__supp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__supp_mean <- function(
    data,
    name = "fc_p_vs__supp_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__supp,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Parent\] (Family support):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_vs__supp_nm`
#' (Values Scale \[Parent\] (Family support): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__supp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_vs__supp_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__supp_nm <- function(
    data,
    name = "fc_p_vs__supp_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_vs__supp,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_vs__famil                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__famil_mean
#' @format a character vector of all column names
#' used to compute summary score of `fc_p_vs__famil_mean` and
#' `fc_p_vs__famil_nm`.
vars_fc_p_vs__famil <- c(
  "fc_p_vs__supp_001",
  "fc_p_vs__supp_002",
  "fc_p_vs__supp_003",
  "fc_p_vs__supp_004",
  "fc_p_vs__supp_005",
  "fc_p_vs__supp_006",
  "fc_p_vs__ref_001",
  "fc_p_vs__ref_002",
  "fc_p_vs__ref_003",
  "fc_p_vs__ref_004",
  "fc_p_vs__ref_005",
  "fc_p_vs__obl_001",
  "fc_p_vs__obl_002",
  "fc_p_vs__obl_003",
  "fc_p_vs__obl_004",
  "fc_p_vs__obl_005"
)

#' Compute "Values Scale \[Parent\] (Familism):
#'   Mean - Baseline to Year 5"
#'
#' @description
#' Computes the summary score `fc_p_vs__famil_mean`
#' (Values Scale \[Parent\] (Familism): Mean - Baseline to Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__famil |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#' - *Validation criterion:*
#'    - maximally 3 of 16 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric vector of positive whole number. Number of missing
#'   items allowed (Default: 3).
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__famil_mean <- function(
    data,
    name = "fc_p_vs__famil_mean",
    max_na = 3,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::check_names(data, "session_id")

  # calculate only up to `ses-05A`
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num <= 5) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_mean(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_p_vs__famil,
      max_na  = max_na,
      events  = tmp_sessions,
      exclude = exclude
    ) |>
    compute_fc_p_vs__supp_mean(name = "tmp_supp") |>
    compute_fc_p_vs__ref_mean(name = "tmp_ref") |>
    compute_fc_p_vs__obl_mean(name = "tmp_obl") |>
    check_assign_na(
      output = name,
      input = c("tmp_supp", "tmp_ref", "tmp_obl"),
      allow_missingness = FALSE
    ) |>
    select(
      -matches("^tmp_")
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' Compute "Values Scale \[Parent\] (Familism): Number missing - Baseline to
#' Year 5"
#'
#' @description
#' Computes the summary score `fc_p_vs__famil_nm__v01`
#' (Values Scale \[Parent\] (Familism): Number missing - Baseline to Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__famil |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#'
#' @seealso [compute_fc_p_vs__famil_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__famil_nm <- function(
    data,
    name = "fc_p_vs__famil_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::check_names(data, "session_id")

  # calculate only up to `ses-05A`
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num <= 5) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_nm(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_p_vs__famil,
      events  = tmp_sessions,
      exclude = exclude
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' @export
#' @autoglobal
#' @rdname compute_fc_p_vs__famil_mean__v01
#' @format a character vector of all column names
#' used to compute summary score of `fc_p_vs__famil_mean__v01` and
#' `fc_p_vs__famil_nm__v01`.
vars_fc_p_vs__famil__v01 <- c(
  "fc_p_vs__supp_001",
  "fc_p_vs__supp_002",
  "fc_p_vs__supp_003",
  "fc_p_vs__supp_004",
  "fc_p_vs__supp_005",
  "fc_p_vs__supp_006",
  "fc_p_vs__ref_001",
  "fc_p_vs__ref_002",
  "fc_p_vs__ref_003",
  "fc_p_vs__ref_004",
  "fc_p_vs__ref_005"
)


#' Compute "Values Scale \[Parent\] (Familism):
#'   Mean - Version 1 (Year 5 onwards)"
#'
#' @description
#' Computes the summary score `fc_p_vs__famil_mean__v01`
#' (Values Scale \[Parent\] (Familism): Mean - Version 1 (Year 5 onwards))
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__famil__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#' - *Validation criterion:*
#'    - maximally 2 of 11 items missing
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#' @param max_na numeric vector of positive whole number. Number of missing
#'   items allowed (Default: 2).
#'
#' @seealso [compute_fc_p_vs__famil_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__famil_mean__v01 <- function(
    data,
    name = "fc_p_vs__famil_mean__v01",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::check_names(data, "session_id")

  # calculate from `ses-06A` onwards
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num >= 6) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_mean(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_p_vs__famil__v01,
      max_na  = max_na,
      events  = tmp_sessions,
      exclude = exclude
    ) |>
    compute_fc_p_vs__supp_mean(name = "tmp_supp") |>
    compute_fc_p_vs__ref_mean(name = "tmp_ref") |>
    check_assign_na(
      output = name,
      input = c("tmp_supp", "tmp_ref"),
      allow_missingness = FALSE
    ) |>
    select(
      -matches("^tmp_")
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' Compute "Values Scale \[Parent\] (Familism): Number missing - Version 1
#' (Year 5 onwards)"
#'
#' @description
#' Computes the summary score `fc_p_vs__famil_nm__v01`
#' (Values Scale \[Parent\] (Familism): Number missing - Version 1
#' (Year 5 onwards))
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_vs__famil__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#'
#' @seealso [compute_fc_p_vs__famil_mean__v01()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_vs__famil_nm__v01 <- function(
    data,
    name = "fc_p_vs__famil_nm__v01",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::check_names(data, "session_id")

  # calculate from `ses-06A` onwards
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num >= 6) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_nm(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_p_vs__famil__v01,
      events  = tmp_sessions,
      exclude = exclude
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#   ____________________________________________________________________________
#   fc_p_meim__explor                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_meim__explor_mean
#' @format vars_fc_p_meim__explor is a character vector of all column names
#' used to compute summary score of `fc_p_meim__explor`.
vars_fc_p_meim__explor <- c(
  "fc_p_meim__explor_001",
  "fc_p_meim__explor_002",
  "fc_p_meim__explor_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\]
#'   (Exploration): Mean"
#'
#' @description
#' Computes the summary score `fc_p_meim__explor_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Exploration): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim__explor |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim__explor_mean <- function(
    data,
    name = "fc_p_meim__explor_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim__explor,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\]
#'   (Exploration): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_meim__explor_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Exploration):
#' Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim__explor |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_meim__explor_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim__explor_nm <- function(
    data,
    name = "fc_p_meim__explor_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim__explor,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_meim                                                               ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_meim_mean
#' @format vars_fc_p_meim is a character vector of all column names
#' used to compute summary score of `fc_p_meim`.
vars_fc_p_meim <- c(
  "fc_p_meim__commattach_001",
  "fc_p_meim__commattach_002",
  "fc_p_meim__commattach_003",
  "fc_p_meim__explor_001",
  "fc_p_meim__explor_002",
  "fc_p_meim__explor_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\]: Mean"
#'
#' @description
#' Computes the summary score `fc_p_meim_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim_mean <- function(
    data,
    name = "fc_p_meim_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\]: Number
#'   missing"
#'
#' @description
#' Computes the summary score `fc_p_meim_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_meim_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim_nm <- function(
    data,
    name = "fc_p_meim_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_meim__commattach                                                   ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_meim__commattach_mean
#' @format vars_fc_p_meim__commattach is a character vector of all column names
#' used to compute summary score of `fc_p_meim__commattach`.
vars_fc_p_meim__commattach <- c(
  "fc_p_meim__commattach_001",
  "fc_p_meim__commattach_002",
  "fc_p_meim__commattach_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Commitment
#'   and attachment): Mean"
#'
#' @description
#' Computes the summary score `fc_p_meim__commattach_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Commitment and
#' attachment): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim__commattach |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim__commattach_mean <- function(
    data,
    name = "fc_p_meim__commattach_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim__commattach,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Commitment
#'   and attachment): Number missing"
#'
#' @description
#' Computes the summary score `fc_p_meim__commattach_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Commitment and
#' attachment): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_meim__commattach |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_meim__commattach_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_meim__commattach_nm <- function(
    data,
    name = "fc_p_meim__commattach_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_meim__commattach,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_p_nce__cc                                                            ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_nce__cc_mean
#' @format vars_fc_p_nce__cc is a character vector of all column names
#' used to compute summary score of `fc_p_nce__cc`.
vars_fc_p_nce__cc <- c(
  "fc_p_nce__cc_001",
  "fc_p_nce__cc_002",
  "fc_p_nce__cc_003",
  "fc_p_nce__cc_004",
  "fc_p_nce__cc_005"
)


#' Compute "Neighborhood Collective Efficacy \[Parent\] (Community cohesion):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_p_nce__cc_mean`
#' (Neighborhood Collective Efficacy \[Parent\] (Community cohesion): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce__cc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 5 items missing
#' - *Notes:*
#'   - The following variables are reverse coded before computing the summary
#'     score:
#'     - `fc_p_nce__cc_003`
#'     - `fc_p_nce__cc_004`
#'   - The value "99" (Don't know) is recoded to "3" (Neither... nor...)
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce__cc_mean <- function(
    data,
    name = "fc_p_nce__cc_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_recoded <- data |>
    recode_levels(
      vars = c(
        "fc_p_nce__cc_003",
        "fc_p_nce__cc_004"
      ),
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    ) |>
    recode_levels(
      vars = vars_fc_p_nce__cc,
      recode = c("99" = "3")
    )

  data_ss <- data_recoded |>
    ss_mean(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_p_nce__cc,
      max_na  = max_na,
      exclude = c("777")
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Neighborhood Collective Efficacy \[Parent\] (Community cohesion):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_nce__cc_nm`
#' (Neighborhood Collective Efficacy \[Parent\] (Community cohesion): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce__cc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_nce__cc_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce__cc_nm <- function(
    data,
    name = "fc_p_nce__cc_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_nce__cc,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_p_nce__isc                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_nce__isc_mean
#' @format vars_fc_p_nce__isc is a character vector of all column names
#' used to compute summary score of `fc_p_nce__isc`.
vars_fc_p_nce__isc <- c(
  "fc_p_nce__isc_001",
  "fc_p_nce__isc_002",
  "fc_p_nce__isc_003",
  "fc_p_nce__isc_004",
  "fc_p_nce__isc_005"
)


#' Compute "Neighborhood Collective Efficacy \[Parent\] (Informal social control):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_p_nce__isc_mean`
#' (Neighborhood Collective Efficacy \[Parent\] (Informal social control): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce__isc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 5 items missing
#' - *Note:* The value "99" (Don't know) is recoded to "3" (Neither... nor...)
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce__isc_mean <- function(
    data,
    name = "fc_p_nce__isc_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    # recode values
    recode_levels(
      vars = vars_fc_p_nce__isc,
      recode = c("99" = "3")
    ) |>
    # compute summary score
    ss_mean(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_p_nce__isc,
      max_na  = max_na,
      exclude = c("777")
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Neighborhood Collective Efficacy \[Parent\] (Informal social control):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_p_nce__isc_nm`
#' (Neighborhood Collective Efficacy \[Parent\] (Informal social control): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce__isc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_nce__isc_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce__isc_nm <- function(
    data,
    name = "fc_p_nce__isc_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_nce__isc,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_p_nce                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_nce_mean
#' @format vars_fc_p_nce is a character vector of all column names
#' used to compute summary score of `fc_p_nce`.
vars_fc_p_nce <- c(
  "fc_p_nce__cc_001",
  "fc_p_nce__cc_002",
  "fc_p_nce__cc_003",
  "fc_p_nce__cc_004",
  "fc_p_nce__cc_005",
  "fc_p_nce__isc_001",
  "fc_p_nce__isc_002",
  "fc_p_nce__isc_003",
  "fc_p_nce__isc_004",
  "fc_p_nce__isc_005"
)


#' Compute "Neighborhood Collective Efficacy \[Parent\]: Mean"
#'
#' @description
#' Computes the summary score `fc_p_nce_mean`
#' (Neighborhood Collective Efficacy \[Parent\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 2 of 10 items missing
#' - *Notes:*
#'   - The following variables are reverse coded before computing the summary
#'     score:
#'     - `fc_p_nce__cc_003`
#'     - `fc_p_nce__cc_004`
#'   - The value "99" (Don't know) is recoded to "3" (Neither... nor...)
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 2).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce_mean <- function(
    data,
    name = "fc_p_nce_mean",
    max_na = 2,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_recoded <- data |>
    recode_levels(
      vars = c(
        "fc_p_nce__cc_003",
        "fc_p_nce__cc_004"
      ),
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    ) |>
    recode_levels(
      vars = vars_fc_p_nce,
      recode = c("99" = "3")
    )

  data_ss <- data_recoded |>
    ss_mean(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_p_nce,
      max_na  = max_na,
      exclude = c("777")
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Neighborhood Collective Efficacy \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_p_nce_nm`
#' (Neighborhood Collective Efficacy \[Parent\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nce |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_nce_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nce_nm <- function(
    data,
    name = "fc_p_nce_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_nce,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_p_nsc__ns                                                            ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_nsc__ns_mean
#' @format vars_fc_p_nsc__ns is a character vector of all column names
#' used to compute summary score of `fc_p_nsc__ns`.
vars_fc_p_nsc__ns <- c(
  "fc_p_nsc__ns_001",
  "fc_p_nsc__ns_002",
  "fc_p_nsc__ns_003"
)


#' Compute "Neighborhood Safety & Crime \[Parent\] (Neighborhood safety): Mean"
#'
#' @description
#' Computes the summary score `fc_p_nsc__ns_mean`
#' (Neighborhood Safety & Crime \[Parent\] (Neighborhood safety): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nsc__ns |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nsc__ns_mean <- function(
    data,
    name = "fc_p_nsc__ns_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_nsc__ns,
      max_na  = max_na,
      exclude = c("777", "999")
    )
}

#' Compute "Neighborhood Safety & Crime \[Parent\] (Neighborhood safety): Number
#'   missing"
#'
#' @description
#' Computes the summary score `fc_p_nsc__ns_nm`
#' (Neighborhood Safety & Crime \[Parent\] (Neighborhood safety): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_nsc__ns |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_nsc__ns_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_nsc__ns_nm <- function(
    data,
    name = "fc_p_nsc__ns_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_nsc__ns,
      exclude = c("777", "999")
    )
}

#   ____________________________________________________________________________
#   fc_p_pk__knowl                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_pk__knowl_mean
#' @format vars_fc_p_pk__knowl is a character vector of all column names
#' used to compute summary score of `fc_p_pk__knowl`.
vars_fc_p_pk__knowl <- c(
  "fc_p_pk__knowl_001",
  "fc_p_pk__knowl_002",
  "fc_p_pk__knowl_003",
  "fc_p_pk__knowl_004",
  "fc_p_pk__knowl_005",
  "fc_p_pk__knowl_006",
  "fc_p_pk__knowl_007",
  "fc_p_pk__knowl_008",
  "fc_p_pk__knowl_009"
)


#' Compute "Parental Knowledge Scale \[Parent\]: Mean"
#'
#' @description
#' Computes the summary score `fc_p_pk__knowl_mean`
#' (Parental Knowledge Scale \[Parent\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_pk__knowl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 9 items missing
#' - *Notes:* All items are reverse coded before computing the summary score.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_pk__knowl_mean <- function(
    data,
    name = "fc_p_pk__knowl_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_recoded <- data |>
    recode_levels(
      vars = c(
        "fc_p_pk__knowl_001",
        "fc_p_pk__knowl_003",
        "fc_p_pk__knowl_004",
        "fc_p_pk__knowl_005",
        "fc_p_pk__knowl_006",
        "fc_p_pk__knowl_009"
      ),
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    ) |>
    recode_levels(
      vars = c(
        "fc_p_pk__knowl_002",
        "fc_p_pk__knowl_007"
      ),
      recode = c(
        "1" = "4",
        "2" = "3",
        "3" = "2",
        "4" = "1"
      )
    ) |>
    recode_levels(
      vars = "fc_p_pk__knowl_008",
      recode = c("0" = "1")
    )

  data_ss <- data_recoded |>
    ss_mean(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_p_pk__knowl,
      max_na  = max_na,
      exclude = c("777")
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Parental Knowledge Scale \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_p_pk__knowl_nm`
#' (Parental Knowledge Scale \[Parent\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_pk__knowl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_pk__knowl_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_pk__knowl_nm <- function(
    data,
    name = "fc_p_pk__knowl_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_pk__knowl,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_p_psb                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_fc_p_psb_mean
#' @format vars_fc_p_psb is a character vector of all column names
#' used to compute summary score of `fc_p_psb`.
vars_fc_p_psb <- c(
  "fc_p_psb_001",
  "fc_p_psb_002",
  "fc_p_psb_003"
)


#' Compute "Prosocial Behavior \[Parent\]: Mean"
#'
#' @description
#' Computes the summary score `fc_p_psb_mean`
#' (Prosocial Behavior \[Parent\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_psb |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_psb_mean <- function(
    data,
    name = "fc_p_psb_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_psb,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Prosocial Behavior \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_p_psb_nm`
#' (Prosocial Behavior \[Parent\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_p_psb |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_p_psb_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_p_psb_nm <- function(
    data,
    name = "fc_p_psb_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_p_psb,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_as__safe                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_as__safe_mean
#' @format vars_fc_y_as__safe is a character vector of all column names
#' used to compute summary score of `fc_y_as__safe`.
vars_fc_y_as__safe <- c(
  "fc_y_as__safe_001a",
  "fc_y_as__safe_001b",
  "fc_y_as__safe_001c"
)


#' Compute "Activity Space \[Youth\] (Safety): Mean"
#'
#' @description
#' Computes the summary score `fc_y_as__safe_mean`
#' (Activity Space \[Youth\] (Safety): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_as__safe |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_as__safe_mean <- function(
    data,
    name = "fc_y_as__safe_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_as__safe,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Activity Space \[Youth\] (Safety): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_as__safe_nm`
#' (Activity Space \[Youth\] (Safety): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_as__safe |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_as__safe_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_as__safe_nm <- function(
    data,
    name = "fc_y_as__safe_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_as__safe,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_crpbi__cg1                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_crpbi__cg1_mean
#' @format vars_fc_y_crpbi__cg1 is a character vector of all column names
#' used to compute summary score of `fc_y_crpbi__cg1`.
vars_fc_y_crpbi__cg1 <- c(
  "fc_y_crpbi__cg1_002",
  "fc_y_crpbi__cg1_003",
  "fc_y_crpbi__cg1_004",
  "fc_y_crpbi__cg1_005",
  "fc_y_crpbi__cg1_006"
)


#' Compute "Children's Report of Parental Behavioral Inventory \[Youth\]
#'   (Caregiver A): Mean"
#'
#' @description
#' Computes the summary score `fc_y_crpbi__cg1_mean`
#' (Children's Report of Parental Behavioral Inventory \[Youth\] (Caregiver A):
#' Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_crpbi__cg1 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_crpbi__cg1_mean <- function(
    data,
    name = "fc_y_crpbi__cg1_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_crpbi__cg1,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Children's Report of Parental Behavioral Inventory \[Youth\]
#'   (Caregiver A): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_crpbi__cg1_nm`
#' (Children's Report of Parental Behavioral Inventory \[Youth\] (Caregiver A):
#' Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_crpbi__cg1 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_crpbi__cg1_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_crpbi__cg1_nm <- function(
    data,
    name = "fc_y_crpbi__cg1_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_crpbi__cg1,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_crpbi__cg2                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_crpbi__cg2_mean
#' @format vars_fc_y_crpbi__cg2 is a character vector of all column names
#' used to compute summary score of `fc_y_crpbi__cg2`.
vars_fc_y_crpbi__cg2 <- c(
  "fc_y_crpbi__cg2_002",
  "fc_y_crpbi__cg2_003",
  "fc_y_crpbi__cg2_004",
  "fc_y_crpbi__cg2_005",
  "fc_y_crpbi__cg2_006"
)


#' Compute "Children's Report of Parental Behavioral Inventory \[Youth\]
#'   (Caregiver B): Mean"
#'
#' @description
#' Computes the summary score `fc_y_crpbi__cg2_mean`
#' (Children's Report of Parental Behavioral Inventory \[Youth\] (Caregiver B):
#' Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_crpbi__cg2 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_crpbi__cg2_mean <- function(
    data,
    name = "fc_y_crpbi__cg2_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_crpbi__cg2,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Children's Report of Parental Behavioral Inventory \[Youth\]
#'   (Caregiver B): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_crpbi__cg2_nm`
#' (Children's Report of Parental Behavioral Inventory \[Youth\] (Caregiver B):
#' Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_crpbi__cg2 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_crpbi__cg2_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_crpbi__cg2_nm <- function(
    data,
    name = "fc_y_crpbi__cg2_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_crpbi__cg2,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_eut__ethn                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_eut__ethn_mean
#' @format vars_fc_y_eut__ethn is a character vector of all column names
#' used to compute summary score of `fc_y_eut__ethn`.
vars_fc_y_eut__ethn <- c(
  "fc_y_eut__ethn_001a",
  "fc_y_eut__ethn_001b",
  "fc_y_eut__ethn_001c", # fc_y_eut__ethn_001c__v01
  "fc_y_eut__ethn_001d", # added in event "ses-06A"
  "fc_y_eut__ethn_002",
  "fc_y_eut__ethn_003a", # fc_y_eut__ethn_003a__v01
  "fc_y_eut__ethn_003b", # fc_y_eut__ethn_003b__v01
  "fc_y_eut__ethn_003c" # fc_y_eut__ethn_003c__v01
)


#' Compute "Experiences with Unfair Treatment \[Youth\] (Ethnicity): Mean"
#'
#' @description
#' Computes the summary score `fc_y_eut__ethn_mean`
#' (Experiences with Unfair Treatment \[Youth\] (Ethnicity): Mean)
#'
#' - *Summarized variables:*
#'   - `fc_y_eut__ethn_001a`
#'   - `fc_y_eut__ethn_001b`
#'   - `fc_y_eut__ethn_001c`/`fc_y_eut__ethn_001c__v01`
#'   - `fc_y_eut__ethn_001d` (only from event "ses-06A" onwards)
#'   - `fc_y_eut__ethn_002`
#'   - `fc_y_eut__ethn_003a`/`fc_y_eut__ethn_003a__v01`
#'   - `fc_y_eut__ethn_003b`/`fc_y_eut__ethn_003b__v01`
#'   - `fc_y_eut__ethn_003c`/`fc_y_eut__ethn_003c__v01`
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:*
#'   - before event ses-06A: none of 7 items missing
#'   - starting at event ses-06A: maximally 1 of 8 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_eut__ethn_mean <- function(
    data,
    name = "fc_y_eut__ethn_mean",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data_combined <- data |>
    combine_cols("fc_y_eut__ethn_001c", "fc_y_eut__ethn_001c__v01") |>
    combine_cols("fc_y_eut__ethn_003a", "fc_y_eut__ethn_003a__v01") |>
    combine_cols("fc_y_eut__ethn_003b", "fc_y_eut__ethn_003b__v01") |>
    combine_cols("fc_y_eut__ethn_003c", "fc_y_eut__ethn_003c__v01")

  data_ss_before <- data_combined |>
    ss_mean(
      name    = "fc_y_eut__ethn_mean_before",
      vars    = setdiff(vars_fc_y_eut__ethn, "fc_y_eut__ethn_001d"),
      max_na  = 0,
      exclude = c("444", "777", "999"),
      combine = FALSE
    )

  data_ss_after <- data_combined |>
    ss_mean(
      name    = "fc_y_eut__ethn_mean_after",
      vars    = vars_fc_y_eut__ethn,
      max_na  = 1,
      exclude = c("444", "777", "999"),
      combine = FALSE
    )

  data_ss <- bind_cols(
    select(data, session_id),
    data_ss_before,
    data_ss_after
  ) |>
    transmute(
      "{name}" := if_else(
        session_id %in% c(
          "ses-01A",
          "ses-02A",
          "ses-04A"
        ),
        fc_y_eut__ethn_mean_before,
        fc_y_eut__ethn_mean_after
      )
    )


  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Experiences with Unfair Treatment \[Youth\] (Ethnicity): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_eut__ethn_nm`
#' (Experiences with Unfair Treatment \[Youth\] (Ethnicity): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_eut__ethn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_eut__ethn_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_eut__ethn_nm <- function(
    data,
    name = "fc_y_eut__ethn_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data_combined <- data |>
    combine_cols("fc_y_eut__ethn_001c", "fc_y_eut__ethn_001c__v01") |>
    combine_cols("fc_y_eut__ethn_003a", "fc_y_eut__ethn_003a__v01") |>
    combine_cols("fc_y_eut__ethn_003b", "fc_y_eut__ethn_003b__v01") |>
    combine_cols("fc_y_eut__ethn_003c", "fc_y_eut__ethn_003c__v01")

  data_ss_before <- data_combined |>
    ss_nm(
      name    = "fc_y_eut__ethn_nm_before",
      vars    = setdiff(vars_fc_y_eut__ethn, "fc_y_eut__ethn_001d"),
      exclude = c("444", "777", "999"),
      combine = FALSE
    )

  data_ss_after <- data_combined |>
    ss_nm(
      name    = "fc_y_eut__ethn_nm_after",
      vars    = vars_fc_y_eut__ethn,
      exclude = c("444", "777", "999"),
      combine = FALSE
    )


  data_ss <- bind_cols(
    data,
    data_ss_before,
    data_ss_after
  ) |>
    transmute(
      "{name}" := if_else(
        session_id %in% c(
          "ses-01A",
          "ses-02A",
          "ses-04A"
        ),
        fc_y_eut__ethn_nm_before,
        fc_y_eut__ethn_nm_after
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   fc_y_fes__cohes                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_fes__cohes_mean
#' @format vars_fc_y_fes__cohes is a character vector of all column names
#' used to compute summary score of `fc_y_fes__cohes`.
vars_fc_y_fes__cohes <- c(
  "fc_y_fes__cohes_001",
  "fc_y_fes__cohes_002",
  "fc_y_fes__cohes_003",
  "fc_y_fes__cohes_004",
  "fc_y_fes__cohes_005",
  "fc_y_fes__cohes_006",
  "fc_y_fes__cohes_007",
  "fc_y_fes__cohes_008",
  "fc_y_fes__cohes_009"
)


#' Compute "Family Environment Scale \[Youth\] (Cohesion): Mean"
#'
#' @description
#' Computes the summary score `fc_y_fes__cohes_mean`
#' (Family Environment Scale \[Youth\] (Cohesion): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_fes__cohes |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_fes__cohes_mean <- function(
    data,
    name = "fc_y_fes__cohes_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_fes__cohes,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Youth\] (Cohesion): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_fes__cohes_nm`
#' (Family Environment Scale \[Youth\] (Cohesion): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_fes__cohes |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_fes__cohes_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_fes__cohes_nm <- function(
    data,
    name = "fc_y_fes__cohes_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_fes__cohes,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_fes__confl                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_fes__confl_mean
#' @format vars_fc_y_fes__confl is a character vector of all column names
#' used to compute summary score of `fc_y_fes__confl`.
vars_fc_y_fes__confl <- c(
  "fc_y_fes__confl_001",
  "fc_y_fes__confl_002",
  "fc_y_fes__confl_003",
  "fc_y_fes__confl_004",
  "fc_y_fes__confl_005",
  "fc_y_fes__confl_006",
  "fc_y_fes__confl_007",
  "fc_y_fes__confl_008",
  "fc_y_fes__confl_009"
)


#' Compute "Family Environment Scale \[Youth\] (Conflict): Mean"
#'
#' @description
#' Computes the summary score `fc_y_fes__confl_mean`
#' (Family Environment Scale \[Youth\] (Conflict): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_fes__confl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_fes__confl_mean <- function(
    data,
    name = "fc_y_fes__confl_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_fes__confl,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Family Environment Scale \[Youth\] (Conflict): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_fes__confl_nm`
#' (Family Environment Scale \[Youth\] (Conflict): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_fes__confl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_fes__confl_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_fes__confl_nm <- function(
    data,
    name = "fc_y_fes__confl_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_fes__confl,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_vs__indselfrel                                                  ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__indselfrel_mean
#' @format vars_fc_y_vs__indselfrel is a character vector of all column names
#' used to compute summary score of `fc_y_vs__indselfrel`.
vars_fc_y_vs__indselfrel <- c(
  "fc_y_vs__indselfrel_001",
  "fc_y_vs__indselfrel_002",
  "fc_y_vs__indselfrel_003",
  "fc_y_vs__indselfrel_004",
  "fc_y_vs__indselfrel_005"
)


#' Compute "Values Scale \[Youth\] (Independence and
#'   self-reliance): Mean"
#'
#' @description
#' Computes the summary score `fc_y_vs__indselfrel_mean`
#' (Values Scale \[Youth\] (Independence and
#' self-reliance): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__indselfrel |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__indselfrel_mean <- function(
    data,
    name = "fc_y_vs__indselfrel_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__indselfrel,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Youth\] (Independence and
#'   self-reliance): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_vs__indselfrel_nm`
#' (Values Scale \[Youth\] (Independence and
#' self-reliance): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__indselfrel |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_vs__indselfrel_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__indselfrel_nm <- function(
    data,
    name = "fc_y_vs__indselfrel_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__indselfrel,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_vs__obl                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__obl_mean
#' @format vars_fc_y_vs__obl is a character vector of all column names
#' used to compute summary score of `fc_y_vs__obl`.
vars_fc_y_vs__obl <- c(
  "fc_y_vs__obl_001",
  "fc_y_vs__obl_002",
  "fc_y_vs__obl_003",
  "fc_y_vs__obl_004",
  "fc_y_vs__obl_005"
)


#' Compute "Values Scale \[Youth\] (Family obligation):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_y_vs__obl_mean`
#' (Values Scale \[Youth\] (Family obligation): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__obl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__obl_mean <- function(
    data,
    name = "fc_y_vs__obl_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__obl,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Youth\] (Family obligation):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_vs__obl_nm`
#' (Values Scale \[Youth\] (Family obligation): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__obl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_vs__obl_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__obl_nm <- function(
    data,
    name = "fc_y_vs__obl_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__obl,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_vs__ref                                                         ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__ref_mean
#' @format vars_fc_y_vs__ref is a character vector of all column names
#' used to compute summary score of `fc_y_vs__ref`.
vars_fc_y_vs__ref <- c(
  "fc_y_vs__ref_001",
  "fc_y_vs__ref_002",
  "fc_y_vs__ref_003",
  "fc_y_vs__ref_004",
  "fc_y_vs__ref_005"
)


#' Compute "Values Scale \[Youth\] (Family as referent):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_y_vs__ref_mean`
#' (Values Scale \[Youth\] (Family as referent): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__ref |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__ref_mean <- function(
    data,
    name = "fc_y_vs__ref_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__ref,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Youth\] (Family as referent):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_vs__ref_nm`
#' (Values Scale \[Youth\] (Family as referent): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__ref |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_vs__ref_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__ref_nm <- function(
    data,
    name = "fc_y_vs__ref_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__ref,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_vs__relig                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__relig_mean
#' @format vars_fc_y_vs__relig is a character vector of all column names
#' used to compute summary score of `fc_y_vs__relig`.
vars_fc_y_vs__relig <- c(
  "fc_y_vs__relig_001",
  "fc_y_vs__relig_002",
  "fc_y_vs__relig_003",
  "fc_y_vs__relig_004",
  "fc_y_vs__relig_005",
  "fc_y_vs__relig_006",
  "fc_y_vs__relig_007"
)


#' Compute "Values Scale \[Youth\] (Religion): Mean"
#'
#' @description
#' Computes the summary score `fc_y_vs__relig_mean`
#' (Values Scale \[Youth\] (Religion): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__relig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__relig_mean <- function(
    data,
    name = "fc_y_vs__relig_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__relig,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Youth\] (Religion): Number
#'   missing"
#'
#' @description
#' Computes the summary score `fc_y_vs__relig_nm`
#' (Values Scale \[Youth\] (Religion): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__relig |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_vs__relig_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__relig_nm <- function(
    data,
    name = "fc_y_vs__relig_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__relig,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_vs__supp                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__supp_mean
#' @format vars_fc_y_vs__supp is a character vector of all column names
#' used to compute summary score of `fc_y_vs__supp`.
vars_fc_y_vs__supp <- c(
  "fc_y_vs__supp_001",
  "fc_y_vs__supp_002",
  "fc_y_vs__supp_003",
  "fc_y_vs__supp_004",
  "fc_y_vs__supp_005",
  "fc_y_vs__supp_006"
)


#' Compute "Values Scale \[Youth\] (Family support):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_y_vs__supp_mean`
#' (Values Scale \[Youth\] (Family support): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__supp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__supp_mean <- function(
    data,
    name = "fc_y_vs__supp_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__supp,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Values Scale \[Youth\] (Family support):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_vs__supp_nm`
#' (Values Scale \[Youth\] (Family support): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__supp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_vs__supp_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__supp_nm <- function(
    data,
    name = "fc_y_vs__supp_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_vs__supp,
      exclude = NULL
    )
}
#   ____________________________________________________________________________
#   fc_y_vs__famil                                                        ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__famil_mean
#' @format a character vector of all column names
#' used to compute summary score of `fc_y_vs__famil_mean` and
#' `fc_y_vs__famil_nm`.
vars_fc_y_vs__famil <- c(
  "fc_y_vs__supp_001",
  "fc_y_vs__supp_002",
  "fc_y_vs__supp_003",
  "fc_y_vs__supp_004",
  "fc_y_vs__supp_005",
  "fc_y_vs__supp_006",
  "fc_y_vs__ref_001",
  "fc_y_vs__ref_002",
  "fc_y_vs__ref_003",
  "fc_y_vs__ref_004",
  "fc_y_vs__ref_005",
  "fc_y_vs__obl_001",
  "fc_y_vs__obl_002",
  "fc_y_vs__obl_003",
  "fc_y_vs__obl_004",
  "fc_y_vs__obl_005"
)

#' Compute "Values Scale \[Youth\] (Familism):
#'   Mean - Baseline to Year 5"
#'
#' @description
#' Computes the summary score `fc_y_vs__famil_mean`
#' (Values Scale \[Youth\] (Familism): Mean - Baseline to Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__famil |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#' - *Validation criterion:*
#'    - maximally 3 of 16 items missing
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#' @param max_na numeric vector of positive whole number. Number of missing
#'   items allowed (Default: 3).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__famil_mean <- function(
    data,
    name = "fc_y_vs__famil_mean",
    max_na = 3,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::check_names(data, "session_id")

  # calculate only up to `ses-05A`
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num <= 5) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_mean(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_y_vs__famil,
      max_na  = max_na,
      events  = tmp_sessions,
      exclude = exclude
    ) |>
    compute_fc_y_vs__supp_mean(name = "tmp_supp") |>
    compute_fc_y_vs__ref_mean(name = "tmp_ref") |>
    compute_fc_y_vs__obl_mean(name = "tmp_obl") |>
    check_assign_na(
      output = name,
      input = c("tmp_supp", "tmp_ref", "tmp_obl"),
      allow_missingness = FALSE
    ) |>
    select(
      -matches("^tmp_")
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' Compute "Values Scale \[Youth\] (Familism): Number missing - Baseline to
#' Year 5"
#'
#' @description
#' Computes the summary score `fc_y_vs__famil_nm__v01`
#' (Values Scale \[Youth\] (Familism): Number missing - Baseline to Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__famil |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#'
#' @seealso [compute_fc_y_vs__famil_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__famil_nm <- function(
    data,
    name = "fc_y_vs__famil_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::check_names(data, "session_id")

  # calculate only up to `ses-05A`
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num <= 5) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_nm(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_y_vs__famil,
      events  = tmp_sessions,
      exclude = exclude
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' @export
#' @autoglobal
#' @rdname compute_fc_y_vs__famil_mean__v01
#' @format a character vector of all column names
#' used to compute summary score of `fc_y_vs__famil_mean__v01` and
#' `fc_y_vs__famil_nm__v01`.
vars_fc_y_vs__famil__v01 <- c(
  "fc_y_vs__supp_001",
  "fc_y_vs__supp_002",
  "fc_y_vs__supp_003",
  "fc_y_vs__supp_004",
  "fc_y_vs__supp_005",
  "fc_y_vs__supp_006",
  "fc_y_vs__ref_001",
  "fc_y_vs__ref_002",
  "fc_y_vs__ref_003",
  "fc_y_vs__ref_004",
  "fc_y_vs__ref_005"
)


#' Compute "Values Scale \[Youth\] (Familism):
#'   Mean - Version 1 (Year 5 onwards)"
#'
#' @description
#' Computes the summary score `fc_y_vs__famil_mean__v01`
#' (Values Scale \[Youth\] (Familism): Mean - Version 1 (Year 5 onwards))
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__famil__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#' - *Validation criterion:*
#'    - maximally 2 of 11 items missing
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#' @param max_na numeric vector of positive whole number. Number of missing
#'   items allowed (Default: 2).
#'
#' @seealso [compute_fc_y_vs__famil_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__famil_mean__v01 <- function(
    data,
    name = "fc_y_vs__famil_mean__v01",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  chk::check_names(data, "session_id")

  # calculate from `ses-06A` onwards
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num >= 6) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_mean(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_y_vs__famil__v01,
      max_na  = max_na,
      events  = tmp_sessions,
      exclude = exclude
    ) |>
    compute_fc_y_vs__supp_mean(name = "tmp_supp") |>
    compute_fc_y_vs__ref_mean(name = "tmp_ref") |>
    check_assign_na(
      output = name,
      input = c("tmp_supp", "tmp_ref"),
      allow_missingness = FALSE
    ) |>
    select(
      -matches("^tmp_")
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#' Compute "Values Scale \[Youth\] (Familism): Number missing - Version 1
#' (Year 5 onwards)"
#'
#' @description
#' Computes the summary score `fc_y_vs__famil_nm__v01`
#' (Values Scale \[Youth\] (Familism): Number missing - Version 1
#' (Year 5 onwards))
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_vs__famil__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_fc_p_vs__famil_mean
#'
#' @seealso [compute_fc_y_vs__famil_mean__v01()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_vs__famil_nm__v01 <- function(
    data,
    name = "fc_y_vs__famil_nm__v01",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::check_names(data, "session_id")

  # calculate from `ses-06A` onwards
  tmp_sessions <- data |>
    create_session_num() |>
    filter(session_num >= 6) |>
    pull(session_id) |>
    unique() |>
    as.character()

  out <- data |>
    ss_nm(
      combine = TRUE,
      name    = name,
      vars    = vars_fc_y_vs__famil__v01,
      events  = tmp_sessions,
      exclude = exclude
    )

  if (combine) {
    out
  } else {
    out |> select(!!name)
  }
}

#   ____________________________________________________________________________
#   fc_y_meim__commattach                                                   ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_meim__commattach_mean
#' @format vars_fc_y_meim__commattach is a character vector of all column names
#' used to compute summary score of `fc_y_meim__commattach`.
vars_fc_y_meim__commattach <- c(
  "fc_y_meim__commattach_001",
  "fc_y_meim__commattach_002",
  "fc_y_meim__commattach_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Commitment
#'   and attachment): Mean"
#'
#' @description
#' Computes the summary score `fc_y_meim__commattach_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Commitment and
#' attachment): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim__commattach |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim__commattach_mean <- function(
    data,
    name = "fc_y_meim__commattach_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim__commattach,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Commitment
#'   and attachment): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_meim__commattach_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Commitment and
#' attachment): Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim__commattach |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_meim__commattach_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim__commattach_nm <- function(
    data,
    name = "fc_y_meim__commattach_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim__commattach,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_meim__explor                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_meim__explor_mean
#' @format vars_fc_y_meim__explor is a character vector of all column names
#' used to compute summary score of `fc_y_meim__explor`.
vars_fc_y_meim__explor <- c(
  "fc_y_meim__explor_001",
  "fc_y_meim__explor_002",
  "fc_y_meim__explor_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\]
#'   (Exploration): Mean"
#'
#' @description
#' Computes the summary score `fc_y_meim__explor_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Exploration): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim__explor |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim__explor_mean <- function(
    data,
    name = "fc_y_meim__explor_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim__explor,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\]
#'   (Exploration): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_meim__explor_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Exploration):
#' Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim__explor |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_meim__explor_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim__explor_nm <- function(
    data,
    name = "fc_y_meim__explor_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim__explor,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_meim                                                               ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_meim_mean
#' @format vars_fc_y_meim is a character vector of all column names
#' used to compute summary score of `fc_y_meim`.
vars_fc_y_meim <- c(
  "fc_y_meim__commattach_001",
  "fc_y_meim__commattach_002",
  "fc_y_meim__commattach_003",
  "fc_y_meim__explor_001",
  "fc_y_meim__explor_002",
  "fc_y_meim__explor_003"
)


#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_meim_mean`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim_mean <- function(
    data,
    name = "fc_y_meim_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\]: Number
#'   missing"
#'
#' @description
#' Computes the summary score `fc_y_meim_nm`
#' (The Multigroup Ethnic Identity Measure-Revised \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_meim |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_meim_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_meim_nm <- function(
    data,
    name = "fc_y_meim_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_meim,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_mnbs__edusupp                                                      ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_mnbs__edusupp_mean
#' @format vars_fc_y_mnbs__edusupp is a character vector of all column names
#' used to compute summary score of `fc_y_mnbs__edusupp`.
vars_fc_y_mnbs__edusupp <- c(
  "fc_y_mnbs__edusupp_001",
  "fc_y_mnbs__edusupp_002",
  "fc_y_mnbs__edusupp_003"
)


#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\] (Education
#'   support): Mean"
#'
#' @description
#' Computes the summary score `fc_y_mnbs__edusupp_mean`
#' (Multidimensional Neglectful Behavior Scale \[Youth\] (Education support):
#' Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs__edusupp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs__edusupp_mean <- function(
    data,
    name = "fc_y_mnbs__edusupp_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs__edusupp,
      max_na  = max_na,
      exclude = c("777")
    )
}

#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\] (Education
#'   support): Number missing"
#'
#' @description
#' Computes the summary score `fc_y_mnbs__edusupp_nm`
#' (Multidimensional Neglectful Behavior Scale \[Youth\] (Education support):
#' Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs__edusupp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_mnbs__edusupp_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs__edusupp_nm <- function(
    data,
    name = "fc_y_mnbs__edusupp_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs__edusupp,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_y_mnbs__superv                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_mnbs__superv_mean
#' @format vars_fc_y_mnbs__superv is a character vector of all column names
#' used to compute summary score of `fc_y_mnbs__superv`.
vars_fc_y_mnbs__superv <- c(
  "fc_y_mnbs__superv_001",
  "fc_y_mnbs__superv_002",
  "fc_y_mnbs__superv_003",
  "fc_y_mnbs__superv_004",
  "fc_y_mnbs__superv_005"
)


#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\] (Supervision):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_y_mnbs__superv_mean`
#' (Multidimensional Neglectful Behavior Scale \[Youth\] (Supervision): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs__superv |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs__superv_mean <- function(
    data,
    name = "fc_y_mnbs__superv_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs__superv,
      max_na  = max_na,
      exclude = c("777")
    )
}

#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\] (Supervision):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_mnbs__superv_nm`
#' (Multidimensional Neglectful Behavior Scale \[Youth\] (Supervision): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs__superv |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_mnbs__superv_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs__superv_nm <- function(
    data,
    name = "fc_y_mnbs__superv_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs__superv,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_y_mnbs                                                               ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_mnbs_mean
#' @format vars_fc_y_mnbs is a character vector of all column names
#' used to compute summary score of `fc_y_mnbs`.
vars_fc_y_mnbs <- c(
  "fc_y_mnbs__edusupp_001",
  "fc_y_mnbs__edusupp_002",
  "fc_y_mnbs__edusupp_003",
  "fc_y_mnbs__superv_001",
  "fc_y_mnbs__superv_002",
  "fc_y_mnbs__superv_003",
  "fc_y_mnbs__superv_004",
  "fc_y_mnbs__superv_005"
)


#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_mnbs_mean`
#' (Multidimensional Neglectful Behavior Scale \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs_mean <- function(
    data,
    name = "fc_y_mnbs_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs,
      max_na  = max_na,
      exclude = c("777")
    )
}

#' Compute "Multidimensional Neglectful Behavior Scale \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_mnbs_nm`
#' (Multidimensional Neglectful Behavior Scale \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_mnbs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @seealso [compute_fc_y_mnbs_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_mnbs_nm <- function(
    data,
    name = "fc_y_mnbs_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_mnbs,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_y_pm                                                                 ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_pm_mean
#' @format vars_fc_y_pm is a character vector of all column names
#' used to compute summary score of `fc_y_pm`.
vars_fc_y_pm <- c(
  "fc_y_pm_001",
  "fc_y_pm_002",
  "fc_y_pm_003",
  "fc_y_pm_004",
  "fc_y_pm_005"
)


#' Compute "Parental Monitoring \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_pm_mean`
#' (Parental Monitoring \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_pm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_pm_mean <- function(
    data,
    name = "fc_y_pm_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_pm,
      max_na  = max_na,
      exclude = c("777")
    )
}

#' Compute "Parental Monitoring \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_pm_nm`
#' (Parental Monitoring \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_pm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_pm_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_pm_nm <- function(
    data,
    name = "fc_y_pm_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_pm,
      exclude = c("777")
    )
}

#   ____________________________________________________________________________
#   fc_y_pnh                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_pnh_sum
#' @format vars_fc_y_pnh is a character vector of all column names
#' used to compute summary score of `fc_y_pnh`.
vars_fc_y_pnh <- c(
  "fc_y_pnh_001",
  "fc_y_pnh_002",
  "fc_y_pnh_002__01",
  "fc_y_pnh_003",
  "fc_y_pnh_003__01"
)


#' Compute "Peer Network Health \[Youth\]: Sum"
#'
#' @description
#' Computes the summary score `fc_y_pnh_sum`
#' (Peer Network Health \[Youth\]: Sum)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_pnh |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 5 items missing
#' - *Notes:*
#'   - `fc_y_pnh_001` is scored: No = 0; Yes = 3
#'   - `fc_y_pnh_002`/`fc_y_pnh_003` are scored: No = 0; Yes = 2
#'   - `fc_y_pnh_002__01`/`fc_y_pnh_003__01` are scored with their original
#'     values (1 through 10)
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_pnh_sum <- function(
    data,
    name = "fc_y_pnh_sum",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_recoded <- data |>
    recode_levels(
      vars = "fc_y_pnh_001",
      recode = c("1" = "3")
    ) |>
    recode_levels(
      vars = c(
        "fc_y_pnh_002",
        "fc_y_pnh_003"
      ),
      recode = c("1" = "2")
    )

  data_ss <- data_recoded |>
    ss_sum(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_y_pnh,
      max_na  = max_na,
      exclude = NULL
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Peer Network Health \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_pnh_nm`
#' (Peer Network Health \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_pnh |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_pnh_sum()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_pnh_nm <- function(
    data,
    name = "fc_y_pnh_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_pnh,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_psb                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_psb_mean
#' @format vars_fc_y_psb is a character vector of all column names
#' used to compute summary score of `fc_y_psb`.
vars_fc_y_psb <- c(
  "fc_y_psb_001",
  "fc_y_psb_002",
  "fc_y_psb_003"
)


#' Compute "Prosocial Behavior \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_psb_mean`
#' (Prosocial Behavior \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_psb |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 3 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_psb_mean <- function(
    data,
    name = "fc_y_psb_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_psb,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Prosocial Behavior \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_psb_nm`
#' (Prosocial Behavior \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_psb |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_psb_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_psb_nm <- function(
    data,
    name = "fc_y_psb_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_psb,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_rpi                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_rpi_mean
#' @format vars_fc_y_rpi is a character vector of all column names
#' used to compute summary score of `fc_y_rpi`.
vars_fc_y_rpi <- c(
  "fc_y_rpi_001",
  "fc_y_rpi_002",
  "fc_y_rpi_003",
  "fc_y_rpi_004",
  "fc_y_rpi_005",
  "fc_y_rpi_006",
  "fc_y_rpi_007",
  "fc_y_rpi_008",
  "fc_y_rpi_009",
  "fc_y_rpi_010"
)


#' Compute "Resistance to Peer Influence \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_rpi_mean`
#' (Resistance to Peer Influence \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_rpi |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 3 of 10 items missing
#' - *Note:* The following variables are reverse coded before computing the
#'   summary score:
#'   - `fc_y_rpi_002`
#'   - `fc_y_rpi_006`
#'   - `fc_y_rpi_010`
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 3).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_rpi_mean <- function(
    data,
    name = "fc_y_rpi_mean",
    max_na = 3,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_recoded <- data |>
    recode_levels(
      vars = c(
        "fc_y_rpi_002",
        "fc_y_rpi_006",
        "fc_y_rpi_010"
      ),
      recode = c(
        "1" = "2",
        "2" = "1"
      )
    )

  data_ss <- data_recoded |>
    ss_mean(
      combine = FALSE,
      name    = name,
      vars    = vars_fc_y_rpi,
      max_na  = max_na,
      exclude = NULL
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Resistance to Peer Influence \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_rpi_nm`
#' (Resistance to Peer Influence \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_rpi |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_rpi_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_rpi_nm <- function(
    data,
    name = "fc_y_rpi_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_rpi,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_srpf__dis                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_srpf__dis_mean
#' @format vars_fc_y_srpf__dis is a character vector of all column names
#' used to compute summary score of `fc_y_srpf__dis`.
vars_fc_y_srpf__dis <- c(
  "fc_y_srpf__dis_001",
  "fc_y_srpf__dis_002"
)


#' Compute "School Risk & Protective Factors \[Youth\] (School disengagement):
#'   Mean"
#'
#' @description
#' Computes the summary score `fc_y_srpf__dis_mean`
#' (School Risk & Protective Factors \[Youth\] (School disengagement): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__dis |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 2 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__dis_mean <- function(
    data,
    name = "fc_y_srpf__dis_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__dis,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "School Risk & Protective Factors \[Youth\] (School disengagement):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_srpf__dis_nm`
#' (School Risk & Protective Factors \[Youth\] (School disengagement): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__dis |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_srpf__dis_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__dis_nm <- function(
    data,
    name = "fc_y_srpf__dis_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__dis,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_srpf__env                                                          ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_srpf__env_mean
#' @format vars_fc_y_srpf__env is a character vector of all column names
#' used to compute summary score of `fc_y_srpf__env`.
vars_fc_y_srpf__env <- c(
  "fc_y_srpf__env_001",
  "fc_y_srpf__env_002",
  "fc_y_srpf__env_003",
  "fc_y_srpf__env_004",
  "fc_y_srpf__env_005",
  "fc_y_srpf__env_006"
)


#' Compute "School Risk & Protective Factors \[Youth\] (School environment): Mean"
#'
#' @description
#' Computes the summary score `fc_y_srpf__env_mean`
#' (School Risk & Protective Factors \[Youth\] (School environment): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__env |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__env_mean <- function(
    data,
    name = "fc_y_srpf__env_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__env,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "School Risk & Protective Factors \[Youth\] (School environment):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_srpf__env_nm`
#' (School Risk & Protective Factors \[Youth\] (School environment): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__env |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_srpf__env_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__env_nm <- function(
    data,
    name = "fc_y_srpf__env_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__env,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_srpf__involv                                                       ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_srpf__involv_mean
#' @format vars_fc_y_srpf__involv is a character vector of all column names
#' used to compute summary score of `fc_y_srpf__involv`.
vars_fc_y_srpf__involv <- c(
  "fc_y_srpf__involv_001",
  "fc_y_srpf__involv_002",
  "fc_y_srpf__involv_003",
  "fc_y_srpf__involv_004"
)


#' Compute "School Risk & Protective Factors \[Youth\] (School involvement): Mean"
#'
#' @description
#' Computes the summary score `fc_y_srpf__involv_mean`
#' (School Risk & Protective Factors \[Youth\] (School involvement): Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__involv |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 0).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__involv_mean <- function(
    data,
    name = "fc_y_srpf__involv_mean",
    max_na = 0,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__involv,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "School Risk & Protective Factors \[Youth\] (School involvement):
#'   Number missing"
#'
#' @description
#' Computes the summary score `fc_y_srpf__involv_nm`
#' (School Risk & Protective Factors \[Youth\] (School involvement): Number
#' missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_srpf__involv |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_srpf__involv_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_srpf__involv_nm <- function(
    data,
    name = "fc_y_srpf__involv_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_srpf__involv,
      exclude = NULL
    )
}

#   ____________________________________________________________________________
#   fc_y_wpss                                                               ####

#' @export
#' @autoglobal
#' @rdname compute_fc_y_wpss_mean
#' @format vars_fc_y_wpss is a character vector of all column names
#' used to compute summary score of `fc_y_wpss`.
vars_fc_y_wpss <- c(
  "fc_y_wpss_001",
  "fc_y_wpss_002",
  "fc_y_wpss_003",
  "fc_y_wpss_004",
  "fc_y_wpss_005",
  "fc_y_wpss_006"
)


#' Compute "Wills Problem Solving Scale \[Youth\]: Mean"
#'
#' @description
#' Computes the summary score `fc_y_wpss_mean`
#' (Wills Problem Solving Scale \[Youth\]: Mean)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_wpss |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 1).
#'
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_wpss_mean <- function(
    data,
    name = "fc_y_wpss_mean",
    max_na = 1,
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data |>
    ss_mean(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_wpss,
      max_na  = max_na,
      exclude = NULL
    )
}

#' Compute "Wills Problem Solving Scale \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `fc_y_wpss_nm`
#' (Wills Problem Solving Scale \[Youth\]: Number missing)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_fc_y_wpss |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score. Default is the name in
#' the description.
#' @param combine logical. If `TRUE`, the summary score is appended to the
#' input data frame. If `FALSE`, the summary score is returned as a separate
#' data frame. Default is `TRUE`.
#'
#' @seealso [compute_fc_y_wpss_mean()]
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#'
#' @export
#' @autoglobal
compute_fc_y_wpss_nm <- function(
    data,
    name = "fc_y_wpss_nm",
    combine = TRUE) {
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::chk_data(data)

  data |>
    ss_nm(
      combine = combine,
      name    = name,
      vars    = vars_fc_y_wpss,
      exclude = NULL
    )
}


# all functions ----------------------------------------------------------------

#' Compute all the fc_p_fes summary scores
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
#' compute_fc_p_fes_all(data)
#' }
compute_fc_p_fes_all <- function(data) {
  data |>
    compute_fc_p_fes__cohes_mean() |>
    compute_fc_p_fes__cohes_nm() |>
    compute_fc_p_fes__confl_mean() |>
    compute_fc_p_fes__confl_nm() |>
    compute_fc_p_fes__expr_mean() |>
    compute_fc_p_fes__expr_nm() |>
    compute_fc_p_fes__intelcult_mean() |>
    compute_fc_p_fes__intelcult_nm() |>
    compute_fc_p_fes__org_mean() |>
    compute_fc_p_fes__org_nm() |>
    compute_fc_p_fes__rec_mean() |>
    compute_fc_p_fes__rec_nm()
}


#' Compute all the fc_p_vs summary scores
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
#' compute_fc_p_vs_all(data)
#' }
compute_fc_p_vs_all <- function(data) {
  data |>
    compute_fc_p_vs__indselfrel_mean() |>
    compute_fc_p_vs__indselfrel_nm() |>
    compute_fc_p_vs__obl_mean() |>
    compute_fc_p_vs__obl_nm() |>
    compute_fc_p_vs__ref_mean() |>
    compute_fc_p_vs__ref_nm() |>
    compute_fc_p_vs__relig_mean() |>
    compute_fc_p_vs__relig_nm() |>
    compute_fc_p_vs__supp_mean() |>
    compute_fc_p_vs__supp_nm() |>
    compute_fc_p_vs__famil_mean() |>
    compute_fc_p_vs__famil_nm() |>
    compute_fc_p_vs__famil_mean__v01() |>
    compute_fc_p_vs__famil_nm__v01()
}

#' Compute all the fc_p_meim summary scores
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
#' compute_fc_p_meim_all(data)
#' }
compute_fc_p_meim_all <- function(data) {
  data |>
    compute_fc_p_meim__commattach_mean() |>
    compute_fc_p_meim__commattach_nm() |>
    compute_fc_p_meim__explor_mean() |>
    compute_fc_p_meim__explor_nm() |>
    compute_fc_p_meim_mean() |>
    compute_fc_p_meim_nm()
}

#' Compute all the fc_p_nce summary scores
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
#' compute_fc_p_nce_all(data)
#' }
compute_fc_p_nce_all <- function(data) {
  data |>
    compute_fc_p_nce__cc_mean() |>
    compute_fc_p_nce__cc_nm() |>
    compute_fc_p_nce__isc_mean() |>
    compute_fc_p_nce__isc_nm() |>
    compute_fc_p_nce_mean() |>
    compute_fc_p_nce_nm()
}

#' Compute all the fc_p_nsc summary scores
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
#' compute_fc_p_nsc_all(data)
#' }
compute_fc_p_nsc_all <- function(data) {
  data |>
    compute_fc_p_nsc__ns_mean() |>
    compute_fc_p_nsc__ns_nm()
}

#' Compute all the fc_p_pk summary scores
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
#' compute_fc_p_pk_all(data)
#' }
compute_fc_p_pk_all <- function(data) {
  data |>
    compute_fc_p_pk__knowl_mean() |>
    compute_fc_p_pk__knowl_nm()
}

#' Compute all the fc_p_psb summary scores
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
#' compute_fc_p_psb_all(data)
#' }
compute_fc_p_psb_all <- function(data) {
  data |>
    compute_fc_p_psb_mean() |>
    compute_fc_p_psb_nm()
}

#' Compute all the fc_y_as summary scores
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
#' compute_fc_y_as_all(data)
#' }
compute_fc_y_as_all <- function(data) {
  data |>
    compute_fc_y_as__safe_mean() |>
    compute_fc_y_as__safe_nm()
}

#' Compute all the fc_y_crpbi summary scores
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
#' compute_fc_y_crpbi_all(data)
#' }
compute_fc_y_crpbi_all <- function(data) {
  data |>
    compute_fc_y_crpbi__cg1_mean() |>
    compute_fc_y_crpbi__cg1_nm() |>
    compute_fc_y_crpbi__cg2_mean() |>
    compute_fc_y_crpbi__cg2_nm()
}

#' Compute all the fc_y_eut summary scores
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
#' compute_fc_y_eut_all(data)
#' }
compute_fc_y_eut_all <- function(data) {
  data |>
    compute_fc_y_eut__ethn_mean() |>
    compute_fc_y_eut__ethn_nm()
}

#' Compute all the fc_y_fes summary scores
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
#' compute_fc_y_fes_all(data)
#' }
compute_fc_y_fes_all <- function(data) {
  data |>
    compute_fc_y_fes__cohes_mean() |>
    compute_fc_y_fes__cohes_nm() |>
    compute_fc_y_fes__confl_mean() |>
    compute_fc_y_fes__confl_nm()
}

#' Compute all the fc_y_vs summary scores
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
#' compute_fc_y_vs_all(data)
#' }
compute_fc_y_vs_all <- function(data) {
  data |>
    compute_fc_y_vs__indselfrel_mean() |>
    compute_fc_y_vs__indselfrel_nm() |>
    compute_fc_y_vs__obl_mean() |>
    compute_fc_y_vs__obl_nm() |>
    compute_fc_y_vs__ref_mean() |>
    compute_fc_y_vs__ref_nm() |>
    compute_fc_y_vs__relig_mean() |>
    compute_fc_y_vs__relig_nm() |>
    compute_fc_y_vs__supp_mean() |>
    compute_fc_y_vs__supp_nm() |>
    compute_fc_y_vs__famil_mean() |>
    compute_fc_y_vs__famil_nm() |>
    compute_fc_y_vs__famil_mean__v01() |>
    compute_fc_y_vs__famil_nm__v01()
}

#' Compute all the fc_y_meim summary scores
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
#' compute_fc_y_meim_all(data)
#' }
compute_fc_y_meim_all <- function(data) {
  data |>
    compute_fc_y_meim__commattach_mean() |>
    compute_fc_y_meim__commattach_nm() |>
    compute_fc_y_meim__explor_mean() |>
    compute_fc_y_meim__explor_nm() |>
    compute_fc_y_meim_mean() |>
    compute_fc_y_meim_nm()
}

#' Compute all the fc_y_mnbs summary scores
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
#' compute_fc_y_mnbs_all(data)
#' }
compute_fc_y_mnbs_all <- function(data) {
  data |>
    compute_fc_y_mnbs__edusupp_mean() |>
    compute_fc_y_mnbs__edusupp_nm() |>
    compute_fc_y_mnbs__superv_mean() |>
    compute_fc_y_mnbs__superv_nm() |>
    compute_fc_y_mnbs_mean() |>
    compute_fc_y_mnbs_nm()
}

#' Compute all the fc_y_pm summary scores
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
#' compute_fc_y_pm_all(data)
#' }
compute_fc_y_pm_all <- function(data) {
  data |>
    compute_fc_y_pm_mean() |>
    compute_fc_y_pm_nm()
}

#' Compute all the fc_y_pnh summary scores
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
#' compute_fc_y_pnh_all(data)
#' }
compute_fc_y_pnh_all <- function(data) {
  data |>
    compute_fc_y_pnh_sum() |>
    compute_fc_y_pnh_nm()
}

#' Compute all the fc_y_psb summary scores
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
#' compute_fc_y_psb_all(data)
#' }
compute_fc_y_psb_all <- function(data) {
  data |>
    compute_fc_y_psb_mean() |>
    compute_fc_y_psb_nm()
}

#' Compute all the fc_y_rpi summary scores
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
#' compute_fc_y_rpi_all(data)
#' }
compute_fc_y_rpi_all <- function(data) {
  data |>
    compute_fc_y_rpi_mean() |>
    compute_fc_y_rpi_nm()
}

#' Compute all the fc_y_srpf summary scores
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
#' compute_fc_y_srpf_all(data)
#' }
compute_fc_y_srpf_all <- function(data) {
  data |>
    compute_fc_y_srpf__dis_mean() |>
    compute_fc_y_srpf__dis_nm() |>
    compute_fc_y_srpf__env_mean() |>
    compute_fc_y_srpf__env_nm() |>
    compute_fc_y_srpf__involv_mean() |>
    compute_fc_y_srpf__involv_nm()
}

#' Compute all the fc_y_wpss summary scores
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
#' compute_fc_y_wpss_all(data)
#' }
compute_fc_y_wpss_all <- function(data) {
  data |>
    compute_fc_y_wpss_mean() |>
    compute_fc_y_wpss_nm()
}
