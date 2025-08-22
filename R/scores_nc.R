# fmt: skip file

#' @export
#' @autoglobal
#' @rdname compute_nc_p_bdefs_sum
#' @format vars_nc_p_bdefs is a character vector of all column names
#' used to compute summary scores of `nc_p_bdefs`.
vars_nc_p_bdefs <- c(
  "nc_p_bdefs_001",
  "nc_p_bdefs_002",
  "nc_p_bdefs_003",
  "nc_p_bdefs_004",
  "nc_p_bdefs_005",
  "nc_p_bdefs_006",
  "nc_p_bdefs_007",
  "nc_p_bdefs_008",
  "nc_p_bdefs_009",
  "nc_p_bdefs_010",
  "nc_p_bdefs_011",
  "nc_p_bdefs_012",
  "nc_p_bdefs_013",
  "nc_p_bdefs_014",
  "nc_p_bdefs_015",
  "nc_p_bdefs_016",
  "nc_p_bdefs_017",
  "nc_p_bdefs_018",
  "nc_p_bdefs_019",
  "nc_p_bdefs_020"
)

#' Compute "Barkley Deficits in Executive Functioning Scale \[Parent\] (EF
#' Summary Score): Sum"
#' @description
#' Computes the summary score `nc_p_bdefs_sum`
#' Barkley Deficits in Executive Functioning Scale \[Parent\] (EF Summary
#' Score): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_nc_p_bdefs |> md_bullet(2, TRUE)
#'   ```
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param max_na integer, Maximum number of missing values allowed in the
#' summary score. `NULL` means no limit.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#' the input data frame. If `FALSE`, the summary score will be returned as a
#' separate data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_nc_p_bdefs_sum(data) |>
#'   select(
#'     data,
#'     all_of(c("nc_p_bdefs_sum", vars_nc_p_bdefs))
#'   )
#' }
compute_nc_p_bdefs_sum <- function(
    data,
    name = "nc_p_bdefs_sum",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_nc_p_bdefs,
      max_na  = max_na,
      exclude = c("777"),
      combine = combine
    )
}

#' Compute "Barkley Deficits in Executive Functioning Scale \[Parent\] (EF
#' Summary Score): Number missing"
#' @description
#' Computes the summary score `nc_p_bdefs_nm`
#' Barkley Deficits in Executive Functioning Scale \[Parent\] (EF Summary
#' Score): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_nc_p_bdefs |> md_bullet(2, TRUE)
#'  ```
#'
#' @inherit compute_nc_p_bdefs_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_nc_p_bdefs_sum()]
#' @examples
#' \dontrun{
#' compute_nc_p_bdefs_nm(data) |>
#'   select(
#'     data,
#'     all_of(c("nc_p_bdefs_nm", vars_nc_p_bdefs))
#'   )
#' }
compute_nc_p_bdefs_nm <- function(
    data,
    name = "nc_p_bdefs_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_nc_p_bdefs,
      exclude = c("777"),
      combine = combine
    )
}

#' Compute "Barkley Deficits in Executive Functioning Scale \[Parent\] (EF
#' Symptom Count, number of answers of 3 or 4): Count"
#' @description
#' Computes the summary score `nc_p_bdefs__sympt_count`
#' Barkley Deficits in Executive Functioning Scale \[Parent\] (EF Symptom
#' Count, number of answers of 3 or 4): Count
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_nc_p_bdefs |> md_bullet(2, TRUE)
#'  ```
#'
#' @inherit compute_nc_p_bdefs_sum params return
#' @export
#' @autoglobal
#' @seealso [compute_nc_p_bdefs_sum()]
#' @examples
#' \dontrun{
#' compute_nc_p_bdefs__sympt_count(data) |>
#'   select(
#'     data,
#'     all_of(c("nc_p_bdefs__sympt_count", vars_nc_p_bdefs))
#'   )
#' }
compute_nc_p_bdefs__sympt_count <- function(
    data,
    name = "nc_p_bdefs__sympt_count",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  check_col_names(data, name)

  data_ss <- data |>
    select(all_of(vars_nc_p_bdefs)) |>
    mutate(
      across(
        everything(),
        ~ if_else(
          .x == "777",
          NA_character_,
          .x
        )
      ),
      "{name}" := if_else(
        rowSums(across(everything(), is.na)) > max_na,
        NA_real_,
        rowSums(
          across(everything(), ~ .x %in% c("3", "4")),
        )
      ) |>
        as.integer()
    ) |>
    select(all_of(name))

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute all the BDEFS summary scores
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
#' compute_nc_p_bdefs_all(data)
#' }
compute_nc_p_bdefs_all <- function(data) {
  data |>
    compute_nc_p_bdefs_sum() |>
    compute_nc_p_bdefs_nm() |>
    compute_nc_p_bdefs__sympt_count()
}


# nc_y_ehis ---------------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_nc_y_ehis_score
#' @format vars_nc_y_ehis is a character vector of all column names
#' used to compute summary scores of `nc_y_ehis`.
vars_nc_y_ehis <- c(
  "nc_y_ehis_001",
  "nc_y_ehis_002",
  "nc_y_ehis_003",
  "nc_y_ehis_004"
)

#' Compute "Edinburgh Handedness Inventory \[Youth\] (Handedness score rating)"
#' @description
#' Computes the summary score `nc_y_ehis_score`
#' Edinburgh Handedness Inventory \[Youth\] (Handedness score rating)
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_nc_y_ehis |> md_bullet(2, TRUE)
#'    ```
#'
#' @inherit compute_nc_p_bdefs_sum params return
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_nc_y_ehis_score(data) |>
#'   select(
#'     data,
#'     all_of(c("nc_y_ehis_score", vars_nc_y_ehis))
#'   )
#' }
compute_nc_y_ehis_score <- function(
    data,
    name = "nc_y_ehis_score",
    max_na = 0,
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_nc_y_ehis)
  check_col_names(data, name)

  data_ss <- data |>
    ss_mean(
      name = "nc_y_ehis_mean",
      vars = vars_nc_y_ehis,
      max_na = max_na,
      combine = FALSE
    ) |>
    mutate(
      "{name}" := case_when(
        nc_y_ehis_mean < -59 ~ "2",
        nc_y_ehis_mean >= -59 & nc_y_ehis_mean < 60 ~ "3",
        nc_y_ehis_mean >= 60 ~ "1",
        .default = NA_character_
      )
    ) |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Edinburgh Handedness Inventory \[Youth\]: Number missing"
#' @description
#' Computes the summary score `nc_y_ehis_nm`
#' Edinburgh Handedness Inventory \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_nc_y_ehis |> md_bullet(2, TRUE)
#'    ```
#'
#' @inherit compute_nc_p_bdefs_sum params return
#' @seealso [compute_nc_y_ehis_score()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_nc_y_ehis_nm(data) |>
#'   select(
#'     data,
#'     all_of(c("nc_y_ehis_nm", vars_nc_y_ehis))
#'   )
#' }
compute_nc_y_ehis_nm <- function(
    data,
    name = "nc_y_ehis_nm",
    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_nc_y_ehis)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_nc_y_ehis,
      exclude = c("777"),
      combine = combine
    )
}


#' Compute all the EHIS summary scores
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
#' compute_nc_y_ehis_all(data)
#' }
compute_nc_y_ehis_all <- function(data) {
  data |>
    compute_nc_y_ehis_score() |>
    compute_nc_y_ehis_nm()
}
