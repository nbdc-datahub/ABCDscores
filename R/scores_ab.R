#   ____________________________________________________________________________
#   Race / Ethnicity                                                        ####

##  ............................................................................
##  ab_g_stc__cohort_ethnrace__meim                                         ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_ethnrace__meim
#' @format a character vector of all
#' column names used to compute summary score of
#' `ab_g_stc__cohort_ethnrace__meim`.
#'
vars_ab_g_stc__cohort_ethnrace__meim <- c(
  "fc_p_meim_001"
)

#' Compute "Cohort description: Ethno-racial identity (15 level classification
#' from fc_p_meim_001) \[Based on baseline response; missingness filled in from
#' longitudinal responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_ethnrace__meim`
#' Cohort description: Ethno-racial identity (15 level classification from
#' fc_p_meim_001) \[Based on baseline response; missingness filled in from
#' longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_stc__cohort_ethnrace__meim |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character, Name of the new column to be created. Default is
#'    the name in description, but users can change it.
#' @param combine logical, If `TRUE`, the summary score will be appended to
#'    the input data frame. If `FALSE`, the summary score for each participant
#'    will be returned as a separate data frame. (Default: FALSE)
#' @param exclude character vector. Values to be excluded from the summary
#'    score calculation.
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_ethnrace__meim <- function(
    data,
    name = "ab_g_stc__cohort_ethnrace__meim",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_stc__cohort_ethnrace__meim)

  data_ss <- data |>
    make_static(
      var_in  = "fc_p_meim_001",
      var_out = name,
      exclude = exclude
    ) |>
    mutate(
      across(name, ~ as.character(.x))
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

##  ............................................................................
##  ab_g_stc__cohort_ethn                                                   ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_ethn
#' @format a character vector of all column names
#' used to compute summary score of `ab_g_stc__cohort_ethn`.
vars_ab_g_stc__cohort_ethn <- c(
  "ab_p_demo__ethn_001",
  "ab_p_demo__ethn_001__v01"
)

#' Compute "Cohort description: Ethnicity (Hispanic or not Hispanic) \[Based on
#' baseline response; missingness filled in from longitudinal responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_ethn`
#' Cohort description: Ethnicity (Hispanic or not Hispanic) \[Based on
#' baseline response; missingness filled in from longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_stc__cohort_ethn |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' - *Notes:*
#'   - Values in `ab_p_demo__ethn_001__v01` were recoded:
#'      - "0" --> "2",
#'      - "2" --> "1"
#'      - "3" --> "1"
#'      - "4" --> "1"
#'   - Values in `ab_p_demo__ethn_001` were recoded:
#'      - "0" --> "2"
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_ethn <- function(
    data,
    name = "ab_g_stc__cohort_ethn",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_stc__cohort_ethn)

  tmp_dat <- data |>
    mutate(
      across(
        all_of(vars_ab_g_stc__cohort_ethn),
        ~ as.character(.x)
      )
    ) |>
    recode_levels(
      vars = "ab_p_demo__ethn_001__v01",
      recode = c(
        "0"   = "2",
        "2"   = "1",
        "3"   = "1",
        "4"   = "1"
      )
    ) |>
    recode_levels(
      vars = "ab_p_demo__ethn_001",
      recode = c(
        "0" = "2"
      )
    ) |>
    combine_cols(
      col_1 = "ab_p_demo__ethn_001",
      col_2 = "ab_p_demo__ethn_001__v01"
    )

  data_ss <- tmp_dat |>
    make_static(
      var_in  = "ab_p_demo__ethn_001",
      var_out = name,
      exclude = exclude
    ) |>
    mutate(
      across(name, ~ as.character(.x))
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

##  ............................................................................
##  ab_g_stc__cohort_race__nih                                              ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_race__nih
#' @format a tibble of all column names, baseline and longitudinal,
#' used to compute summary score of `ab_g_stc__cohort_race__nih`.
vars_ab_g_stc__cohort_race__nih <- tibble::tribble(
  ~baseline_choice, ~longitudinal_choice,
  "ab_p_demo__race_001___0", "ab_p_demo__race_001__v01___999",
  "ab_p_demo__race_001___10", "ab_p_demo__race_001__v01___10",
  "ab_p_demo__race_001___11", "ab_p_demo__race_001__v01___11",
  "ab_p_demo__race_001___12", "ab_p_demo__race_001__v01___12",
  "ab_p_demo__race_001___13", "ab_p_demo__race_001__v01___12",
  "ab_p_demo__race_001___14", "ab_p_demo__race_001__v01___20",
  "ab_p_demo__race_001___15", "ab_p_demo__race_001__v01___21",
  "ab_p_demo__race_001___16", "ab_p_demo__race_001__v01___22",
  "ab_p_demo__race_001___17", "ab_p_demo__race_001__v01___23",
  "ab_p_demo__race_001___18", "ab_p_demo__race_001__v01___13",
  "ab_p_demo__race_001___19", "ab_p_demo__race_001__v01___14",
  "ab_p_demo__race_001___20", "ab_p_demo__race_001__v01___15",
  "ab_p_demo__race_001___21", "ab_p_demo__race_001__v01___17",
  "ab_p_demo__race_001___22", "ab_p_demo__race_001__v01___18",
  "ab_p_demo__race_001___23", "ab_p_demo__race_001__v01___19",
  "ab_p_demo__race_001___24", "ab_p_demo__race_001__v01___16",
  "ab_p_demo__race_001___25", "ab_p_demo__race_001__v01___24",
  "ab_p_demo__race_001___777", "ab_p_demo__race_001__v01___777",
  "ab_p_demo__race_001___999", "ab_p_demo__race_001__v01___999"
)

#' Compute "Cohort description: Race (NIH classification reporting 7 levels)
#' \[Based on baseline response; missingness filled in from longitudinal
#' responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_race__nih`
#' Cohort description: Race (NIH classification reporting 7 levels) \[Based
#' on baseline response; missingness filled in from longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   unlist(vars_ab_g_stc__cohort_race__nih) |> unique() |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_race__nih <- function(
    data,
    name = "ab_g_stc__cohort_race__nih",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c(
      "participant_id",
      "session_id",
      unique(unlist(vars_ab_g_stc__cohort_race__nih))
    )
  )

  tmp_data <- purrr::map2_dfc(
    vars_ab_g_stc__cohort_race__nih$baseline_choice,
    vars_ab_g_stc__cohort_race__nih$longitudinal_choice,
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
    mutate(
      participant_id = data[["participant_id"]],
      session_id = data[["session_id"]],
      .before = 1
    ) |>
    mutate(
      across(
        vars_ab_g_stc__cohort_race__nih$baseline_choice,
        ~ as.numeric(as.character(.x))
      )
    ) |>
    mutate(
      # intermediate columns
      tmp_unknown = if_else(
        rowSums(
          across(matches("^ab_p_demo__race_001___[7|9]{3}$"))
        ) >= 1 |
          ab_p_demo__race_001___0 == 1,
        1,
        0
      ),
      tmp_multi_race = if_else(
        rowSums(
          across(matches("^ab_p_demo__race_001___(1[0-9]|2[0-4])$"))
        ) >= 2,
        1,
        0
      ),
      tmp_white = if_else(
        ab_p_demo__race_001___10 == 1,
        1,
        0
      ),
      tmp_black = if_else(
        ab_p_demo__race_001___11 == 1,
        1,
        0
      ),
      tmp_asian = if_else(
        ab_p_demo__race_001___18 == 1 |
          ab_p_demo__race_001___19 == 1 |
          ab_p_demo__race_001___20 == 1 |
          ab_p_demo__race_001___21 == 1 |
          ab_p_demo__race_001___22 == 1 |
          ab_p_demo__race_001___23 == 1 |
          ab_p_demo__race_001___24 == 1,
        1,
        0
      ),
      tmp_haw_pac = if_else(
        ab_p_demo__race_001___14 == 1 |
          ab_p_demo__race_001___15 == 1 |
          ab_p_demo__race_001___16 == 1 |
          ab_p_demo__race_001___17 == 1,
        1,
        0
      ),
      tmp_aian = if_else(
        ab_p_demo__race_001___12 == 1 |
          ab_p_demo__race_001___13 == 1,
        1,
        0
      ),
      tmp_other = if_else(
        ab_p_demo__race_001___25 == 1,
        1,
        0
      ),
      # outcome column
      tmp_nih = case_when(
        tmp_unknown == 1 ~ "13", # Other (Unknown or not reported)
        tmp_other == 1 ~ "13", # Other (Unknown or not reported)
        tmp_multi_race == 1 ~ "8", # More than One Race
        tmp_asian == 1 ~ "4", # Asian
        tmp_white == 1 ~ "2", # White
        tmp_black == 1 ~ "3", # Black (African American)
        tmp_haw_pac == 1 ~ "6", # Native Hawaiian or Other Pacific Islander
        tmp_aian == 1 ~ "5", # American Indian/Alaska Native
        .default = NA_character_
      )
    ) |>
    select(
      participant_id,
      session_id,
      tmp_nih
    )

  data_ss <- left_join(
    make_static(
      data    = tmp_data,
      var_in  = "tmp_nih",
      var_out = name,
      exclude = c("13")
    ),
    make_static(
      data    = tmp_data,
      var_in  = "tmp_nih",
      var_out = "tmp_col"
    ),
    join_by(participant_id)
  ) |>
    combine_cols(
      col_1 = name,
      col_2 = "tmp_col"
    ) |>
    mutate(
      !!name := as.character(.data[[name]])
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

##  ............................................................................
##  ab_g_stc__cohort_ethnrace__leg                                          ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_ethnrace__leg
#' @format a character vector of all column names
#' used to compute summary score of `ab_g_stc__cohort_ethnrace__leg`.
vars_ab_g_stc__cohort_ethnrace__leg <- c(
  vars_ab_g_stc__cohort_ethn,
  vars_ab_g_stc__cohort_race__nih |> unlist() |> unique()
)

#' Compute "Cohort description: Ethno-racial identity (Legacy ABCD variable
#' reporting 6 levels; Hispanic ethnicity report outweighs any racial
#' endorements) \[Based on baseline response; missingness filled in from
#' longitudinal responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_ethnrace__leg`
#' Cohort description: Ethno-racial identity (Legacy ABCD variable
#' reporting 6 levels; Hispanic ethnicity report outweighs any racial
#' endorements) \[Based on baseline response; missingness filled in from
#' longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_stc__cohort_ethnrace__leg |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_ethnrace__leg <- function(
    data,
    name = "ab_g_stc__cohort_ethnrace__leg",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_stc__cohort_ethnrace__leg)

  data_ss <- left_join(
    compute_ab_g_stc__cohort_ethn(
      data,
      name = "tmp_ethnicity",
      combine = FALSE
    ),
    compute_ab_g_stc__cohort_race__nih(
      data,
      name = "tmp_race_nih",
      combine = FALSE
    ),
    join_by(participant_id)
  ) |>
    mutate(
      !!name := case_when(
        tmp_ethnicity == "1" ~ "1", # Hispanic
        tmp_race_nih == "2" ~ "2", # White
        tmp_race_nih == "3" ~ "3", # Black
        tmp_race_nih == "4" ~ "4", # Asian
        !is.na(tmp_race_nih) ~ "13", # Other
        .default = NA_character_
      )
    ) |>
    select(
      participant_id,
      !!name
    ) |>
    mutate(
      !!name := as.character(.data[[name]])
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

##  ............................................................................
##  ab_g_stc__cohort_ethnrace__mhisp                                        ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_ethnrace__mhisp
#' @format a character vector of all
#' column names used to compute summary score of
#' `ab_g_stc__cohort_ethnrace__mhisp`.
vars_ab_g_stc__cohort_ethnrace__mhisp <- vars_ab_g_stc__cohort_ethnrace__leg

#' Compute "Cohort description: Ethno-racial identity (8 level aggregation
#' providing information on ethnicity for multiracial endorements) \[Based on
#' baseline response; missingness filled in from longitudinal responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_ethnrace__mhisp`
#' Cohort description: Ethno-racial identity (8 level aggregation providing
#' information on ethnicity for multiracial endorements) \[Based on baseline
#' response; missingness filled in from longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_stc__cohort_ethnrace__mhisp |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__leg
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_ethnrace__mhisp <- function(
    data,
    name = "ab_g_stc__cohort_ethnrace__mhisp",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_stc__cohort_ethnrace__mhisp)

  data_ss <- left_join(
    compute_ab_g_stc__cohort_ethn(
      data,
      name = "tmp_ethnicity",
      combine = FALSE
    ),
    compute_ab_g_stc__cohort_race__nih(
      data,
      name = "tmp_race_nih",
      combine = FALSE
    ),
    join_by(participant_id)
  ) |>
    combine_levels(
      vars = list(
        "tmp_new" = c("tmp_race_nih", "tmp_ethnicity")
      ),
      conds = list(
        "2"  = list("2", "2"), # White (non-Hispanic)
        "3"  = list("3", "2"), # Black (non-Hispanic)
        "7"  = list(c("4", "6"), "2"), # Asian/Pacific Islander (non-Hispanic)
        "13" = list(c("13", "5"), "2"), # Other (non-Hispanic)
        "12" = list("8", "2"), # Multiracial (non-Hispanic)
        "11" = list("8", "1"), # Multiracial (Hispanic)
        "1"  = list(c("2", "3", "4", "5", "6", "13"), "1") # Hispanic
      ),
      default = NA_character_,
      combine = TRUE
    ) |>
    select(
      participant_id,
      !!name := tmp_new
    ) |>
    mutate(
      !!name := as.character(.data[[name]])
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

##  ............................................................................
##  ab_g_stc__cohort_ethnrace__mblack                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_stc__cohort_ethnrace__mblack
#' @format a character vector of all
#' column names used to compute summary score of
#' `ab_g_stc__cohort_ethnrace__mblack`.
vars_ab_g_stc__cohort_ethnrace__mblack <- vars_ab_g_stc__cohort_ethnrace__leg

#' Compute "Cohort description: Ethno-racial identity (8 level aggregation
#' providing information on Black identity for multiracial endorements) \[Based
#' on baseline response; missingness filled in from longitudinal responses\]"
#'
#' @description
#' Computes the summary score `ab_g_stc__cohort_ethnrace__mblack`
#' Cohort description: Ethno-racial identity (8 level aggregation providing
#' information on Black identity for multiracial endorements) \[Based on
#' baseline response; missingness filled in from longitudinal responses\]
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_stc__cohort_ethnrace__mblack |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column (default). If `combine == FALSE`, a data frame with two
#'    columns: participant ID and summary score.
#'
#' @export
#' @autoglobal
compute_ab_g_stc__cohort_ethnrace__mblack <- function(
    data,
    name = "ab_g_stc__cohort_ethnrace__mblack",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(
    data,
    c("participant_id", "session_id", vars_ab_g_stc__cohort_ethnrace__mblack)
  )

  tmp_data <- data |>
    select(
      participant_id,
      session_id,
      baseline = ab_p_demo__race_001___11,
      longitudinal = ab_p_demo__race_001__v01___11
    ) |>
    combine_cols(
      col_1 = "baseline",
      col_2 = "longitudinal"
    ) |>
    make_static(
      var_in = "baseline",
      var_out = "tmp_black",
      exclude = c("0")
    )

  data_ss <- data |>
    compute_ab_g_stc__cohort_ethnrace__mhisp(
      name = "tmp_ethnrace_mhisp",
      combine = FALSE
    ) |>
    left_join(
      tmp_data,
      join_by(participant_id)
    ) |>
    combine_levels(
      vars = list(
        "tmp_new" = c("tmp_ethnrace_mhisp", "tmp_black")
      ),
      conds = list(
        "10" = list(c("11", "12"), NA), # Multiracial (non-Black)
        "9"  = list(c("11", "12"), "1") # Multiracial (Black)
      ),
      default = "tmp_ethnrace_mhisp",
      combine = TRUE
    ) |>
    select(
      participant_id,
      !!name := tmp_new
    ) |>
    mutate(
      !!name := as.character(.data[[name]])
    )

  if (combine) {
    data_ss <- left_join(data, data_ss, join_by(participant_id))
  }

  data_ss
}

#   ____________________________________________________________________________
#   (ALL) ab_g_stc                                                          ####

#' Compute all the ab_g_stc scores
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
#' compute_ab_g_stc_all(data)
#' }
compute_ab_g_stc_all <- function(data) {
  data |>
    compute_ab_g_stc__cohort_ethnrace__meim() |>
    compute_ab_g_stc__cohort_ethn() |>
    compute_ab_g_stc__cohort_race__nih() |>
    compute_ab_g_stc__cohort_ethnrace__leg() |>
    compute_ab_g_stc__cohort_ethnrace__mhisp() |>
    compute_ab_g_stc__cohort_ethnrace__mblack()
}

#   ____________________________________________________________________________
#   Household income                                                        ####

##  ............................................................................
##  ab_g_dyn__cohort_income__hhold                                          ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_dyn__cohort_income__hhold__6lvl
#' @format a character vector
#' of all column names used to compute summary score of
#' `ab_g_dyn__cohort_income__hhold__6lvl`.
#'
vars_ab_g_dyn__cohort_income__hhold__6lvl <- c(
  "ab_p_demo__income__hhold_001",
  "ab_p_demo__income__hhold_001__v01"
)

#' Compute "Cohort description: Household income - 6 levels"
#'
#' @description
#' Computes the summary score `ab_g_dyn__cohort_income__hhold__6lvl`
#' Cohort description: Household income - 6 levels
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_dyn__cohort_income__hhold__6lvl |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ab_g_dyn__cohort_income__hhold__6lvl <- function(
    data,
    name = "ab_g_dyn__cohort_income__hhold__6lvl",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_dyn__cohort_income__hhold__6lvl)

  data_ss <- data |>
    rename(
      baseline     = ab_p_demo__income__hhold_001,
      longitudinal = ab_p_demo__income__hhold_001__v01
    ) |>
    combine_cols(
      col_1 = "baseline",
      col_2 = "longitudinal"
    ) |>
    transmute(
      !!name := case_when(
        baseline %in% c("1", "2", "3", "4") ~ "1", # < 25k
        baseline %in% c("5", "6") ~ "2", # 25k to 50k
        baseline == "7" ~ "3", # 50k to 75k
        baseline == "8" ~ "4", # 75k to 100k
        baseline == "9" ~ "5", # 100k to 200k
        baseline == "10" ~ "6", # > 200k
        baseline == "777" ~ "777", # Decline to answer
        baseline == "999" ~ "999", # Don't know
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute "Cohort description: Household income - 3 levels"
#'
#' @description
#' Computes the summary score `ab_g_dyn__cohort_income__hhold__3lvl`
#' Cohort description: Household income - 3 levels
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_dyn__cohort_income__hhold__6lvl |> md_bullet(2, TRUE)
#'   ```
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#' @seealso [compute_ab_g_dyn__cohort_income__hhold__6lvl()]
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ab_g_dyn__cohort_income__hhold__3lvl <- function(
    data,
    name = "ab_g_dyn__cohort_income__hhold__3lvl",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)

  data_ss <- data |>
    compute_ab_g_dyn__cohort_income__hhold__6lvl(
      name = "tmp_income"
    ) |>
    transmute(
      !!name := case_when(
        tmp_income %in% c("1", "2") ~ "1", # < 50k
        tmp_income %in% c("3", "4") ~ "2", # 50k to 100k
        tmp_income %in% c("5", "6") ~ "3", # > 100k
        .default = tmp_income # 777, Decline to answer | 999, Don't know
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   Household education                                                     ####

##  ............................................................................
##  ab_g_dyn__cohort_edu__cgs                                               ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_dyn__cohort_edu__cgs
#' @format a character vector
#' of all column names used to compute summary score of
#' `ab_g_dyn__cohort_edu__cgs`.
#'
vars_ab_g_dyn__cohort_edu__cgs <- c(
  # parent:
  "ab_p_demo__edu__slf_001", # baseline,
  "ab_p_demo__edu__slf_001__v01", # < 2yr
  "ab_p_demo__edu__slf_001__v02", # ≥ 2 yr
  # partner:
  "ab_p_demo__edu__prtnr_001", # baseline + < 2yr
  "ab_p_demo__edu__prtnr_001__v01" # ≥ 2yr
)

#' Compute "Cohort description: Highest education across caregivers"
#'
#' @description
#' Computes the summary score `ab_g_dyn__cohort_edu__cgs`
#' Cohort description: Highest education across caregivers
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_dyn__cohort_edu__cgs |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ab_g_dyn__cohort_edu__cgs <- function(
    data,
    name = "ab_g_dyn__cohort_edu__cgs",
    exclude = c("777", "999"),
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_dyn__cohort_edu__cgs)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ab_g_dyn__cohort_edu__cgs),
        ~ as.numeric(as.character(.x))
      )
    ) |>
    # caregiver 1
    combine_cols(
      col_1 = "ab_p_demo__edu__slf_001",
      col_2 = "ab_p_demo__edu__slf_001__v01"
    ) |>
    combine_cols(
      col_1 = "ab_p_demo__edu__slf_001",
      col_2 = "ab_p_demo__edu__slf_001__v02",
      name  = "tmp_cg1"
    ) |>
    # caregiver 2
    combine_cols(
      col_1 = "ab_p_demo__edu__prtnr_001",
      col_2 = "ab_p_demo__edu__prtnr_001__v01",
      name  = "tmp_cg2"
    ) |>
    # get highest education across cg1 and cg2 at each visit
    ss_max(
      name    = "tmp_education",
      vars    = c("tmp_cg1", "tmp_cg2"),
      exclude = exclude,
      combine = TRUE
    ) |>
    # create summary score
    transmute(
      !!name := case_when(
        tmp_education %in% c(0:12) ~ "1", # Up to High School (No Diploma)
        tmp_education %in% c(13, 14) ~ "2", # High School Diploma/GED
        tmp_education %in% c(15:17, 22:23) ~ "3", # Some College
        tmp_education == 18 ~ "4", # Bachelor’s Degree
        tmp_education %in% c(19:21) ~ "5", # Graduate School or Professional Degree
        tmp_education %in% c(777, 999) ~ NA_character_,
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   Parent partner and employment status                                    ####

##  ............................................................................
##  ab_g_dyn__cohort_prtnrshp__employ                                       ####

#' @export
#' @autoglobal
#' @rdname compute_ab_g_dyn__cohort_prtnrshp__employ
#' @format a character vector
#' of all column names used to compute summary score of
#' `ab_g_dyn__cohort_prtnrshp__employ`.
#'
vars_ab_g_dyn__cohort_prtnrshp__employ <- c(
  # partner status: ---
  "ab_p_demo__marital__slf_001", # demo_prnt_marital_v2b + demo_prnt_marital_v2_l
  "ab_p_demo__prtnr_001", # demo_prnt_prtnr_v2b + demo_prnt_prtnr_v2_l
  # employment: ---
  "ab_p_demo__empl__slf_001", # demo_prnt_empl_v2b + demo_prnt_empl_v2_l
  "ab_p_demo__empl__prtnr_001", # demo_prtnr_empl_v2b
  "ab_p_demo__empl__prtnr_001__v01" # demo_prtnr_empl_v2_l
)

#' Compute "Cohort description: Caregivers' partnership and employment status"
#'
#' @description
#' Computes the summary score `ab_g_dyn__cohort_prtnrshp__employ`
#' Cohort description: Caregivers' partnership and employment status
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_ab_g_dyn__cohort_prtnrshp__employ |> md_bullet(2, TRUE)
#'   ```
#'
#' - *Excluded values:*
#'    - 777
#'    - 999
#'
#' @inheritParams compute_ab_g_stc__cohort_ethnrace__meim
#'
#' @return tbl. The input data frame with the summary score appended as
#'    a new column.
#'
#' @export
#' @autoglobal
compute_ab_g_dyn__cohort_prtnrshp__employ <- function(
    data,
    name = "ab_g_dyn__cohort_prtnrshp__employ",
    combine = TRUE) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_logical(combine)
  chk::check_names(data, vars_ab_g_dyn__cohort_prtnrshp__employ)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_ab_g_dyn__cohort_prtnrshp__employ),
        ~ as.character(.x)
      )
    ) |>
    # combine baseline + longitudinal for partner employment
    combine_cols(
      col_1 = "ab_p_demo__empl__prtnr_001",
      col_2 = "ab_p_demo__empl__prtnr_001__v01"
    ) |>
    # create summary score
    transmute(
      !!name := case_when(
        ab_p_demo__marital__slf_001 %in% c("1", "6") &
          ab_p_demo__prtnr_001 == "1" &
          ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10") &
          ab_p_demo__empl__prtnr_001 %in% c("1", "2", "9", "10") ~
          "5", # "Partnered, 2 people in the labor force"

        ab_p_demo__marital__slf_001 %in% c("1", "6") &
          ab_p_demo__prtnr_001 == "1" &
          (ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10") |
            ab_p_demo__empl__prtnr_001 %in% c("1", "2", "9", "10")) &
          !(ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10") &
            ab_p_demo__empl__prtnr_001 %in% c("1", "2", "9", "10")) ~
          "4", # "Partnered, 1 person in the labor force"

        ab_p_demo__marital__slf_001 %in% c("1", "6") &
          ab_p_demo__prtnr_001 == "1" &
          !(ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10")) &
          !(ab_p_demo__empl__prtnr_001 %in% c("1", "2", "9", "10")) ~
          "3", # "Partnered, 0 people in the labor force"

        ab_p_demo__marital__slf_001 %in% c("2", "3", "4", "5") &
          ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10") ~
          "2", # "Single, in the labor force"

        ab_p_demo__marital__slf_001 %in% c("2", "3", "4", "5") &
          !(ab_p_demo__empl__slf_001 %in% c("1", "2", "9", "10")) ~
          "1", # "Single, not in the labor force"

        # Specify remaining cases as NA
        ab_p_demo__marital__slf_001 == "777" |
          ab_p_demo__prtnr_001 == "777" |
          ab_p_demo__empl__slf_001 == "777" |
          ab_p_demo__empl__prtnr_001 %in% c("777", "999") ~
          NA_character_,
        .default = NA_character_
      )
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#   ____________________________________________________________________________
#   (ALL) ab_g_dyn                                                          ####

#' Compute all the ab_g_dyn scores
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
#' compute_ab_g_dyn_all(data)
#' }
compute_ab_g_dyn_all <- function(data) {
  data |>
    compute_ab_g_dyn__cohort_income__hhold__6lvl() |>
    compute_ab_g_dyn__cohort_income__hhold__3lvl() |>
    compute_ab_g_dyn__cohort_edu__cgs() |>
    compute_ab_g_dyn__cohort_prtnrshp__employ()
}
