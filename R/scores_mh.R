# fmt: skip file

#' Dummy function for all MH summary score functions.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score column.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit.
#' @param combine logical. If `TRUE` (default), the summary score is
#' is appended as a new column to the input data frame. If `FALSE`, the
#' summary score is returned as a separate one-column data frame.
#' @param exclude character vector. Values to be excluded from the summary
#' score calculation.
#' @param event character. Event (session ID) to be used.
#' @param events character vector. Event (session ID) to be used.
#' @return tbl. see `combine`.
#' @keywords internal
dummy_mh <- function(data, name, max_na, combine, exclude, event, events) {}

# mh_p_ders__attun -------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_ders__attun_mean
#' @format `vars_mh_p_ders__attun` is vector of all column names
#' used to compute summary score of `mh_p_ders__attun` scores.
vars_mh_p_ders__attun <- c(
  "mh_p_ders__attun_001",
  "mh_p_ders__attun_002",
  "mh_p_ders__attun_003",
  "mh_p_ders__attun_004",
  "mh_p_ders__attun_005",
  "mh_p_ders__attun_006"
)


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Attuned): Mean"
#'
#' @description
#' Computes the summary score `mh_p_ders__attun_mean`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Attuned): Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__attun |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__attun_mean(data) |>
#'   select(
#'     any_of(c("mh_p_ders__attun_mean", vars_mh_p_ders__attun))
#'   )
#' }
compute_mh_p_ders__attun_mean <- function(
  data,
  name = "mh_p_ders__attun_mean",
  max_na = 1,
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data_ss <- data |>
    recode_levels(
      vars = vars_mh_p_ders__attun,
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    ) |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_ders__attun,
      max_na  = max_na,
      exclude = exclude,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Attuned):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_ders__attun_nm`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Attuned): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__attun |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_ders__attun_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__attun_nm(data) |>
#'   select(
#'     any_of(c("mh_p_ders__attun_nm", vars_mh_p_ders__attun))
#'   )
#' }
compute_mh_p_ders__attun_nm <- function(
  data,
  name = "mh_p_ders__attun_nm",
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ders__attun,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_ders__catast ------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_ders__catast_mean
#' @format `vars_mh_p_ders__catast` is vector of all column names
#' used to compute summary score of `mh_p_ders__catast` scores.
vars_mh_p_ders__catast <- c(
  "mh_p_ders__catast_001",
  "mh_p_ders__catast_002",
  "mh_p_ders__catast_003",
  "mh_p_ders__catast_004",
  "mh_p_ders__catast_005",
  "mh_p_ders__catast_006",
  "mh_p_ders__catast_007",
  "mh_p_ders__catast_008",
  "mh_p_ders__catast_009",
  "mh_p_ders__catast_010",
  "mh_p_ders__catast_011",
  "mh_p_ders__catast_012"
)


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize):
#' Mean"
#'
#' @description
#' Computes the summary score `mh_p_ders__catast_mean`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize):
#' Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__catast |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#' - *Validation criterion:* maximally 2 of 12 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__catast_mean(data) |>
#'   select(
#'     any_of(c("mh_p_ders__catast_mean", vars_mh_p_ders__catast))
#'   )
#' }
compute_mh_p_ders__catast_mean <- function(
  data,
  name = "mh_p_ders__catast_mean",
  max_na = 2,
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data_ss <- data |>
    recode_levels(
      vars = c("mh_p_ders__catast_006", "mh_p_ders__catast_007"),
      recode = c(
        "1" = "5",
        "2" = "4",
        "4" = "2",
        "5" = "1"
      )
    ) |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_ders__catast,
      max_na  = max_na,
      exclude = exclude,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_ders__catast_nm`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__catast |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_ders__catast_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__catast_nm(data) |>
#'   select(
#'     any_of(c("mh_p_ders__catast_nm", vars_mh_p_ders__catast))
#'   )
#' }
compute_mh_p_ders__catast_nm <- function(
  data,
  name = "mh_p_ders__catast_nm",
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ders__catast,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_ders__distract ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_ders__distract_mean
#' @format `vars_mh_p_ders__distract` is vector of all column names
#' used to compute summary score of `mh_p_ders__distract` scores.
vars_mh_p_ders__distract <- c(
  "mh_p_ders__distract_001",
  "mh_p_ders__distract_002",
  "mh_p_ders__distract_003",
  "mh_p_ders__distract_004"
)


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Distracted):
#' Mean"
#'
#' @description
#' Computes the summary score `mh_p_ders__distract_mean`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Distracted): Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__distract |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__distract_mean(data) |>
#'   select(
#'     any_of(c("mh_p_ders__distract_mean", vars_mh_p_ders__distract))
#'   )
#' }
compute_mh_p_ders__distract_mean <- function(
  data,
  name = "mh_p_ders__distract_mean",
  max_na = 0,
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_ders__distract,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Distracted):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_ders__distract_nm`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Distracted): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__distract |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_ders__distract_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__distract_nm(data) |>
#'   select(
#'     any_of(c("mh_p_ders__distract_nm", vars_mh_p_ders__distract))
#'   )
#' }
compute_mh_p_ders__distract_nm <- function(
  data,
  name = "mh_p_ders__distract_nm",
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ders__distract,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_ders__negscnd -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_ders__negscnd_mean
#' @format `vars_mh_p_ders__negscnd` is vector of all column names
#' used to compute summary score of `mh_p_ders__negscnd` scores.
vars_mh_p_ders__negscnd <- c(
  "mh_p_ders__negscnd_001",
  "mh_p_ders__negscnd_002",
  "mh_p_ders__negscnd_003",
  "mh_p_ders__negscnd_004",
  "mh_p_ders__negscnd_005",
  "mh_p_ders__negscnd_006",
  "mh_p_ders__negscnd_007"
)


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Negative
#' Secondary): Mean"
#'
#' @description
#' Computes the summary score `mh_p_ders__negscnd_mean`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Negative
#' Secondary): Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__negscnd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__negscnd_mean(data) |>
#'   select(
#'     any_of(c("mh_p_ders__negscnd_mean", vars_mh_p_ders__negscnd))
#'   )
#' }
compute_mh_p_ders__negscnd_mean <- function(
  data,
  name = "mh_p_ders__negscnd_mean",
  max_na = 1,
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_ders__negscnd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Negative
#' Secondary): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_ders__negscnd_nm`
#' Difficulties in Emotion Regulation Scale \[Parent\] (Negative
#' Secondary): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ders__negscnd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 999
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_ders__negscnd_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders__negscnd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_ders__negscnd_nm", vars_mh_p_ders__negscnd))
#'   )
#' }
compute_mh_p_ders__negscnd_nm <- function(
  data,
  name = "mh_p_ders__negscnd_nm",
  exclude = c("999", "777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ders__negscnd,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_ders all ----------------------------------------------------------------
#' Compute all summary scores for mh_p_ders.
#' @description
#' This function computes all summary scores for the mh_p_ders table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ders_all(data)
#' }
compute_mh_p_ders_all <- function(data) {
  data |>
    compute_mh_p_ders__attun_mean() |>
    compute_mh_p_ders__attun_nm() |>
    compute_mh_p_ders__catast_mean() |>
    compute_mh_p_ders__catast_nm() |>
    compute_mh_p_ders__distract_mean() |>
    compute_mh_p_ders__distract_nm() |>
    compute_mh_p_ders__negscnd_mean() |>
    compute_mh_p_ders__negscnd_nm()
}
# mh_p_gbi ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_gbi_nm
#' @format `vars_mh_p_gbi` is vector of all column names
#' used to compute summary score of `mh_p_gbi` scores.
vars_mh_p_gbi <- c(
  "mh_p_gbi_001",
  "mh_p_gbi_002",
  "mh_p_gbi_003",
  "mh_p_gbi_004",
  "mh_p_gbi_005",
  "mh_p_gbi_006",
  "mh_p_gbi_007",
  "mh_p_gbi_008",
  "mh_p_gbi_009",
  "mh_p_gbi_010"
)


#' Compute "Parent General Behavior Inventory \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_p_gbi_nm`
#' Parent General Behavior Inventory \[Parent\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_gbi |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_gbi_nm(data) |>
#'   select(
#'     any_of(c("mh_p_gbi_nm", vars_mh_p_gbi))
#'   )
#' }
compute_mh_p_gbi_nm <- function(
  data,
  name = "mh_p_gbi_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_gbi,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Parent General Behavior Inventory \[Parent\]: Sum"
#'
#' @description
#' Computes the summary score `mh_p_gbi_sum`
#' Parent General Behavior Inventory \[Parent\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_gbi |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 10 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_gbi_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_gbi_sum(data) |>
#'   select(
#'     any_of(c("mh_p_gbi_sum", vars_mh_p_gbi))
#'   )
#' }
compute_mh_p_gbi_sum <- function(
  data,
  name = "mh_p_gbi_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_gbi,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_gbi all -----------------------------------------------------------------
#' Compute all summary scores for mh_p_gbi.
#' @description
#' This function computes all summary scores for the mh_p_gbi table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_gbi_all(data)
#' }
compute_mh_p_gbi_all <- function(data) {
  data |>
    compute_mh_p_gbi_nm() |>
    compute_mh_p_gbi_sum()
}
# mh_p_ssrs --------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_ssrs_nm
#' @format `vars_mh_p_ssrs` is vector of all column names
#' used to compute summary score of `mh_p_ssrs` scores.
vars_mh_p_ssrs <- c(
  "mh_p_ssrs_001",
  "mh_p_ssrs_002",
  "mh_p_ssrs_003",
  "mh_p_ssrs_004",
  "mh_p_ssrs_005",
  "mh_p_ssrs_006",
  "mh_p_ssrs_007",
  "mh_p_ssrs_008",
  "mh_p_ssrs_009",
  "mh_p_ssrs_010",
  "mh_p_ssrs_011"
)


#' Compute "Short Social Responsiveness Scale \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_p_ssrs_nm`
#' Short Social Responsiveness Scale \[Parent\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ssrs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ssrs_nm(data) |>
#'   select(
#'     any_of(c("mh_p_ssrs_nm", vars_mh_p_ssrs))
#'   )
#' }
compute_mh_p_ssrs_nm <- function(
  data,
  name = "mh_p_ssrs_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ssrs,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Short Social Responsiveness Scale \[Parent\]: Sum"
#'
#' @description
#' Computes the summary score `mh_p_ssrs_sum`
#' Short Social Responsiveness Scale \[Parent\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ssrs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 11 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_p_ssrs_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ssrs_sum(data) |>
#'   select(
#'     any_of(c("mh_p_ssrs_sum", vars_mh_p_ssrs))
#'   )
#' }
compute_mh_p_ssrs_sum <- function(
  data,
  name = "mh_p_ssrs_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ssrs,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_ssrs all ----------------------------------------------------------------
#' Compute all summary scores for mh_p_ssrs.
#' @description
#' This function computes all summary scores for the mh_p_ssrs table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ssrs_all(data)
#' }
compute_mh_p_ssrs_all <- function(data) {
  data |>
    compute_mh_p_ssrs_nm() |>
    compute_mh_p_ssrs_sum()
}
# mh_y_bisbas__bas__dr ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bas__dr_nm
#' @format `vars_mh_y_bisbas__bas__dr` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bas__dr` scores.
vars_mh_y_bisbas__bas__dr <- c(
  "mh_y_bisbas__bas__dr_001",
  "mh_y_bisbas__bas__dr_002",
  "mh_y_bisbas__bas__dr_003",
  "mh_y_bisbas__bas__dr_004"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Drive): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__dr_nm`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Drive): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__dr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__dr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__dr_nm", vars_mh_y_bisbas__bas__dr))
#'   )
#' }
compute_mh_y_bisbas__bas__dr_nm <- function(
  data,
  name = "mh_y_bisbas__bas__dr_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__dr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Drive): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__dr_sum`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Drive): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__dr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bas__dr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__dr_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__dr_sum", vars_mh_y_bisbas__bas__dr))
#'   )
#' }
compute_mh_y_bisbas__bas__dr_sum <- function(
  data,
  name = "mh_y_bisbas__bas__dr_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__dr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas__bas__fs ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bas__fs_nm
#' @format `vars_mh_y_bisbas__bas__fs` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bas__fs` scores.
vars_mh_y_bisbas__bas__fs <- c(
  "mh_y_bisbas__bas__fs_001",
  "mh_y_bisbas__bas__fs_002",
  "mh_y_bisbas__bas__fs_003",
  "mh_y_bisbas__bas__fs_004"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Fun Seeking): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__fs_nm`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Fun Seeking): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__fs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__fs_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__fs_nm", vars_mh_y_bisbas__bas__fs))
#'   )
#' }
compute_mh_y_bisbas__bas__fs_nm <- function(
  data,
  name = "mh_y_bisbas__bas__fs_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__fs,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Fun Seeking): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__fs_sum`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Fun Seeking): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__fs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bas__fs_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__fs_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__fs_sum", vars_mh_y_bisbas__bas__fs))
#'   )
#' }
compute_mh_y_bisbas__bas__fs_sum <- function(
  data,
  name = "mh_y_bisbas__bas__fs_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__fs,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas__bas__rr ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bas__rr_nm
#' @format `vars_mh_y_bisbas__bas__rr` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bas__rr` scores.
vars_mh_y_bisbas__bas__rr <- c(
  "mh_y_bisbas__bas__rr_001",
  "mh_y_bisbas__bas__rr_002",
  "mh_y_bisbas__bas__rr_003",
  "mh_y_bisbas__bas__rr_004",
  "mh_y_bisbas__bas__rr_005"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Reward Responsiveness): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__rr_nm`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Reward Responsiveness): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__rr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__rr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__rr_nm", vars_mh_y_bisbas__bas__rr))
#'   )
#' }
compute_mh_y_bisbas__bas__rr_nm <- function(
  data,
  name = "mh_y_bisbas__bas__rr_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__rr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BAS Reward Responsiveness): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__rr_sum`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BAS Reward Responsiveness): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__rr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 5 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bas__rr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__rr_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__rr_sum", vars_mh_y_bisbas__bas__rr))
#'   )
#' }
compute_mh_y_bisbas__bas__rr_sum <- function(
  data,
  name = "mh_y_bisbas__bas__rr_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__rr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas__bas__rr__v01 ----------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bas__rr_nm__v01
#' @format `vars_mh_y_bisbas__bas__rr__v01` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bas__rr__v01` scores.
vars_mh_y_bisbas__bas__rr__v01 <- c(
  "mh_y_bisbas__bas__rr_001",
  "mh_y_bisbas__bas__rr_002",
  "mh_y_bisbas__bas__rr_004",
  "mh_y_bisbas__bas__rr_005"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] ((BAS Reward Responsiveness (modified)): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__rr_nm__v01`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] ((BAS Reward Responsiveness (modified)): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__rr__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__rr_nm__v01(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__rr_nm__v01", vars_mh_y_bisbas__bas__rr__v01))
#'   )
#' }
compute_mh_y_bisbas__bas__rr_nm__v01 <- function(
  data,
  name = "mh_y_bisbas__bas__rr_nm__v01",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__rr__v01,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] ((BAS Reward Responsiveness (modified)): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bas__rr_sum__v01`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] ((BAS Reward Responsiveness (modified)): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bas__rr__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bas__rr_nm__v01()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bas__rr_sum__v01(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bas__rr_sum__v01", vars_mh_y_bisbas__bas__rr__v01))
#'   )
#' }
compute_mh_y_bisbas__bas__rr_sum__v01 <- function(
  data,
  name = "mh_y_bisbas__bas__rr_sum__v01",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bas__rr__v01,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas__bis -------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bis_nm
#' @format `vars_mh_y_bisbas__bis` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bis` scores.
vars_mh_y_bisbas__bis <- c(
  "mh_y_bisbas__bis_001",
  "mh_y_bisbas__bis_002",
  "mh_y_bisbas__bis_003",
  "mh_y_bisbas__bis_004",
  "mh_y_bisbas__bis_005",
  "mh_y_bisbas__bis_006",
  "mh_y_bisbas__bis_007"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BIS): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bis_nm`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BIS): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bis |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bis_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bis_nm", vars_mh_y_bisbas__bis))
#'   )
#' }
compute_mh_y_bisbas__bis_nm <- function(
  data,
  name = "mh_y_bisbas__bis_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bis,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BIS): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bis_sum`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BIS): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bis |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 7 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bis_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bis_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bis_sum", vars_mh_y_bisbas__bis))
#'   )
#' }
compute_mh_y_bisbas__bis_sum <- function(
  data,
  name = "mh_y_bisbas__bis_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bis,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas__bis__v01 --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bisbas__bis_nm__v01
#' @format `vars_mh_y_bisbas__bis__v01` is vector of all column names
#' used to compute summary score of `mh_y_bisbas__bis__v01` scores.
vars_mh_y_bisbas__bis__v01 <- c(
  "mh_y_bisbas__bis_002",
  "mh_y_bisbas__bis_003",
  "mh_y_bisbas__bis_004",
  "mh_y_bisbas__bis_006"
)


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BIS (modified)): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bis_nm__v01`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BIS (modified)): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bis__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bis_nm__v01(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bis_nm__v01", vars_mh_y_bisbas__bis__v01))
#'   )
#' }
compute_mh_y_bisbas__bis_nm__v01 <- function(
  data,
  name = "mh_y_bisbas__bis_nm__v01",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bisbas__bis__v01,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "The Behavioral Inhibition System/Behavioral Activation System
#' Scales \[Youth\] (BIS (modified)): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bisbas__bis_sum__v01`
#' The Behavioral Inhibition System/Behavioral Activation System Scales
#' \[Youth\] (BIS (modified)): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bisbas__bis__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_bisbas__bis_nm__v01()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas__bis_sum__v01(data) |>
#'   select(
#'     any_of(c("mh_y_bisbas__bis_sum__v01", vars_mh_y_bisbas__bis__v01))
#'   )
#' }
compute_mh_y_bisbas__bis_sum__v01 <- function(
  data,
  name = "mh_y_bisbas__bis_sum__v01",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bisbas__bis__v01,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_bisbas all --------------------------------------------------------------
#' Compute all summary scores for mh_y_bisbas.
#' @description
#' This function computes all summary scores for the mh_y_bisbas table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bisbas_all(data)
#' }
compute_mh_y_bisbas_all <- function(data) {
  data |>
    # compute_mh_y_bisbas__bas__dr_nm__v01() |>
    # compute_mh_y_bisbas__bas__dr_sum__v01() |>
    compute_mh_y_bisbas__bas__dr_nm() |>
    compute_mh_y_bisbas__bas__dr_sum() |>
    compute_mh_y_bisbas__bas__fs_nm() |>
    compute_mh_y_bisbas__bas__fs_sum() |>
    compute_mh_y_bisbas__bas__rr_nm__v01() |>
    compute_mh_y_bisbas__bas__rr_sum__v01() |>
    compute_mh_y_bisbas__bas__rr_nm() |>
    compute_mh_y_bisbas__bas__rr_sum() |>
    compute_mh_y_bisbas__bis_nm__v01() |>
    compute_mh_y_bisbas__bis_sum__v01() |>
    compute_mh_y_bisbas__bis_nm() |>
    compute_mh_y_bisbas__bis_sum()
}
# mh_y_erq__reapp --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_erq__reapp_mean
#' @format `vars_mh_y_erq__reapp` is vector of all column names
#' used to compute summary score of `mh_y_erq__reapp` scores.
vars_mh_y_erq__reapp <- c(
  "mh_y_erq__reapp_001",
  "mh_y_erq__reapp_002",
  "mh_y_erq__reapp_003"
)

#' Compute "Emotion Regulation Questionnaire \[Youth\] (Reappraisal): Mean"
#'
#' @description
#' Computes the summary score `mh_y_erq__reapp_mean`
#' Emotion Regulation Questionnaire \[Youth\] (Reappraisal): Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_erq__reapp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_erq__reapp_mean(data) |>
#'   select(
#'     any_of(c("mh_y_erq__reapp_mean", vars_mh_y_erq__reapp))
#'   )
#' }
compute_mh_y_erq__reapp_mean <- function(
  data,
  name = "mh_y_erq__reapp_mean",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_y_erq__reapp,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Emotion Regulation Questionnaire \[Youth\] (Reappraisal): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_erq__reapp_nm`
#' Emotion Regulation Questionnaire \[Youth\] (Reappraisal): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_erq__reapp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_erq__reapp_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_erq__reapp_nm(data) |>
#'   select(
#'     any_of(c("mh_y_erq__reapp_nm", vars_mh_y_erq__reapp))
#'   )
#' }
compute_mh_y_erq__reapp_nm <- function(
  data,
  name = "mh_y_erq__reapp_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_erq__reapp,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_erq__suppr --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_erq__suppr_mean
#' @format `vars_mh_y_erq__suppr` is vector of all column names
#' used to compute summary score of `mh_y_erq__suppr` scores.
vars_mh_y_erq__suppr <- c(
  "mh_y_erq__suppr_001",
  "mh_y_erq__suppr_002",
  "mh_y_erq__suppr_003"
)


#' Compute "Emotion Regulation Questionnaire \[Youth\] (Suppression): Mean"
#'
#' @description
#' Computes the summary score `mh_y_erq__suppr_mean`
#' Emotion Regulation Questionnaire \[Youth\] (Suppression): Mean
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_erq__suppr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_erq__suppr_mean(data) |>
#'   select(
#'     any_of(c("mh_y_erq__suppr_mean", vars_mh_y_erq__suppr))
#'   )
#' }
compute_mh_y_erq__suppr_mean <- function(
  data,
  name = "mh_y_erq__suppr_mean",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_y_erq__suppr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Emotion Regulation Questionnaire \[Youth\] (Suppression): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_erq__suppr_nm`
#' Emotion Regulation Questionnaire \[Youth\] (Suppression): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_erq__suppr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_erq__suppr_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_erq__suppr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_erq__suppr_nm", vars_mh_y_erq__suppr))
#'   )
#' }
compute_mh_y_erq__suppr_nm <- function(
  data,
  name = "mh_y_erq__suppr_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_erq__suppr,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_erq all -----------------------------------------------------------------
#' Compute all summary scores for mh_y_erq.
#' @description
#' This function computes all summary scores for the mh_y_erq table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_erq_all(data)
#' }
compute_mh_y_erq_all <- function(data) {
  data |>
    compute_mh_y_erq__reapp_mean() |>
    compute_mh_y_erq__reapp_nm() |>
    compute_mh_y_erq__suppr_mean() |>
    compute_mh_y_erq__suppr_nm()
}
# mh_y_peq__overt__agg ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__overt__agg_nm
#' @format `vars_mh_y_peq__overt__agg` is vector of all column names
#' used to compute summary score of `mh_y_peq__overt__agg` scores.
vars_mh_y_peq__overt__agg <- c(
  "mh_y_peq__overt__agg_001",
  "mh_y_peq__overt__agg_002",
  "mh_y_peq__overt__agg_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Overt Aggression): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__overt__agg_nm`
#' Peer Experiences Questionnaire \[Youth\] (Overt Aggression): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__overt__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__overt__agg_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__overt__agg_nm", vars_mh_y_peq__overt__agg))
#'   )
#' }
compute_mh_y_peq__overt__agg_nm <- function(
  data,
  name = "mh_y_peq__overt__agg_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__overt__agg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Overt Aggression): Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__overt__agg_sum`
#' Peer Experiences Questionnaire \[Youth\] (Overt Aggression): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__overt__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__overt__agg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__overt__agg_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__overt__agg_sum", vars_mh_y_peq__overt__agg))
#'   )
#' }
compute_mh_y_peq__overt__agg_sum <- function(
  data,
  name = "mh_y_peq__overt__agg_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__overt__agg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq__overt__vict --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__overt__vict_nm
#' @format `vars_mh_y_peq__overt__vict` is vector of all column names
#' used to compute summary score of `mh_y_peq__overt__vict` scores.
vars_mh_y_peq__overt__vict <- c(
  "mh_y_peq__overt__vict_001",
  "mh_y_peq__overt__vict_002",
  "mh_y_peq__overt__vict_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Overt Victimization):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__overt__vict_nm`
#' Peer Experiences Questionnaire \[Youth\] (Overt Victimization): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__overt__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__overt__vict_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__overt__vict_nm", vars_mh_y_peq__overt__vict))
#'   )
#' }
compute_mh_y_peq__overt__vict_nm <- function(
  data,
  name = "mh_y_peq__overt__vict_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__overt__vict,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Overt Victimization): Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__overt__vict_sum`
#' Peer Experiences Questionnaire \[Youth\] (Overt Victimization): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__overt__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__overt__vict_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__overt__vict_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__overt__vict_sum", vars_mh_y_peq__overt__vict))
#'   )
#' }
compute_mh_y_peq__overt__vict_sum <- function(
  data,
  name = "mh_y_peq__overt__vict_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__overt__vict,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq__rel__agg -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__rel__agg_nm
#' @format `vars_mh_y_peq__rel__agg` is vector of all column names
#' used to compute summary score of `mh_y_peq__rel__agg` scores.
vars_mh_y_peq__rel__agg <- c(
  "mh_y_peq__rel__agg_001",
  "mh_y_peq__rel__agg_002",
  "mh_y_peq__rel__agg_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Relational Aggression):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__rel__agg_nm`
#' Peer Experiences Questionnaire \[Youth\] (Relational Aggression): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rel__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rel__agg_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rel__agg_nm", vars_mh_y_peq__rel__agg))
#'   )
#' }
compute_mh_y_peq__rel__agg_nm <- function(
  data,
  name = "mh_y_peq__rel__agg_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__rel__agg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Relational Aggression):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__rel__agg_sum`
#' Peer Experiences Questionnaire \[Youth\] (Relational Aggression): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rel__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__rel__agg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rel__agg_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rel__agg_sum", vars_mh_y_peq__rel__agg))
#'   )
#' }
compute_mh_y_peq__rel__agg_sum <- function(
  data,
  name = "mh_y_peq__rel__agg_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__rel__agg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq__rel__vict ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__rel__vict_nm
#' @format `vars_mh_y_peq__rel__vict` is vector of all column names
#' used to compute summary score of `mh_y_peq__rel__vict` scores.
vars_mh_y_peq__rel__vict <- c(
  "mh_y_peq__rel__vict_001",
  "mh_y_peq__rel__vict_002",
  "mh_y_peq__rel__vict_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Relational Victimization):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__rel__vict_nm`
#' Peer Experiences Questionnaire \[Youth\] (Relational Victimization):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rel__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rel__vict_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rel__vict_nm", vars_mh_y_peq__rel__vict))
#'   )
#' }
compute_mh_y_peq__rel__vict_nm <- function(
  data,
  name = "mh_y_peq__rel__vict_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__rel__vict,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Relational Victimization):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__rel__vict_sum`
#' Peer Experiences Questionnaire \[Youth\] (Relational Victimization): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rel__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__rel__vict_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rel__vict_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rel__vict_sum", vars_mh_y_peq__rel__vict))
#'   )
#' }
compute_mh_y_peq__rel__vict_sum <- function(
  data,
  name = "mh_y_peq__rel__vict_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__rel__vict,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq__rep__agg -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__rep__agg_nm
#' @format `vars_mh_y_peq__rep__agg` is vector of all column names
#' used to compute summary score of `mh_y_peq__rep__agg` scores.
vars_mh_y_peq__rep__agg <- c(
  "mh_y_peq__rep__agg_001",
  "mh_y_peq__rep__agg_002",
  "mh_y_peq__rep__agg_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Reputational Aggression):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__rep__agg_nm`
#' Peer Experiences Questionnaire \[Youth\] (Reputational Aggression):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rep__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rep__agg_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rep__agg_nm", vars_mh_y_peq__rep__agg))
#'   )
#' }
compute_mh_y_peq__rep__agg_nm <- function(
  data,
  name = "mh_y_peq__rep__agg_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__rep__agg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Reputational Aggression):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__rep__agg_sum`
#' Peer Experiences Questionnaire \[Youth\] (Reputational Aggression): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rep__agg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__rep__agg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rep__agg_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rep__agg_sum", vars_mh_y_peq__rep__agg))
#'   )
#' }
compute_mh_y_peq__rep__agg_sum <- function(
  data,
  name = "mh_y_peq__rep__agg_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__rep__agg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq__rep__vict ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_peq__rep__vict_nm
#' @format `vars_mh_y_peq__rep__vict` is vector of all column names
#' used to compute summary score of `mh_y_peq__rep__vict` scores.
vars_mh_y_peq__rep__vict <- c(
  "mh_y_peq__rep__vict_001",
  "mh_y_peq__rep__vict_002",
  "mh_y_peq__rep__vict_003"
)


#' Compute "Peer Experiences Questionnaire \[Youth\] (Reputational
#' Victimization): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_peq__rep__vict_nm`
#' Peer Experiences Questionnaire \[Youth\] (Reputational Victimization):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rep__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rep__vict_nm(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rep__vict_nm", vars_mh_y_peq__rep__vict))
#'   )
#' }
compute_mh_y_peq__rep__vict_nm <- function(
  data,
  name = "mh_y_peq__rep__vict_nm",
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_peq__rep__vict,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Peer Experiences Questionnaire \[Youth\] (Reputational
#' Victimization): Sum"
#'
#' @description
#' Computes the summary score `mh_y_peq__rep__vict_sum`
#' Peer Experiences Questionnaire \[Youth\] (Reputational Victimization):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_peq__rep__vict |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#' - *Validation criterion:* none of 3 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_peq__rep__vict_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq__rep__vict_sum(data) |>
#'   select(
#'     any_of(c("mh_y_peq__rep__vict_sum", vars_mh_y_peq__rep__vict))
#'   )
#' }
compute_mh_y_peq__rep__vict_sum <- function(
  data,
  name = "mh_y_peq__rep__vict_sum",
  max_na = 0,
  exclude = c("777"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_peq__rep__vict,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_peq all -----------------------------------------------------------------
#' Compute all summary scores for mh_y_peq.
#' @description
#' This function computes all summary scores for the mh_y_peq table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_peq_all(data)
#' }
compute_mh_y_peq_all <- function(data) {
  data |>
    compute_mh_y_peq__overt__agg_nm() |>
    compute_mh_y_peq__overt__agg_sum() |>
    compute_mh_y_peq__overt__vict_nm() |>
    compute_mh_y_peq__overt__vict_sum() |>
    compute_mh_y_peq__rel__agg_nm() |>
    compute_mh_y_peq__rel__agg_sum() |>
    compute_mh_y_peq__rel__vict_nm() |>
    compute_mh_y_peq__rel__vict_sum() |>
    compute_mh_y_peq__rep__agg_nm() |>
    compute_mh_y_peq__rep__agg_sum() |>
    compute_mh_y_peq__rep__vict_nm() |>
    compute_mh_y_peq__rep__vict_sum()
}
# mh_y_sup ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_sup_nm
#' @format `vars_mh_y_sup` is vector of all column names
#' used to compute summary score of `mh_y_sup` scores.
vars_mh_y_sup <- c(
  "mh_y_sup_001",
  "mh_y_sup_002",
  "mh_y_sup_003",
  "mh_y_sup_004",
  "mh_y_sup_005",
  "mh_y_sup_006",
  "mh_y_sup_007"
)


#' Compute "7-Up Mania Inventory \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_y_sup_nm`
#' 7-Up Mania Inventory \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_sup |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_sup_nm(data) |>
#'   select(
#'     any_of(c("mh_y_sup_nm", vars_mh_y_sup))
#'   )
#' }
compute_mh_y_sup_nm <- function(
  data,
  name = "mh_y_sup_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_sup,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "7-Up Mania Inventory \[Youth\]: Sum"
#'
#' @description
#' Computes the summary score `mh_y_sup_sum`
#' 7-Up Mania Inventory \[Youth\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_sup |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 7 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_sup_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_sup_sum(data) |>
#'   select(
#'     any_of(c("mh_y_sup_sum", vars_mh_y_sup))
#'   )
#' }
compute_mh_y_sup_sum <- function(
  data,
  name = "mh_y_sup_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_sup,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_sup all -----------------------------------------------------------------
#' Compute all summary scores for mh_y_sup.
#' @description
#' This function computes all summary scores for the mh_y_sup table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_sup_all(data)
#' }
compute_mh_y_sup_all <- function(data) {
  data |>
    compute_mh_y_sup_nm() |>
    compute_mh_y_sup_sum()
}
# mh_y_upps__nurg --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_upps__nurg_nm
#' @format `vars_mh_y_upps__nurg` is vector of all column names
#' used to compute summary score of `mh_y_upps__nurg` scores.
vars_mh_y_upps__nurg <- c(
  "mh_y_upps__nurg_001",
  "mh_y_upps__nurg_002",
  "mh_y_upps__nurg_003",
  "mh_y_upps__nurg_004"
)


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Negative
#' Urgency): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_upps__nurg_nm`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Negative
#' Urgency): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__nurg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__nurg_nm(data) |>
#'   select(
#'     any_of(c("mh_y_upps__nurg_nm", vars_mh_y_upps__nurg))
#'   )
#' }
compute_mh_y_upps__nurg_nm <- function(
  data,
  name = "mh_y_upps__nurg_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_upps__nurg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Negative
#' Urgency): Sum"
#'
#' @description
#' Computes the summary score `mh_y_upps__nurg_sum`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Negative
#' Urgency): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__nurg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_upps__nurg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__nurg_sum(data) |>
#'   select(
#'     any_of(c("mh_y_upps__nurg_sum", vars_mh_y_upps__nurg))
#'   )
#' }
compute_mh_y_upps__nurg_sum <- function(
  data,
  name = "mh_y_upps__nurg_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_upps__nurg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_upps__pers --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_upps__pers_nm
#' @format `vars_mh_y_upps__pers` is vector of all column names
#' used to compute summary score of `mh_y_upps__pers` scores.
vars_mh_y_upps__pers <- c(
  "mh_y_upps__pers_001",
  "mh_y_upps__pers_002",
  "mh_y_upps__pers_003",
  "mh_y_upps__pers_004"
)


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Perseverance (GSSF)): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_upps__pers_nm`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Perseverance (GSSF)): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__pers |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__pers_nm(data) |>
#'   select(
#'     any_of(c("mh_y_upps__pers_nm", vars_mh_y_upps__pers))
#'   )
#' }
compute_mh_y_upps__pers_nm <- function(
  data,
  name = "mh_y_upps__pers_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_upps__pers,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Perseverance (GSSF)): Sum"
#'
#' @description
#' Computes the summary score `mh_y_upps__pers_sum`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Perseverance (GSSF)): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__pers |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_upps__pers_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__pers_sum(data) |>
#'   select(
#'     any_of(c("mh_y_upps__pers_sum", vars_mh_y_upps__pers))
#'   )
#' }
compute_mh_y_upps__pers_sum <- function(
  data,
  name = "mh_y_upps__pers_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_upps__pers,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_upps__plan --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_upps__plan_nm
#' @format `vars_mh_y_upps__plan` is vector of all column names
#' used to compute summary score of `mh_y_upps__plan` scores.
vars_mh_y_upps__plan <- c(
  "mh_y_upps__plan_001",
  "mh_y_upps__plan_002",
  "mh_y_upps__plan_003",
  "mh_y_upps__plan_004"
)


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Planning): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_upps__plan_nm`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Planning): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__plan |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__plan_nm(data) |>
#'   select(
#'     any_of(c("mh_y_upps__plan_nm", vars_mh_y_upps__plan))
#'   )
#' }
compute_mh_y_upps__plan_nm <- function(
  data,
  name = "mh_y_upps__plan_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_upps__plan,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Planning): Sum"
#'
#' @description
#' Computes the summary score `mh_y_upps__plan_sum`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Lack of
#' Planning): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__plan |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_upps__plan_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__plan_sum(data) |>
#'   select(
#'     any_of(c("mh_y_upps__plan_sum", vars_mh_y_upps__plan))
#'   )
#' }
compute_mh_y_upps__plan_sum <- function(
  data,
  name = "mh_y_upps__plan_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_upps__plan,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_upps__purg --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_upps__purg_nm
#' @format `vars_mh_y_upps__purg` is vector of all column names
#' used to compute summary score of `mh_y_upps__purg` scores.
vars_mh_y_upps__purg <- c(
  "mh_y_upps__purg_001",
  "mh_y_upps__purg_002",
  "mh_y_upps__purg_003",
  "mh_y_upps__purg_004"
)


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Positive
#' Urgency): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_upps__purg_nm`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Positive
#' Urgency): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__purg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__purg_nm(data) |>
#'   select(
#'     any_of(c("mh_y_upps__purg_nm", vars_mh_y_upps__purg))
#'   )
#' }
compute_mh_y_upps__purg_nm <- function(
  data,
  name = "mh_y_upps__purg_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_upps__purg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Positive
#' Urgency): Sum"
#'
#' @description
#' Computes the summary score `mh_y_upps__purg_sum`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Positive
#' Urgency): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__purg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_upps__purg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__purg_sum(data) |>
#'   select(
#'     any_of(c("mh_y_upps__purg_sum", vars_mh_y_upps__purg))
#'   )
#' }
compute_mh_y_upps__purg_sum <- function(
  data,
  name = "mh_y_upps__purg_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_upps__purg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_upps__sens --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_upps__sens_nm
#' @format `vars_mh_y_upps__sens` is vector of all column names
#' used to compute summary score of `mh_y_upps__sens` scores.
vars_mh_y_upps__sens <- c(
  "mh_y_upps__sens_001",
  "mh_y_upps__sens_002",
  "mh_y_upps__sens_003",
  "mh_y_upps__sens_004"
)


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Sensation
#' Seeking): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_upps__sens_nm`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Sensation
#' Seeking): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__sens |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__sens_nm(data) |>
#'   select(
#'     any_of(c("mh_y_upps__sens_nm", vars_mh_y_upps__sens))
#'   )
#' }
compute_mh_y_upps__sens_nm <- function(
  data,
  name = "mh_y_upps__sens_nm",
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_upps__sens,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Sensation
#' Seeking): Sum"
#'
#' @description
#' Computes the summary score `mh_y_upps__sens_sum`
#' Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
#' Urgency, Impulsive Behavior Scale (Short Version) \[Youth\] (Sensation
#' Seeking): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_upps__sens |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 4 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_upps__sens_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps__sens_sum(data) |>
#'   select(
#'     any_of(c("mh_y_upps__sens_sum", vars_mh_y_upps__sens))
#'   )
#' }
compute_mh_y_upps__sens_sum <- function(
  data,
  name = "mh_y_upps__sens_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_upps__sens,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_upps all ----------------------------------------------------------------
#' Compute all summary scores for mh_y_upps.
#' @description
#' This function computes all summary scores for the mh_y_upps table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_upps_all(data)
#' }
compute_mh_y_upps_all <- function(data) {
  data |>
    compute_mh_y_upps__nurg_nm() |>
    compute_mh_y_upps__nurg_sum() |>
    compute_mh_y_upps__pers_nm() |>
    compute_mh_y_upps__pers_sum() |>
    compute_mh_y_upps__plan_nm() |>
    compute_mh_y_upps__plan_sum() |>
    compute_mh_y_upps__purg_nm() |>
    compute_mh_y_upps__purg_sum() |>
    compute_mh_y_upps__sens_nm() |>
    compute_mh_y_upps__sens_sum()
}


# mh_y_pai --------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_pai_nm
#' @format `vars_mh_y_pai` is vector of all column names
#' used to compute summary score of `compute_mh_y_pai` scores.

vars_mh_y_pai <- c(
  "mh_y_pai_001",
  "mh_y_pai_002",
  "mh_y_pai_003",
  "mh_y_pai_004",
  "mh_y_pai_005",
  "mh_y_pai_006",
  "mh_y_pai_007",
  "mh_y_pai_008",
  "mh_y_pai_009"
)


#' Compute "NIH Toolbox - Positive Affect Items \[Youth\] (NA): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_pai_nm`
#' NIH Toolbox - Positive Affect Items \[Youth\] (NA): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_pai |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pai_nm(data) |>
#'   select(
#'     any_of(c("mh_y_pai_nm", vars_mh_y_pai))
#'   )
#' }
compute_mh_y_pai_nm <- function(
  data,
  name = "mh_y_pai_nm",
  exclude = c("777", "999"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_pai,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "NIH Toolbox - Positive Affect Items \[Youth\] (NA): Sum \[Validation:
#' None missing or declined\]"
#'
#' @description
#' Computes the summary score `mh_y_pai_sum`
#' NIH Toolbox - Positive Affect Items \[Youth\] (NA): Sum \[Validation:
#' None missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_pai |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* none of 9 items missing
#'
#' @inherit dummy_mh params return references
#' @seealso [compute_mh_y_pai_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pai_sum(data) |>
#'   select(
#'     any_of(c("mh_y_pai_sum", vars_mh_y_pai))
#'   )
#' }
compute_mh_y_pai_sum <- function(
  data,
  name = "mh_y_pai_sum",
  max_na = 0,
  exclude = c("777", "999"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_pai,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_pai all ----------------------------------------------------------------
#' Compute all summary scores for mh_y_upps.
#' @description
#' This function computes all summary scores for the mh_y_pai table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pai_all(data)
#' }
compute_mh_y_pai_all <- function(data) {
  data |>
    compute_mh_y_pai_nm() |>
    compute_mh_y_pai_sum()
}


recode_eatq <- c(
  "1" = "5",
  "2" = "4",
  "4" = "2",
  "5" = "1"
)

# 1 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__surg_mean
#' @format vars_mh_p_eatq__surg is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__surg_mean`.
vars_mh_p_eatq__surg <- c(
  "mh_p_eatq__surg_001",
  "mh_p_eatq__surg_002",
  "mh_p_eatq__surg_003",
  "mh_p_eatq__surg_004",
  "mh_p_eatq__surg_005",
  "mh_p_eatq__surg_006",
  "mh_p_eatq__surg_007",
  "mh_p_eatq__surg_008",
  "mh_p_eatq__surg_009"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Surgency):
#' Mean \[Validation: No more than 1 missing or declined\]"
#' @description
#' Computes the summary score `mh_p_eatq__surg_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Surgency): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_eatq__surg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 9 items missing
#'
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param max_na integer, Maximum number of missing values allowed in the
#' summary score. `NULL` means no limit.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#' the input data frame. If `FALSE`, the summary score will be returned as a
#' separate data frame.
#' @param revert logical, If `TRUE`, the summary score will be reverse scored.

#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__surg_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__surg_mean", vars_mh_p_eatq__surg))
#' )
#' }
compute_mh_p_eatq__surg_mean <- function(
  data,
  name = "mh_p_eatq__surg_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__surg)

  data_ss <- data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_eatq__surg,
      max_na  = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Surgency):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__surg_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Surgency): Number
#' missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__surg |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__surg_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__surg_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__surg_nm", vars_mh_p_eatq__surg))
#' )
#' }
#'
compute_mh_p_eatq__surg_nm <- function(
  data,
  name = "mh_p_eatq__surg_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__surg)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__surg,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__actv_mean
#' @format vars_mh_p_eatq__actv is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__actv_mean`.
vars_mh_p_eatq__actv <- c(
  "mh_p_eatq__actv_001",
  "mh_p_eatq__actv_002",
  "mh_p_eatq__actv_003",
  "mh_p_eatq__actv_004",
  "mh_p_eatq__actv_005",
  "mh_p_eatq__actv_006",
  "mh_p_eatq__actv_007"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Activation):
#' Mean "
#' @description
#' Computes the summary score `mh_p_eatq__actv_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Activation): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__actv |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__actv_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__actv_mean", vars_mh_p_eatq__actv))
#' )
#' }
#'
compute_mh_p_eatq__actv_mean <- function(
  data,
  name = "mh_p_eatq__actv_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__actv)

  data_ss <- data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_eatq__actv,
      max_na  = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Activation):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__actv_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Activation):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__actv |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__actv_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__actv_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__actv_nm", vars_mh_p_eatq__actv))
#' )
#' }
#'
compute_mh_p_eatq__actv_nm <- function(
  data,
  name = "mh_p_eatq__actv_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__actv)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__actv,
      combine = combine
    )
}

# 3 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__affl_mean
#' @format vars_mh_p_eatq__affl is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__affl_mean`.
vars_mh_p_eatq__affl <- c(
  "mh_p_eatq__affl_001",
  "mh_p_eatq__affl_002",
  "mh_p_eatq__affl_003",
  "mh_p_eatq__affl_004",
  "mh_p_eatq__affl_005",
  "mh_p_eatq__affl_006"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Affiliation):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__affl_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Affiliation):
#' Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__affl |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__affl_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__affl_mean", vars_mh_p_eatq__affl))
#' )
#' }
compute_mh_p_eatq__affl_mean <- function(
  data,
  name = "mh_p_eatq__affl_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__affl)

  data_ss <- ss_mean(
    data    = data,
    name    = name,
    vars    = vars_mh_p_eatq__affl,
    max_na  = max_na,
    combine = FALSE
  )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Affiliation):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__affl_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Affiliation):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__affl |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__affl_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__affl_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__affl_nm", vars_mh_p_eatq__affl))
#' )
#' }
#'
compute_mh_p_eatq__affl_nm <- function(
  data,
  name = "mh_p_eatq__affl_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__affl)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__affl,
      combine = combine
    )
}

# 4 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__depm_mean
#' @format vars_mh_p_eatq__depm is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__depm_mean`.
vars_mh_p_eatq__depm <- c(
  "mh_p_eatq__depm_001",
  "mh_p_eatq__depm_002",
  "mh_p_eatq__depm_003",
  "mh_p_eatq__depm_004",
  "mh_p_eatq__depm_005"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Depressive
#' Mood): Mean"
#' @description
#' Computes the summary score `mh_p_eatq__depm_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Depressive Mood):
#' Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__depm |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__depm_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__depm_mean", vars_mh_p_eatq__depm))
#' )
#' }
#'
compute_mh_p_eatq__depm_mean <- function(
  data,
  name = "mh_p_eatq__depm_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__depm)

  data_ss <- data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_eatq__depm,
      max_na  = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Depressive
#' Mood): Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__depm_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Depressive Mood):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__depm |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__depm_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__depm_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__depm_nm", vars_mh_p_eatq__depm))
#' )
#' }
#'
compute_mh_p_eatq__depm_nm <- function(
  data,
  name = "mh_p_eatq__depm_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__depm)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__depm,
      combine = combine
    )
}

# 5 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__aggr_mean
#' @format vars_mh_p_eatq__aggr is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__aggr_mean`.
vars_mh_p_eatq__aggr <- c(
  "mh_p_eatq__aggr_001",
  "mh_p_eatq__aggr_002",
  "mh_p_eatq__aggr_003",
  "mh_p_eatq__aggr_004",
  "mh_p_eatq__aggr_005",
  "mh_p_eatq__aggr_006",
  "mh_p_eatq__aggr_007"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Aggression):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__aggr_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Aggression): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__aggr |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__aggr_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__aggr_mean", vars_mh_p_eatq__aggr))
#' )
#' }
#'
compute_mh_p_eatq__aggr_mean <- function(
  data,
  name = "mh_p_eatq__aggr_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__aggr)

  data_ss <- data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_eatq__aggr,
      max_na  = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Aggression):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__aggr_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Aggression):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__aggr |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__aggr_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__aggr_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__aggr_nm", vars_mh_p_eatq__aggr))
#' )
#' }
#'
compute_mh_p_eatq__aggr_nm <- function(
  data,
  name = "mh_p_eatq__aggr_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__aggr)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__aggr,
      combine = combine
    )
}

# 6 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__attn_mean
#' @format vars_mh_p_eatq__attn is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__attn_mean`.
vars_mh_p_eatq__attn <- c(
  "mh_p_eatq__attn_001",
  "mh_p_eatq__attn_002",
  "mh_p_eatq__attn_003",
  "mh_p_eatq__attn_004",
  "mh_p_eatq__attn_005",
  "mh_p_eatq__attn_006"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Attention):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__attn_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Attention): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__attn |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#'
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__attn_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__attn_mean", vars_mh_p_eatq__attn))
#' )
#' }
#'
compute_mh_p_eatq__attn_mean <- function(
  data,
  name = "mh_p_eatq__attn_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__attn)

  data_ss <- data |>
    ss_mean(
      name    = name,
      vars    = vars_mh_p_eatq__attn,
      max_na  = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Attention):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__attn_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Attention):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__attn |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__attn_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__attn_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__attn_nm", vars_mh_p_eatq__attn))
#' )
#' }
#'
compute_mh_p_eatq__attn_nm <- function(
  data,
  name = "mh_p_eatq__attn_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__attn)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__attn,
      combine = combine
    )
}

# 7 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__fear_mean
#' @format vars_mh_p_eatq__fear is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__fear_mean`.
vars_mh_p_eatq__fear <- c(
  "mh_p_eatq__fear_001",
  "mh_p_eatq__fear_002",
  "mh_p_eatq__fear_003",
  "mh_p_eatq__fear_004",
  "mh_p_eatq__fear_005",
  "mh_p_eatq__fear_006"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Fear): Mean"
#' @description
#' Computes the summary score `mh_p_eatq__fear_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Fear): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__fear |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__fear_mean(data)
#' select(
#'   data,
#'   any_of(c(
#'     "mh_p_eatq__fear_mean",
#'     vars_mh_p_eatq__fear
#'   ))
#' )
#' }
#'
compute_mh_p_eatq__fear_mean <- function(
  data,
  name = "mh_p_eatq__fear_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__fear)

  data_ss <- data |>
    ss_mean(
      name = name,
      vars = vars_mh_p_eatq__fear,
      max_na = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Fear): Number
#' missing"
#' @description
#' Computes the summary score `mh_p_eatq__fear_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Fear): Number
#' missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__fear |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__fear_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__fear_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__fear_nm", vars_mh_p_eatq__fear))
#' )
#' }
#'
compute_mh_p_eatq__fear_nm <- function(
  data,
  name = "mh_p_eatq__fear_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__fear)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__fear,
      combine = combine
    )
}

# 9 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__inhib_mean
#' @format vars_mh_p_eatq__inhib is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__inhib_mean`.
vars_mh_p_eatq__inhib <- c(
  "mh_p_eatq__inhib_001",
  "mh_p_eatq__inhib_002",
  "mh_p_eatq__inhib_003",
  "mh_p_eatq__inhib_004",
  "mh_p_eatq__inhib_005"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Inhibition):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__inhib_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Inhibition): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__inhib |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__inhib_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__inhib_mean", vars_mh_p_eatq__inhib))
#' )
#' }
#'
compute_mh_p_eatq__inhib_mean <- function(
  data,
  name = "mh_p_eatq__inhib_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__inhib)

  data_ss <- data |>
    ss_mean(
      name = name,
      vars = vars_mh_p_eatq__inhib,
      max_na = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Inhibition):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__inhib_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Inhibition):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__inhib |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__inhib_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__inhib_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__inhib_nm", vars_mh_p_eatq__inhib))
#' )
#' }
#'
compute_mh_p_eatq__inhib_nm <- function(
  data,
  name = "mh_p_eatq__inhib_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__inhib)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__inhib,
      combine = combine
    )
}

# 10 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__shy_mean
#' @format vars_mh_p_eatq__shy is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__shy_mean`.
vars_mh_p_eatq__shy <- c(
  "mh_p_eatq__shy_001",
  "mh_p_eatq__shy_002",
  "mh_p_eatq__shy_003",
  "mh_p_eatq__shy_004",
  "mh_p_eatq__shy_005"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Shyness):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__shy_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Shyness): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__shy |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 5 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__shy_mean(data)
#' select(
#'   data,
#'   any_of(c(
#'     "mh_p_eatq__shy_mean",
#'     vars_mh_p_eatq__shy
#'   ))
#' )
#' }
#'
compute_mh_p_eatq__shy_mean <- function(
  data,
  name = "mh_p_eatq__shy_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__shy)

  data_ss <- data |>
    ss_mean(
      name = name,
      vars = vars_mh_p_eatq__shy,
      max_na = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Shyness):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__shy_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Shyness): Number
#' missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__shy |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__shy_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__shy_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__shy_nm", vars_mh_p_eatq__shy))
#' )
#' }
#'
compute_mh_p_eatq__shy_nm <- function(
  data,
  name = "mh_p_eatq__shy_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__shy)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__shy,
      combine = combine
    )
}

# 12 -----------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_eatq__frust_mean
#' @format vars_mh_p_eatq__frust is a character vector of all column names
#' used to compute summary score of `mh_p_eatq__frust_mean`.
vars_mh_p_eatq__frust <- c(
  "mh_p_eatq__frust_001",
  "mh_p_eatq__frust_002",
  "mh_p_eatq__frust_003",
  "mh_p_eatq__frust_004",
  "mh_p_eatq__frust_005",
  "mh_p_eatq__frust_006"
)

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Frustration):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__frust_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Frustration):
#' Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__frust |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 1 of 6 items missing
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__frust_mean(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__frust_mean", vars_mh_p_eatq__frust))
#' )
#' }
#'
compute_mh_p_eatq__frust_mean <- function(
  data,
  name = "mh_p_eatq__frust_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
) {
  chk::chk_data(data)
  if (!is.null(max_na)) chk::chk_whole_number(max_na)
  chk::chk_logical(combine)
  chk::chk_logical(revert)
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_eatq__frust)

  data_ss <- data |>
    ss_mean(
      name = name,
      vars = vars_mh_p_eatq__frust,
      max_na = max_na,
      combine = FALSE
    )

  if (revert) {
    data_ss <- data_ss |>
      mutate(
        "{name}" := 6 - .data[[name]]
      )
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Frustration):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__frust_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Frustration):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_p_eatq__frust |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__frust_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__frust_nm(data)
#' select(
#'   data,
#'   any_of(c("mh_p_eatq__frust_nm", vars_mh_p_eatq__frust))
#' )
#' }
#'
compute_mh_p_eatq__frust_nm <- function(
  data,
  name = "mh_p_eatq__frust_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_p_eatq__frust)
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = vars_mh_p_eatq__frust,
      combine = combine
    )
}

# 13 -----------------------------------------------------------------------
#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Effortful control: Combines attention, inhibition, and activation scales):
#' Mean"
#' @description
#' Computes the summary score `mh_p_eatq__ss__efcon_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Effortful control: Combines attention, inhibition, and activation scales):
#' Mean
#'
#' - *Summarized variables:*
#'    - `mh_p_eatq__attn_mean`
#'    - `mh_p_eatq__inhib_mean`
#'    - `mh_p_eatq__actv_mean`
#' - *Excluded values:* none
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#' the name in description, but users can change it.
#' @param combine logical, append the new computed column to the end
#' of original tibble? Default is `TRUE`.
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @details
#' Effortful Control = Attention, Inhibitory Control, Activation Control
#'
#' In the super scale calculation, no NA is allowed.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_eatq__ss__efcon_mean(data) |>
#'   select(
#'     any_of(c(
#'       "mh_p_eatq__ss__efcon_mean",
#'     ))
#'   )
#' }
#'
compute_mh_p_eatq__ss__efcon_mean <- function(
  data,
  name = "mh_p_eatq__ss__efcon_mean",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)
  chk::check_names(
    data, c(vars_mh_p_eatq__attn, vars_mh_p_eatq__inhib, vars_mh_p_eatq__actv)
  )

  data_ss <- data |>
    compute_mh_p_eatq__attn_mean(name = "attn_internal") |>
    compute_mh_p_eatq__inhib_mean(name = "inhib_internal") |>
    compute_mh_p_eatq__actv_mean(name = "actv_internal") |>
    ss_mean(
      name = name,
      vars = c("attn_internal", "inhib_internal", "actv_internal"),
      max_na = 0,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Effortful control: Combines attention, inhibition, and activation scales):
#' Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__ss__efcon_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Effortful control: Combines attention, inhibition, and activation scales):
#' Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    c(vars_mh_p_eatq__attn, vars_mh_p_eatq__inhib, vars_mh_p_eatq__actv) |>
#'      md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__ss__efcon_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__ss__efcon_nm(data)
#' }
#'
compute_mh_p_eatq__ss__efcon_nm <- function(
  data,
  name = "mh_p_eatq__ss__efcon_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data, c(vars_mh_p_eatq__attn, vars_mh_p_eatq__inhib, vars_mh_p_eatq__actv)
  )
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = c(
        vars_mh_p_eatq__attn,
        vars_mh_p_eatq__inhib,
        vars_mh_p_eatq__actv
      ),
      combine = combine
    )
}

# 14 -----------------------------------------------------------------------
#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Negative Affect: Combines frustration, depressed mood, and aggression
#' scales): Mean"
#' @description
#' Computes the summary score `mh_p_eatq__ss__negaff_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Negative Affect: Combines frustration, depressed mood, and aggression
#' scales): Mean
#'
#' - *Summarized variables:*
#'    - `mh_p_eatq__frust_mean`
#'    - `mh_p_eatq__depm_mean`
#'    - `mh_p_eatq__aggr_mean`
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__ss__efcon_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @details
#' Negative Affect = Frustration, Depressive Mood, Aggression
#'
#' In the super scale calculation, no NA is allowed.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data |>
#'   compute_mh_p_eatq__ss__negaff_mean() |>
#'   select(
#'     any_of(c(
#'       "mh_p_eatq__ss__negaff_mean"
#'     ))
#'   )
#' }
#'
compute_mh_p_eatq__ss__negaff_mean <- function(
  data,
  name = "mh_p_eatq__ss__negaff_mean",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)
  chk::check_names(
    data, c(vars_mh_p_eatq__frust, vars_mh_p_eatq__depm, vars_mh_p_eatq__aggr)
  )

  data_ss <- data |>
    compute_mh_p_eatq__frust_mean(name = "frust_internal") |>
    compute_mh_p_eatq__depm_mean(name = "depm_internal") |>
    compute_mh_p_eatq__aggr_mean(name = "aggr_internal") |>
    ss_mean(
      name = name,
      vars = c("frust_internal", "depm_internal", "aggr_internal"),
      max_na = 0,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Negative Affect: Combines frustration, depressed mood, and aggression
#' scales): Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__ss__negaff_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Negative Affect: Combines frustration, depressed mood, and aggression
#' scales): Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    c(vars_mh_p_eatq__frust, vars_mh_p_eatq__depm, vars_mh_p_eatq__aggr) |>
#'      md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__ss__negaff_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__ss__negaff_nm(data)
#' }
compute_mh_p_eatq__ss__negaff_nm <- function(
  data,
  name = "mh_p_eatq__ss__negaff_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data, c(vars_mh_p_eatq__frust, vars_mh_p_eatq__depm, vars_mh_p_eatq__aggr)
  )
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = c(
        vars_mh_p_eatq__frust,
        vars_mh_p_eatq__depm,
        vars_mh_p_eatq__aggr
      ),
      combine = combine
    )
}

# 15 -----------------------------------------------------------------------
#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Surgency: Combines surgency, fear (reverse coded), and shyness (reverse
#' coded) scales): Mean \[Validation: No more than 0 missing or declined\]"
#' @description
#' Computes the summary score `mh_p_eatq__ss__surg_mean`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Surgency: Combines surgency, fear (reverse coded), and shyness (reverse
#' coded) scales): Mean \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'    - `mh_p_eatq__surg_mean`
#'    - `mh_p_eatq__fear_mean` (revert)
#'    - `mh_p_eatq__shy_mean` (revert)
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__ss__efcon_mean
#' @return tbl. The input data frame with the summary score appended as
#' a new column.
#' @details
#' Surgency = Surgency, Fear (reverse scored), Shyness (reverse scored)
#'
#' In the super scale calculation, no NA is allowed.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_eatq__ss__surg_mean(data) |>
#'   select(
#'     any_of(c(
#'       "mh_p_eatq__ss__surg_mean"
#'     ))
#'   )
#' }
#'
compute_mh_p_eatq__ss__surg_mean <- function(
  data,
  name = "mh_p_eatq__ss__surg_mean",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  check_col_names(data, name)
  chk::check_names(
    data, c(vars_mh_p_eatq__surg, vars_mh_p_eatq__fear, vars_mh_p_eatq__shy)
  )

  data_ss <- data |>
    compute_mh_p_eatq__surg_mean(name = "surg_internal") |>
    compute_mh_p_eatq__fear_mean(name = "fear_internal", revert = TRUE) |>
    compute_mh_p_eatq__shy_mean(name = "shy_internal", revert = TRUE) |>
    ss_mean(
      name = name,
      vars = c("surg_internal", "fear_internal", "shy_internal"),
      max_na = 0,
      combine = FALSE
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Surgency: Combines surgency, fear (reverse coded), and shyness (reverse
#' coded) scales): Number missing"
#' @description
#' Computes the summary score `mh_p_eatq__ss__surg_nm`
#' Early Adolescent Temperament Questionnaire \[Parent\] (Super scale -
#' Surgency: Combines surgency, fear (reverse coded), and shyness (reverse
#' coded) scales): Number missing
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    c(vars_mh_p_eatq__surg, vars_mh_p_eatq__fear, vars_mh_p_eatq__shy) |>
#'      md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#'
#' @inheritParams compute_mh_p_eatq__surg_mean
#' @return tbl. The input data frame with the summary score appended as
#'  a new column.
#' @seealso [compute_mh_p_eatq__ss__surg_mean()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' data <- compute_mh_p_eatq__ss__surg_nm(data)
#' }
compute_mh_p_eatq__ss__surg_nm <- function(
  data,
  name = "mh_p_eatq__ss__surg_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(
    data, c(vars_mh_p_eatq__surg, vars_mh_p_eatq__fear, vars_mh_p_eatq__shy)
  )
  check_col_names(data, name)

  data |>
    ss_nm(
      name = name,
      vars = c(vars_mh_p_eatq__surg, vars_mh_p_eatq__fear, vars_mh_p_eatq__shy),
      combine = combine
    )
}

#' Compute all the EATQ variables
#' @description
#' This super function computes all scores in EATQ using all the
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @details
#' Make sure the `data` is the full set of all variables from EATQ
#' @examples
#' \dontrun{
#' compute_mh_p_eatq_all(data)
#' }
compute_mh_p_eatq_all <- function(data) {
  data |>
    compute_mh_p_eatq__surg_mean() |>
    compute_mh_p_eatq__surg_nm() |>
    compute_mh_p_eatq__actv_mean() |>
    compute_mh_p_eatq__actv_nm() |>
    compute_mh_p_eatq__affl_mean() |>
    compute_mh_p_eatq__affl_nm() |>
    compute_mh_p_eatq__depm_mean() |>
    compute_mh_p_eatq__depm_nm() |>
    compute_mh_p_eatq__aggr_mean() |>
    compute_mh_p_eatq__aggr_nm() |>
    compute_mh_p_eatq__attn_mean() |>
    compute_mh_p_eatq__attn_nm() |>
    compute_mh_p_eatq__fear_mean() |>
    compute_mh_p_eatq__fear_nm() |>
    compute_mh_p_eatq__inhib_mean() |>
    compute_mh_p_eatq__inhib_nm() |>
    compute_mh_p_eatq__shy_mean() |>
    compute_mh_p_eatq__shy_nm() |>
    compute_mh_p_eatq__frust_mean() |>
    compute_mh_p_eatq__frust_nm() |>
    compute_mh_p_eatq__ss__efcon_mean() |>
    compute_mh_p_eatq__ss__efcon_nm() |>
    compute_mh_p_eatq__ss__negaff_mean() |>
    compute_mh_p_eatq__ss__negaff_nm() |>
    compute_mh_p_eatq__ss__surg_mean() |>
    compute_mh_p_eatq__ss__surg_nm()
}


#   ____________________________________________________________________________
#   mh_p_ple                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count
#' @format vars_mh_p_ple is a character vector of all column names
#' used to compute summary score of `mh_p_ple`.
vars_mh_p_ple <- c(
  "mh_p_ple_001",
  "mh_p_ple_002",
  "mh_p_ple_003",
  "mh_p_ple_004",
  "mh_p_ple_005",
  "mh_p_ple_006",
  "mh_p_ple_007",
  "mh_p_ple_008",
  "mh_p_ple_009",
  "mh_p_ple_010",
  "mh_p_ple_011",
  "mh_p_ple_012",
  "mh_p_ple_013",
  "mh_p_ple_014",
  "mh_p_ple_015",
  "mh_p_ple_016",
  "mh_p_ple_017",
  "mh_p_ple_018",
  "mh_p_ple_019",
  "mh_p_ple_020",
  "mh_p_ple_021",
  "mh_p_ple_022",
  "mh_p_ple_023",
  "mh_p_ple_024",
  "mh_p_ple_025"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity_sum
#' @format vars_mh_p_ple__severity is a character vector of all column names
#' used to compute summary score of `mh_p_ple__severity`.
vars_mh_p_ple__severity <- c(
  "mh_p_ple__severity_001",
  "mh_p_ple__severity_002",
  "mh_p_ple__severity_003",
  "mh_p_ple__severity_004",
  "mh_p_ple__severity_005",
  "mh_p_ple__severity_006",
  "mh_p_ple__severity_007",
  "mh_p_ple__severity_008",
  "mh_p_ple__severity_009",
  "mh_p_ple__severity_010",
  "mh_p_ple__severity_011",
  "mh_p_ple__severity_012",
  "mh_p_ple__severity_013",
  "mh_p_ple__severity_014",
  "mh_p_ple__severity_015",
  "mh_p_ple__severity_016",
  "mh_p_ple__severity_017",
  "mh_p_ple__severity_018",
  "mh_p_ple__severity_019",
  "mh_p_ple__severity_020",
  "mh_p_ple__severity_021",
  "mh_p_ple__severity_022",
  "mh_p_ple__severity_023",
  "mh_p_ple__severity_024",
  "mh_p_ple__severity_025"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count
#' @format vars_mh_p_ple__exp is a character vector of all column names
#' used to compute summary score of `mh_p_ple__exp`.
vars_mh_p_ple__exp <- c(
  "mh_p_ple__exp_001",
  "mh_p_ple__exp_002",
  "mh_p_ple__exp_003",
  "mh_p_ple__exp_004",
  "mh_p_ple__exp_005",
  "mh_p_ple__exp_006",
  "mh_p_ple__exp_007",
  "mh_p_ple__exp_008",
  "mh_p_ple__exp_009",
  "mh_p_ple__exp_010",
  "mh_p_ple__exp_011",
  "mh_p_ple__exp_012",
  "mh_p_ple__exp_013",
  "mh_p_ple__exp_014",
  "mh_p_ple__exp_015",
  "mh_p_ple__exp_016",
  "mh_p_ple__exp_017",
  "mh_p_ple__exp_018",
  "mh_p_ple__exp_019",
  "mh_p_ple__exp_020",
  "mh_p_ple__exp_021",
  "mh_p_ple__exp_022",
  "mh_p_ple__exp_023",
  "mh_p_ple__exp_024",
  "mh_p_ple__exp_025"
)


#' Compute "Life Events \[Parent\] (Events): Count"
#' @description
#' Computes the summary score `mh_p_ple_count`
#' Life Events \[Parent\] (Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_count <- function(data,
                                   name = "mh_p_ple_count",
                                   combine = TRUE,
                                   max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ple,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#' Compute "Life Events \[Parent\] (Events): Number missing"
#' @description
#' Computes the summary score `mh_p_ple_nm`
#' Life Events \[Parent\] (Events): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_p_ple_nm <- function(data,
                                name = "mh_p_ple_nm",
                                combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ple,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_p_ple__severity                                                      ####

#' Compute "Life Events \[Parent\] (Severity): Sum \[Validation: No more than 5
#' events missing and no severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_sum`
#' Life Events \[Parent\] (Severity): Sum \[Validation: No more than 5
#' events missing and no severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_sum <- function(data,
                                           name = "mh_p_ple__severity_sum",
                                           combine = TRUE,
                                           max_na = 5) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple,
      vars        = vars_mh_p_ple__severity,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Mean \[Validation: No more than 5
#' events missing and no severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_mean`
#' Life Events \[Parent\] (Severity): Mean \[Validation: No more than 5
#' events missing and no severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_mean <- function(data,
                                            name = "mh_p_ple__severity_mean",
                                            combine = TRUE,
                                            max_na = 5) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple,
      vars        = vars_mh_p_ple__severity,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Number missing"
#' @description
#' Computes the summary score `mh_p_ple__severity_nm`
#' Life Events \[Parent\] (Severity): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_p_ple__severity_nm <- function(data,
                                          name = "mh_p_ple__severity_nm",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      vars      = vars_mh_p_ple__severity,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Sum \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_sum`
#' Life Events \[Parent\] (Severity of Good Events): Sum \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp,
#'    vars_mh_p_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_sum <- function(
  data,
  name = "mh_p_ple__severity__good_sum",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp,
      vars        = vars_mh_p_ple__severity,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_mean`
#' Life Events \[Parent\] (Severity of Good Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp,
#'    vars_mh_p_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_mean <- function(
  data,
  name = "mh_p_ple__severity__good_mean",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp,
      vars        = vars_mh_p_ple__severity,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp,
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Sum \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_sum`
#' Life Events \[Parent\] (Severity of Bad Events): Sum \[Validation: No
#' more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp,
#'    vars_mh_p_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_sum <- function(
  data,
  name = "mh_p_ple__severity__bad_sum",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp,
      vars        = vars_mh_p_ple__severity,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_mean`
#' Life Events \[Parent\] (Severity of Bad Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp,
#'    vars_mh_p_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_mean <- function(
  data,
  name = "mh_p_ple__severity__bad_mean",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp,
      vars        = vars_mh_p_ple__severity,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__exp                                                           ####


#' Compute "Life Events \[Parent\] (Experience): Number missing"
#' @description
#' Computes the summary score `mh_p_ple__exp_nm`
#' Life Events \[Parent\] (Experience): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_p_ple__exp_nm <- function(data,
                                     name = "mh_p_ple__exp_nm",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      vars      = vars_mh_p_ple__exp,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}

#' Compute "Life Events \[Parent\] (Experience Good Events): Count"
#' @description
#' Computes the summary score `mh_p_ple__exp__good_count`
#' Life Events \[Parent\] (Experience Good Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__good_count <- function(data,
                                              name = "mh_p_ple__exp__good_count",
                                              combine = TRUE,
                                              max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Experience Bad Events): Count"
#' @description
#' Computes the summary score `mh_p_ple__exp__bad_count`
#' Life Events \[Parent\] (Experience Bad Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__bad_count <- function(data,
                                             name = "mh_p_ple__exp__bad_count",
                                             combine = TRUE,
                                             max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__v01                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count__v01
#' @format vars_mh_p_ple__v01 is a character vector of all column names
#' used to compute summary score of `mh_p_ple`.
vars_mh_p_ple__v01 <- c(
  "mh_p_ple_001",
  "mh_p_ple_002",
  "mh_p_ple_003",
  "mh_p_ple_004",
  "mh_p_ple_005",
  "mh_p_ple_006",
  "mh_p_ple_007",
  "mh_p_ple_008",
  "mh_p_ple_009",
  "mh_p_ple_010",
  "mh_p_ple_011",
  "mh_p_ple_012",
  "mh_p_ple_013",
  "mh_p_ple_014",
  "mh_p_ple_015",
  "mh_p_ple_016",
  "mh_p_ple_017",
  "mh_p_ple_018",
  "mh_p_ple_019",
  "mh_p_ple_020",
  "mh_p_ple_021",
  "mh_p_ple_022",
  "mh_p_ple_023",
  "mh_p_ple_024",
  "mh_p_ple_025",
  "mh_p_ple_026",
  "mh_p_ple_027",
  "mh_p_ple_028",
  "mh_p_ple_029",
  "mh_p_ple_030",
  "mh_p_ple_031"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity_sum__v01
#' @format vars_mh_p_ple__severity__v01 is a character vector of all column
#' names
#' used to compute summary score of `mh_p_ple__severity`.
vars_mh_p_ple__severity__v01 <- c(
  "mh_p_ple__severity_001",
  "mh_p_ple__severity_002",
  "mh_p_ple__severity_003",
  "mh_p_ple__severity_004",
  "mh_p_ple__severity_005",
  "mh_p_ple__severity_006",
  "mh_p_ple__severity_007",
  "mh_p_ple__severity_008",
  "mh_p_ple__severity_009",
  "mh_p_ple__severity_010",
  "mh_p_ple__severity_011",
  "mh_p_ple__severity_012",
  "mh_p_ple__severity_013",
  "mh_p_ple__severity_014",
  "mh_p_ple__severity_015",
  "mh_p_ple__severity_016",
  "mh_p_ple__severity_017",
  "mh_p_ple__severity_018",
  "mh_p_ple__severity_019",
  "mh_p_ple__severity_020",
  "mh_p_ple__severity_021",
  "mh_p_ple__severity_022",
  "mh_p_ple__severity_023",
  "mh_p_ple__severity_024",
  "mh_p_ple__severity_025",
  "mh_p_ple__severity_026",
  "mh_p_ple__severity_027",
  "mh_p_ple__severity_028",
  "mh_p_ple__severity_029",
  "mh_p_ple__severity_030",
  "mh_p_ple__severity_031"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity__good_sum__v01
#' @format vars_mh_p_ple__exp__v01 is a character vector of all column names
#' used to compute summary score of `mh_p_ple__exp`.
vars_mh_p_ple__exp__v01 <- c(
  "mh_p_ple__exp_001",
  "mh_p_ple__exp_002",
  "mh_p_ple__exp_003",
  "mh_p_ple__exp_004",
  "mh_p_ple__exp_005",
  "mh_p_ple__exp_006",
  "mh_p_ple__exp_007",
  "mh_p_ple__exp_008",
  "mh_p_ple__exp_009",
  "mh_p_ple__exp_010",
  "mh_p_ple__exp_011",
  "mh_p_ple__exp_012",
  "mh_p_ple__exp_013",
  "mh_p_ple__exp_014",
  "mh_p_ple__exp_015",
  "mh_p_ple__exp_016",
  "mh_p_ple__exp_017",
  "mh_p_ple__exp_018",
  "mh_p_ple__exp_019",
  "mh_p_ple__exp_020",
  "mh_p_ple__exp_021",
  "mh_p_ple__exp_022",
  "mh_p_ple__exp_023",
  "mh_p_ple__exp_024",
  "mh_p_ple__exp_025",
  "mh_p_ple__exp_026",
  "mh_p_ple__exp_027",
  "mh_p_ple__exp_028",
  "mh_p_ple__exp_029",
  "mh_p_ple__exp_030",
  "mh_p_ple__exp_031"
)


#' Compute "Life Events \[Parent\] (Events): Count - Version 1 (Year 3)"
#' @description
#' Computes the summary score `mh_p_ple_count__v01`
#' Life Events \[Parent\] (Events): Count - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_count__v01 <- function(data,
                                        name = "mh_p_ple_count__v01",
                                        events = "ses-03A",
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ple__v01,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Parent\] (Events): Number missing - Version 1 (Year
#' 3)"
#' @description
#' Computes the summary score `mh_p_ple_nm__v01`
#' Life Events \[Parent\] (Events): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_nm__v01 <- function(data,
                                     name = "mh_p_ple_nm__v01",
                                     events = "ses-03A",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ple__v01,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_p_ple__severity__v01                                                 ####

#' Compute "Life Events \[Parent\] (Severity): Sum - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_sum__v01`
#' Life Events \[Parent\] (Severity): Sum - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_sum__v01 <- function(
  data,
  name = "mh_p_ple__severity_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Mean - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_mean__v01`
#' Life Events \[Parent\] (Severity): Mean - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_mean__v01 <- function(
  data,
  name = "mh_p_ple__severity_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Number missing - Version 1 (Year
#' 3)"
#' @description
#' Computes the summary score `mh_p_ple__severity_nm__v01`
#' Life Events \[Parent\] (Severity): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_nm__v01 <- function(
  data,
  name = "mh_p_ple__severity_nm__v01",
  events = "ses-03A",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      vars      = vars_mh_p_ple__severity__v01,
      events    = events,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Sum -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_sum__v01`
#' Life Events \[Parent\] (Severity of Good Events): Sum - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v01,
#'    vars_mh_p_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_sum__v01 <- function(
  data,
  name = "mh_p_ple__severity__good_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Mean -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_mean__v01`
#' Life Events \[Parent\] (Severity of Good Events): Mean - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v01,
#'    vars_mh_p_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_mean__v01 <- function(
  data,
  name = "mh_p_ple__severity__good_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v01,
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Sum -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_sum__v01`
#' Life Events \[Parent\] (Severity of Bad Events): Sum - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v01,
#'    vars_mh_p_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_sum__v01 <- function(
  data,
  name = "mh_p_ple__severity__bad_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v01,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Mean -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_mean__v01`
#' Life Events \[Parent\] (Severity of Bad Events): Mean - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v01,
#'    vars_mh_p_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_mean__v01 <- function(
  data,
  name = "mh_p_ple__severity__bad_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v01,
      vars        = vars_mh_p_ple__severity__v01,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v01,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__exp__v01                                                      ####


#' Compute "Life Events \[Parent\] (Experience): Number missing - Version 1
#' (Year 3)"
#' @description
#' Computes the summary score `mh_p_ple__exp_nm__v01`
#' Life Events \[Parent\] (Experience): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp_nm__v01 <- function(data,
                                          name = "mh_p_ple__exp_nm__v01",
                                          events = "ses-03A",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      vars      = vars_mh_p_ple__exp__v01,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Parent\] (Experience Good Events): Count - Version 1
#' (Year 3)"
#' @description
#' Computes the summary score `mh_p_ple__exp__good_count__v01`
#' Life Events \[Parent\] (Experience Good Events): Count - Version 1 (Year
#' 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__good_count__v01 <- function(
  data,
  name = "mh_p_ple__exp__good_count__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v01)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v01, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v01, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Experience Bad Events): Count - Version 1
#' (Year 3)"
#' @description
#' Computes the summary score `mh_p_ple__exp__bad_count__v01`
#' Life Events \[Parent\] (Experience Bad Events): Count - Version 1 (Year
#' 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__bad_count__v01 <- function(
  data,
  name = "mh_p_ple__exp__bad_count__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v01)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v01, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v01, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__v02                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count__v02
#' @format vars_mh_p_ple__v02 is a character vector of all column names
#' used to compute summary score of `mh_p_ple`.
vars_mh_p_ple__v02 <- c(
  "mh_p_ple_001",
  "mh_p_ple_002",
  "mh_p_ple_003",
  "mh_p_ple_004",
  "mh_p_ple_005",
  "mh_p_ple_006",
  "mh_p_ple_007",
  "mh_p_ple_008",
  "mh_p_ple_009",
  "mh_p_ple_010",
  "mh_p_ple_011",
  "mh_p_ple_012",
  "mh_p_ple_013",
  "mh_p_ple_014",
  "mh_p_ple_015",
  "mh_p_ple_016",
  "mh_p_ple_017",
  "mh_p_ple_018",
  "mh_p_ple_019",
  "mh_p_ple_020",
  "mh_p_ple_021",
  "mh_p_ple_022",
  "mh_p_ple_023",
  "mh_p_ple_024",
  "mh_p_ple_025",
  "mh_p_ple_026",
  "mh_p_ple_027",
  "mh_p_ple_028",
  "mh_p_ple_029",
  "mh_p_ple_030",
  "mh_p_ple_031",
  "mh_p_ple_032"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity_sum__v02
#' @format vars_mh_p_ple__severity__v02 is a character vector of all column
#' names
#' used to compute summary score of `mh_p_ple__severity`.
vars_mh_p_ple__severity__v02 <- c(
  "mh_p_ple__severity_001",
  "mh_p_ple__severity_002",
  "mh_p_ple__severity_003",
  "mh_p_ple__severity_004",
  "mh_p_ple__severity_005",
  "mh_p_ple__severity_006",
  "mh_p_ple__severity_007",
  "mh_p_ple__severity_008",
  "mh_p_ple__severity_009",
  "mh_p_ple__severity_010",
  "mh_p_ple__severity_011",
  "mh_p_ple__severity_012",
  "mh_p_ple__severity_013",
  "mh_p_ple__severity_014",
  "mh_p_ple__severity_015",
  "mh_p_ple__severity_016",
  "mh_p_ple__severity_017",
  "mh_p_ple__severity_018",
  "mh_p_ple__severity_019",
  "mh_p_ple__severity_020",
  "mh_p_ple__severity_021",
  "mh_p_ple__severity_022",
  "mh_p_ple__severity_023",
  "mh_p_ple__severity_024",
  "mh_p_ple__severity_025",
  "mh_p_ple__severity_026",
  "mh_p_ple__severity_027",
  "mh_p_ple__severity_028",
  "mh_p_ple__severity_029",
  "mh_p_ple__severity_030",
  "mh_p_ple__severity_031",
  "mh_p_ple__severity_032"
)


#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity__good_sum__v02
#' @format vars_mh_p_ple__exp__v02 is a character vector of all column names
#' used to compute summary score of `mh_p_ple__exp`.
vars_mh_p_ple__exp__v02 <- c(
  "mh_p_ple__exp_001",
  "mh_p_ple__exp_002",
  "mh_p_ple__exp_003",
  "mh_p_ple__exp_004",
  "mh_p_ple__exp_005",
  "mh_p_ple__exp_006",
  "mh_p_ple__exp_007",
  "mh_p_ple__exp_008",
  "mh_p_ple__exp_009",
  "mh_p_ple__exp_010",
  "mh_p_ple__exp_011",
  "mh_p_ple__exp_012",
  "mh_p_ple__exp_013",
  "mh_p_ple__exp_014",
  "mh_p_ple__exp_015",
  "mh_p_ple__exp_016",
  "mh_p_ple__exp_017",
  "mh_p_ple__exp_018",
  "mh_p_ple__exp_019",
  "mh_p_ple__exp_020",
  "mh_p_ple__exp_021",
  "mh_p_ple__exp_022",
  "mh_p_ple__exp_023",
  "mh_p_ple__exp_024",
  "mh_p_ple__exp_025",
  "mh_p_ple__exp_026",
  "mh_p_ple__exp_027",
  "mh_p_ple__exp_028",
  "mh_p_ple__exp_029",
  "mh_p_ple__exp_030",
  "mh_p_ple__exp_031",
  "mh_p_ple__exp_032"
)

#' Compute "Life Events \[Parent\] (Events): Count - Version 2 (Year 4 and Year
#' 5)"
#' @description
#' Computes the summary score `mh_p_ple_count__v02`
#' Life Events \[Parent\] (Events): Count - Version 2 (Year 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_count__v02 <- function(data,
                                        name = "mh_p_ple_count__v02",
                                        events = c("ses-04A", "ses-05A"),
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ple__v02,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Parent\] (Events): Number missing - Version 2 (Year 4
#' and Year 5)"
#' @description
#' Computes the summary score `mh_p_ple_nm__v02`
#' Life Events \[Parent\] (Events): Number missing - Version 2 (Year 4 and
#' Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_nm__v02 <- function(data,
                                     name = "mh_p_ple_nm__v02",
                                     events = c("ses-04A", "ses-05A"),
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ple__v02,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_p_ple__severity__v02                                                 ####

#' Compute "Life Events \[Parent\] (Severity): Sum - Version 2 (Year 4 and Year
#' 5) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_sum__v02`
#' Life Events \[Parent\] (Severity): Sum - Version 2 (Year 4 and Year 5)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_sum__v02 <- function(
  data,
  name = "mh_p_ple__severity_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Mean - Version 2 (Year 4 and Year
#' 5) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_mean__v02`
#' Life Events \[Parent\] (Severity): Mean - Version 2 (Year 4 and Year 5)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_mean__v02 <- function(
  data,
  name = "mh_p_ple__severity_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Number missing - Version 2 (Year
#' 4 and Year 5)"
#' @description
#' Computes the summary score `mh_p_ple__severity_nm__v02`
#' Life Events \[Parent\] (Severity): Number missing - Version 2 (Year 4
#' and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_nm__v02 <- function(
  data,
  name = "mh_p_ple__severity_nm__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      vars      = vars_mh_p_ple__severity__v02,
      events    = events,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Sum - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_sum__v02`
#' Life Events \[Parent\] (Severity of Good Events): Sum - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v02,
#'    vars_mh_p_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_sum__v02 <- function(
  data,
  name = "mh_p_ple__severity__good_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Mean - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_mean__v02`
#' Life Events \[Parent\] (Severity of Good Events): Mean - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v02,
#'    vars_mh_p_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_mean__v02 <- function(
  data,
  name = "mh_p_ple__severity__good_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v02,
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Sum - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_sum__v02`
#' Life Events \[Parent\] (Severity of Bad Events): Sum - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v02,
#'    vars_mh_p_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_sum__v02 <- function(
  data,
  name = "mh_p_ple__severity__bad_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v02,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Mean - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_mean__v02`
#' Life Events \[Parent\] (Severity of Bad Events): Mean - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v02,
#'    vars_mh_p_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 32 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_mean__v02 <- function(
  data,
  name = "mh_p_ple__severity__bad_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v02,
      vars        = vars_mh_p_ple__severity__v02,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v02,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__exp__v02                                                      ####


#' Compute "Life Events \[Parent\] (Experience): Number missing - Version 2
#' (Year 4 and Year 5)"
#' @description
#' Computes the summary score `mh_p_ple__exp_nm__v02`
#' Life Events \[Parent\] (Experience): Number missing - Version 2 (Year 4
#' and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp_nm__v02 <- function(data,
                                          name = "mh_p_ple__exp_nm__v02",
                                          events = c("ses-04A", "ses-05A"),
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      vars      = vars_mh_p_ple__exp__v02,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Parent\] (Experience Good Events): Count - Version
#' 2 (Year 4 and Year 5)"
#' @description
#' Computes the summary score `mh_p_ple__exp__good_count__v02`
#' Life Events \[Parent\] (Experience Good Events): Count - Version 2 (Year
#' 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__good_count__v02 <- function(
  data,
  name = "mh_p_ple__exp__good_count__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v02)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v02, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v02, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Experience Bad Events): Count - Version
#' 2 (Year 4 and Year 5)"
#' @description
#' Computes the summary score `mh_p_ple__exp__bad_count__v02`
#' Life Events \[Parent\] (Experience Bad Events): Count - Version 2 (Year
#' 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__bad_count__v02 <- function(
  data,
  name = "mh_p_ple__exp__bad_count__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v02)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v02, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v02, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__v03                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count__v03
#' @format vars_mh_p_ple__v03 is a character vector of all column names
#' used to compute summary score of `mh_p_ple`.
vars_mh_p_ple__v03 <- c(
  "mh_p_ple_001",
  "mh_p_ple_002",
  "mh_p_ple_003",
  "mh_p_ple_004",
  "mh_p_ple_005",
  "mh_p_ple_006",
  "mh_p_ple_007",
  "mh_p_ple_008",
  "mh_p_ple_009",
  "mh_p_ple_010",
  "mh_p_ple_011",
  "mh_p_ple_012",
  "mh_p_ple_013",
  "mh_p_ple_014",
  "mh_p_ple_015",
  "mh_p_ple_016",
  "mh_p_ple_017",
  "mh_p_ple_018",
  "mh_p_ple_019",
  "mh_p_ple_020",
  "mh_p_ple_021",
  "mh_p_ple_022",
  "mh_p_ple_023",
  "mh_p_ple_024",
  "mh_p_ple_025",
  "mh_p_ple_026",
  "mh_p_ple_027",
  "mh_p_ple_028",
  "mh_p_ple_029",
  "mh_p_ple_030",
  "mh_p_ple_031",
  "mh_p_ple_032",
  "mh_p_ple_033"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity_sum__v03
#' @format vars_mh_p_ple__severity__v03 is a character vector of all column
#' names
#' used to compute summary score of `mh_p_ple__severity`.
vars_mh_p_ple__severity__v03 <- c(
  "mh_p_ple__severity_001",
  "mh_p_ple__severity_002",
  "mh_p_ple__severity_003",
  "mh_p_ple__severity_004",
  "mh_p_ple__severity_005",
  "mh_p_ple__severity_006",
  "mh_p_ple__severity_007",
  "mh_p_ple__severity_008",
  "mh_p_ple__severity_009",
  "mh_p_ple__severity_010",
  "mh_p_ple__severity_011",
  "mh_p_ple__severity_012",
  "mh_p_ple__severity_013",
  "mh_p_ple__severity_014",
  "mh_p_ple__severity_015",
  "mh_p_ple__severity_016",
  "mh_p_ple__severity_017",
  "mh_p_ple__severity_018",
  "mh_p_ple__severity_019",
  "mh_p_ple__severity_020",
  "mh_p_ple__severity_021",
  "mh_p_ple__severity_022",
  "mh_p_ple__severity_023",
  "mh_p_ple__severity_024",
  "mh_p_ple__severity_025",
  "mh_p_ple__severity_026",
  "mh_p_ple__severity_027",
  "mh_p_ple__severity_028",
  "mh_p_ple__severity_029",
  "mh_p_ple__severity_030",
  "mh_p_ple__severity_031",
  "mh_p_ple__severity_032",
  "mh_p_ple__severity_033"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity__good_sum__v03
#' @format vars_mh_p_ple__exp__v03 is a character vector of all column names
#' used to compute summary score of `mh_p_ple__exp`.
vars_mh_p_ple__exp__v03 <- c(
  "mh_p_ple__exp_001",
  "mh_p_ple__exp_002",
  "mh_p_ple__exp_003",
  "mh_p_ple__exp_004",
  "mh_p_ple__exp_005",
  "mh_p_ple__exp_006",
  "mh_p_ple__exp_007",
  "mh_p_ple__exp_008",
  "mh_p_ple__exp_009",
  "mh_p_ple__exp_010",
  "mh_p_ple__exp_011",
  "mh_p_ple__exp_012",
  "mh_p_ple__exp_013",
  "mh_p_ple__exp_014",
  "mh_p_ple__exp_015",
  "mh_p_ple__exp_016",
  "mh_p_ple__exp_017",
  "mh_p_ple__exp_018",
  "mh_p_ple__exp_019",
  "mh_p_ple__exp_020",
  "mh_p_ple__exp_021",
  "mh_p_ple__exp_022",
  "mh_p_ple__exp_023",
  "mh_p_ple__exp_024",
  "mh_p_ple__exp_025",
  "mh_p_ple__exp_026",
  "mh_p_ple__exp_027",
  "mh_p_ple__exp_028",
  "mh_p_ple__exp_029",
  "mh_p_ple__exp_030",
  "mh_p_ple__exp_031",
  "mh_p_ple__exp_032",
  "mh_p_ple__exp_033"
)


#' Compute "Life Events \[Parent\] (Events): Count - Version 3 (Year 6)"
#' @description
#' Computes the summary score `mh_p_ple_count__v03`
#' Life Events \[Parent\] (Events): Count - Version 3 (Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_count__v03 <- function(data,
                                        name = "mh_p_ple_count__v03",
                                        events = "ses-06A",
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ple__v03,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Parent\] (Events): Number missing - Version 3 (Year
#' 6 )"
#' @description
#' Computes the summary score `mh_p_ple_nm__v03`
#' Life Events \[Parent\] (Events): Number missing - Version 3 (Year 6 )
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_nm__v03 <- function(data,
                                     name = "mh_p_ple_nm__v03",
                                     events = "ses-06A",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ple__v03,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_p_ple__severity__v03                                                 ####

#' Compute "Life Events \[Parent\] (Severity): Sum - Version 3 (Year 6 )
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_sum__v03`
#' Life Events \[Parent\] (Severity): Sum - Version 3 (Year 6 )
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_sum__v03 <- function(
  data,
  name = "mh_p_ple__severity_sum__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Mean - Version 3 (Year 6 )
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_mean__v03`
#' Life Events \[Parent\] (Severity): Mean - Version 3 (Year 6 )
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_mean__v03 <- function(
  data,
  name = "mh_p_ple__severity_mean__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Number missing - Version 3 (Year
#' 6 )"
#' @description
#' Computes the summary score `mh_p_ple__severity_nm__v03`
#' Life Events \[Parent\] (Severity): Number missing - Version 3 (Year 6 )
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_nm__v03 <- function(
  data,
  name = "mh_p_ple__severity_nm__v03",
  events = "ses-06A",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      vars      = vars_mh_p_ple__severity__v03,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Sum -
#' Version 3 (Year 6 ) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_sum__v03`
#' Life Events \[Parent\] (Severity of Good Events): Sum - Version 3 (Year
#' 6 ) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v03,
#'    vars_mh_p_ple__severity__v03
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_sum__v03 <- function(
  data,
  name = "mh_p_ple__severity__good_sum__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Mean -
#' Version 3 (Year 6 ) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_mean__v03`
#' Life Events \[Parent\] (Severity of Good Events): Mean - Version 3 (Year
#' 6 ) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v03,
#'    vars_mh_p_ple__severity__v03
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_mean__v03 <- function(
  data,
  name = "mh_p_ple__severity__good_mean__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v03,
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Sum -
#' Version 3 (Year 6 ) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_sum__v03`
#' Life Events \[Parent\] (Severity of Bad Events): Sum - Version 3 (Year
#' 6 ) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v03,
#'    vars_mh_p_ple__severity__v03
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_sum__v03 <- function(
  data,
  name = "mh_p_ple__severity__bad_sum__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v03,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Mean -
#' Version 3 (Year 6 ) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_mean__v03`
#' Life Events \[Parent\] (Severity of Bad Events): Mean - Version 3 (Year
#' 6 ) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v03,
#'    vars_mh_p_ple__severity__v03
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_mean__v03 <- function(
  data,
  name = "mh_p_ple__severity__bad_mean__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v03,
      vars        = vars_mh_p_ple__severity__v03,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v03,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__exp__v03                                                      ####


#' Compute "Life Events \[Parent\] (Experience): Number missing - Version 3
#' (Year 6 )"
#' @description
#' Computes the summary score `mh_p_ple__exp_nm__v03`
#' Life Events \[Parent\] (Experience): Number missing - Version 3 (Year
#' 6 )
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp_nm__v03 <- function(data,
                                          name = "mh_p_ple__exp_nm__v03",
                                          events = "ses-06A",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      vars      = vars_mh_p_ple__exp__v03,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Parent\] (Experience Good Events): Count - Version
#' 3 (Year 6)"
#' @description
#' Computes the summary score `mh_p_ple__exp__good_count__v03`
#' Life Events \[Parent\] (Experience Good Events): Count - Version 3 (Year
#' 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__good_count__v03 <- function(
  data,
  name = "mh_p_ple__exp__good_count__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v03)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v03, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v03, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Experience Bad Events): Count - Version
#' 3 (Year 6)"
#' @description
#' Computes the summary score `mh_p_ple__exp__bad_count__v03`
#' Life Events \[Parent\] (Experience Bad Events): Count - Version 3 (Year
#' 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__bad_count__v03 <- function(
  data,
  name = "mh_p_ple__exp__bad_count__v03",
  events = "ses-06A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v03)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v03, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v03, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   mh_p_ple__v04                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple_count__v04
#' @format vars_mh_p_ple__v04 is a character vector of all column names
#' used to compute summary score of `mh_p_ple`.
vars_mh_p_ple__v04 <- c(
  "mh_p_ple_001",
  "mh_p_ple_002",
  # "mh_p_ple_003",
  # "mh_p_ple_004",
  # "mh_p_ple_005",
  # "mh_p_ple_006",
  "mh_p_ple_007",
  "mh_p_ple_008",
  # "mh_p_ple_009",
  # "mh_p_ple_010",
  "mh_p_ple_011",
  "mh_p_ple_012",
  "mh_p_ple_013",
  "mh_p_ple_014",
  "mh_p_ple_015",
  # "mh_p_ple_016",
  # "mh_p_ple_017",
  "mh_p_ple_018",
  "mh_p_ple_019",
  # "mh_p_ple_020",
  "mh_p_ple_021",
  "mh_p_ple_022",
  "mh_p_ple_023",
  "mh_p_ple_024",
  # "mh_p_ple_025",
  "mh_p_ple_026",
  "mh_p_ple_027",
  "mh_p_ple_028",
  # "mh_p_ple_029",
  # "mh_p_ple_030",
  # "mh_p_ple_031",
  "mh_p_ple_032",
  "mh_p_ple_033"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity_sum__v04
#' @format vars_mh_p_ple__severity__v04 is a character vector of all column
#' names
#' used to compute summary score of `mh_p_ple__severity`.
vars_mh_p_ple__severity__v04 <- c(
  "mh_p_ple__severity_001",
  "mh_p_ple__severity_002",
  # "mh_p_ple__severity_003",
  # "mh_p_ple__severity_004",
  # "mh_p_ple__severity_005",
  # "mh_p_ple__severity_006",
  "mh_p_ple__severity_007",
  "mh_p_ple__severity_008",
  # "mh_p_ple__severity_009",
  # "mh_p_ple__severity_010",
  "mh_p_ple__severity_011",
  "mh_p_ple__severity_012",
  "mh_p_ple__severity_013",
  "mh_p_ple__severity_014",
  "mh_p_ple__severity_015",
  # "mh_p_ple__severity_016",
  # "mh_p_ple__severity_017",
  "mh_p_ple__severity_018",
  "mh_p_ple__severity_019",
  # "mh_p_ple__severity_020",
  "mh_p_ple__severity_021",
  "mh_p_ple__severity_022",
  "mh_p_ple__severity_023",
  "mh_p_ple__severity_024",
  # "mh_p_ple__severity_025",
  "mh_p_ple__severity_026",
  "mh_p_ple__severity_027",
  "mh_p_ple__severity_028",
  # "mh_p_ple__severity_029",
  # "mh_p_ple__severity_030",
  # "mh_p_ple__severity_031",
  "mh_p_ple__severity_032",
  "mh_p_ple__severity_033"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ple__severity__good_sum__v04
#' @format vars_mh_p_ple__exp__v04 is a character vector of all column names
#' used to compute summary score of `mh_p_ple__exp`.
vars_mh_p_ple__exp__v04 <- c(
  "mh_p_ple__exp_001",
  "mh_p_ple__exp_002",
  # "mh_p_ple__exp_003",
  # "mh_p_ple__exp_004",
  # "mh_p_ple__exp_005",
  # "mh_p_ple__exp_006",
  "mh_p_ple__exp_007",
  "mh_p_ple__exp_008",
  # "mh_p_ple__exp_009",
  # "mh_p_ple__exp_010",
  "mh_p_ple__exp_011",
  "mh_p_ple__exp_012",
  "mh_p_ple__exp_013",
  "mh_p_ple__exp_014",
  "mh_p_ple__exp_015",
  # "mh_p_ple__exp_016",
  # "mh_p_ple__exp_017",
  "mh_p_ple__exp_018",
  "mh_p_ple__exp_019",
  # "mh_p_ple__exp_020",
  "mh_p_ple__exp_021",
  "mh_p_ple__exp_022",
  "mh_p_ple__exp_023",
  "mh_p_ple__exp_024",
  # "mh_p_ple__exp_025",
  "mh_p_ple__exp_026",
  "mh_p_ple__exp_027",
  "mh_p_ple__exp_028",
  # "mh_p_ple__exp_029",
  # "mh_p_ple__exp_030",
  # "mh_p_ple__exp_031",
  "mh_p_ple__exp_032",
  "mh_p_ple__exp_033"
)


#' Compute "Life Events \[Parent\] (Events): Count - Version 4 (Starting at Year
#' 7)"
#' @description
#' Computes the summary score `mh_p_ple_count__v04`
#' Life Events \[Parent\] (Events): Count - Version 4 (Starting at Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_count__v04 <- function(data,
                                        name = "mh_p_ple_count__v04",
                                        events = "ses-07A",
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_ple__v04,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Parent\] (Events): Number missing - Version 4
#' (Starting at Year 7)"
#' @description
#' Computes the summary score `mh_p_ple_nm__v04`
#' Life Events \[Parent\] (Events): Number missing - Version 4 (Starting at
#' Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple_nm__v04 <- function(data,
                                     name = "mh_p_ple_nm__v04",
                                     events = "ses-07A",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_ple__v04,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_p_ple__severity__v04                                                 ####

#' Compute "Life Events \[Parent\] (Severity): Sum - Version 4 (Starting at Year
#' 7) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_sum__v04`
#' Life Events \[Parent\] (Severity): Sum - Version 4 (Starting at Year 7)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_sum__v04 <- function(
  data,
  name = "mh_p_ple__severity_sum__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Mean - Version 4 (Starting at
#' Year 7) \[Validation: No more than 6 events missing and no severity items
#' missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity_mean__v04`
#' Life Events \[Parent\] (Severity): Mean - Version 4 (Starting at Year 7)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_mean__v04 <- function(
  data,
  name = "mh_p_ple__severity_mean__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Parent\] (Severity): Number missing - Version 4
#' (Starting at Year 7)"
#' @description
#' Computes the summary score `mh_p_ple__severity_nm__v04`
#' Life Events \[Parent\] (Severity): Number missing - Version 4 (Starting
#' at Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__severity__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity_nm__v04 <- function(
  data,
  name = "mh_p_ple__severity_nm__v04",
  events = "ses-07A",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      vars      = vars_mh_p_ple__severity__v04,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Sum - Version
#' 4 (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_sum__v04`
#' Life Events \[Parent\] (Severity of Good Events): Sum - Version 4
#' (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v04,
#'    vars_mh_p_ple__severity__v04
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_sum__v04 <- function(
  data,
  name = "mh_p_ple__severity__good_sum__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v04(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v04(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v04,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Good Events): Mean - Version
#' 4 (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__good_mean__v04`
#' Life Events \[Parent\] (Severity of Good Events): Mean - Version 4
#' (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v04,
#'    vars_mh_p_ple__severity__v04
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__good_mean__v04 <- function(
  data,
  name = "mh_p_ple__severity__good_mean__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v04(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v04(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v04,
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Sum - Version 4
#' (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_sum__v04`
#' Life Events \[Parent\] (Severity of Bad Events): Sum - Version 4
#' (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v04,
#'    vars_mh_p_ple__severity__v04
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_sum__v04 <- function(
  data,
  name = "mh_p_ple__severity__bad_sum__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v04(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v04(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v04,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Severity of Bad Events): Mean - Version
#' 4 (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_p_ple__severity__bad_mean__v04`
#' Life Events \[Parent\] (Severity of Bad Events): Mean - Version 4
#' (Starting at Year 7) \[Validation: No more than 4 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_p_ple__exp__v04,
#'    vars_mh_p_ple__severity__v04
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 4 of 20 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 4).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__severity__bad_mean__v04 <- function(
  data,
  name = "mh_p_ple__severity__bad_mean__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_p_ple__exp_nm__v04(
      name = "exp_internal"
    ) |>
    compute_mh_p_ple__severity_nm__v04(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_p_ple__exp__v04,
      vars        = vars_mh_p_ple__severity__v04,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__exp__v04,
      fork_val  = "2",
      vars      = paste0(vars_mh_p_ple__severity__v04, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple__exp__v04                                                      ####


#' Compute "Life Events \[Parent\] (Experience): Number missing - Version 4
#' (Starting at Year 7)"
#' @description
#' Computes the summary score `mh_p_ple__exp_nm__v04`
#' Life Events \[Parent\] (Experience): Number missing - Version 4
#' (Starting at Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp_nm__v04 <- function(data,
                                          name = "mh_p_ple__exp_nm__v04",
                                          events = "ses-07A",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      vars      = vars_mh_p_ple__exp__v04,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Parent\] (Experience Good Events): Count - Version
#' 4 (Starting at Year 7)"
#' @description
#' Computes the summary score `mh_p_ple__exp__good_count__v04`
#' Life Events \[Parent\] (Experience Good Events): Count - Version 4
#' (Starting at Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__good_count__v04 <- function(
  data,
  name = "mh_p_ple__exp__good_count__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v04)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v04, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v04, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Parent\] (Experience Bad Events): Count - Version
#' 4 (Starting at Year 7)"
#' @description
#' Computes the summary score `mh_p_ple__exp__bad_count__v04`
#' Life Events \[Parent\] (Experience Bad Events): Count - Version 4
#' (Starting at Year 7)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ple__exp__v04 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inheritParams dummy_mh
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_p_ple__exp__bad_count__v04 <- function(
  data,
  name = "mh_p_ple__exp__bad_count__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_p_ple_count__v04(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_p_ple__exp__v04)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_p_ple__exp__v04, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_p_ple__v04,
      fork_val  = "1",
      vars      = paste0(vars_mh_p_ple__exp__v04, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_p_ple_all                                                            ####

#' Compute all summary scores for mh_p_ple
#' @description
#' This function computes all summary scores for the mh_p_ple form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_ple_all(data)
#' }
compute_mh_p_ple_all <- function(data) {
  data |>
    compute_mh_p_ple__exp__bad_count() |> # 1
    compute_mh_p_ple__exp__bad_count__v01() |> # 2
    compute_mh_p_ple__exp__bad_count__v02() |> # 3
    compute_mh_p_ple__exp__bad_count__v03() |> # 4
    compute_mh_p_ple__exp__bad_count__v04() |> # 5
    compute_mh_p_ple__exp__good_count() |> # 6
    compute_mh_p_ple__exp__good_count__v01() |> # 7
    compute_mh_p_ple__exp__good_count__v02() |> # 8
    compute_mh_p_ple__exp__good_count__v03() |> # 9
    compute_mh_p_ple__exp__good_count__v04() |> # 10
    compute_mh_p_ple__exp_nm() |> # 11
    compute_mh_p_ple__exp_nm__v01() |> # 12
    compute_mh_p_ple__exp_nm__v02() |> # 13
    compute_mh_p_ple__exp_nm__v03() |> # 14
    compute_mh_p_ple__exp_nm__v04() |> # 15
    compute_mh_p_ple__severity__bad_mean() |> # 16
    compute_mh_p_ple__severity__bad_mean__v01() |> # 17
    compute_mh_p_ple__severity__bad_mean__v02() |> # 18
    compute_mh_p_ple__severity__bad_mean__v03() |> # 19
    compute_mh_p_ple__severity__bad_mean__v04() |> # 20
    compute_mh_p_ple__severity__bad_sum() |> # 21
    compute_mh_p_ple__severity__bad_sum__v01() |> # 22
    compute_mh_p_ple__severity__bad_sum__v02() |> # 23
    compute_mh_p_ple__severity__bad_sum__v03() |> # 24
    compute_mh_p_ple__severity__bad_sum__v04() |> # 25
    compute_mh_p_ple__severity__good_mean() |> # 26
    compute_mh_p_ple__severity__good_mean__v01() |> # 27
    compute_mh_p_ple__severity__good_mean__v02() |> # 28
    compute_mh_p_ple__severity__good_mean__v03() |> # 29
    compute_mh_p_ple__severity__good_mean__v04() |> # 30
    compute_mh_p_ple__severity__good_sum() |> # 31
    compute_mh_p_ple__severity__good_sum__v01() |> # 32
    compute_mh_p_ple__severity__good_sum__v02() |> # 33
    compute_mh_p_ple__severity__good_sum__v03() |> # 34
    compute_mh_p_ple__severity__good_sum__v04() |> # 35
    compute_mh_p_ple__severity_mean() |> # 36
    compute_mh_p_ple__severity_mean__v01() |> # 37
    compute_mh_p_ple__severity_mean__v02() |> # 38
    compute_mh_p_ple__severity_mean__v03() |> # 39
    compute_mh_p_ple__severity_mean__v04() |> # 40
    compute_mh_p_ple__severity_nm() |> # 41
    compute_mh_p_ple__severity_nm__v01() |> # 42
    compute_mh_p_ple__severity_nm__v02() |> # 43
    compute_mh_p_ple__severity_nm__v03() |> # 44
    compute_mh_p_ple__severity_nm__v04() |> # 45
    compute_mh_p_ple__severity_sum() |> # 46
    compute_mh_p_ple__severity_sum__v01() |> # 47
    compute_mh_p_ple__severity_sum__v02() |> # 48
    compute_mh_p_ple__severity_sum__v03() |> # 49
    compute_mh_p_ple__severity_sum__v04() |> # 50
    compute_mh_p_ple_nm() |> # 51
    compute_mh_p_ple_nm__v01() |> # 52
    compute_mh_p_ple_nm__v02() |> # 53
    compute_mh_p_ple_nm__v03() |> # 54
    compute_mh_p_ple_nm__v04() |> # 55
    compute_mh_p_ple_count() |> # 56
    compute_mh_p_ple_count__v01() |> # 57
    compute_mh_p_ple_count__v02() |> # 58
    compute_mh_p_ple_count__v03() |> # 59
    compute_mh_p_ple_count__v04() # 60
}


#   ____________________________________________________________________________
#   mh_y_ple                                                                ####

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple_count
#' @format vars_mh_y_ple is a character vector of all column names
#' used to compute summary score of `mh_y_ple`.
vars_mh_y_ple <- c(
  "mh_y_ple_001",
  "mh_y_ple_002",
  "mh_y_ple_003",
  "mh_y_ple_004",
  "mh_y_ple_005",
  "mh_y_ple_006",
  "mh_y_ple_007",
  "mh_y_ple_008",
  "mh_y_ple_009",
  "mh_y_ple_010",
  "mh_y_ple_011",
  "mh_y_ple_012",
  "mh_y_ple_013",
  "mh_y_ple_014",
  "mh_y_ple_015",
  "mh_y_ple_016",
  "mh_y_ple_017",
  "mh_y_ple_018",
  "mh_y_ple_019",
  "mh_y_ple_020",
  "mh_y_ple_021",
  "mh_y_ple_022",
  "mh_y_ple_023",
  "mh_y_ple_024",
  "mh_y_ple_025"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity_sum
#' @format vars_mh_y_ple__severity is a character vector of all column names
#' used to compute summary score of `mh_y_ple__severity`.
vars_mh_y_ple__severity <- c(
  "mh_y_ple__severity_001",
  "mh_y_ple__severity_002",
  "mh_y_ple__severity_003",
  "mh_y_ple__severity_004",
  "mh_y_ple__severity_005",
  "mh_y_ple__severity_006",
  "mh_y_ple__severity_007",
  "mh_y_ple__severity_008",
  "mh_y_ple__severity_009",
  "mh_y_ple__severity_010",
  "mh_y_ple__severity_011",
  "mh_y_ple__severity_012",
  "mh_y_ple__severity_013",
  "mh_y_ple__severity_014",
  "mh_y_ple__severity_015",
  "mh_y_ple__severity_016",
  "mh_y_ple__severity_017",
  "mh_y_ple__severity_018",
  "mh_y_ple__severity_019",
  "mh_y_ple__severity_020",
  "mh_y_ple__severity_021",
  "mh_y_ple__severity_022",
  "mh_y_ple__severity_023",
  "mh_y_ple__severity_024",
  "mh_y_ple__severity_025"
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity__good_sum
#' @format vars_mh_y_ple__exp is a character vector of all column names
#' used to compute summary score of `mh_y_ple__exp`.
vars_mh_y_ple__exp <- c(
  "mh_y_ple__exp_001",
  "mh_y_ple__exp_002",
  "mh_y_ple__exp_003",
  "mh_y_ple__exp_004",
  "mh_y_ple__exp_005",
  "mh_y_ple__exp_006",
  "mh_y_ple__exp_007",
  "mh_y_ple__exp_008",
  "mh_y_ple__exp_009",
  "mh_y_ple__exp_010",
  "mh_y_ple__exp_011",
  "mh_y_ple__exp_012",
  "mh_y_ple__exp_013",
  "mh_y_ple__exp_014",
  "mh_y_ple__exp_015",
  "mh_y_ple__exp_016",
  "mh_y_ple__exp_017",
  "mh_y_ple__exp_018",
  "mh_y_ple__exp_019",
  "mh_y_ple__exp_020",
  "mh_y_ple__exp_021",
  "mh_y_ple__exp_022",
  "mh_y_ple__exp_023",
  "mh_y_ple__exp_024",
  "mh_y_ple__exp_025"
)


#' Compute "Life Events \[Youth\] (Events): Count"
#' @description
#' Computes the summary score `mh_y_ple_count`
#' Life Events \[Youth\] (Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_count <- function(data,
                                   name = "mh_y_ple_count",
                                   combine = TRUE,
                                   max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ple,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#' Compute "Life Events \[Youth\] (Events): Number missing"
#' @description
#' Computes the summary score `mh_y_ple_nm`
#' Life Events \[Youth\] (Events): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_y_ple_nm <- function(data,
                                name = "mh_y_ple_nm",
                                combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ple,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_y_ple__severity                                                      ####


#' Compute "Life Events \[Youth\] (Severity): Sum \[Validation: No more than 5
#' events missing and no severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_sum`
#' Life Events \[Youth\] (Severity): Sum \[Validation: No more than 5
#' events missing and no severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_sum <- function(data,
                                           name = "mh_y_ple__severity_sum",
                                           combine = TRUE,
                                           max_na = 5) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple,
      vars        = vars_mh_y_ple__severity,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Mean \[Validation: No more than 5
#' events missing and no severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_mean`
#' Life Events \[Youth\] (Severity): Mean \[Validation: No more than 5
#' events missing and no severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_mean <- function(data,
                                            name = "mh_y_ple__severity_mean",
                                            combine = TRUE,
                                            max_na = 5) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple,
      vars        = vars_mh_y_ple__severity,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Number missing"
#' @description
#' Computes the summary score `mh_y_ple__severity_nm`
#' Life Events \[Youth\] (Severity): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_y_ple__severity_nm <- function(data,
                                          name = "mh_y_ple__severity_nm",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      vars      = vars_mh_y_ple__severity,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Sum \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_sum`
#' Life Events \[Youth\] (Severity of Good Events): Sum \[Validation: No
#' more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp,
#'    vars_mh_y_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_sum <- function(
  data,
  name = "mh_y_ple__severity__good_sum",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp,
      vars        = vars_mh_y_ple__severity,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_mean`
#' Life Events \[Youth\] (Severity of Good Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp,
#'    vars_mh_y_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_mean <- function(
  data,
  name = "mh_y_ple__severity__good_mean",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp,
      vars        = vars_mh_y_ple__severity,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp,
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Sum \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_sum`
#' Life Events \[Youth\] (Severity of Bad Events): Sum \[Validation: No
#' more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp,
#'    vars_mh_y_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_sum <- function(
  data,
  name = "mh_y_ple__severity__bad_sum",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp,
      vars        = vars_mh_y_ple__severity,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Mean \[Validation:
#' No more than 5 events missing and no experience/severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_mean`
#' Life Events \[Youth\] (Severity of Bad Events): Mean \[Validation: No
#' more than 5 events missing and no experience/severity items missing or
#' declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp,
#'    vars_mh_y_ple__severity
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 5 of 25 items missing
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 5).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_mean <- function(
  data,
  name = "mh_y_ple__severity__bad_mean",
  combine = TRUE,
  max_na = 5
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp,
      vars        = vars_mh_y_ple__severity,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_y_ple__exp                                                           ####


#' Compute "Life Events \[Youth\] (Experience): Number missing"
#' @description
#' Computes the summary score `mh_y_ple__exp_nm`
#' Life Events \[Youth\] (Experience): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
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
compute_mh_y_ple__exp_nm <- function(data,
                                     name = "mh_y_ple__exp_nm",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      vars      = vars_mh_y_ple__exp,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}

#' Compute "Life Events \[Youth\] (Experience Good Events): Count"
#' @description
#' Computes the summary score `mh_y_ple__exp__good_count`
#' Life Events \[Youth\] (Experience Good Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__good_count <- function(data,
                                              name = "mh_y_ple__exp__good_count",
                                              combine = TRUE,
                                              max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Experience Bad Events): Count"
#' @description
#' Computes the summary score `mh_y_ple__exp__bad_count`
#' Life Events \[Youth\] (Experience Bad Events): Count
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__bad_count <- function(data,
                                             name = "mh_y_ple__exp__bad_count",
                                             combine = TRUE,
                                             max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data_ss <- data |>
    compute_mh_y_ple_count(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   mh_y_ple__v01                                                           ####

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple_count__v01
#' @format vars_mh_y_ple__v01 is a character vector of all column names
#' used to compute summary score of `mh_y_ple`.
vars_mh_y_ple__v01 <- c(
  "mh_y_ple_001",
  "mh_y_ple_002",
  "mh_y_ple_003",
  "mh_y_ple_004",
  "mh_y_ple_005",
  "mh_y_ple_006",
  "mh_y_ple_007",
  "mh_y_ple_008",
  "mh_y_ple_009",
  "mh_y_ple_010",
  "mh_y_ple_011",
  "mh_y_ple_012",
  "mh_y_ple_013",
  "mh_y_ple_014",
  "mh_y_ple_015",
  "mh_y_ple_016",
  "mh_y_ple_017",
  "mh_y_ple_018",
  "mh_y_ple_019",
  "mh_y_ple_020",
  "mh_y_ple_021",
  "mh_y_ple_022",
  "mh_y_ple_023",
  "mh_y_ple_024",
  "mh_y_ple_025",
  "mh_y_ple_026", # ple_deported_y
  "mh_y_ple_027", # ple_hospitalized_y
  "mh_y_ple_028", # ple_foster_care_y
  "mh_y_ple_029", # ple_hit_y
  "mh_y_ple_030", # ple_shot_y
  "mh_y_ple_031" # ple_lockdown_y
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity_sum__v01
#' @format vars_mh_y_ple__severity__v01 is a character vector of all column
#' names
#' used to compute summary score of `mh_y_ple__severity`.
vars_mh_y_ple__severity__v01 <- c(
  "mh_y_ple__severity_001",
  "mh_y_ple__severity_002",
  "mh_y_ple__severity_003",
  "mh_y_ple__severity_004",
  "mh_y_ple__severity_005",
  "mh_y_ple__severity_006",
  "mh_y_ple__severity_007",
  "mh_y_ple__severity_008",
  "mh_y_ple__severity_009",
  "mh_y_ple__severity_010",
  "mh_y_ple__severity_011",
  "mh_y_ple__severity_012",
  "mh_y_ple__severity_013",
  "mh_y_ple__severity_014",
  "mh_y_ple__severity_015",
  "mh_y_ple__severity_016",
  "mh_y_ple__severity_017",
  "mh_y_ple__severity_018",
  "mh_y_ple__severity_019",
  "mh_y_ple__severity_020",
  "mh_y_ple__severity_021",
  "mh_y_ple__severity_022",
  "mh_y_ple__severity_023",
  "mh_y_ple__severity_024",
  "mh_y_ple__severity_025",
  "mh_y_ple__severity_026", # ple_deported_y
  "mh_y_ple__severity_027", # ple_hospitalized_y
  "mh_y_ple__severity_028", # ple_foster_care_y
  "mh_y_ple__severity_029", # ple_hit_y
  "mh_y_ple__severity_030", # ple_shot_y
  "mh_y_ple__severity_031" # ple_lockdown_y
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity__good_sum__v01
#' @format vars_mh_y_ple__exp__v01 is a character vector of all column names
#' used to compute summary score of `mh_y_ple__exp`.
vars_mh_y_ple__exp__v01 <- c(
  "mh_y_ple__exp_001",
  "mh_y_ple__exp_002",
  "mh_y_ple__exp_003",
  "mh_y_ple__exp_004",
  "mh_y_ple__exp_005",
  "mh_y_ple__exp_006",
  "mh_y_ple__exp_007",
  "mh_y_ple__exp_008",
  "mh_y_ple__exp_009",
  "mh_y_ple__exp_010",
  "mh_y_ple__exp_011",
  "mh_y_ple__exp_012",
  "mh_y_ple__exp_013",
  "mh_y_ple__exp_014",
  "mh_y_ple__exp_015",
  "mh_y_ple__exp_016",
  "mh_y_ple__exp_017",
  "mh_y_ple__exp_018",
  "mh_y_ple__exp_019",
  "mh_y_ple__exp_020",
  "mh_y_ple__exp_021",
  "mh_y_ple__exp_022",
  "mh_y_ple__exp_023",
  "mh_y_ple__exp_024",
  "mh_y_ple__exp_025",
  "mh_y_ple__exp_026", # ple_deported_y
  "mh_y_ple__exp_027", # ple_hospitalized_y
  "mh_y_ple__exp_028", # ple_foster_care_y
  "mh_y_ple__exp_029", # ple_hit_y
  "mh_y_ple__exp_030", # ple_shot_y
  "mh_y_ple__exp_031" # ple_lockdown_y
)


#' Compute "Life Events \[Youth\] (Events): Count - Version 1 (Year 3)"
#' @description
#' Computes the summary score `mh_y_ple_count__v01`
#' Life Events \[Youth\] (Events): Count - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_count__v01 <- function(data,
                                        name = "mh_y_ple_count__v01",
                                        events = "ses-03A",
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ple__v01,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Youth\] (Events): Number missing - Version 1 (Year 3)"
#' @description
#' Computes the summary score `mh_y_ple_nm__v01`
#' Life Events \[Youth\] (Events): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_nm__v01 <- function(data,
                                     name = "mh_y_ple_nm__v01",
                                     events = "ses-03A",
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ple__v01,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_y_ple__severity__v01                                                 ####

#' Compute "Life Events \[Youth\] (Severity): Sum - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_sum__v01`
#' Life Events \[Youth\] (Severity): Sum - Version 1 (Year 3) \[Validation:
#' No more than 6 events missing and no severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_sum__v01 <- function(
  data,
  name = "mh_y_ple__severity_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Mean - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing or
#' declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_mean__v01`
#' Life Events \[Youth\] (Severity): Mean - Version 1 (Year 3)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_mean__v01 <- function(
  data,
  name = "mh_y_ple__severity_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Number missing - Version 1 (Year
#' 3)"
#' @description
#' Computes the summary score `mh_y_ple__severity_nm__v01`
#' Life Events \[Youth\] (Severity): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_nm__v01 <- function(
  data,
  name = "mh_y_ple__severity_nm__v01",
  events = "ses-03A",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      vars      = vars_mh_y_ple__severity__v01,
      events    = events,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Sum -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_sum__v01`
#' Life Events \[Youth\] (Severity of Good Events): Sum - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v01,
#'    vars_mh_y_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_sum__v01 <- function(
  data,
  name = "mh_y_ple__severity__good_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Mean -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_mean__v01`
#' Life Events \[Youth\] (Severity of Good Events): Mean - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v01,
#'    vars_mh_y_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_mean__v01 <- function(
  data,
  name = "mh_y_ple__severity__good_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v01,
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Sum -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_sum__v01`
#' Life Events \[Youth\] (Severity of Bad Events): Sum - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v01,
#'    vars_mh_y_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_sum__v01 <- function(
  data,
  name = "mh_y_ple__severity__bad_sum__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v01,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Mean -
#' Version 1 (Year 3) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_mean__v01`
#' Life Events \[Youth\] (Severity of Bad Events): Mean - Version 1 (Year
#' 3) \[Validation: No more than 6 events missing and no experience/severity
#' items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v01,
#'    vars_mh_y_ple__severity__v01
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 31 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_mean__v01 <- function(
  data,
  name = "mh_y_ple__severity__bad_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v01(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v01(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v01,
      vars        = vars_mh_y_ple__severity__v01,
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v01,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v01, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_y_ple__exp__v01                                                      ####


#' Compute "Life Events \[Youth\] (Experience): Number missing - Version 1 (Year
#' 3)"
#' @description
#' Computes the summary score `mh_y_ple__exp_nm__v01`
#' Life Events \[Youth\] (Experience): Number missing - Version 1 (Year 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp_nm__v01 <- function(data,
                                          name = "mh_y_ple__exp_nm__v01",
                                          events = "ses-03A",
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      vars      = vars_mh_y_ple__exp__v01,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Youth\] (Experience Good Events): Count - Version 1
#' (Year 3)"
#' @description
#' Computes the summary score `mh_y_ple__exp__good_count__v01`
#' Life Events \[Youth\] (Experience Good Events): Count - Version 1 (Year
#' 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__good_count__v01 <- function(
  data,
  name = "mh_y_ple__exp__good_count__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v01)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v01, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v01, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Experience Bad Events): Count - Version 1
#' (Year 3)"
#' @description
#' Computes the summary score `mh_y_ple__exp__bad_count__v01`
#' Life Events \[Youth\] (Experience Bad Events): Count - Version 1 (Year
#' 3)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v01 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__bad_count__v01 <- function(
  data,
  name = "mh_y_ple__exp__bad_count__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v01(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v01)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v01, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v01,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v01, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_y_ple__v02                                                           ####


#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple_count__v02
#' @format vars_mh_y_ple__v02 is a character vector of all column names
#' used to compute summary score of `mh_y_ple`.
vars_mh_y_ple__v02 <- c(
  "mh_y_ple_001",
  "mh_y_ple_002",
  "mh_y_ple_003",
  "mh_y_ple_004",
  "mh_y_ple_005",
  "mh_y_ple_006",
  "mh_y_ple_007",
  "mh_y_ple_008",
  "mh_y_ple_009",
  "mh_y_ple_010",
  "mh_y_ple_011",
  "mh_y_ple_012",
  "mh_y_ple_013",
  "mh_y_ple_014",
  "mh_y_ple_015",
  "mh_y_ple_016",
  "mh_y_ple_017",
  "mh_y_ple_018",
  "mh_y_ple_019",
  "mh_y_ple_020",
  "mh_y_ple_021",
  "mh_y_ple_022",
  "mh_y_ple_023",
  "mh_y_ple_024",
  "mh_y_ple_025",
  "mh_y_ple_026",
  "mh_y_ple_027",
  "mh_y_ple_028",
  "mh_y_ple_029",
  "mh_y_ple_030",
  "mh_y_ple_031",
  "mh_y_ple_032", # ple_homeless_y
  # "mh_y_ple_033"
  "mh_y_ple_034" # ple_suicide_y
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity_sum__v02
#' @format vars_mh_y_ple__severity__v02 is a character vector of all column
#' names
#' used to compute summary score of `mh_y_ple__severity`.
vars_mh_y_ple__severity__v02 <- c(
  "mh_y_ple__severity_001",
  "mh_y_ple__severity_002",
  "mh_y_ple__severity_003",
  "mh_y_ple__severity_004",
  "mh_y_ple__severity_005",
  "mh_y_ple__severity_006",
  "mh_y_ple__severity_007",
  "mh_y_ple__severity_008",
  "mh_y_ple__severity_009",
  "mh_y_ple__severity_010",
  "mh_y_ple__severity_011",
  "mh_y_ple__severity_012",
  "mh_y_ple__severity_013",
  "mh_y_ple__severity_014",
  "mh_y_ple__severity_015",
  "mh_y_ple__severity_016",
  "mh_y_ple__severity_017",
  "mh_y_ple__severity_018",
  "mh_y_ple__severity_019",
  "mh_y_ple__severity_020",
  "mh_y_ple__severity_021",
  "mh_y_ple__severity_022",
  "mh_y_ple__severity_023",
  "mh_y_ple__severity_024",
  "mh_y_ple__severity_025",
  "mh_y_ple__severity_026",
  "mh_y_ple__severity_027",
  "mh_y_ple__severity_028",
  "mh_y_ple__severity_029",
  "mh_y_ple__severity_030",
  "mh_y_ple__severity_031",
  "mh_y_ple__severity_032", # ple__severity_homeless_y
  # "mh_y_ple__severity_033"
  "mh_y_ple__severity_034" # ple__severity_suicide_y
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity__good_sum__v02
#' @format vars_mh_y_ple__exp__v02 is a character vector of all column names
#' used to compute summary score of `mh_y_ple__exp`.
vars_mh_y_ple__exp__v02 <- c(
  "mh_y_ple__exp_001",
  "mh_y_ple__exp_002",
  "mh_y_ple__exp_003",
  "mh_y_ple__exp_004",
  "mh_y_ple__exp_005",
  "mh_y_ple__exp_006",
  "mh_y_ple__exp_007",
  "mh_y_ple__exp_008",
  "mh_y_ple__exp_009",
  "mh_y_ple__exp_010",
  "mh_y_ple__exp_011",
  "mh_y_ple__exp_012",
  "mh_y_ple__exp_013",
  "mh_y_ple__exp_014",
  "mh_y_ple__exp_015",
  "mh_y_ple__exp_016",
  "mh_y_ple__exp_017",
  "mh_y_ple__exp_018",
  "mh_y_ple__exp_019",
  "mh_y_ple__exp_020",
  "mh_y_ple__exp_021",
  "mh_y_ple__exp_022",
  "mh_y_ple__exp_023",
  "mh_y_ple__exp_024",
  "mh_y_ple__exp_025",
  "mh_y_ple__exp_026",
  "mh_y_ple__exp_027",
  "mh_y_ple__exp_028",
  "mh_y_ple__exp_029",
  "mh_y_ple__exp_030",
  "mh_y_ple__exp_031",
  "mh_y_ple__exp_032" # ple__exp_homeless_y
  # "mh_y_ple__exp_033"
  # "mh_y_ple__exp_034" # THERE IS NO MATCHING POSITIVITY FOR mh_y_ple__exp_034
  # (anyone who has attempted suicide)
)


#' Compute "Life Events \[Youth\] (Events): Count - Version 2 (Year 4 and Year
#' 5)"
#' @description
#' Computes the summary score `mh_y_ple_count__v02`
#' Life Events \[Youth\] (Events): Count - Version 2 (Year 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_count__v02 <- function(data,
                                        name = "mh_y_ple_count__v02",
                                        events = c("ses-04A", "ses-05A"),
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ple__v02,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Youth\] (Events): Number missing - Version 2 (Year 4
#' and Year 5)"
#' @description
#' Computes the summary score `mh_y_ple_nm__v02`
#' Life Events \[Youth\] (Events): Number missing - Version 2 (Year 4 and
#' Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_nm__v02 <- function(data,
                                     name = "mh_y_ple_nm__v02",
                                     events = c("ses-04A", "ses-05A"),
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ple__v02,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_y_ple__severity__v02                                                 ####

#' Compute "Life Events \[Youth\] (Severity): Sum - Version 2 (Year 4 and Year
#' 5) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_sum__v02`
#' Life Events \[Youth\] (Severity): Sum - Version 2 (Year 4 and Year 5)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_sum__v02 <- function(
  data,
  name = "mh_y_ple__severity_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v02,
      vars        = vars_mh_y_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Mean - Version 2 (Year 4 and Year
#' 5) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_mean__v02`
#' Life Events \[Youth\] (Severity): Mean - Version 2 (Year 4 and Year 5)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_mean__v02 <- function(
  data,
  name = "mh_y_ple__severity_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v02,
      vars        = vars_mh_y_ple__severity__v02,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02,
      vars      = paste0(vars_mh_y_ple__severity__v02, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Number missing - Version 2 (Year 4
#' and Year 5)"
#' @description
#' Computes the summary score `mh_y_ple__severity_nm__v02`
#' Life Events \[Youth\] (Severity): Number missing - Version 2 (Year 4 and
#' Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_nm__v02 <- function(
  data,
  name = "mh_y_ple__severity_nm__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02,
      vars      = vars_mh_y_ple__severity__v02,
      events    = events,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Sum - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_sum__v02`
#' Life Events \[Youth\] (Severity of Good Events): Sum - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v02,
#'    vars_mh_y_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_sum__v02 <- function(
  data,
  name = "mh_y_ple__severity__good_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v02,
      vars        = vars_mh_y_ple__severity__v02 |> head(-1),
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v02,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v02 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Mean - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_mean__v02`
#' Life Events \[Youth\] (Severity of Good Events): Mean - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v02,
#'    vars_mh_y_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_mean__v02 <- function(
  data,
  name = "mh_y_ple__severity__good_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v02,
      vars        = vars_mh_y_ple__severity__v02 |> head(-1),
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v02,
      vars      = paste0(vars_mh_y_ple__severity__v02 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Sum - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_sum__v02`
#' Life Events \[Youth\] (Severity of Bad Events): Sum - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v02,
#'    vars_mh_y_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_sum__v02 <- function(
  data,
  name = "mh_y_ple__severity__bad_sum__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v02,
      vars        = vars_mh_y_ple__severity__v02 |> head(-1),
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v02,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v02 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Mean - Version
#' 2 (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_mean__v02`
#' Life Events \[Youth\] (Severity of Bad Events): Mean - Version 2
#' (Year 4 and Year 5) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v02,
#'    vars_mh_y_ple__severity__v02
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_mean__v02 <- function(
  data,
  name = "mh_y_ple__severity__bad_mean__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v02(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v02(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v02,
      vars        = vars_mh_y_ple__severity__v02 |> head(-1),
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v02,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v02 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_y_ple__exp__v02                                                      ####


#' Compute "Life Events \[Youth\] (Experience): Number missing - Version 2 (Year
#' 4 and Year 5)"
#' @description
#' Computes the summary score `mh_y_ple__exp_nm__v02`
#' Life Events \[Youth\] (Experience): Number missing - Version 2 (Year 4
#' and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp_nm__v02 <- function(data,
                                          name = "mh_y_ple__exp_nm__v02",
                                          events = c("ses-04A", "ses-05A"),
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02 |> head(-1),
      vars      = vars_mh_y_ple__exp__v02,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Youth\] (Experience Good Events): Count - Version
#' 2 (Year 4 and Year 5)"
#' @description
#' Computes the summary score `mh_y_ple__exp__good_count__v02`
#' Life Events \[Youth\] (Experience Good Events): Count - Version 2 (Year
#' 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__good_count__v02 <- function(
  data,
  name = "mh_y_ple__exp__good_count__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v02)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v02, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02 |> head(-1),
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v02, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Experience Bad Events): Count - Version
#' 2 (Year 4 and Year 5)"
#' @description
#' Computes the summary score `mh_y_ple__exp__bad_count__v02`
#' Life Events \[Youth\] (Experience Bad Events): Count - Version 2 (Year
#' 4 and Year 5)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v02 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__bad_count__v02 <- function(
  data,
  name = "mh_y_ple__exp__bad_count__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v02(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v02)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v02, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v02 |> head(-1),
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v02, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   mh_y_ple__v03                                                           ####


#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple_count__v03
#' @format vars_mh_y_ple__v03 is a character vector of all column names
#' used to compute summary score of `mh_y_ple`.
vars_mh_y_ple__v03 <- c(
  "mh_y_ple_001",
  "mh_y_ple_002",
  "mh_y_ple_003",
  "mh_y_ple_004",
  "mh_y_ple_005",
  "mh_y_ple_006",
  "mh_y_ple_007",
  "mh_y_ple_008",
  "mh_y_ple_009",
  "mh_y_ple_010",
  "mh_y_ple_011",
  "mh_y_ple_012",
  "mh_y_ple_013",
  "mh_y_ple_014",
  "mh_y_ple_015",
  "mh_y_ple_016",
  "mh_y_ple_017",
  "mh_y_ple_018",
  "mh_y_ple_019",
  "mh_y_ple_020",
  "mh_y_ple_021",
  "mh_y_ple_022",
  "mh_y_ple_023",
  "mh_y_ple_024",
  "mh_y_ple_025",
  "mh_y_ple_026",
  "mh_y_ple_027",
  "mh_y_ple_028",
  "mh_y_ple_029",
  "mh_y_ple_030",
  "mh_y_ple_031",
  "mh_y_ple_032",
  "mh_y_ple_033", # ple_homeless_fu3_y_6yr
  "mh_y_ple_034" # THERE IS NO MATCHING POSITIVITY FOR mh_y_ple_034
  # (anyone who has attempted suicide)
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity_sum__v03
#' @format vars_mh_y_ple__severity__v03 is a character vector of all column
#' names
#' used to compute summary score of `mh_y_ple__severity`.
vars_mh_y_ple__severity__v03 <- c(
  "mh_y_ple__severity_001",
  "mh_y_ple__severity_002",
  "mh_y_ple__severity_003",
  "mh_y_ple__severity_004",
  "mh_y_ple__severity_005",
  "mh_y_ple__severity_006",
  "mh_y_ple__severity_007",
  "mh_y_ple__severity_008",
  "mh_y_ple__severity_009",
  "mh_y_ple__severity_010",
  "mh_y_ple__severity_011",
  "mh_y_ple__severity_012",
  "mh_y_ple__severity_013",
  "mh_y_ple__severity_014",
  "mh_y_ple__severity_015",
  "mh_y_ple__severity_016",
  "mh_y_ple__severity_017",
  "mh_y_ple__severity_018",
  "mh_y_ple__severity_019",
  "mh_y_ple__severity_020",
  "mh_y_ple__severity_021",
  "mh_y_ple__severity_022",
  "mh_y_ple__severity_023",
  "mh_y_ple__severity_024",
  "mh_y_ple__severity_025",
  "mh_y_ple__severity_026",
  "mh_y_ple__severity_027",
  "mh_y_ple__severity_028",
  "mh_y_ple__severity_029",
  "mh_y_ple__severity_030",
  "mh_y_ple__severity_031",
  "mh_y_ple__severity_032",
  "mh_y_ple__severity_033", # ple__severity_homeless_fu3_y_6yr
  "mh_y_ple__severity_034" # THERE IS NO MATCHING POSITIVITY FOR
  # mh_y_ple__severity_034 (anyone who has attempted suicide)
)

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ple__severity__good_sum__v03
#' @format vars_mh_y_ple__exp__v03 is a character vector of all column names
#' used to compute summary score of `mh_y_ple__exp`.
vars_mh_y_ple__exp__v03 <- c(
  "mh_y_ple__exp_001",
  "mh_y_ple__exp_002",
  "mh_y_ple__exp_003",
  "mh_y_ple__exp_004",
  "mh_y_ple__exp_005",
  "mh_y_ple__exp_006",
  "mh_y_ple__exp_007",
  "mh_y_ple__exp_008",
  "mh_y_ple__exp_009",
  "mh_y_ple__exp_010",
  "mh_y_ple__exp_011",
  "mh_y_ple__exp_012",
  "mh_y_ple__exp_013",
  "mh_y_ple__exp_014",
  "mh_y_ple__exp_015",
  "mh_y_ple__exp_016",
  "mh_y_ple__exp_017",
  "mh_y_ple__exp_018",
  "mh_y_ple__exp_019",
  "mh_y_ple__exp_020",
  "mh_y_ple__exp_021",
  "mh_y_ple__exp_022",
  "mh_y_ple__exp_023",
  "mh_y_ple__exp_024",
  "mh_y_ple__exp_025",
  "mh_y_ple__exp_026",
  "mh_y_ple__exp_027",
  "mh_y_ple__exp_028",
  "mh_y_ple__exp_029",
  "mh_y_ple__exp_030",
  "mh_y_ple__exp_031",
  "mh_y_ple__exp_032",
  "mh_y_ple__exp_033" # ple__exp_homeless_fu3_y_6yr
  # "mh_y_ple__exp_034" # THERE IS NO MATCHING POSITIVITY FOR
  # mh_y_ple__exp_034 (anyone who has attempted suicide)
)

#' Compute "Life Events \[Youth\] (Events): Count - Version 3 (Starting at Year
#' 6)"
#' @description
#' Computes the summary score `mh_y_ple_count__v03`
#' Life Events \[Youth\] (Events): Count - Version 3 (Starting at Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_count__v03 <- function(data,
                                        name = "mh_y_ple_count__v03",
                                        events = c("ses-06A", "ses-07A"),
                                        combine = TRUE,
                                        max_na = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ple__v03,
      max_na  = max_na,
      exclude = c("444", "777", "999"),
      events  = events,
      combine = combine
    )
}


#' Compute "Life Events \[Youth\] (Events): Number missing - Version 3 (Starting
#' at Year 6)"
#' @description
#' Computes the summary score `mh_y_ple_nm__v03`
#' Life Events \[Youth\] (Events): Number missing - Version 3 (Starting at
#' Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple_nm__v03 <- function(data,
                                     name = "mh_y_ple_nm__v03",
                                     events = c("ses-06A", "ses-07A"),
                                     combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ple__v03,
      events  = events,
      exclude = c("444", "777", "999"),
      combine = combine
    )
}


#   ____________________________________________________________________________
#   mh_y_ple__severity__v03                                                 ####

#' Compute "Life Events \[Youth\] (Severity): Sum - Version 3 (Starting at Year
#' 6) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_sum__v03`
#' Life Events \[Youth\] (Severity): Sum - Version 3 (Starting at Year 6)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 34 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_sum__v03 <- function(
  data,
  name = "mh_y_ple__severity_sum__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v03,
      vars        = vars_mh_y_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Mean - Version 3 (Starting at Year
#' 6) \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity_mean__v03`
#' Life Events \[Youth\] (Severity): Mean - Version 3 (Starting at Year 6)
#' \[Validation: No more than 6 events missing and no severity items missing
#' or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 34 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_mean__v03 <- function(
  data,
  name = "mh_y_ple__severity_mean__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__v03,
      vars        = vars_mh_y_ple__severity__v03,
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03,
      vars      = paste0(vars_mh_y_ple__severity__v03, "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Life Events \[Youth\] (Severity): Number missing - Version 3
#' (Starting at Year 6)"
#' @description
#' Computes the summary score `mh_y_ple__severity_nm__v03`
#' Life Events \[Youth\] (Severity): Number missing - Version 3 (Starting
#' at Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__severity__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity_nm__v03 <- function(
  data,
  name = "mh_y_ple__severity_nm__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03,
      vars      = vars_mh_y_ple__severity__v03,
      events    = events,
      exclude   = c("444", "777", "999"),
      combine   = combine
    )
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Sum - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_sum__v03`
#' Life Events \[Youth\] (Severity of Good Events): Sum - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v03,
#'    vars_mh_y_ple__severity__v03 |> head(-1)
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_sum__v03 <- function(
  data,
  name = "mh_y_ple__severity__good_sum__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)


  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v03,
      vars        = vars_mh_y_ple__severity__v03 |> head(-1),
      keep_values = "1"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v03,
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__severity__v03 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Good Events): Mean - Version
#' 3 (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__good_mean__v03`
#' Life Events \[Youth\] (Severity of Good Events): Mean - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v03,
#'    vars_mh_y_ple__severity__v03 |> head(-1)
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__good_mean__v03 <- function(
  data,
  name = "mh_y_ple__severity__good_mean__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v03,
      vars        = vars_mh_y_ple__severity__v03 |> head(-1),
      keep_values = "1"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v03,
      vars      = paste0(vars_mh_y_ple__severity__v03 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Sum - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_sum__v03`
#' Life Events \[Youth\] (Severity of Bad Events): Sum - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v03,
#'    vars_mh_y_ple__severity__v03 |> head(-1)
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_sum__v03 <- function(
  data,
  name = "mh_y_ple__severity__bad_sum__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v03,
      vars        = vars_mh_y_ple__severity__v03 |> head(-1),
      keep_values = "2"
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v03,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v03 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Severity of Bad Events): Mean - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]"
#' @description
#' Computes the summary score `mh_y_ple__severity__bad_mean__v03`
#' Life Events \[Youth\] (Severity of Bad Events): Mean - Version 3
#' (Starting at Year 6) \[Validation: No more than 6 events missing and no
#' experience/severity items missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   c(
#'    vars_mh_y_ple__exp__v03,
#'    vars_mh_y_ple__severity__v03 |> head(-1)
#'   ) |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 6 of 33 items missing
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: 6).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__severity__bad_mean__v03 <- function(
  data,
  name = "mh_y_ple__severity__bad_mean__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = 6
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)

  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    compute_mh_y_ple__exp_nm__v03(
      name = "exp_internal"
    ) |>
    compute_mh_y_ple__severity_nm__v03(
      name = "severity_internal",
    ) |>
    product_vars(
      fork_vars   = vars_mh_y_ple__exp__v03,
      vars        = vars_mh_y_ple__severity__v03 |> head(-1),
      keep_values = "2"
    ) |>
    ss_mean_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__exp__v03,
      fork_val  = "2",
      vars      = paste0(vars_mh_y_ple__severity__v03 |> head(-1), "_product"),
      max_na    = 0,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal) | exp_internal != 0 | severity_internal != 0,
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#   ____________________________________________________________________________
#   mh_y_ple__exp__v03                                                      ####


#' Compute "Life Events \[Youth\] (Experience): Number missing - Version 3
#' (Starting at Year 6)"
#' @description
#' Computes the summary score `mh_y_ple__exp_nm__v03`
#' Life Events \[Youth\] (Experience): Number missing - Version 3 (Starting
#' at Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp_nm__v03 <- function(data,
                                          name = "mh_y_ple__exp_nm__v03",
                                          events = c("ses-06A", "ses-07A"),
                                          combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03 |> head(-1),
      vars      = vars_mh_y_ple__exp__v03,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = combine
    )
}

#' Compute "Life Events \[Youth\] (Experience Good Events): Count - Version
#' 3 (Starting at Year 6)"
#' @description
#' Computes the summary score `mh_y_ple__exp__good_count__v03`
#' Life Events \[Youth\] (Experience Good Events): Count - Version 3
#' (Starting at Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__good_count__v03 <- function(
  data,
  name = "mh_y_ple__exp__good_count__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v03)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v03, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "0",
        "1" = "1"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03 |> head(-1),
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v03, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute "Life Events \[Youth\] (Experience Bad Events): Count - Version 3
#' (Starting at Year 6)"
#' @description
#' Computes the summary score `mh_y_ple__exp__bad_count__v03`
#' Life Events \[Youth\] (Experience Bad Events): Count - Version 3
#' (Starting at Year 6)
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ple__exp__v03 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 444
#'   - 777
#'   - 999
#'
#' @inherit dummy_mh params
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the new column to be created (Default:
#' the name used in the ABCD data release).
#' @param combine logical. If TRUE, the new column will be bound to the input
#' data frame. If FALSE, the new column will be created as a new data frame.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit (Default: NULL).
#' @return tbl. The input data frame with the summary score appended as
#'   a new column.
#' @export
#' @autoglobal
compute_mh_y_ple__exp__bad_count__v03 <- function(
  data,
  name = "mh_y_ple__exp__bad_count__v03",
  events = c("ses-06A", "ses-07A"),
  combine = TRUE,
  max_na = NULL
) {
  chk::chk_data(data)
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  }


  data_ss <- data |>
    compute_mh_y_ple_count__v03(
      name   = "count_internal",
      max_na = max_na
    ) |>
    bind_cols(
      data |>
        select(all_of(vars_mh_y_ple__exp__v03)) |>
        rename_all(~ stringr::str_c(., "_recoded"))
    ) |>
    recode_levels(
      vars = paste0(vars_mh_y_ple__exp__v03, "_recoded"),
      recode = c(
        "6" = "0",
        "7" = "0",
        "2" = "1",
        "1" = "0"
      )
    ) |>
    ss_sum_mh_ple(
      name      = name,
      fork_vars = vars_mh_y_ple__v03 |> head(-1),
      fork_val  = "1",
      vars      = paste0(vars_mh_y_ple__exp__v03, "_recoded"),
      max_na    = NULL,
      exclude   = c("444", "777", "999"),
      events    = events,
      combine   = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        is.na(count_internal),
        NA,
        .data[[name]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   mh_y_ple_all                                                            ####

#' Compute all summary scores for mh_y_ple
#' @description
#' This function computes all summary scores for the mh_y_ple form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ple_all(data)
#' }
compute_mh_y_ple_all <- function(data) {
  data |>
    compute_mh_y_ple__exp__bad_count() |> # 61
    compute_mh_y_ple__exp__bad_count__v01() |> # 62
    compute_mh_y_ple__exp__bad_count__v02() |> # 63
    compute_mh_y_ple__exp__bad_count__v03() |> # 64
    compute_mh_y_ple__exp__good_count() |> # 65
    compute_mh_y_ple__exp__good_count__v01() |> # 66
    compute_mh_y_ple__exp__good_count__v02() |> # 67
    compute_mh_y_ple__exp__good_count__v03() |> # 68
    compute_mh_y_ple__exp_nm() |> # 69
    compute_mh_y_ple__exp_nm__v01() |> # 70
    compute_mh_y_ple__exp_nm__v02() |> # 71
    compute_mh_y_ple__exp_nm__v03() |> # 72
    compute_mh_y_ple__severity__bad_mean() |> # 73
    compute_mh_y_ple__severity__bad_mean__v01() |> # 74
    compute_mh_y_ple__severity__bad_mean__v02() |> # 75
    compute_mh_y_ple__severity__bad_mean__v03() |> # 76
    compute_mh_y_ple__severity__bad_sum() |> # 77
    compute_mh_y_ple__severity__bad_sum__v01() |> # 78
    compute_mh_y_ple__severity__bad_sum__v02() |> # 79
    compute_mh_y_ple__severity__bad_sum__v03() |> # 80
    compute_mh_y_ple__severity__good_mean() |> # 81
    compute_mh_y_ple__severity__good_mean__v01() |> # 82
    compute_mh_y_ple__severity__good_mean__v02() |> # 83
    compute_mh_y_ple__severity__good_mean__v03() |> # 84
    compute_mh_y_ple__severity__good_sum() |> # 85
    compute_mh_y_ple__severity__good_sum__v01() |> # 86
    compute_mh_y_ple__severity__good_sum__v02() |> # 87
    compute_mh_y_ple__severity__good_sum__v03() |> # 88
    compute_mh_y_ple__severity_mean() |> # 89
    compute_mh_y_ple__severity_mean__v01() |> # 90
    compute_mh_y_ple__severity_mean__v02() |> # 91
    compute_mh_y_ple__severity_mean__v03() |> # 92
    compute_mh_y_ple__severity_nm() |> # 93
    compute_mh_y_ple__severity_nm__v01() |> # 94
    compute_mh_y_ple__severity_nm__v02() |> # 95
    compute_mh_y_ple__severity_nm__v03() |> # 96
    compute_mh_y_ple__severity_sum() |> # 97
    compute_mh_y_ple__severity_sum__v01() |> # 98
    compute_mh_y_ple__severity_sum__v02() |> # 99
    compute_mh_y_ple__severity_sum__v03() |> # 100
    compute_mh_y_ple_nm() |> # 101
    compute_mh_y_ple_nm__v01() |> # 102
    compute_mh_y_ple_nm__v02() |> # 103
    compute_mh_y_ple_nm__v03() |> # 104
    compute_mh_y_ple_count() |> # 105
    compute_mh_y_ple_count__v01() |> # 106
    compute_mh_y_ple_count__v02() |> # 107
    compute_mh_y_ple_count__v03() # 108
}


# -------------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_pps_count
#' @format vars_mh_y_pps_count is a character vector of all column names
#' used to compute summary score of `mh_y_pps_count` and `mh_y_pps_nm`
vars_mh_y_pps_count <- c(
  "mh_y_pps_001",
  "mh_y_pps_002",
  "mh_y_pps_003",
  "mh_y_pps_004",
  "mh_y_pps_005",
  "mh_y_pps_006",
  "mh_y_pps_007",
  "mh_y_pps_008",
  "mh_y_pps_009",
  "mh_y_pps_010",
  "mh_y_pps_011",
  "mh_y_pps_012",
  "mh_y_pps_013",
  "mh_y_pps_014",
  "mh_y_pps_015",
  "mh_y_pps_016",
  "mh_y_pps_017",
  "mh_y_pps_018",
  "mh_y_pps_019",
  "mh_y_pps_020",
  "mh_y_pps_021"
)

#' Compute "Prodromal Psychosis Scale \[Youth\] (number of "Yes" responses):
#' Count "
#' @description
#' Computes the summary score `mh_y_pps_count`
#' Prodromal Psychosis Scale \[Youth\] (number of
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_pps_count |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:* none
#' - *Validation criterion:* maximally 4 of 21 items missing
#'
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
#' @details
#' The `mh_y_pps_count` is calculated by summing the number of `1`s in each
#' question. If the number of missing values is greater than `max_na`,
#' the summary score is set to `NA`. By default, `max_na` is set to 4 (20%).
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pps_count(data) |>
#'   select(
#'     any_of(c("mh_y_pps_count", vars_mh_y_pps_count))
#'   )
#' }
compute_mh_y_pps_count <- function(
  data,
  name = "mh_y_pps_count",
  max_na = 4,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_pps_count,
      max_na  = max_na,
      combine = combine
    )
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (number of responses): Number
#' missing "
#' @description
#' Computes the summary score `mh_y_pps_nm`
#' Prodromal Psychosis Scale \[Youth\] (number of responses): Number
#' missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_mh_y_pps_count |> md_bullet(2, TRUE)
#'  ```
#' @inherit compute_mh_y_pps_count references params return
#' @seealso [compute_mh_y_pps_count()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pps_nm(data) |>
#'   select(
#'     any_of(c("mh_y_pps_nm", vars_mh_y_pps_count))
#'   )
#' }
compute_mh_y_pps_nm <- function(
  data,
  name = "mh_y_pps_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_pps_count,
      combine = combine
    )
}

# -------------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_pps__bother_nm
#' @format vars_mh_y_pps__bother is a character vector of all
#' column names used to compute summary of `mh_y_pps__bother` scores.
vars_mh_y_pps__bother <- c(
  "mh_y_pps__bother_001",
  "mh_y_pps__bother_002",
  "mh_y_pps__bother_003",
  "mh_y_pps__bother_004",
  "mh_y_pps__bother_005",
  "mh_y_pps__bother_006",
  "mh_y_pps__bother_007",
  "mh_y_pps__bother_008",
  "mh_y_pps__bother_009",
  "mh_y_pps__bother_010",
  "mh_y_pps__bother_011",
  "mh_y_pps__bother_012",
  "mh_y_pps__bother_013",
  "mh_y_pps__bother_014",
  "mh_y_pps__bother_015",
  "mh_y_pps__bother_016",
  "mh_y_pps__bother_017",
  "mh_y_pps__bother_018",
  "mh_y_pps__bother_019",
  "mh_y_pps__bother_020",
  "mh_y_pps__bother_021"
)

#' Compute "Prodromal Psychosis Scale \[Youth\] (Bother responses): Number
#' missing"
#' @description
#' Computes the summary score `mh_y_pps__bother_nm`
#' Prodromal Psychosis Scale \[Youth\] (Bother responses): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_mh_y_pps__bother |> md_bullet(2, TRUE)
#'  ```
#' @inherit compute_mh_y_pps_count references params
#' @details
#' The number of missing values in the `mh_y_pps__bother` score is
#' calculated by subtracting the number of valid pairs from the total
#' PPS count for each subject (mh_y_pps_count - bother_pair_good_sum).
#'
#' A good pair is defined as a pair where the `mh_y_pps_count` is 1 and
#' the `mh_y_pps__bother` is not missing.
#' @seealso [compute_mh_y_pps_count()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pps__bother_nm(data) |>
#'   select(
#'     any_of(c("mh_y_pps__bother_nm", vars_mh_y_pps__bother))
#'   )
#' }
compute_mh_y_pps__bother_nm <- function(
  data,
  name = "mh_y_pps__bother_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  bother_pair_good_sum <- purrr::map2(
    vars_mh_y_pps_count,
    vars_mh_y_pps__bother,
    ~ ((data[[.x]] == 1) & !is.na(data[[.y]]))
  ) |>
    purrr::reduce(`+`)

  data_ss <- data |>
    compute_mh_y_pps_count(name = "mh_y_pps_count_internal") |>
    transmute(
      "{name}" := if_else(
        mh_y_pps_count_internal == 0,
        NA_real_,
        mh_y_pps_count_internal - bother_pair_good_sum
      ) |>
        as.integer()
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}


#' Compute "Prodromal Psychosis Scale \[Youth\] (Bother "Yes" responses): Count"
#' @description
#' Computes the summary score `mh_y_pps__bother__yes_count`
#' Prodromal Psychosis Scale \[Youth\] (Bother
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_mh_y_pps__bother |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#' - *Validation criterion:* 0 of 21 items missing
#'
#' @inherit compute_mh_y_pps_count references params return
#' @details
#' The bother count is depend on the `mh_y_pps__bother_nm` score. If the
#' `mh_y_pps__bother_nm` score is greater than `max_na`, the bother count
#' is set to `NA`.
#'
#' There is also a sanity check for the gating question in PPS bother score.
#' If the paired gating question is 0 or `NA` and the bother score is not
#' missing, the paired bother score is set to `NA` before computing the count.
#' @seealso [compute_mh_y_pps__bother_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pps__bother__yes_count(data) |>
#'   select(
#'     any_of(c("mh_y_pps__bother__yes_count", vars_mh_y_pps__bother))
#'   )
#' }
compute_mh_y_pps__bother__yes_count <- function(
  data,
  name = "mh_y_pps__bother__yes_count",
  max_na = 0,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  check_col_names(data, name)

  bother_pair_invalid <- purrr::map2(
    vars_mh_y_pps_count,
    vars_mh_y_pps__bother,
    ~ ((data[[.x]] == 0 | is.na(data[[.x]])) & !is.na(data[[.y]]))
  ) |>
    setNames(vars_mh_y_pps__bother)

  data_ss <- data |>
    compute_mh_y_pps__bother_nm(name = "mh_y_pps__bother_nm_internal") |>
    mutate(
      across(
        all_of(vars_mh_y_pps__bother),
        ~ if_else(
          bother_pair_invalid[[cur_column()]],
          NA,
          .x
        )
      )
    ) |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_pps__bother,
      combine = TRUE
    ) |>
    transmute(
      "{name}" := if_else(
        mh_y_pps__bother_nm_internal > max_na,
        NA_real_,
        .data[[name]]
      ) |>
        as.integer()
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Bother "No" responses): Count"
#' @description
#' Computes the summary score `mh_y_pps__bother__no_count`
#' Prodromal Psychosis Scale \[Youth\] (Bother
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_y_pps__bother |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* 0 of 21 items missing
#'
#' @inherit  compute_mh_y_pps_count references params return
#' @details
#' The bother count is depend on the `mh_y_pps__bother_nm` score. If the
#' `mh_y_pps__bother_nm` score is greater than `max_na`, the bother count
#' is set to `NA`.
#'
#' There is also a sanity check for the gating question in PPS bother score.
#' If the paired gating question is 0 or `NA` and the bother score is not
#' missing, the paired bother score is set to `NA` before computing the count.
#' @export
#' @autoglobal
#' @seealso [compute_mh_y_pps__bother_nm()]
#' @examples
#' \dontrun{
#' compute_mh_y_pps__bother__no_count(data) |>
#'   select(
#'     any_of(c("mh_y_pps__bother__no_count", vars_mh_y_pps__bother))
#'   )
#' }
compute_mh_y_pps__bother__no_count <- function(
  data,
  name = "mh_y_pps__bother__no_count",
  max_na = 0,
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  check_col_names(data, name)

  bother_pair_invalid <- purrr::map2(
    vars_mh_y_pps_count,
    vars_mh_y_pps__bother,
    ~ ((data[[.x]] == 0 | is.na(data[[.x]])) & !is.na(data[[.y]]))
  ) |>
    setNames(vars_mh_y_pps__bother)

  data_ss <- data |>
    compute_mh_y_pps__bother_nm(name = "mh_y_pps__bother_nm_internal") |>
    mutate(
      across(
        all_of(vars_mh_y_pps__bother),
        ~ if_else(
          bother_pair_invalid[[cur_column()]],
          NA,
          .x
        )
      ),
      "{name}" := if_else(
        mh_y_pps__bother_nm_internal > max_na,
        NA_real_,
        rowSums(
          across(all_of(vars_mh_y_pps__bother), ~ .x == 0),
          na.rm = TRUE
        )
      ) |>
        as.integer()
    ) |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

# -------------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_pps__severity_nm
#' @format vars_mh_y_pps__severity is a character vector of all column names
#' used to compute summary of `mh_y_pps__severity` scores.
vars_mh_y_pps__severity <- c(
  "mh_y_pps__severity_001",
  "mh_y_pps__severity_002",
  "mh_y_pps__severity_003",
  "mh_y_pps__severity_004",
  "mh_y_pps__severity_005",
  "mh_y_pps__severity_006",
  "mh_y_pps__severity_007",
  "mh_y_pps__severity_008",
  "mh_y_pps__severity_009",
  "mh_y_pps__severity_010",
  "mh_y_pps__severity_011",
  "mh_y_pps__severity_012",
  "mh_y_pps__severity_013",
  "mh_y_pps__severity_014",
  "mh_y_pps__severity_015",
  "mh_y_pps__severity_016",
  "mh_y_pps__severity_017",
  "mh_y_pps__severity_018",
  "mh_y_pps__severity_019",
  "mh_y_pps__severity_020",
  "mh_y_pps__severity_021"
)

#' Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score): Number
#' missing"
#' @description
#' Computes the summary score `mh_y_pps__severity_nm`
#' Prodromal Psychosis Scale \[Youth\] (Severity Score): Number missing
#'
#' - *Summarized variables:*
#'  ```{r, echo=FALSE, results='asis'}
#'  vars_mh_y_pps__severity |> md_bullet(2, TRUE)
#'  ```
#' - *Excluded values:* none
#'
#' @inherit compute_mh_y_pps_count references params
#' @details
#' The number of missing values in the `mh_y_pps__severity` score is
#' calculated by subtracting the number of valid pairs from the total
#' __bother__ count for each subject
#' (mh_y_pps__bother_yes_count - severity_pair_good_sum).
#'
#' A good pair is defined as a pair where the `mh_y_pps__bother__yes_count`
#' is 1 and the `mh_y_pps__severity` is not missing.
#' @seealso [compute_mh_y_pps__bother__yes_count()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_pps__severity_nm(data) |>
#'   select(
#'     any_of(c("mh_y_pps__severity_nm", vars_mh_y_pps__severity))
#'   )
#' }
compute_mh_y_pps__severity_nm <- function(
  data,
  name = "mh_y_pps__severity_nm",
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_mh_y_pps__severity)

  severity_pair_good_sum <- purrr::map2(
    vars_mh_y_pps__bother,
    vars_mh_y_pps__severity,
    ~ ((data[[.x]] == 1) & !is.na(data[[.y]]))
  ) |>
    purrr::reduce(`+`)

  data_ss <- data |>
    compute_mh_y_pps__bother__yes_count(
      name = "mh_y_pps__bother__yes_count_internal"
    ) |>
    transmute(
      "{name}" := if_else(
        mh_y_pps__bother__yes_count_internal == 0,
        NA_real_,
        mh_y_pps__bother__yes_count_internal - severity_pair_good_sum
      ) |>
        as.integer()
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score)"
#' @description
#' Computes the summary score `mh_y_pps__severity_score`
#' Prodromal Psychosis Scale \[Youth\] (Severity Score)
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    vars_mh_y_pps__severity |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 21 items missing
#'
#' @inherit  dummy_mh params references return
#' @export
#' @autoglobal
#' @details
#' The severity score is calculated by summing the severity scores for each
#' question and adding the number of `mh_y_pps__bother__yes_count` to the
#' total.
#'
#' However, if the `mh_y_pps__severity_nm` score is greater than `max_na`,
#' the severity score is set to `NA`.
#'
#' There is also a sanity check for the gating question of PPS
#' base/bother score. If the paired base/bother question is 0 or `NA`
#' and the severity score is not missing, the paired severity score is set
#' to `NA` before computing the score.
#' @seealso [compute_mh_y_pps__bother__yes_count()]
#' @examples
#' \dontrun{
#' compute_mh_y_pps__severity_score(data) |>
#'   select(
#'     any_of(c("mh_y_pps__severity_score", vars_mh_y_pps__severity))
#'   ) |>
#'   View()
#' }
compute_mh_y_pps__severity_score <- function(data,
                                             name = "mh_y_pps__severity_score",
                                             max_na = 0,
                                             combine = TRUE) {
  chk::chk_data(data)
  chk::chk_whole_number(max_na)
  chk::chk_gte(max_na, 0)
  check_col_names(data, name)

  severity_pair_invalid <- mapply(
    x = vars_mh_y_pps_count,
    y = vars_mh_y_pps__bother,
    z = vars_mh_y_pps__severity,
    FUN = function(x, y, z) {
      (
        (data[[x]] == 0 | is.na(data[[x]])) |
          (data[[y]] == 0 | is.na(data[[y]]))
      ) &
        !is.na(data[[z]])
    },
    SIMPLIFY = FALSE
  ) |>
    setNames(vars_mh_y_pps__severity)

  data_ss <- data |>
    compute_mh_y_pps__severity_nm(name = "mh_y_pps__severity_nm_internal") |>
    compute_mh_y_pps_count(name = "mh_y_pps_count_internal") |>
    mutate(
      across(
        all_of(vars_mh_y_pps__severity),
        ~ if_else(
          severity_pair_invalid[[cur_column()]],
          NA,
          as.numeric(as.character(.x))
        )
      ),
      "{name}" := case_when(
        mh_y_pps_count_internal == 0 ~ 0,
        mh_y_pps__severity_nm_internal > max_na |
          is.na(mh_y_pps_count_internal) ~ NA_real_,
        .default =
          rowSums(across(all_of(vars_mh_y_pps__severity)), na.rm = TRUE) +
            .data[["mh_y_pps_count_internal"]]
      ) |>
        as.integer()
    ) |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score): Mean"
#' @description
#' Computes the summary score `mh_y_pps__severity_mean`
#' Prodromal Psychosis Scale \[Youth\] (Severity Score): Mean
#'
#' - *Summarized variables:*
#'    ```{r, echo=FALSE, results='asis'}
#'    c(vars_mh_y_pps_count, vars_mh_y_pps__severity) |> md_bullet(2, TRUE)
#'    ```
#' - *Excluded values:* none
#' - *Validation criterion:* none of 21 items missing
#'
#' @inherit compute_mh_y_pps_count references params return
#' @export
#' @autoglobal
#' @details
#' The mean severity score is calculated by dividing the total severity
#' score by the number of `mh_y_pps__bother__yes_count`. If any of the
#' two values is missing, the mean severity score is set to `NA`.
#' @seealso [compute_mh_y_pps__bother__yes_count()]
#' @examples
#' \dontrun{
#' compute_mh_y_pps__severity_mean(data) |>
#'   select(
#'     any_of(c("mh_y_pps__severity_mean", vars_mh_y_pps__severity))
#'   )
#' }
compute_mh_y_pps__severity_mean <- function(
  data,
  name = "mh_y_pps__severity_mean",
  max_na = 0,
  combine = TRUE
) {
  chk::chk_data(data)
  check_col_names(data, name)

  data_ss <- data |>
    compute_mh_y_pps__severity_score(
      name = "mh_y_pps__severity_score_internal",
      max_na = max_na
    ) |>
    compute_mh_y_pps__bother__yes_count(
      name = "mh_y_pps__bother__yes_count_internal"
    ) |>
    transmute(
      "{name}" := if_else(
        # denominator is zero, NA
        mh_y_pps__bother__yes_count_internal == 0,
        NA_real_,
        .data[["mh_y_pps__severity_score_internal"]] /
          .data[["mh_y_pps__bother__yes_count_internal"]]
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Current Distress Score)"
#' @description
#' Computes the summary score `mh_y_pps__dist__curr_score`
#' Prodromal Psychosis Scale \[Youth\] (Current Distress Score)
#'
#' For the current wave, if z-score of `mh_y_pps__severity_score` normalized
#' across all current participants in the assessment wave is ≥ 1.96, set the
#' value to "1"; else set the value to "0". If there is no score for the current
#' assessment wave,set the value to `NA` (missing).
#'
#' - *Summarized variables:*
#'   - mh_y_pps__severity_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:*  none
#'
#' @seealso [compute_mh_y_pps__severity_score()]
#' @inherit dummy_mh params return
#' @export
#' @autoglobal
compute_mh_y_pps__dist__curr_score <- function(
  data,
  name = "mh_y_pps__dist__curr_score",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data_ss <- data |>
    compute_mh_y_pps__severity_score(
      name = "mh_y_pps__severity_score_internal"
    ) |>
    group_by(session_id) |>
    # compute z-scores
    mutate(
      mh_y_pps__severity_score_z = {
        vals <- as.numeric(mh_y_pps__severity_score_internal)
        if (sum(!is.na(vals)) < 2) {
          rep(NA_real_, length(vals))
        } else {
          base::scale(vals)[, 1]
        }
      },
      # find if any z-score >= 1.96 in each event by participants
      !!name := as.character(as.integer(mh_y_pps__severity_score_z >= 1.96))
    ) |>
    ungroup() |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Persistent Distress Score)"
#' @description
#' Computes the summary score `mh_y_pps__dist__pers_score`
#' Prodromal Psychosis Scale \[Youth\] (Persistent Distress Score)
#'
#' For the last 3 consecutive waves (this wave, prior annual wave, and the wave
#' before that), if 2 or more waves have a `mh_y_pps__dist__curr_score` of "1",
#' then score is "1", else "0";
#' if more than 1 `NA` values in the last 3 waves, then score is `NA`.
#'
#' The persistent flag is derived from a padded annual timeline per participant.
#' Missing annual visits between observed sessions are treated as `NA`,
#' so each observed session evaluates the current wave plus the two
#' immediately preceding annual slots, even if data were not collected for
#' one of those visits.
#' The special case where both `ses-00A` and `ses-01A` meet the threshold (`1`)
#' is also treated as persistent at `ses-01A`.
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__curr_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:*  none
#'
#' @seealso [compute_mh_y_pps__dist__curr_score()]
#' @inherit dummy_mh params return
#' @export
#' @autoglobal
compute_mh_y_pps__dist__pers_score <- function(
  data,
  name = "mh_y_pps__dist__pers_score",
  combine = TRUE
) {
  chk::chk_data(data)
  chk::chk_logical(combine)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data_ss <- data |>
    # only annual sessions
    filter(stringr::str_detect(
      session_id,
      "^ses-[0-9]{2}A$"
    )) |>
    compute_mh_y_pps__dist__curr_score(
      name = "mh_y_pps__dist__curr_score_internal"
    ) |>
    mutate(
      session_num = suppressWarnings(as.integer(stringr::str_extract(
        session_id, "(?<=ses-)[0-9]{2}"
      )))
    ) |>
    group_by(participant_id) |>
    arrange(session_num, .by_group = TRUE) |>
    mutate(
      !!name := {
        if (!length(session_num) || all(is.na(session_num))) {
          return(rep(NA_integer_, length(session_num)))
        }

        seq_nums <- seq.int(0L, max(session_num, na.rm = TRUE))
        idx <- match(session_num, seq_nums)
        padded <- rep(NA_integer_, length(seq_nums))
        padded[idx] <- as.integer(mh_y_pps__dist__curr_score_internal)

        lag1 <- c(NA_integer_, padded[-length(padded)])
        lag2 <- c(NA_integer_, lag1[-length(lag1)])

        mat <- cbind(padded, lag1, lag2)
        na_counts <- rowSums(is.na(mat))
        pos_counts <- rowSums(mat == 1, na.rm = TRUE)

        res_pad <- rep(NA_integer_, length(seq_nums))
        eligible <- (seq_nums >= 2L) & (na_counts <= 1)
        res_pad[eligible] <- as.integer(pos_counts[eligible] >= 2)

        early_double <- (seq_nums == 1L) & (padded == 1L) & (lag1 == 1L)
        res_pad[early_double] <- 1L

        as.character(res_pad[idx])
      }
    ) |>
    ungroup()

  # make sure to join back to original data to keep original order and rows
  data_ss <- data |>
    select(participant_id, session_id) |>
    left_join(data_ss, by = c("participant_id", "session_id")) |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}

#' Compute all PPS scores
#' @description
#' This super function computes all scores in PPS using all the
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#' @inherit compute_mh_y_pps_count references
#' @return tbl. The input data frame with the summary scores appended as
#'  new columns.
#' @export
#' @autoglobal
#' @details
#' Make sure the `data` is the full set of all variables from PPS
#' @examples
#' \dontrun{
#' compute_mh_y_pps_all(data)
#' }
compute_mh_y_pps_all <- function(data) {
  data |>
    compute_mh_y_pps_count() |>
    compute_mh_y_pps_nm() |>
    compute_mh_y_pps__bother_nm() |>
    compute_mh_y_pps__bother__yes_count() |>
    compute_mh_y_pps__bother__no_count() |>
    compute_mh_y_pps__severity_nm() |>
    compute_mh_y_pps__severity_score() |>
    compute_mh_y_pps__severity_mean() |>
    compute_mh_y_pps__dist__curr_score() |>
    compute_mh_y_pps__dist__pers_score()
}

# mh_y_ppsss --------------------------------------------------------------

#' Compute "Prodromal Psychosis Scale \[Youth\] (Current Distress Count)"
#' @description
#' Computes the summary score `mh_y_ppsss__dist__curr_count`
#' Prodromal Psychosis Scale \[Youth\] (Current Distress Count):
#' Number of times criteria met.
#'
#' This function creates a static variable from longitudinal data.
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__curr_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' @seealso [compute_mh_y_pps__dist__curr_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__curr_count <- function(
  data,
  name = "mh_y_ppsss__dist__curr_count"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__curr_score(
      name = "mh_y_pps__dist__curr_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- as.integer(mh_y_pps__dist__curr_score_internal)
        if (all(is.na(vals))) {
          NA_integer_
        } else {
          as.integer(sum(vals, na.rm = TRUE))
        }
      },
      .groups = "drop"
    )
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (Persistent Distress Count)"
#' @description
#' Computes the summary score `mh_y_ppsss__dist__pers_count`
#' Prodromal Psychosis Scale \[Youth\] (Persistent Distress Count):
#' Number of times criteria met
#'
#' This function creates a static variable from longitudinal data.
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__pers_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' @seealso [compute_mh_y_pps__dist__pers_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__pers_count <- function(
  data,
  name = "mh_y_ppsss__dist__pers_count"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__pers_score(
      name = "mh_y_pps__dist__pers_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- as.integer(mh_y_pps__dist__pers_score_internal)
        if (all(is.na(vals))) {
          NA_integer_
        } else {
          as.integer(sum(vals, na.rm = TRUE))
        }
      },
      .groups = "drop"
    )
}

#' Compute "Static Prodromal Psychosis Scale \[Youth\] (First Current Distress)"
#' @description
#' Static Prodromal Psychosis Scale \[Youth\] (First Current Distress):
#' Session when criteria first met
#'
#' This function creates a static variable from longitudinal data.
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__curr_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' @seealso [compute_mh_y_pps__dist__curr_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__curr_first <- function(
  data,
  name = "mh_y_ppsss__dist__curr_first"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__curr_score(
      name = "mh_y_pps__dist__curr_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- as.integer(mh_y_pps__dist__curr_score_internal)
        idx <- which(vals == 1)[1]
        if (is.na(idx)) {
          NA_character_
        } else {
          as.character(session_id[idx])
        }
      },
      .groups = "drop"
    )
}

#' Compute "Prodromal Psychosis Scale \[Youth\] (First Persistent Distress)"
#' @description
#' Static Prodromal Psychosis Scale \[Youth\] (First Persistent Distress):
#' Session when criteria first met
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__pers_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' This function creates a static variable from longitudinal data.
#'
#' @seealso [compute_mh_y_pps__dist__pers_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__pers_first <- function(
  data,
  name = "mh_y_ppsss__dist__pers_first"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__pers_score(
      name = "mh_y_pps__dist__pers_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- as.integer(mh_y_pps__dist__pers_score_internal)
        idx <- which(vals == 1)[1]
        if (is.na(idx)) {
          NA_character_
        } else {
          as.character(session_id[idx])
        }
      },
      .groups = "drop"
    )
}

#' Compute "Static Prodromal Psychosis Scale \[Youth\] (Current Distress Ever)"
#' @description
#' Static Prodromal Psychosis Scale \[Youth\] (Current Distress Ever):
#' Indicates if criteria ever met
#'
#' This function creates a static variable from longitudinal data.
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__curr_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' @seealso [compute_mh_y_pps__dist__curr_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__curr_ever <- function(
  data,
  name = "mh_y_ppsss__dist__curr_ever"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__curr_score(
      name = "mh_y_pps__dist__curr_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- mh_y_pps__dist__curr_score_internal
        if (all(is.na(vals))) {
          NA_character_
        } else {
          as.character(as.integer(any(vals == "1", na.rm = TRUE)))
        }
      },
      .groups = "drop"
    )
}

#' Compute "Static Prodromal Psychosis Scale \[Youth\] (Persistent Distress Ever)"
#' @description
#' Static Prodromal Psychosis Scale \[Youth\] (Persistent Distress Ever):
#' Indicates if criteria ever met
#'
#' - *Summarized variables:*
#'   - mh_y_pps__dist__pers_score (intermediate score)
#'
#' - *Excluded values:* none
#' - *Validation criterion:* none
#'
#' This function creates a static variable from longitudinal data.
#'
#' @seealso [compute_mh_y_pps__dist__pers_score()]
#' @inherit dummy_mh params return
#' @return a tibble of the `participant_id` column and the new static column
#' @export
#' @autoglobal
compute_mh_y_ppsss__dist__pers_ever <- function(
  data,
  name = "mh_y_ppsss__dist__pers_ever"
) {
  chk::chk_data(data)
  chk::check_names(data, c("participant_id", "session_id"))
  check_col_names(data, name)

  data |>
    compute_mh_y_pps__dist__pers_score(
      name = "mh_y_pps__dist__pers_score_internal"
    ) |>
    group_by(participant_id) |>
    summarize(
      !!name := {
        vals <- mh_y_pps__dist__pers_score_internal
        if (all(is.na(vals))) {
          NA_character_
        } else {
          as.character(as.integer(any(vals == "1", na.rm = TRUE)))
        }
      },
      .groups = "drop"
    )
}

#' Compute all the mh_y_ppsss scores
#'
#' @description
#' A single function to compute all scores in the above domain using
#' **default** arguments.
#'
#' @param data tbl, Dataframe containing the columns to be summarized.
#'
#' @return a tibble of the `participant_id` column and the new static columns
#'
#' @export
#' @autoglobal
compute_mh_y_ppsss_all <- function(data) {
  purrr::map(
    c(
      compute_mh_y_ppsss__dist__pers_count,
      compute_mh_y_ppsss__dist__curr_count,
      compute_mh_y_ppsss__dist__curr_first,
      compute_mh_y_ppsss__dist__pers_first,
      compute_mh_y_ppsss__dist__curr_ever,
      compute_mh_y_ppsss__dist__pers_ever
    ),
    ~ .x(data)
  ) |>
    purrr::reduce(dplyr::left_join, by = c("participant_id"))
}


# mh_ple ss functions -----------------------------------------------------


#' Retain values based on conditions
#'
#' Creates new variables by applying conditions to specified columns
#' (`fork_vars`) and retaining or modifying values from other columns (`vars`)
#' based on `keep_values`.
#' Generates new variables with `_product` suffix.
#'
#' @param data A data frame containing the input data
#' @param fork_vars Character vector of column names to use as logical
#'  conditions, evaluated against `keep_values`
#' @param vars Character vector of column names whose values will be retained or
#'   modified based on conditions in `fork_vars`
#' @param keep_values Vector of values in `fork_vars` to consider as "true" for
#'   retaining values in `vars`
#'
#' @return A data frame with new `_product` suffixed variables. Excludes
#'   intermediate logical columns.
#'
#' @examples
#' product_vars(
#'   data = tibble::tibble(
#'     var_av = c("1", "2", "3", "4", "5", NA, "999", "777"),
#'     var_al = c("5", "4", "3", "2", "1", "777", NA, "999"),
#'     var_bv = c("1", "1", "36", "2", "1", NA, "999", "777"),
#'     var_bl = c("5", "2", "2", "2", "1", "777", NA, "999")
#'   ),
#'   fork_vars = c("var_al", "var_bl"),
#'   vars = c("var_av", "var_bv"),
#'   keep_values = "2"
#' )
#'
#' @import dplyr
#' @export
#' @autoglobal
#' @keywords internal
product_vars <- function(
  data,
  fork_vars,
  vars,
  keep_values
) {
  chk::chk_identical(
    length(fork_vars),
    length(vars)
  )

  out <- data |>
    mutate(
      across(all_of(fork_vars), ~ .x %in% keep_values, .names = "{.col}_logical")
    )

  for (i in 1:length(vars)) {
    fork_var <- paste0(fork_vars[i], "_logical")
    var <- vars[i]
    new_numeric_var <- paste0(var, "_product")

    out <- out |>
      mutate(!!new_numeric_var := if_else(
        !!sym(fork_var),
        !!sym(var),
        NA_character_
      ))
  }

  out |>
    select(
      !ends_with("_logical")
    )
}

#' Compute mean for MH-PLE scores
#'
#' @description
#' Calculates mean scores for variables with forking logic, where variables may
#' only be applicable based on certain conditions. Missing values and exclusions
#' are handled based on the forking variable values.
#'
#' @param data Data frame containing columns to summarize
#' @param name String specifying name for summary score column
#' @param fork_vars Character vector of columns used as logical conditions
#' @param fork_val String indicating value in fork_vars for valid responses
#' @param vars Character vector of columns to summarize
#' @param max_na Integer for maximum allowed missing values
#' @param exclude Character vector of values to exclude
#' @param events Character vector of events to compute scores for
#' @param combine Logical; if TRUE, append score to input data
#' @param no_na Logical; if TRUE, return NA when any value is missing
#'
#' @return Data frame with summary score column
#' @export
#' @autoglobal
#' @keywords internal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b, ~c, ~a__severe, ~b__severe, ~c__severe,
#'   "ses-00A", "1", "1", "1", "1", NA, NA,
#'   "ses-01A", "1", "1", "1", "2", "777", "2"
#' )
#'
#' data |>
#'   ss_mean_mh_ple(
#'     name = "mean",
#'     fork_vars = c("a", "b", "c"),
#'     vars = paste0(c("a", "b", "c"), "__severe"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
ss_mean_mh_ple <- function(
  data,
  name,
  fork_vars,
  fork_val = "1",
  vars,
  max_na = NULL,
  exclude = NULL,
  events = NULL,
  combine = TRUE,
  no_na = FALSE
) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(fork_vars)
  chk::check_names(data, fork_vars)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  chk::chk_identical(
    length(fork_vars),
    length(vars)
  )

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          is.na(data[[fork_vars[match(cur_column(), vars)]]]) |
            data[[fork_vars[match(cur_column(), vars)]]] != fork_val |
            .x %in% exclude,
          NA,
          .x
        ) |>
          as.numeric()
      )
    ) |>
    # Nb of fork vars having a value of fork_val (value expected in matching var)
    mutate(
      total_na = rowSums(across(all_of(c(vars, fork_vars)), ~ is.na(.x) | (.x %in% exclude))),
      fork_vals = rowSums(across(all_of(fork_vars), ~ .x == fork_val), na.rm = TRUE),
      var_valid = length(vars) - rowSums(across(all_of(vars), is.na))
    ) |>
    mutate(
      real_na = fork_vals - var_valid
    ) |>
    transmute(
      "{name}" := case_when(
        no_na & (total_na > 0) ~ NA,
        (var_valid == 0) | (real_na > max_na) ~ NA,
        .default = rowMeans(across(all_of(vars)), na.rm = TRUE)
      )
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}


#' Compute sum for MH-PLE scores
#'
#' @description
#' Calculates sum scores for variables with forking logic, where variables may
#' only be applicable based on certain conditions. Missing values and exclusions
#' are handled based on the forking variable values.
#'
#' @inheritParams ss_mean_mh_ple
#'
#' @return Data frame with summary score column
#' @export
#' @autoglobal
#' @keywords internal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b, ~c, ~a__severe, ~b__severe, ~c__severe,
#'   "ses-00A", "1", "1", "1", "1", NA, NA,
#'   "ses-01A", "1", "1", "1", "2", "777", "2"
#' )
#'
#' data |>
#'   ss_sum_mh_ple(
#'     name = "sum",
#'     fork_vars = c("a", "b", "c"),
#'     vars = paste0(c("a", "b", "c"), "__severe"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
ss_sum_mh_ple <- function(data,
                          name,
                          fork_vars,
                          fork_val = "1",
                          vars,
                          max_na = NULL,
                          exclude = NULL,
                          events = NULL,
                          combine = TRUE,
                          no_na = FALSE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(fork_vars)
  chk::check_names(data, fork_vars)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  chk::chk_identical(
    length(fork_vars),
    length(vars)
  )

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          is.na(data[[fork_vars[match(cur_column(), vars)]]]) |
            data[[fork_vars[match(cur_column(), vars)]]] != fork_val |
            .x %in% exclude,
          NA,
          .x
        ) |>
          as.numeric()
      )
    ) |>
    # Nb of fork vars having a value of fork_val (value expected in matching var)
    mutate(
      total_na = rowSums(across(all_of(c(vars, fork_vars)), ~ is.na(.x) | (.x %in% exclude))),
      fork_vals = rowSums(across(all_of(fork_vars), ~ .x == fork_val), na.rm = TRUE),
      var_valid = length(vars) - rowSums(across(all_of(vars), is.na))
    ) |>
    mutate(
      real_na = fork_vals - var_valid
    ) |>
    transmute(
      "{name}" := case_when(
        no_na & (total_na > 0) ~ NA,
        (var_valid == 0) | (real_na > max_na) ~ NA,
        .default = rowSums(across(all_of(vars)), na.rm = TRUE)
      ) |> as.integer()
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}


#' Count missing values for MH-PLE scores
#'
#' @description
#' Counts missing values for variables with forking logic, where variables may
#' only be applicable based on certain conditions. Excluded values are treated
#' as missing.
#'
#' @inheritParams ss_mean_mh_ple
#'
#' @return Data frame with count of missing values
#' @export
#' @autoglobal
#' @keywords internal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b, ~c, ~a__severe, ~b__severe, ~c__severe,
#'   "ses-00A", "1", "1", "1", "1", NA, NA,
#'   "ses-01A", "1", "1", "1", "2", "777", "2"
#' )
#'
#' data |>
#'   ss_nm_mh_ple(
#'     name = "nm",
#'     fork_vars = c("a", "b", "c"),
#'     vars = paste0(c("a", "b", "c"), "__severe"),
#'     exclude = c("777", "999")
#'   )
ss_nm_mh_ple <- function(data,
                         name,
                         fork_vars,
                         fork_val = "1",
                         vars,
                         exclude = NULL,
                         events = NULL,
                         combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(fork_vars)
  chk::check_names(data, fork_vars)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  if (!is.null(exclude)) chk::chk_character(exclude)
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }

  chk::chk_identical(
    length(fork_vars),
    length(vars)
  )

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          is.na(data[[fork_vars[match(cur_column(), vars)]]]) |
            data[[fork_vars[match(cur_column(), vars)]]] != 1 |
            .x %in% exclude,
          NA,
          .x
        )
      )
    ) |>
    # Nb of fork vars having a value of "1" (value expected in matching var)
    mutate(
      fork_vals = rowSums(across(all_of(fork_vars), ~ .x == "1"), na.rm = TRUE),
      var_valid = length(vars) - rowSums(across(all_of(vars), is.na))
    ) |>
    transmute(
      "{name}" := as.integer(fork_vals - var_valid)
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

# ksads means -------------------------------------------------------------

#' Internal function for all ksads summary score functions.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. Name of the summary score column.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit.
#' @param combine logical. If `TRUE` (default), the summary score is
#' is appended as a new column to the input data frame. If `FALSE`, the
#' summary score is returned as a separate one-column data frame.
#' @param exclude character vector. Values to be excluded from the summary
#' score calculation.
#' @param vars character vector. Names of the columns to be summarized.
#' @return tbl. see `combine`.
#' @details
#' KSADS summary scores are mostly calculating the means over variables,
#' but there are two special codes to handle:
#'
#' - `"888"`: item skipped by branching. When at least one input value is
#'   observed, any `888` value is converted to "0" prior to averaging.
#' - `"555"`: module not administered. If any input variable is "555"
#'   leave the score as `NA`.
#' - `NA`: missing value. If at least one input value is observed,
#'   any `NA` values are converted to "0" prior to averaging.
#'   If all inputs are `NA`, the summary score remains `NA`.
#'
#' @keywords internal
#' @autoglobal
ss_mean_ksads <- function(
  data,
  name,
  vars,
  max_na,
  exclude,
  combine
) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)

  n_vars <- length(vars)

  data_ss <- data |>
    mutate(
      ksads_all_na = if_all(all_of(vars), ~ is.na(.x)),
      across(
        all_of(vars),
        ~ {
          value_chr <- as.character(.x)
          case_when(
            value_chr == "555" ~ value_chr,
            ksads_all_na ~ value_chr,
            is.na(.x) ~ "0",
            value_chr == "888" ~ "0",
            TRUE ~ value_chr
          )
        }
      ),
      ksads_any_555 = rowSums(
        across(all_of(vars), ~ as.numeric(as.character(.x) == "555")),
        na.rm = TRUE
      ) > 0
    ) |>
    ss_mean(
      name    = name,
      vars    = vars,
      max_na  = max_na,
      exclude = exclude
    ) |>
    transmute(
      !!name := if_else(
        ksads_any_555,
        NA_real_,
        .data[[name]]
      )
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}


# ksads__adhd -------------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__adhd__pres__sx_mean
#' @format vars_mh_p_ksads__adhd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__adhd__pres__sx_mean`
vars_mh_p_ksads__adhd__pres__sx <- c(
  "mh_p_ksads__adhd__avoid__task__pres_sx",
  "mh_p_ksads__adhd__blurt__pres_sx",
  "mh_p_ksads__adhd__distract__grdschl__pres_sx",
  "mh_p_ksads__adhd__fidget__pres_sx",
  "mh_p_ksads__adhd__flwinstr__pres_sx",
  "mh_p_ksads__adhd__forget__pres_sx",
  "mh_p_ksads__adhd__hypractv__pres_sx",
  "mh_p_ksads__adhd__impuls__pres_sx",
  "mh_p_ksads__adhd__interrupt__pres_sx",
  "mh_p_ksads__adhd__loses__pres_sx",
  "mh_p_ksads__adhd__mistake__pres_sx",
  "mh_p_ksads__adhd__motor__pres_sx",
  "mh_p_ksads__adhd__notlisten__pres_sx",
  "mh_p_ksads__adhd__orgtask__pres_sx",
  "mh_p_ksads__adhd__quiet__pres_sx",
  "mh_p_ksads__adhd__seat__grdschl__pres_sx",
  "mh_p_ksads__adhd__sustattn__grdschl__pres_sx",
  "mh_p_ksads__adhd__talkexcess__pres_sx",
  "mh_p_ksads__adhd__wait__pres_sx"
)

#' Compute "KSADS - Attention-Deficit/Hyperactivity Disorder \[Parent\]
#' (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__adhd__pres__sx_mean`
#' KSADS - Attention-Deficit/Hyperactivity Disorder \[Parent\]
#' (Symptom - Present): Mean \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__adhd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 19 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__adhd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__adhd__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__adhd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__adhd__past__sx_mean
#' @format vars_mh_p_ksads__adhd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__adhd__past__sx_mean`
vars_mh_p_ksads__adhd__past__sx <- c(
  "mh_p_ksads__adhd__avoid__task__past_sx",
  "mh_p_ksads__adhd__blurt__past_sx",
  "mh_p_ksads__adhd__distract__1schlyr__past_sx",
  "mh_p_ksads__adhd__fidget__past_sx",
  "mh_p_ksads__adhd__flwinstr__past_sx",
  "mh_p_ksads__adhd__forget__past_sx",
  "mh_p_ksads__adhd__hypractv__past_sx",
  "mh_p_ksads__adhd__impuls__past_sx",
  "mh_p_ksads__adhd__interrupt__past_sx",
  "mh_p_ksads__adhd__loses__past_sx",
  "mh_p_ksads__adhd__mistake__past_sx",
  "mh_p_ksads__adhd__motor__past_sx",
  "mh_p_ksads__adhd__notlisten__past_sx",
  "mh_p_ksads__adhd__orgtask__past_sx",
  "mh_p_ksads__adhd__quiet__past_sx",
  "mh_p_ksads__adhd__seat__1schlyr__past_sx",
  "mh_p_ksads__adhd__sustattn__1schlyr__past_sx",
  "mh_p_ksads__adhd__talkexcess__past_sx",
  "mh_p_ksads__adhd__wait__past_sx"
)

#' Compute "KSADS - Attention-Deficit/Hyperactivity Disorder \[Parent\]
#' (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__adhd__past__sx_mean`
#' KSADS - Attention-Deficit/Hyperactivity Disorder \[Parent\] (Symptom - Past):
#' Mean `[Validation: No more than 3 missing or declined`]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__adhd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 19 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__adhd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__adhd__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__adhd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__adhd
#' @description
#' This function computes all summary scores for the mh_p_ksads__adhd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__adhd_all <- function(data) {
  data |>
    compute_mh_p_ksads__adhd__past__sx_mean() |>
    compute_mh_p_ksads__adhd__pres__sx_mean()
}

# mh_p_ksads__agor --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__agor__pres__sx_mean
#' @format vars_mh_p_ksads__agor__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__agor__pres__sx_mean`
vars_mh_p_ksads__agor__pres__sx <- c(
  "mh_p_ksads__agor__avoid__pres_sx",
  "mh_p_ksads__agor__multi__pres_sx"
)

#' Compute "KSADS - Agoraphobia \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__agor__pres__sx_mean`
#' KSADS - Agoraphobia \[Parent\] (Symptom - Present): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__agor__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__agor__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__agor__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__agor__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__agor__past__sx_mean
#' @format vars_mh_p_ksads__agor__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__agor__past__sx_mean`
vars_mh_p_ksads__agor__past__sx <- c(
  "mh_p_ksads__agor__avoid__past_sx",
  "mh_p_ksads__agor__multi__past_sx"
)

#' Compute "KSADS - Agoraphobia \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__agor__past__sx_mean`
#' KSADS - Agoraphobia \[Parent\] (Symptom - Past): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__agor__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__agor__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__agor__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__agor__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__agor
#' @description
#' This function computes all summary scores for the mh_p_ksads__agor table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__agor_all <- function(data) {
  data |>
    compute_mh_p_ksads__agor__past__sx_mean() |>
    compute_mh_p_ksads__agor__pres__sx_mean()
}


# mh_p_ksads__asd --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__asd__pres__sx_mean
#' @format vars_mh_p_ksads__asd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__asd__pres__sx_mean`
vars_mh_p_ksads__asd__pres__sx <- c(
  "mh_p_ksads__asd__hyporeact__pres_sx",
  "mh_p_ksads__asd__hyprreact__pres_sx",
  "mh_p_ksads__asd__pooreyecont__pres_sx",
  "mh_p_ksads__asd__relatsh__pres_sx",
  "mh_p_ksads__asd__restrctintrst__pres_sx",
  "mh_p_ksads__asd__routine__pres_sx",
  "mh_p_ksads__asd__socemotrcp__pres_sx",
  "mh_p_ksads__asd__unusmvmnt__pres_sx"
)

#' Compute "KSADS - Autism Spectrum Disorders \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__asd__pres__sx_mean`
#' KSADS - Autism Spectrum Disorders \[Parent\] (Symptom - Present): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__asd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__asd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__asd__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__asd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__asd__past__sx_mean
#' @format vars_mh_p_ksads__asd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__asd__past__sx_mean`
vars_mh_p_ksads__asd__past__sx <- c(
  "mh_p_ksads__asd__hyporeact__past_sx",
  "mh_p_ksads__asd__hyprreact__past_sx",
  "mh_p_ksads__asd__pooreyecont__past_sx",
  "mh_p_ksads__asd__relatsh__past_sx",
  "mh_p_ksads__asd__restrctintrst__past_sx",
  "mh_p_ksads__asd__routine__past_sx",
  "mh_p_ksads__asd__socemotrcp__past_sx",
  "mh_p_ksads__asd__unusmvmnt__past_sx"
)

#' Compute "KSADS - Autism Spectrum Disorders \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__asd__past__sx_mean`
#' KSADS - Autism Spectrum Disorders \[Parent\] (Symptom - Past): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__asd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__asd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__asd__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__asd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__asd
#' @description
#' This function computes all summary scores for the mh_p_ksads__asd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__asd_all <- function(data) {
  data |>
    compute_mh_p_ksads__asd__past__sx_mean() |>
    compute_mh_p_ksads__asd__pres__sx_mean()
}

# mh_p_ksads__bpd --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__bpd__pres__sx_mean
#' @format vars_mh_p_ksads__bpd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__bpd__pres__sx_mean`
vars_mh_p_ksads__bpd__pres__sx <- c(
  "mh_p_ksads__bpd__distract__incr__pres_sx",
  "mh_p_ksads__bpd__distract__pres_sx",
  "mh_p_ksads__bpd__enrg__incr__pres_sx",
  "mh_p_ksads__bpd__flgtid__pres_sx",
  "mh_p_ksads__bpd__goaldir__incr__pres_sx",
  "mh_p_ksads__bpd__grndios__pres_sx",
  "mh_p_ksads__bpd__hyprsex__pres_sx",
  "mh_p_ksads__bpd__irrit__expl__pres_sx",
  "mh_p_ksads__bpd__irrit__manic__pres_sx",
  "mh_p_ksads__bpd__mood__elv__pres_sx",
  "mh_p_ksads__bpd__mood__euph__pres_sx",
  "mh_p_ksads__bpd__prspch__pres_sx",
  "mh_p_ksads__bpd__psymot__agit__pres_sx",
  "mh_p_ksads__bpd__ractho__pres_sx",
  "mh_p_ksads__bpd__riskactv__pres_sx",
  "mh_p_ksads__bpd__slpdecr__pres_sx"
)

#' Compute "KSADS - Bipolar Disorders \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__bpd__pres__sx_mean`
#' KSADS - Bipolar Disorders \[Parent\] (Symptom - Present): Mean
#' \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__bpd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 16 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__bpd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__bpd__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__bpd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__bpd__past__sx_mean
#' @format vars_mh_p_ksads__bpd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__bpd__past__sx_mean`
vars_mh_p_ksads__bpd__past__sx <- c(
  "mh_p_ksads__bpd__distract__incr__past_sx",
  "mh_p_ksads__bpd__distract__past_sx",
  "mh_p_ksads__bpd__enrg__incr__past_sx",
  "mh_p_ksads__bpd__flgtid__past_sx",
  "mh_p_ksads__bpd__goaldir__incr__past_sx",
  "mh_p_ksads__bpd__grndios__past_sx",
  "mh_p_ksads__bpd__hyprsex__past_sx",
  "mh_p_ksads__bpd__irrit__expl__past_sx",
  "mh_p_ksads__bpd__irrit__manic__past_sx",
  "mh_p_ksads__bpd__mood__elv__past_sx",
  "mh_p_ksads__bpd__mood__euph__past_sx",
  "mh_p_ksads__bpd__prspch__past_sx",
  "mh_p_ksads__bpd__psymot__agit__past_sx",
  "mh_p_ksads__bpd__ractho__past_sx",
  "mh_p_ksads__bpd__riskactv__past_sx",
  "mh_p_ksads__bpd__slpdecr__past_sx"
)

#' Compute "KSADS - Bipolar Disorders \[Parent\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_p_ksads__bpd__past__sx_mean`
#' KSADS - Bipolar Disorders \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__bpd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 16 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__bpd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__bpd__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__bpd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__bpd
#' @description
#' This function computes all summary scores for the mh_p_ksads__bpd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__bpd_all <- function(data) {
  data |>
    compute_mh_p_ksads__bpd__past__sx_mean() |>
    compute_mh_p_ksads__bpd__pres__sx_mean()
}

# mh_p_ksads__cond -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__cond__pres__sx_mean
#' @format vars_mh_p_ksads__cond__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__cond__pres__sx_mean`
vars_mh_p_ksads__cond__pres__sx <- c(
  "mh_p_ksads__cond__breakin__pres_sx",
  "mh_p_ksads__cond__bully__pres_sx",
  "mh_p_ksads__cond__fight__pres_sx",
  "mh_p_ksads__cond__fire__pres_sx",
  "mh_p_ksads__cond__lies__pres_sx",
  "mh_p_ksads__cond__outlate__pres_sx",
  "mh_p_ksads__cond__physcruel__anml__pres_sx",
  "mh_p_ksads__cond__physcruel__ppl__pres_sx",
  "mh_p_ksads__cond__rob__pres_sx",
  "mh_p_ksads__cond__runaway__pres_sx",
  "mh_p_ksads__cond__steal__pres_sx",
  "mh_p_ksads__cond__truant__pres_sx",
  "mh_p_ksads__cond__vandal__pres_sx",
  "mh_p_ksads__cond__weapon__pres_sx"
)

#' Compute "KSADS - Conduct Disorder \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__cond__pres__sx_mean`
#' KSADS - Conduct Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__cond__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 14 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__cond__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__cond__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__cond__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__cond__past__sx_mean
#' @format vars_mh_p_ksads__cond__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__cond__past__sx_mean`
vars_mh_p_ksads__cond__past__sx <- c(
  "mh_p_ksads__cond__breakin__past_sx",
  "mh_p_ksads__cond__bully__past_sx",
  "mh_p_ksads__cond__fight__past_sx",
  "mh_p_ksads__cond__fire__past_sx",
  "mh_p_ksads__cond__lies__past_sx",
  "mh_p_ksads__cond__outlate__past_sx",
  "mh_p_ksads__cond__physcruel__anml__past_sx",
  "mh_p_ksads__cond__physcruel__ppl__past_sx",
  "mh_p_ksads__cond__rob__past_sx",
  "mh_p_ksads__cond__runaway__past_sx",
  "mh_p_ksads__cond__steal__past_sx",
  "mh_p_ksads__cond__truant__past_sx",
  "mh_p_ksads__cond__vandal__past_sx",
  "mh_p_ksads__cond__weapon__past_sx"
)

#' Compute "KSADS - Conduct Disorder \[Parent\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_p_ksads__cond__past__sx_mean`
#' KSADS - Conduct Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__cond__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 14 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__cond__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__cond__past__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__cond__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__cond
#' @description
#' This function computes all summary scores for the mh_p_ksads__cond table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__cond_all <- function(data) {
  data |>
    compute_mh_p_ksads__cond__past__sx_mean() |>
    compute_mh_p_ksads__cond__pres__sx_mean()
}

# mh_p_ksads__dep --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__dep__pres__sx_mean
#' @format vars_mh_p_ksads__dep__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__dep__pres__sx_mean`
vars_mh_p_ksads__dep__pres__sx <- c(
  "mh_p_ksads__dep__anhed__pres_sx",
  "mh_p_ksads__dep__appdecr__pres_sx",
  "mh_p_ksads__dep__conc__pres_sx",
  "mh_p_ksads__dep__fatig__pres_sx",
  "mh_p_ksads__dep__glt__pres_sx",
  "mh_p_ksads__dep__hplss__pres_sx",
  "mh_p_ksads__dep__hyprsom__pres_sx",
  "mh_p_ksads__dep__incapp__pres_sx",
  "mh_p_ksads__dep__indec__pres_sx",
  "mh_p_ksads__dep__irrit__pres_sx",
  "mh_p_ksads__dep__mood__pres_sx",
  "mh_p_ksads__dep__psymot__agit__pres_sx",
  "mh_p_ksads__dep__psymot__rtrd__pres_sx",
  "mh_p_ksads__dep__slfestmdecr__pres_sx",
  "mh_p_ksads__dep__wghtgain__pres_sx",
  "mh_p_ksads__dep__wghtloss__pres_sx"
)

#' Compute "KSADS - Depressive Disorders \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__dep__pres__sx_mean`
#' KSADS - Depressive Disorders \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__dep__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 17 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__dep__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__dep__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__dep__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__dep__past__sx_mean
#' @format vars_mh_p_ksads__dep__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__dep__past__sx_mean`
vars_mh_p_ksads__dep__past__sx <- c(
  "mh_p_ksads__dep__anhed__past_sx",
  "mh_p_ksads__dep__appdecr__past_sx",
  "mh_p_ksads__dep__conc__past_sx",
  "mh_p_ksads__dep__fatig__past_sx",
  "mh_p_ksads__dep__glt__past_sx",
  "mh_p_ksads__dep__hplss__past_sx",
  "mh_p_ksads__dep__hyprsom__past_sx",
  "mh_p_ksads__dep__incapp__past_sx",
  "mh_p_ksads__dep__indec__past_sx",
  "mh_p_ksads__dep__insom__past_sx",
  "mh_p_ksads__dep__irrit__past_sx",
  "mh_p_ksads__dep__mood__past_sx",
  "mh_p_ksads__dep__psymot__agit__past_sx",
  "mh_p_ksads__dep__psymot__rtrd__past_sx",
  "mh_p_ksads__dep__slfestmdecr__past_sx",
  "mh_p_ksads__dep__wghtgain__past_sx",
  "mh_p_ksads__dep__wghtloss__past_sx"
)

#' Compute "KSADS - Depressive Disorders \[Parent\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_p_ksads__dep__past__sx_mean`
#' KSADS - Depressive Disorders \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__dep__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 17 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__dep__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__dep__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__dep__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__dep
#' @description
#' This function computes all summary scores for the mh_p_ksads__dep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__dep_all <- function(data) {
  data |>
    compute_mh_p_ksads__dep__past__sx_mean() |>
    compute_mh_p_ksads__dep__pres__sx_mean()
}

# mh_p_ksads__dmdd ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__dmdd__sx_mean
#' @format vars_mh_p_ksads__dmdd__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__dmdd__sx_mean`
vars_mh_p_ksads__dmdd__sx <- c(
  "mh_p_ksads__dmdd__outbrst__3perwk_sx"
)

#' Compute "KSADS - Disruptive Mood Dysregulation Disorder \[Parent\] (Symptom):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__dmdd__sx_mean`
#' KSADS - Disruptive Mood Dysregulation Disorder \[Parent\] (Symptom): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__dmdd__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__dmdd__sx_mean <- function(
  data,
  name = "mh_p_ksads__dmdd__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__dmdd__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__dep
#' @description
#' This function computes all summary scores for the mh_p_ksads__dep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__dmdd_all <- function(data) {
  data |>
    compute_mh_p_ksads__dmdd__sx_mean()
}

# mh_p_ksads__ed ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ed__pres__sx_mean
#' @format vars_mh_p_ksads__ed__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ed__pres__sx_mean`
vars_mh_p_ksads__ed__pres__sx <- c(
  "mh_p_ksads__ed__binge__distrs__pres_sx",
  "mh_p_ksads__ed__binge__pres_sx",
  "mh_p_ksads__ed__compbehav__pres_sx",
  "mh_p_ksads__ed__emac__pres_sx",
  "mh_p_ksads__ed__fear__obese__pres_sx",
  "mh_p_ksads__ed__slfwrth__pres_sx",
  "mh_p_ksads__ed__wghtcntrl__oth__pres_sx",
  "mh_p_ksads__ed__wghtcntrl__vom__pres_sx"
)

#' Compute "KSADS - Eating Disorders \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ed__pres__sx_mean`
#' KSADS - Eating Disorders \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ed__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ed__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__ed__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ed__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ed__past__sx_mean
#' @format vars_mh_p_ksads__ed__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ed__past__sx_mean`
vars_mh_p_ksads__ed__past__sx <- c(
  "mh_p_ksads__ed__binge__distrs__past_sx",
  "mh_p_ksads__ed__binge__past_sx",
  "mh_p_ksads__ed__compbehav__past_sx",
  "mh_p_ksads__ed__emac__past_sx",
  "mh_p_ksads__ed__fear__obese__past_sx",
  "mh_p_ksads__ed__slfwrth__past_sx",
  "mh_p_ksads__ed__wghtcntrl__oth__past_sx",
  "mh_p_ksads__ed__wghtcntrl__vom__past_sx"
)

#' Compute "KSADS - Eating Disorders \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ed__past__sx_mean`
#' KSADS - Eating Disorders \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ed__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ed__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__ed__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ed__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__ed
#' @description
#' This function computes all summary scores for the mh_p_ksads__ed table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__ed_all <- function(data) {
  data |>
    compute_mh_p_ksads__ed__past__sx_mean() |>
    compute_mh_p_ksads__ed__pres__sx_mean()
}


# mh_p_ksads__gad -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__gad__pres__sx_mean
#' @format vars_mh_p_ksads__gad__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__gad__pres__sx_mean`
vars_mh_p_ksads__gad__pres__sx <- c(
  "mh_p_ksads__gad__worry__6mo__pres_sx",
  "mh_p_ksads__gad__worry__diffctrl__pres_sx",
  "mh_p_ksads__gad__worry__excess__pres_sx",
  "mh_p_ksads__gad__worry__multi__pres_sx"
)

#' Compute "KSADS - Generalized Anxiety Disorder \[Parent\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__gad__pres__sx_mean`
#' KSADS - Generalized Anxiety Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__gad__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__gad__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__gad__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__gad__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__gad__past__sx_mean
#' @format vars_mh_p_ksads__gad__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__gad__past__sx_mean`
vars_mh_p_ksads__gad__past__sx <- c(
  "mh_p_ksads__gad__worry__6mo__past_sx",
  "mh_p_ksads__gad__worry__diffctrl__past_sx",
  "mh_p_ksads__gad__worry__excess__past_sx",
  "mh_p_ksads__gad__worry__multi__past_sx"
)

#' Compute "KSADS - Generalized Anxiety Disorder \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__gad__past__sx_mean`
#' KSADS - Generalized Anxiety Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__gad__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__gad__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__gad__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__gad__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__gad
#' @description
#' This function computes all summary scores for the mh_p_ksads__gad table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__gad_all <- function(data) {
  data |>
    compute_mh_p_ksads__gad__past__sx_mean() |>
    compute_mh_p_ksads__gad__pres__sx_mean()
}


# mh_p_ksads__hom -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__hom__pres__sx_mean
#' @format vars_mh_p_ksads__hom__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__hom__pres__sx_mean`
vars_mh_p_ksads__hom__pres__sx <- c(
  "mh_p_ksads__hom__idea__pres_sx",
  "mh_p_ksads__hom__plan__pres_sx"
)

#' Compute "KSADS - Homicidality \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__hom__pres__sx_mean`
#' KSADS - Homicidality \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__hom__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__hom__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__hom__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__hom__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__hom__past__sx_mean
#' @format vars_mh_p_ksads__hom__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__hom__past__sx_mean`
vars_mh_p_ksads__hom__past__sx <- c(
  "mh_p_ksads__hom__idea__past_sx",
  "mh_p_ksads__hom__plan__past_sx"
)

#' Compute "KSADS - Homicidality \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__hom__past__sx_mean`
#' KSADS - Homicidality \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__hom__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__hom__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__hom__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__hom__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__hom
#' @description
#' This function computes all summary scores for the mh_p_ksads__hom table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__hom_all <- function(data) {
  data |>
    compute_mh_p_ksads__hom__past__sx_mean() |>
    compute_mh_p_ksads__hom__pres__sx_mean()
}

# mh_p_ksads__ocd -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ocd__pres__sx_mean
#' @format vars_mh_p_ksads__ocd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ocd__pres__sx_mean`
vars_mh_p_ksads__ocd__pres__sx <- c(
  "mh_p_ksads__ocd__compuls__pres_sx",
  "mh_p_ksads__ocd__compuls__prvntanx__pres_sx",
  "mh_p_ksads__ocd__compuls__tcnsm__pres_sx",
  "mh_p_ksads__ocd__obsess__intru__pres_sx",
  "mh_p_ksads__ocd__obsess__pres_sx",
  "mh_p_ksads__ocd__obsess__tcnsm__pres_sx",
  "mh_p_ksads__ocd__suprstho__pres_sx"
)

#' Compute "KSADS - Obsessive Compulsive Disorder \[Parent\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ocd__pres__sx_mean`
#' KSADS - Obsessive Compulsive Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ocd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ocd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__ocd__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ocd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ocd__past__sx_mean
#' @format vars_mh_p_ksads__ocd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ocd__past__sx_mean`
vars_mh_p_ksads__ocd__past__sx <- c(
  "mh_p_ksads__ocd__compuls__past_sx",
  "mh_p_ksads__ocd__compuls__prvntanx__past_sx",
  "mh_p_ksads__ocd__compuls__tcnsm__past_sx",
  "mh_p_ksads__ocd__obsess__intru__past_sx",
  "mh_p_ksads__ocd__obsess__past_sx",
  "mh_p_ksads__ocd__obsess__tcnsm__past_sx",
  "mh_p_ksads__ocd__suprstho__past_sx"
)

#' Compute "KSADS - Obsessive Compulsive Disorder \[Parent\] (Symptom - Past):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ocd__past__sx_mean`
#' KSADS - Obsessive Compulsive Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ocd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ocd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__ocd__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ocd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__ocd
#' @description
#' This function computes all summary scores for the mh_p_ksads__ocd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__ocd_all <- function(data) {
  data |>
    compute_mh_p_ksads__ocd__past__sx_mean() |>
    compute_mh_p_ksads__ocd__pres__sx_mean()
}


# mh_p_ksads__odd -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__odd__pres__sx_mean
#' @format vars_mh_p_ksads__odd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__odd__pres__sx_mean`
vars_mh_p_ksads__odd__pres__sx <- c(
  "mh_p_ksads__odd__angry__pres_sx",
  "mh_p_ksads__odd__argue__pres_sx",
  "mh_p_ksads__odd__blame__pres_sx",
  "mh_p_ksads__odd__delibannoy__pres_sx",
  "mh_p_ksads__odd__disobey__pres_sx",
  "mh_p_ksads__odd__temper__pres_sx",
  "mh_p_ksads__odd__touchy__pres_sx",
  "mh_p_ksads__odd__vindict__pres_sx"
)

#' Compute "KSADS - Oppositional Defiant Disorder \[Parent\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__odd__pres__sx_mean`
#' KSADS - Oppositional Defiant Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__odd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__odd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__odd__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__odd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__odd__past__sx_mean
#' @format vars_mh_p_ksads__odd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__odd__past__sx_mean`
vars_mh_p_ksads__odd__past__sx <- c(
  "mh_p_ksads__odd__angry__past_sx",
  "mh_p_ksads__odd__argue__past_sx",
  "mh_p_ksads__odd__blame__past_sx",
  "mh_p_ksads__odd__delibannoy__past_sx",
  "mh_p_ksads__odd__disobey__past_sx",
  "mh_p_ksads__odd__temper__past_sx",
  "mh_p_ksads__odd__touchy__past_sx",
  "mh_p_ksads__odd__vindict__past_sx"
)

#' Compute "KSADS - Oppositional Defiant Disorder \[Parent\] (Symptom - Past):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__odd__past__sx_mean`
#' KSADS - Oppositional Defiant Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__odd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__odd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__odd__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__odd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__odd
#' @description
#' This function computes all summary scores for the mh_p_ksads__odd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__odd_all <- function(data) {
  data |>
    compute_mh_p_ksads__odd__past__sx_mean() |>
    compute_mh_p_ksads__odd__pres__sx_mean()
}

# mh_p_ksads__panic -----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__panic__pres__sx_mean
#' @format vars_mh_p_ksads__panic__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__panic__pres__sx_mean`
vars_mh_p_ksads__panic__pres__sx <- c(
  "mh_p_ksads__panic__attack__maladp__pres_sx",
  "mh_p_ksads__panic__attack__pres_sx",
  "mh_p_ksads__panic__sympt__pres_sx",
  "mh_p_ksads__panic__worry__attack__pres_sx"
)

#' Compute "KSADS - Panic Disorder \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__panic__pres__sx_mean`
#' KSADS - Panic Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__panic__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__panic__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__panic__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__panic__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__panic__past__sx_mean
#' @format vars_mh_p_ksads__panic__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__panic__past__sx_mean`
vars_mh_p_ksads__panic__past__sx <- c(
  "mh_p_ksads__panic__attack__maladp__past_sx",
  "mh_p_ksads__panic__attack__past_sx",
  "mh_p_ksads__panic__sympt__past_sx",
  "mh_p_ksads__panic__worry__attack__past_sx"
)

#' Compute "KSADS - Panic Disorder \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__panic__past__sx_mean`
#' KSADS - Panic Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__panic__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__panic__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__panic__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__panic__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__panic
#' @description
#' This function computes all summary scores for the mh_p_ksads__panic table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__panic_all <- function(data) {
  data |>
    compute_mh_p_ksads__panic__past__sx_mean() |>
    compute_mh_p_ksads__panic__pres__sx_mean()
}

# mh_p_ksads__phobia ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__phobia__pres__sx_mean
#' @format vars_mh_p_ksads__phobia__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__phobia__pres__sx_mean`
vars_mh_p_ksads__phobia__pres__sx <- c(
  "mh_p_ksads__phobia__avoid__pres_sx",
  "mh_p_ksads__phobia__fear__pres_sx"
)

#' Compute "KSADS - Specific Phobia \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__phobia__pres__sx_mean`
#' KSADS - Specific Phobia \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__phobia__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__phobia__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__phobia__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__phobia__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__phobia__past__sx_mean
#' @format vars_mh_p_ksads__phobia__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__phobia__past__sx_mean`
vars_mh_p_ksads__phobia__past__sx <- c(
  "mh_p_ksads__phobia__avoid__past_sx",
  "mh_p_ksads__phobia__fear__past_sx"
)

#' Compute "KSADS - Specific Phobia \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__phobia__past__sx_mean`
#' KSADS - Specific Phobia \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__phobia__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__phobia__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__phobia__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__phobia__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__phobia
#' @description
#' This function computes all summary scores for the mh_p_ksads__phobia table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__phobia_all <- function(data) {
  data |>
    compute_mh_p_ksads__phobia__past__sx_mean() |>
    compute_mh_p_ksads__phobia__pres__sx_mean()
}

# mh_p_ksads__psych -----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__psych__pres__sx_mean
#' @format vars_mh_p_ksads__psych__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__psych__pres__sx_mean`
vars_mh_p_ksads__psych__pres__sx <- c(
  "mh_p_ksads__psych__delus__oth__2wk__pres_sx",
  "mh_p_ksads__psych__delus__persec__2wk__pres_sx",
  "mh_p_ksads__psych__delus__pres_sx",
  "mh_p_ksads__psych__disorg__behav__pres_sx",
  "mh_p_ksads__psych__disorg__speech__pres_sx",
  "mh_p_ksads__psych__halluc__adt__pres_sx",
  "mh_p_ksads__psych__halluc__clust__pres_sx",
  "mh_p_ksads__psych__halluc__oth__altw__pres_sx",
  "mh_p_ksads__psych__halluc__oth__ap__pres_sx",
  "mh_p_ksads__psych__halluc__oth__pres_sx",
  "mh_p_ksads__psych__halluc__pres_sx",
  "mh_p_ksads__psych__neg__pres_sx"
)

#' Compute "KSADS - Psychosis \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__psych__pres__sx_mean`
#' KSADS - Psychosis \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__psych__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 12 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__psych__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__psych__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__psych__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__psych__past__sx_mean
#' @format vars_mh_p_ksads__psych__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__psych__past__sx_mean`
vars_mh_p_ksads__psych__past__sx <- c(
  "mh_p_ksads__psych__delus__oth__past_sx",
  "mh_p_ksads__psych__delus__persec__past_sx",
  "mh_p_ksads__psych__delus__past_sx",
  "mh_p_ksads__psych__halluc__adt__past_sx",
  "mh_p_ksads__psych__halluc__clust__past_sx",
  "mh_p_ksads__psych__halluc__oth__past_sx",
  "mh_p_ksads__psych__halluc__past_sx"
)

#' Compute "KSADS - Psychosis \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__psych__past__sx_mean`
#' KSADS - Psychosis \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__psych__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__psych__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__psych__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__psych__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__psych
#' @description
#' This function computes all summary scores for the mh_p_ksads__psych table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__psych_all <- function(data) {
  data |>
    compute_mh_p_ksads__psych__past__sx_mean() |>
    compute_mh_p_ksads__psych__pres__sx_mean()
}


# mh_p_ksads__ptsd ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ptsd__pres__sx_mean
#' @format vars_mh_p_ksads__ptsd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ptsd__pres__sx_mean`
vars_mh_p_ksads__ptsd__pres__sx <- c(
  "mh_p_ksads__ptsd__anhed__pres_sx",
  "mh_p_ksads__ptsd__avoid__extrmnd__pres_sx",
  "mh_p_ksads__ptsd__avoid__trmatho__pres_sx",
  "mh_p_ksads__ptsd__concprob__pres_sx",
  "mh_p_ksads__ptsd__depersnl__pres_sx",
  "mh_p_ksads__ptsd__derealztn__pres_sx",
  "mh_p_ksads__ptsd__detach__pres_sx",
  "mh_p_ksads__ptsd__distortcog__cause__pres_sx",
  "mh_p_ksads__ptsd__distortcog__consq__pres_sx",
  "mh_p_ksads__ptsd__emot__neg__pres_sx",
  "mh_p_ksads__ptsd__emot__nopos__pres_sx",
  "mh_p_ksads__ptsd__extrmnd__distrs__pres_sx",
  "mh_p_ksads__ptsd__flshbck__pres_sx",
  "mh_p_ksads__ptsd__hyprvigl__pres_sx",
  "mh_p_ksads__ptsd__intrmnd__distrs__pres_sx",
  "mh_p_ksads__ptsd__irrit__pres_sx",
  "mh_p_ksads__ptsd__memloss__pres_sx",
  "mh_p_ksads__ptsd__negblf__pres_sx",
  "mh_p_ksads__ptsd__nghtmr__pres_sx",
  "mh_p_ksads__ptsd__physreact__pres_sx",
  "mh_p_ksads__ptsd__rckls__pres_sx",
  "mh_p_ksads__ptsd__sleepdistb__pres_sx",
  "mh_p_ksads__ptsd__startle__pres_sx",
  "mh_p_ksads__ptsd__trmatho__intru__pres_sx"
)

#' Compute "KSADS - Post-Traumatic Stress Disorder \[Parent\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ptsd__pres__sx_mean`
#' KSADS - Post-Traumatic Stress Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 4 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ptsd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 4 of 24 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ptsd__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__ptsd__pres__sx_mean",
  max_na = 4,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ptsd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__ptsd__past__sx_mean
#' @format vars_mh_p_ksads__ptsd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__ptsd__past__sx_mean`
vars_mh_p_ksads__ptsd__past__sx <- c(
  "mh_p_ksads__ptsd__anhed__past_sx",
  "mh_p_ksads__ptsd__avoid__extrmnd__past_sx",
  "mh_p_ksads__ptsd__avoid__trmatho__past_sx",
  "mh_p_ksads__ptsd__concprob__past_sx",
  "mh_p_ksads__ptsd__depersnl__past_sx",
  "mh_p_ksads__ptsd__derealztn__past_sx",
  "mh_p_ksads__ptsd__detach__past_sx",
  "mh_p_ksads__ptsd__distortcog__cause__past_sx",
  "mh_p_ksads__ptsd__distortcog__consq__past_sx",
  "mh_p_ksads__ptsd__emot__neg__past_sx",
  "mh_p_ksads__ptsd__emot__nopos__past_sx",
  "mh_p_ksads__ptsd__extrmnd__distrs__past_sx",
  "mh_p_ksads__ptsd__flshbck__past_sx",
  "mh_p_ksads__ptsd__hyprvigl__past_sx",
  "mh_p_ksads__ptsd__intrmnd__distrs__past_sx",
  "mh_p_ksads__ptsd__irrit__past_sx",
  "mh_p_ksads__ptsd__memloss__past_sx",
  "mh_p_ksads__ptsd__negblf__past_sx",
  "mh_p_ksads__ptsd__nghtmr__past_sx",
  "mh_p_ksads__ptsd__physreact__past_sx",
  "mh_p_ksads__ptsd__rckls__past_sx",
  "mh_p_ksads__ptsd__sleepdistb__past_sx",
  "mh_p_ksads__ptsd__startle__past_sx",
  "mh_p_ksads__ptsd__trmatho__intru__past_sx"
)

#' Compute "KSADS - Post-Traumatic Stress Disorder \[Parent\] (Symptom - Past):
#' Mean"
#' @description
#' Computes the summary score `mh_p_ksads__ptsd__past__sx_mean`
#' KSADS - Post-Traumatic Stress Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 4 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__ptsd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 4 of 24 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__ptsd__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__ptsd__past__sx_mean",
  max_na = 4,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__ptsd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__ptsd
#' @description
#' This function computes all summary scores for the mh_p_ksads__ptsd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__ptsd_all <- function(data) {
  data |>
    compute_mh_p_ksads__ptsd__past__sx_mean() |>
    compute_mh_p_ksads__ptsd__pres__sx_mean()
}

# mh_p_ksads__sepanx ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__sepanx__pres__sx_mean
#' @format vars_mh_p_ksads__sepanx__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__sepanx__pres__sx_mean`
vars_mh_p_ksads__sepanx__pres__sx <- c(
  "mh_p_ksads__sepanx__evnt__fear__pres_sx",
  "mh_p_ksads__sepanx__fig__harm__pres_sx",
  "mh_p_ksads__sepanx__nghtmr__pres_sx",
  "mh_p_ksads__sepanx__nofig__fear__pres_sx",
  "mh_p_ksads__sepanx__nofig__physympt__pres_sx",
  "mh_p_ksads__sepanx__noschl__pres_sx",
  "mh_p_ksads__sepanx__nosleep__pres_sx",
  "mh_p_ksads__sepanx__sep__distrs__pres_sx"
)

#' Compute "KSADS - Separation Anxiety \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__sepanx__pres__sx_mean`
#' KSADS - Separation Anxiety \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__sepanx__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__sepanx__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__sepanx__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__sepanx__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__sepanx__past__sx_mean
#' @format vars_mh_p_ksads__sepanx__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__sepanx__past__sx_mean`
vars_mh_p_ksads__sepanx__past__sx <- c(
  "mh_p_ksads__sepanx__evnt__fear__past_sx",
  "mh_p_ksads__sepanx__fig__harm__past_sx",
  "mh_p_ksads__sepanx__nghtmr__past_sx",
  "mh_p_ksads__sepanx__nofig__fear__past_sx",
  "mh_p_ksads__sepanx__nofig__physympt__past_sx",
  "mh_p_ksads__sepanx__noschl__past_sx",
  "mh_p_ksads__sepanx__nosleep__past_sx",
  "mh_p_ksads__sepanx__sep__distrs__past_sx"
)

#' Compute "KSADS - Separation Anxiety \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__sepanx__past__sx_mean`
#' KSADS - Separation Anxiety \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__sepanx__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__sepanx__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__sepanx__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__sepanx__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__sepanx
#' @description
#' This function computes all summary scores for the mh_p_ksads__sepanx table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__sepanx_all <- function(data) {
  data |>
    compute_mh_p_ksads__sepanx__past__sx_mean() |>
    compute_mh_p_ksads__sepanx__pres__sx_mean()
}

# mh_p_ksads__sleep ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__sleep__pres__sx_mean
#' @format vars_mh_p_ksads__sleep__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__sleep__pres__sx_mean`
vars_mh_p_ksads__sleep__pres__sx <- c(
  "mh_p_ksads__sleep__insom__pres_sx"
)

#' Compute "KSADS - Sleep Problems \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__sleep__pres__sx_mean`
#' KSADS - Sleep Problems \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__sleep__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__sleep__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__sleep__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__sleep__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__sleep__past__sx_mean
#' @format vars_mh_p_ksads__sleep__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__sleep__past__sx_mean`
vars_mh_p_ksads__sleep__past__sx <- c(
  "mh_p_ksads__sleep__insom__past_sx"
)

#' Compute "KSADS - Sleep Problems \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__sleep__past__sx_mean`
#' KSADS - Sleep Problems \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__sleep__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__sleep__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__sleep__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__sleep__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__sleep
#' @description
#' This function computes all summary scores for the mh_p_ksads__sleep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__sleep_all <- function(data) {
  data |>
    compute_mh_p_ksads__sleep__past__sx_mean() |>
    compute_mh_p_ksads__sleep__pres__sx_mean()
}

# mh_p_ksads__socanx ---------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__socanx__pres__sx_mean
#' @format vars_mh_p_ksads__socanx__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__socanx__pres__sx_mean`
vars_mh_p_ksads__socanx__pres__sx <- c(
  "mh_p_ksads__socanx__anx__pres_sx",
  "mh_p_ksads__socanx__avoid__pres_sx",
  "mh_p_ksads__socanx__fear__pres_sx"
)

#' Compute "KSADS - Social Anxiety Disorder \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__socanx__pres__sx_mean`
#' KSADS - Social Anxiety Disorder \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__socanx__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__socanx__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__socanx__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__socanx__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__socanx__past__sx_mean
#' @format vars_mh_p_ksads__socanx__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__socanx__past__sx_mean`
vars_mh_p_ksads__socanx__past__sx <- c(
  "mh_p_ksads__socanx__anx__past_sx",
  "mh_p_ksads__socanx__avoid__past_sx",
  "mh_p_ksads__socanx__fear__past_sx"
)

#' Compute "KSADS - Social Anxiety Disorder \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__socanx__past__sx_mean`
#' KSADS - Social Anxiety Disorder \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__socanx__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__socanx__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__socanx__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__socanx__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__socanx
#' @description
#' This function computes all summary scores for the mh_p_ksads__socanx table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__socanx_all <- function(data) {
  data |>
    compute_mh_p_ksads__socanx__past__sx_mean() |>
    compute_mh_p_ksads__socanx__pres__sx_mean()
}

# mh_p_ksads__suic -----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__suic__pres__sx_mean
#' @format vars_mh_p_ksads__suic__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__suic__pres__sx_mean`
vars_mh_p_ksads__suic__pres__sx <- c(
  "mh_p_ksads__suic__slfinj__pres_sx",
  "mh_p_ksads__suic__slfinj__nointnt__pres_sx",
  "mh_p_ksads__suic__slfinj__intnt__pres_sx",
  "mh_p_ksads__suic__slfinj__psbldie__pres_sx",
  "mh_p_ksads__suic__idea__pres_sx",
  "mh_p_ksads__suic__intnt__pres_sx",
  "mh_p_ksads__suic__mthd__pres_sx",
  "mh_p_ksads__suic__plan__pres_sx",
  "mh_p_ksads__suic__prep__pres_sx",
  "mh_p_ksads__suic__attmpt__pres_sx",
  "mh_p_ksads__suic__attmpt__intrpt__pres_sx",
  "mh_p_ksads__suic__attmpt__psbldie__pres_sx",
  "mh_p_ksads__suic__wishdead__pres_sx"
)

#' Compute "KSADS - Suicidality \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__suic__pres__sx_mean`
#' KSADS - Suicidality \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__suic__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 13 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__suic__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__suic__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__suic__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__suic__past__sx_mean
#' @format vars_mh_p_ksads__suic__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__suic__past__sx_mean`
vars_mh_p_ksads__suic__past__sx <- c(
  "mh_p_ksads__suic__slfinj__past_sx",
  "mh_p_ksads__suic__slfinj__nointnt__past_sx",
  "mh_p_ksads__suic__slfinj__intnt__past_sx",
  "mh_p_ksads__suic__slfinj__psbldie__past_sx",
  "mh_p_ksads__suic__idea__past_sx",
  "mh_p_ksads__suic__intnt__past_sx",
  "mh_p_ksads__suic__mthd__past_sx",
  "mh_p_ksads__suic__plan__past_sx",
  "mh_p_ksads__suic__prep__past_sx",
  "mh_p_ksads__suic__attmpt__past_sx",
  "mh_p_ksads__suic__attmpt__intrpt__past_sx",
  "mh_p_ksads__suic__attmpt__psbldie__past_sx",
  "mh_p_ksads__suic__wishdead__past_sx"
)

#' Compute "KSADS - Suicidality \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__suic__past__sx_mean`
#' KSADS - Suicidality \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__suic__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 13 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__suic__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__suic__past__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__suic__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__suic
#' @description
#' This function computes all summary scores for the mh_p_ksads__suic table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__suic_all <- function(data) {
  data |>
    compute_mh_p_ksads__suic__past__sx_mean() |>
    compute_mh_p_ksads__suic__pres__sx_mean()
}

# mh_p_ksads__tic ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__tic__pres__sx_mean
#' @format vars_mh_p_ksads__tic__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__tic__pres__sx_mean`
vars_mh_p_ksads__tic__pres__sx <- c(
  "mh_p_ksads__tic__mtr__pres_sx",
  "mh_p_ksads__tic__phnc__pres_sx"
)

#' Compute "KSADS - Tic Disorders \[Parent\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__tic__pres__sx_mean`
#' KSADS - Tic Disorders \[Parent\] (Symptom - Present): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__tic__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__tic__pres__sx_mean <- function(
  data,
  name = "mh_p_ksads__tic__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__tic__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_p_ksads__tic__past__sx_mean
#' @format vars_mh_p_ksads__tic__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_p_ksads__tic__past__sx_mean`
vars_mh_p_ksads__tic__past__sx <- c(
  "mh_p_ksads__tic__mtr__past_sx",
  "mh_p_ksads__tic__phnc__past_sx"
)

#' Compute "KSADS - Tic Disorders \[Parent\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_p_ksads__tic__past__sx_mean`
#' KSADS - Tic Disorders \[Parent\] (Symptom - Past): Mean
#' \[validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_ksads__tic__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 2 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_p_ksads__tic__past__sx_mean <- function(
  data,
  name = "mh_p_ksads__tic__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_p_ksads__tic__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_p_ksads__tic
#' @description
#' This function computes all summary scores for the mh_p_ksads__tic table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_p_ksads__tic_all <- function(data) {
  data |>
    compute_mh_p_ksads__tic__past__sx_mean() |>
    compute_mh_p_ksads__tic__pres__sx_mean()
}


# mh_y_ksads__bpd --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__bpd__pres__sx_mean
#' @format vars_mh_y_ksads__bpd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__bpd__pres__sx_mean`
vars_mh_y_ksads__bpd__pres__sx <- c(
  "mh_y_ksads__bpd__distract__incr__pres_sx",
  "mh_y_ksads__bpd__distract__pres_sx",
  "mh_y_ksads__bpd__enrg__incr__pres_sx",
  "mh_y_ksads__bpd__flgtid__pres_sx",
  "mh_y_ksads__bpd__goaldir__incr__pres_sx",
  "mh_y_ksads__bpd__grndios__pres_sx",
  "mh_y_ksads__bpd__hyprsex__pres_sx",
  "mh_y_ksads__bpd__irrit__expl__pres_sx",
  "mh_y_ksads__bpd__irrit__manic__pres_sx",
  "mh_y_ksads__bpd__mood__elv__pres_sx",
  "mh_y_ksads__bpd__mood__euph__pres_sx",
  "mh_y_ksads__bpd__prspch__pres_sx",
  "mh_y_ksads__bpd__psymot__agit__pres_sx",
  "mh_y_ksads__bpd__ractho__pres_sx",
  "mh_y_ksads__bpd__riskactv__pres_sx",
  "mh_y_ksads__bpd__slpdecr__pres_sx"
)

#' Compute "KSADS - Bipolar Disorders \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__bpd__pres__sx_mean`
#' KSADS - Bipolar Disorders \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__bpd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 16 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__bpd__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__bpd__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__bpd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__bpd__past__sx_mean
#' @format vars_mh_y_ksads__bpd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__bpd__past__sx_mean`
vars_mh_y_ksads__bpd__past__sx <- c(
  "mh_y_ksads__bpd__distract__incr__past_sx",
  "mh_y_ksads__bpd__distract__past_sx",
  "mh_y_ksads__bpd__enrg__incr__past_sx",
  "mh_y_ksads__bpd__flgtid__past_sx",
  "mh_y_ksads__bpd__goaldir__incr__past_sx",
  "mh_y_ksads__bpd__grndios__past_sx",
  "mh_y_ksads__bpd__hyprsex__past_sx",
  "mh_y_ksads__bpd__irrit__expl__past_sx",
  "mh_y_ksads__bpd__irrit__manic__past_sx",
  "mh_y_ksads__bpd__mood__elv__past_sx",
  "mh_y_ksads__bpd__mood__euph__past_sx",
  "mh_y_ksads__bpd__prspch__past_sx",
  "mh_y_ksads__bpd__psymot__agit__past_sx",
  "mh_y_ksads__bpd__ractho__past_sx",
  "mh_y_ksads__bpd__riskactv__past_sx",
  "mh_y_ksads__bpd__slpdecr__past_sx"
)

#' Compute "KSADS - Bipolar Disorders \[Youth\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_y_ksads__bpd__past__sx_mean`
#' KSADS - Bipolar Disorders \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__bpd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 16 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__bpd__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__bpd__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__bpd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__bpd
#' @description
#' This function computes all summary scores for the mh_y_ksads__bpd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__bpd_all <- function(data) {
  data |>
    compute_mh_y_ksads__bpd__past__sx_mean() |>
    compute_mh_y_ksads__bpd__pres__sx_mean()
}

# mh_y_ksads__cond -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__cond__pres__sx_mean
#' @format vars_mh_y_ksads__cond__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__cond__pres__sx_mean`
vars_mh_y_ksads__cond__pres__sx <- c(
  "mh_y_ksads__cond__breakin__pres_sx",
  "mh_y_ksads__cond__bully__pres_sx",
  "mh_y_ksads__cond__fight__pres_sx",
  "mh_y_ksads__cond__fire__pres_sx",
  "mh_y_ksads__cond__lies__pres_sx",
  "mh_y_ksads__cond__outlate__pres_sx",
  "mh_y_ksads__cond__physcruel__anml__pres_sx",
  "mh_y_ksads__cond__physcruel__ppl__pres_sx",
  "mh_y_ksads__cond__rob__pres_sx",
  "mh_y_ksads__cond__runaway__pres_sx",
  "mh_y_ksads__cond__steal__pres_sx",
  "mh_y_ksads__cond__truant__pres_sx",
  "mh_y_ksads__cond__vandal__pres_sx",
  "mh_y_ksads__cond__weapon__pres_sx"
)

#' Compute "KSADS - Conduct Disorder \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__cond__pres__sx_mean`
#' KSADS - Conduct Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__cond__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 14 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__cond__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__cond__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__cond__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__cond__past__sx_mean
#' @format vars_mh_y_ksads__cond__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__cond__past__sx_mean`
vars_mh_y_ksads__cond__past__sx <- c(
  "mh_y_ksads__cond__breakin__past_sx",
  "mh_y_ksads__cond__bully__past_sx",
  "mh_y_ksads__cond__fight__past_sx",
  "mh_y_ksads__cond__fire__past_sx",
  "mh_y_ksads__cond__lies__past_sx",
  "mh_y_ksads__cond__outlate__past_sx",
  "mh_y_ksads__cond__physcruel__anml__past_sx",
  "mh_y_ksads__cond__physcruel__ppl__past_sx",
  "mh_y_ksads__cond__rob__past_sx",
  "mh_y_ksads__cond__runaway__past_sx",
  "mh_y_ksads__cond__steal__past_sx",
  "mh_y_ksads__cond__truant__past_sx",
  "mh_y_ksads__cond__vandal__past_sx",
  "mh_y_ksads__cond__weapon__past_sx"
)

#' Compute "KSADS - Conduct Disorder \[Youth\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_y_ksads__cond__past__sx_mean`
#' KSADS - Conduct Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__cond__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 14 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__cond__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__cond__past__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__cond__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__cond
#' @description
#' This function computes all summary scores for the mh_y_ksads__cond table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__cond_all <- function(data) {
  data |>
    compute_mh_y_ksads__cond__past__sx_mean() |>
    compute_mh_y_ksads__cond__pres__sx_mean()
}

# mh_y_ksads__dep --------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__dep__pres__sx_mean
#' @format vars_mh_y_ksads__dep__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__dep__pres__sx_mean`
vars_mh_y_ksads__dep__pres__sx <- c(
  "mh_y_ksads__dep__anhed__pres_sx",
  "mh_y_ksads__dep__appdecr__pres_sx",
  "mh_y_ksads__dep__conc__pres_sx",
  "mh_y_ksads__dep__fatig__pres_sx",
  "mh_y_ksads__dep__glt__pres_sx",
  "mh_y_ksads__dep__hplss__pres_sx",
  "mh_y_ksads__dep__hyprsom__pres_sx",
  "mh_y_ksads__dep__incapp__pres_sx",
  "mh_y_ksads__dep__indec__pres_sx",
  "mh_y_ksads__dep__irrit__pres_sx",
  "mh_y_ksads__dep__mood__pres_sx",
  "mh_y_ksads__dep__psymot__agit__pres_sx",
  "mh_y_ksads__dep__psymot__rtrd__pres_sx",
  "mh_y_ksads__dep__slfestmdecr__pres_sx",
  "mh_y_ksads__dep__wghtgain__pres_sx",
  "mh_y_ksads__dep__wghtloss__pres_sx"
)

#' Compute "KSADS - Depressive Disorders \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__dep__pres__sx_mean`
#' KSADS - Depressive Disorders \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__dep__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 17 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__dep__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__dep__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__dep__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__dep__past__sx_mean
#' @format vars_mh_y_ksads__dep__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__dep__past__sx_mean`
vars_mh_y_ksads__dep__past__sx <- c(
  "mh_y_ksads__dep__anhed__past_sx",
  "mh_y_ksads__dep__appdecr__past_sx",
  "mh_y_ksads__dep__conc__past_sx",
  "mh_y_ksads__dep__fatig__past_sx",
  "mh_y_ksads__dep__glt__past_sx",
  "mh_y_ksads__dep__hplss__past_sx",
  "mh_y_ksads__dep__hyprsom__past_sx",
  "mh_y_ksads__dep__incapp__past_sx",
  "mh_y_ksads__dep__indec__past_sx",
  "mh_y_ksads__dep__insom__past_sx",
  "mh_y_ksads__dep__irrit__past_sx",
  "mh_y_ksads__dep__mood__past_sx",
  "mh_y_ksads__dep__psymot__agit__past_sx",
  "mh_y_ksads__dep__psymot__rtrd__past_sx",
  "mh_y_ksads__dep__slfestmdecr__past_sx",
  "mh_y_ksads__dep__wghtgain__past_sx",
  "mh_y_ksads__dep__wghtloss__past_sx"
)

#' Compute "KSADS - Depressive Disorders \[Youth\] (Symptom - Past): Mean "
#' @description
#' Computes the summary score `mh_y_ksads__dep__past__sx_mean`
#' KSADS - Depressive Disorders \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 3 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__dep__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 3 of 17 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__dep__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__dep__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__dep__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__dep
#' @description
#' This function computes all summary scores for the mh_y_ksads__dep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__dep_all <- function(data) {
  data |>
    compute_mh_y_ksads__dep__past__sx_mean() |>
    compute_mh_y_ksads__dep__pres__sx_mean()
}

# mh_y_ksads__dmdd ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__dmdd__sx_mean
#' @format vars_mh_y_ksads__dmdd__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__dmdd__sx_mean`
vars_mh_y_ksads__dmdd__sx <- c(
  "mh_y_ksads__dmdd__outbrst__3perwk_sx"
)

#' Compute "KSADS - Disruptive Mood Dysregulation Disorder \[Youth\] (Symptom):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__dmdd__sx_mean`
#' KSADS - Disruptive Mood Dysregulation Disorder \[Youth\] (Symptom): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__dmdd__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__dmdd__sx_mean <- function(
  data,
  name = "mh_y_ksads__dmdd__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__dmdd__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__dep
#' @description
#' This function computes all summary scores for the mh_y_ksads__dep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__dmdd_all <- function(data) {
  data |>
    compute_mh_y_ksads__dmdd__sx_mean()
}

# mh_y_ksads__ed ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ed__pres__sx_mean
#' @format vars_mh_y_ksads__ed__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ed__pres__sx_mean`
vars_mh_y_ksads__ed__pres__sx <- c(
  "mh_y_ksads__ed__binge__distrs__pres_sx",
  "mh_y_ksads__ed__binge__pres_sx",
  "mh_y_ksads__ed__compbehav__pres_sx",
  "mh_y_ksads__ed__emac__pres_sx",
  "mh_y_ksads__ed__fear__obese__pres_sx",
  "mh_y_ksads__ed__slfwrth__pres_sx",
  "mh_y_ksads__ed__wghtcntrl__oth__pres_sx",
  "mh_y_ksads__ed__wghtcntrl__vom__pres_sx"
)

#' Compute "KSADS - Eating Disorders \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ed__pres__sx_mean`
#' KSADS - Eating Disorders \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ed__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ed__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__ed__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ed__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ed__past__sx_mean
#' @format vars_mh_y_ksads__ed__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ed__past__sx_mean`
vars_mh_y_ksads__ed__past__sx <- c(
  "mh_y_ksads__ed__binge__distrs__past_sx",
  "mh_y_ksads__ed__binge__past_sx",
  "mh_y_ksads__ed__compbehav__past_sx",
  "mh_y_ksads__ed__emac__past_sx",
  "mh_y_ksads__ed__fear__obese__past_sx",
  "mh_y_ksads__ed__slfwrth__past_sx",
  "mh_y_ksads__ed__wghtcntrl__oth__past_sx",
  "mh_y_ksads__ed__wghtcntrl__vom__past_sx"
)

#' Compute "KSADS - Eating Disorders \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ed__past__sx_mean`
#' KSADS - Eating Disorders \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ed__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 8 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ed__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__ed__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ed__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__ed
#' @description
#' This function computes all summary scores for the mh_y_ksads__ed table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__ed_all <- function(data) {
  data |>
    compute_mh_y_ksads__ed__past__sx_mean() |>
    compute_mh_y_ksads__ed__pres__sx_mean()
}


# mh_y_ksads__gad -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__gad__pres__sx_mean
#' @format vars_mh_y_ksads__gad__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__gad__pres__sx_mean`
vars_mh_y_ksads__gad__pres__sx <- c(
  "mh_y_ksads__gad__worry__6mo__pres_sx",
  "mh_y_ksads__gad__worry__diffctrl__pres_sx",
  "mh_y_ksads__gad__worry__excess__pres_sx",
  "mh_y_ksads__gad__worry__multi__pres_sx"
)

#' Compute "KSADS - Generalized Anxiety Disorder \[Youth\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__gad__pres__sx_mean`
#' KSADS - Generalized Anxiety Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__gad__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__gad__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__gad__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__gad__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__gad__past__sx_mean
#' @format vars_mh_y_ksads__gad__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__gad__past__sx_mean`
vars_mh_y_ksads__gad__past__sx <- c(
  "mh_y_ksads__gad__worry__6mo__past_sx",
  "mh_y_ksads__gad__worry__diffctrl__past_sx",
  "mh_y_ksads__gad__worry__excess__past_sx",
  "mh_y_ksads__gad__worry__multi__past_sx"
)

#' Compute "KSADS - Generalized Anxiety Disorder \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__gad__past__sx_mean`
#' KSADS - Generalized Anxiety Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__gad__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__gad__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__gad__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__gad__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__gad
#' @description
#' This function computes all summary scores for the mh_y_ksads__gad table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__gad_all <- function(data) {
  data |>
    compute_mh_y_ksads__gad__past__sx_mean() |>
    compute_mh_y_ksads__gad__pres__sx_mean()
}

# mh_y_ksads__ocd -------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ocd__pres__sx_mean
#' @format vars_mh_y_ksads__ocd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ocd__pres__sx_mean`
vars_mh_y_ksads__ocd__pres__sx <- c(
  "mh_y_ksads__ocd__compuls__pres_sx",
  "mh_y_ksads__ocd__compuls__prvntanx__pres_sx",
  "mh_y_ksads__ocd__compuls__tcnsm__pres_sx",
  "mh_y_ksads__ocd__obsess__intru__pres_sx",
  "mh_y_ksads__ocd__obsess__pres_sx",
  "mh_y_ksads__ocd__obsess__tcnsm__pres_sx",
  "mh_y_ksads__ocd__suprstho__pres_sx"
)

#' Compute "KSADS - Obsessive Compulsive Disorder \[Youth\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ocd__pres__sx_mean`
#' KSADS - Obsessive Compulsive Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ocd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ocd__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__ocd__pres__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ocd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ocd__past__sx_mean
#' @format vars_mh_y_ksads__ocd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ocd__past__sx_mean`
vars_mh_y_ksads__ocd__past__sx <- c(
  "mh_y_ksads__ocd__compuls__past_sx",
  "mh_y_ksads__ocd__compuls__prvntanx__past_sx",
  "mh_y_ksads__ocd__compuls__tcnsm__past_sx",
  "mh_y_ksads__ocd__obsess__intru__past_sx",
  "mh_y_ksads__ocd__obsess__past_sx",
  "mh_y_ksads__ocd__obsess__tcnsm__past_sx",
  "mh_y_ksads__ocd__suprstho__past_sx"
)

#' Compute "KSADS - Obsessive Compulsive Disorder \[Youth\] (Symptom - Past):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ocd__past__sx_mean`
#' KSADS - Obsessive Compulsive Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 1 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ocd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 1 of 7 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ocd__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__ocd__past__sx_mean",
  max_na = 1,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ocd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__ocd
#' @description
#' This function computes all summary scores for the mh_y_ksads__ocd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__ocd_all <- function(data) {
  data |>
    compute_mh_y_ksads__ocd__past__sx_mean() |>
    compute_mh_y_ksads__ocd__pres__sx_mean()
}

# mh_y_ksads__panic -----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__panic__pres__sx_mean
#' @format vars_mh_y_ksads__panic__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__panic__pres__sx_mean`
vars_mh_y_ksads__panic__pres__sx <- c(
  "mh_y_ksads__panic__attack__maladp__pres_sx",
  "mh_y_ksads__panic__attack__pres_sx",
  "mh_y_ksads__panic__sympt__pres_sx",
  "mh_y_ksads__panic__worry__attack__pres_sx"
)

#' Compute "KSADS - Panic Disorder \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__panic__pres__sx_mean`
#' KSADS - Panic Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__panic__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__panic__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__panic__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__panic__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__panic__past__sx_mean
#' @format vars_mh_y_ksads__panic__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__panic__past__sx_mean`
vars_mh_y_ksads__panic__past__sx <- c(
  "mh_y_ksads__panic__attack__maladp__past_sx",
  "mh_y_ksads__panic__attack__past_sx",
  "mh_y_ksads__panic__sympt__past_sx",
  "mh_y_ksads__panic__worry__attack__past_sx"
)

#' Compute "KSADS - Panic Disorder \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__panic__past__sx_mean`
#' KSADS - Panic Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__panic__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__panic__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__panic__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__panic__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__panic
#' @description
#' This function computes all summary scores for the mh_y_ksads__panic table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__panic_all <- function(data) {
  data |>
    compute_mh_y_ksads__panic__past__sx_mean() |>
    compute_mh_y_ksads__panic__pres__sx_mean()
}

# mh_y_ksads__ptsd ------------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ptsd__pres__sx_mean
#' @format vars_mh_y_ksads__ptsd__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ptsd__pres__sx_mean`
vars_mh_y_ksads__ptsd__pres__sx <- c(
  "mh_y_ksads__ptsd__anhed__pres_sx",
  "mh_y_ksads__ptsd__avoid__extrmnd__pres_sx",
  "mh_y_ksads__ptsd__avoid__trmatho__pres_sx",
  "mh_y_ksads__ptsd__concprob__pres_sx",
  "mh_y_ksads__ptsd__depersnl__pres_sx",
  "mh_y_ksads__ptsd__derealztn__pres_sx",
  "mh_y_ksads__ptsd__detach__pres_sx",
  "mh_y_ksads__ptsd__distortcog__cause__pres_sx",
  "mh_y_ksads__ptsd__distortcog__consq__pres_sx",
  "mh_y_ksads__ptsd__emot__neg__pres_sx",
  "mh_y_ksads__ptsd__emot__nopos__pres_sx",
  "mh_y_ksads__ptsd__extrmnd__distrs__pres_sx",
  "mh_y_ksads__ptsd__flshbck__pres_sx",
  "mh_y_ksads__ptsd__hyprvigl__pres_sx",
  "mh_y_ksads__ptsd__intrmnd__distrs__pres_sx",
  "mh_y_ksads__ptsd__irrit__pres_sx",
  "mh_y_ksads__ptsd__memloss__pres_sx",
  "mh_y_ksads__ptsd__negblf__pres_sx",
  "mh_y_ksads__ptsd__nghtmr__pres_sx",
  "mh_y_ksads__ptsd__physreact__pres_sx",
  "mh_y_ksads__ptsd__rckls__pres_sx",
  "mh_y_ksads__ptsd__sleepdistb__pres_sx",
  "mh_y_ksads__ptsd__startle__pres_sx",
  "mh_y_ksads__ptsd__trmatho__intru__pres_sx"
)

#' Compute "KSADS - Post-Traumatic Stress Disorder \[Youth\] (Symptom - Present):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ptsd__pres__sx_mean`
#' KSADS - Post-Traumatic Stress Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 4 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ptsd__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 4 of 24 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ptsd__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__ptsd__pres__sx_mean",
  max_na = 4,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ptsd__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__ptsd__past__sx_mean
#' @format vars_mh_y_ksads__ptsd__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__ptsd__past__sx_mean`
vars_mh_y_ksads__ptsd__past__sx <- c(
  "mh_y_ksads__ptsd__anhed__past_sx",
  "mh_y_ksads__ptsd__avoid__extrmnd__past_sx",
  "mh_y_ksads__ptsd__avoid__trmatho__past_sx",
  "mh_y_ksads__ptsd__concprob__past_sx",
  "mh_y_ksads__ptsd__depersnl__past_sx",
  "mh_y_ksads__ptsd__derealztn__past_sx",
  "mh_y_ksads__ptsd__detach__past_sx",
  "mh_y_ksads__ptsd__distortcog__cause__past_sx",
  "mh_y_ksads__ptsd__distortcog__consq__past_sx",
  "mh_y_ksads__ptsd__emot__neg__past_sx",
  "mh_y_ksads__ptsd__emot__nopos__past_sx",
  "mh_y_ksads__ptsd__extrmnd__distrs__past_sx",
  "mh_y_ksads__ptsd__flshbck__past_sx",
  "mh_y_ksads__ptsd__hyprvigl__past_sx",
  "mh_y_ksads__ptsd__intrmnd__distrs__past_sx",
  "mh_y_ksads__ptsd__irrit__past_sx",
  "mh_y_ksads__ptsd__memloss__past_sx",
  "mh_y_ksads__ptsd__negblf__past_sx",
  "mh_y_ksads__ptsd__nghtmr__past_sx",
  "mh_y_ksads__ptsd__physreact__past_sx",
  "mh_y_ksads__ptsd__rckls__past_sx",
  "mh_y_ksads__ptsd__sleepdistb__past_sx",
  "mh_y_ksads__ptsd__startle__past_sx",
  "mh_y_ksads__ptsd__trmatho__intru__past_sx"
)

#' Compute "KSADS - Post-Traumatic Stress Disorder \[Youth\] (Symptom - Past):
#' Mean"
#' @description
#' Computes the summary score `mh_y_ksads__ptsd__past__sx_mean`
#' KSADS - Post-Traumatic Stress Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 4 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__ptsd__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 4 of 24 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__ptsd__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__ptsd__past__sx_mean",
  max_na = 4,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__ptsd__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__ptsd
#' @description
#' This function computes all summary scores for the mh_y_ksads__ptsd table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__ptsd_all <- function(data) {
  data |>
    compute_mh_y_ksads__ptsd__past__sx_mean() |>
    compute_mh_y_ksads__ptsd__pres__sx_mean()
}

# mh_y_ksads__sleep ----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__sleep__pres__sx_mean
#' @format vars_mh_y_ksads__sleep__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__sleep__pres__sx_mean`
vars_mh_y_ksads__sleep__pres__sx <- c(
  "mh_y_ksads__sleep__insom__pres_sx"
)

#' Compute "KSADS - Sleep Problems \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__sleep__pres__sx_mean`
#' KSADS - Sleep Problems \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__sleep__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__sleep__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__sleep__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__sleep__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__sleep__past__sx_mean
#' @format vars_mh_y_ksads__sleep__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__sleep__past__sx_mean`
vars_mh_y_ksads__sleep__past__sx <- c(
  "mh_y_ksads__sleep__insom__past_sx"
)

#' Compute "KSADS - Sleep Problems \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__sleep__past__sx_mean`
#' KSADS - Sleep Problems \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__sleep__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__sleep__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__sleep__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__sleep__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__sleep
#' @description
#' This function computes all summary scores for the mh_y_ksads__sleep table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__sleep_all <- function(data) {
  data |>
    compute_mh_y_ksads__sleep__past__sx_mean() |>
    compute_mh_y_ksads__sleep__pres__sx_mean()
}

# mh_y_ksads__socanx ---------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__socanx__pres__sx_mean
#' @format vars_mh_y_ksads__socanx__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__socanx__pres__sx_mean`
vars_mh_y_ksads__socanx__pres__sx <- c(
  "mh_y_ksads__socanx__anx__pres_sx",
  "mh_y_ksads__socanx__avoid__pres_sx",
  "mh_y_ksads__socanx__fear__pres_sx"
)

#' Compute "KSADS - Social Anxiety Disorder \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__socanx__pres__sx_mean`
#' KSADS - Social Anxiety Disorder \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__socanx__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__socanx__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__socanx__pres__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__socanx__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__socanx__past__sx_mean
#' @format vars_mh_y_ksads__socanx__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__socanx__past__sx_mean`
vars_mh_y_ksads__socanx__past__sx <- c(
  "mh_y_ksads__socanx__anx__past_sx",
  "mh_y_ksads__socanx__avoid__past_sx",
  "mh_y_ksads__socanx__fear__past_sx"
)

#' Compute "KSADS - Social Anxiety Disorder \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__socanx__past__sx_mean`
#' KSADS - Social Anxiety Disorder \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 0 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__socanx__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__socanx__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__socanx__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__socanx__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__socanx
#' @description
#' This function computes all summary scores for the mh_y_ksads__socanx table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__socanx_all <- function(data) {
  data |>
    compute_mh_y_ksads__socanx__past__sx_mean() |>
    compute_mh_y_ksads__socanx__pres__sx_mean()
}

# mh_y_ksads__suic -----------------------------------------------------

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__suic__pres__sx_mean
#' @format vars_mh_y_ksads__suic__pres__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__suic__pres__sx_mean`
vars_mh_y_ksads__suic__pres__sx <- c(
  "mh_y_ksads__suic__slfinj__pres_sx",
  "mh_y_ksads__suic__slfinj__nointnt__pres_sx",
  "mh_y_ksads__suic__slfinj__intnt__pres_sx",
  "mh_y_ksads__suic__slfinj__psbldie__pres_sx",
  "mh_y_ksads__suic__idea__pres_sx",
  "mh_y_ksads__suic__intnt__pres_sx",
  "mh_y_ksads__suic__mthd__pres_sx",
  "mh_y_ksads__suic__plan__pres_sx",
  "mh_y_ksads__suic__prep__pres_sx",
  "mh_y_ksads__suic__attmpt__pres_sx",
  "mh_y_ksads__suic__attmpt__intrpt__pres_sx",
  "mh_y_ksads__suic__attmpt__psbldie__pres_sx",
  "mh_y_ksads__suic__wishdead__pres_sx"
)

#' Compute "KSADS - Suicidality \[Youth\] (Symptom - Present): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__suic__pres__sx_mean`
#' KSADS - Suicidality \[Youth\] (Symptom - Present): Mean
#' \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__suic__pres__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 13 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__suic__pres__sx_mean <- function(
  data,
  name = "mh_y_ksads__suic__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__suic__pres__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' @export
#' @autoglobal
#' @rdname compute_mh_y_ksads__suic__past__sx_mean
#' @format vars_mh_y_ksads__suic__past__sx is a character vector
#' of all column names used to compute summary score of
#' `mh_y_ksads__suic__past__sx_mean`
vars_mh_y_ksads__suic__past__sx <- c(
  "mh_y_ksads__suic__slfinj__past_sx",
  "mh_y_ksads__suic__slfinj__nointnt__past_sx",
  "mh_y_ksads__suic__slfinj__intnt__past_sx",
  "mh_y_ksads__suic__slfinj__psbldie__past_sx",
  "mh_y_ksads__suic__idea__past_sx",
  "mh_y_ksads__suic__intnt__past_sx",
  "mh_y_ksads__suic__mthd__past_sx",
  "mh_y_ksads__suic__plan__past_sx",
  "mh_y_ksads__suic__prep__past_sx",
  "mh_y_ksads__suic__attmpt__past_sx",
  "mh_y_ksads__suic__attmpt__intrpt__past_sx",
  "mh_y_ksads__suic__attmpt__psbldie__past_sx",
  "mh_y_ksads__suic__wishdead__past_sx"
)

#' Compute "KSADS - Suicidality \[Youth\] (Symptom - Past): Mean"
#' @description
#' Computes the summary score `mh_y_ksads__suic__past__sx_mean`
#' KSADS - Suicidality \[Youth\] (Symptom - Past): Mean
#' \[Validation: No more than 2 missing or declined\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ksads__suic__past__sx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 555
#'
#' - *Validation criterion:* maximally 2 of 13 items missing
#'
#' @inherit ss_mean_ksads params return details
#' @export
#' @autoglobal
compute_mh_y_ksads__suic__past__sx_mean <- function(
  data,
  name = "mh_y_ksads__suic__past__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
) {
  check_col_names(data, name)

  data |>
    ss_mean_ksads(
      name    = name,
      vars    = vars_mh_y_ksads__suic__past__sx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}

#' Compute all summary scores for mh_y_ksads__suic
#' @description
#' This function computes all summary scores for the mh_y_ksads__suic table.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary scores appended as new columns.
#' @export
#' @autoglobal
compute_mh_y_ksads__suic_all <- function(data) {
  data |>
    compute_mh_y_ksads__suic__past__sx_mean() |>
    compute_mh_y_ksads__suic__pres__sx_mean()
}
