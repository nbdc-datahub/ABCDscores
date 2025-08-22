#' Dummy function for all ASEBA summary score functions.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param data_norm tbl. Data frame containing the norm (T-score) values.
#' see [ss_tscore()].
#' @param name character. Name of the summary score column.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed. `NULL` means no limit.
#' @param col_age character, name of the age column. see [ss_tscore()].
#' @param col_sex character, name of the sex column. see [ss_tscore()].
#' @param exclude character vector. Values to be excluded from the summary score.
#' @param combine logical. If `TRUE` (default), the summary score is
#' is appended as a new column to the input data frame. If `FALSE`, the
#' summary score is returned as a separate one-column data frame.
#' @return tbl. see `combine`.
#' @keywords internal
dummy_aseba <- function(
    data, data_norm, name, max_na,
    col_age, col_sex, exclude, combine) {
}


# mh_p_abcl --------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl_nm
#' @format `vars_mh_p_abcl` is vector of all column names
#' used to compute summary score of `mh_p_abcl` scores.
vars_mh_p_abcl <- c(
  "mh_p_abcl__rule_001",
  "mh_p_abcl__attn__adhd_002",
  "mh_p_abcl__tho_001",
  "mh_p_abcl__othpr__adhd_001",
  "mh_p_abcl__anxdep__dep_001",
  "mh_p_abcl__aggr__antsoc_003",
  "mh_p_abcl__tho__dep_001",
  "mh_p_abcl__othpr__antsoc_001",
  "mh_p_abcl__tho_002",
  "mh_p_abcl__aggr_001",
  "mh_p_abcl__aggr__antsoc_006",
  "mh_p_abcl__tho_003",
  "mh_p_abcl__tho_004",
  "mh_p_abcl__tho_006",
  "mh_p_abcl__rule_002",
  "mh_p_abcl__tho__dep_002",
  "mh_p_abcl__rule__antsoc_007",
  "mh_p_abcl__aggr__antsoc_008",
  "mh_p_abcl__anxdep__dep_004",
  "mh_p_abcl__aggr__adhd_001",
  "mh_p_abcl__attn__adhd_001",
  "mh_p_abcl__attn__adhd_003",
  "mh_p_abcl__attn__adhd_004",
  "mh_p_abcl__attn__adhd_005",
  "mh_p_abcl__attn__adhd_006",
  "mh_p_abcl__attn__adhd_007",
  "mh_p_abcl__othpr__adhd_002",
  "mh_p_abcl__othpr__adhd_003",
  "mh_p_abcl__othpr__adhd_004",
  "mh_p_abcl__rule__adhd_001",
  "mh_p_abcl__aggr__antsoc_001",
  "mh_p_abcl__aggr__antsoc_002",
  "mh_p_abcl__aggr__antsoc_004",
  "mh_p_abcl__aggr__antsoc_005",
  "mh_p_abcl__aggr__antsoc_007",
  "mh_p_abcl__attn__antsoc_001",
  "mh_p_abcl__othpr__antsoc_002",
  "mh_p_abcl__rule__antsoc_001",
  "mh_p_abcl__rule__antsoc_002",
  "mh_p_abcl__rule__antsoc_003",
  "mh_p_abcl__rule__antsoc_004",
  "mh_p_abcl__rule__antsoc_005",
  "mh_p_abcl__rule__antsoc_006",
  "mh_p_abcl__rule__antsoc_008",
  "mh_p_abcl__rule__antsoc_009",
  "mh_p_abcl__anxdep__anx_001",
  "mh_p_abcl__anxdep__anx_002",
  "mh_p_abcl__anxdep__anx_003",
  "mh_p_abcl__othpr__anx_001",
  "mh_p_abcl__othpr__anx_002",
  "mh_p_abcl__othpr__anx_003",
  "mh_p_abcl__anxdep__avoid_001",
  "mh_p_abcl__anxdep__avoid_002",
  "mh_p_abcl__othpr__avoid_001",
  "mh_p_abcl__wthdr__avoid_001",
  "mh_p_abcl__wthdr__avoid_002",
  "mh_p_abcl__wthdr__avoid_003",
  "mh_p_abcl__wthdr__avoid_004",
  "mh_p_abcl__anxdep__dep_002",
  "mh_p_abcl__anxdep__dep_003",
  "mh_p_abcl__anxdep__dep_005",
  "mh_p_abcl__attn__dep_001",
  "mh_p_abcl__attn__dep_002",
  "mh_p_abcl__attn__dep_003",
  "mh_p_abcl__othpr__dep_001",
  "mh_p_abcl__othpr__dep_002",
  "mh_p_abcl__othpr__dep_003",
  "mh_p_abcl__som__dep_001",
  "mh_p_abcl__wthdr__dep_001",
  "mh_p_abcl__som__somat_001",
  "mh_p_abcl__som__somat_002",
  "mh_p_abcl__som__somat_003",
  "mh_p_abcl__som__somat_004",
  "mh_p_abcl__som__somat_005",
  "mh_p_abcl__som__somat_006",
  "mh_p_abcl__som__somat_007",
  "mh_p_abcl__aggr_002",
  "mh_p_abcl__aggr_003",
  "mh_p_abcl__aggr_004",
  "mh_p_abcl__aggr_005",
  "mh_p_abcl__aggr_006",
  "mh_p_abcl__aggr_007",
  "mh_p_abcl__anxdep_001",
  "mh_p_abcl__anxdep_002",
  "mh_p_abcl__anxdep_003",
  "mh_p_abcl__anxdep_004",
  "mh_p_abcl__attn_001",
  "mh_p_abcl__attn_002",
  "mh_p_abcl__attn_003",
  "mh_p_abcl__attn_004",
  "mh_p_abcl__attn_005",
  "mh_p_abcl__attn_006",
  "mh_p_abcl__rule_003",
  "mh_p_abcl__intru_001",
  "mh_p_abcl__intru_002",
  "mh_p_abcl__intru_003",
  "mh_p_abcl__intru_004",
  "mh_p_abcl__intru_005",
  "mh_p_abcl__intru_006",
  "mh_p_abcl__wthdr_001",
  "mh_p_abcl__wthdr_002",
  "mh_p_abcl__wthdr_003",
  "mh_p_abcl__wthdr_004",
  "mh_p_abcl__som_001",
  "mh_p_abcl__othpr_001",
  "mh_p_abcl__othpr_002",
  "mh_p_abcl__othpr_003",
  "mh_p_abcl__othpr_004",
  "mh_p_abcl__othpr_005",
  "mh_p_abcl__othpr_006",
  "mh_p_abcl__othpr_007",
  "mh_p_abcl__othpr_008",
  "mh_p_abcl__othpr_009",
  "mh_p_abcl__othpr_010",
  "mh_p_abcl__othpr_011",
  "mh_p_abcl__othpr_012",
  "mh_p_abcl__tho_005",
  "mh_p_abcl__tho_007"
)


#' Compute "Adult Behavior Checklist \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl_nm`
#' Adult Behavior Checklist \[Parent\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl_nm", vars_mh_p_abcl))
#'   )
#' }
compute_mh_p_abcl_nm <- function(
    data,
    name = "mh_p_abcl_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\]: Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl_sum`
#' Adult Behavior Checklist \[Parent\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 8 of 118 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl_sum", vars_mh_p_abcl))
#'   )
#' }
compute_mh_p_abcl_sum <- function(
    data,
    name = "mh_p_abcl_sum",
    max_na = 8,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\]: T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl_tscore`
#' Adult Behavior Checklist \[Parent\]: T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 8 of 118 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl_tscore", vars_mh_p_abcl))
#'   )
#' }
compute_mh_p_abcl_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 8,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__afs__frnd ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__afs__frnd_nm
#' @format `vars_mh_p_abcl__afs__frnd` is vector of all column names
#' used to compute summary score of `mh_p_abcl__afs__frnd` scores.
vars_mh_p_abcl__afs__frnd <- c(
  "mh_p_abcl__frnd_001",
  "mh_p_abcl__frnd_002",
  "mh_p_abcl__frnd_003",
  "mh_p_abcl__frnd_004"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__afs__frnd_nm`
#' Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__afs__frnd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__afs__frnd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__afs__frnd_nm", vars_mh_p_abcl__afs__frnd))
#'   )
#' }
compute_mh_p_abcl__afs__frnd_nm <- function(
    data,
    name = "mh_p_abcl__afs__frnd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__afs__frnd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__afs__frnd_sum`
#' Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__afs__frnd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__afs__frnd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__afs__frnd_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__afs__frnd_sum", vars_mh_p_abcl__afs__frnd))
#'   )
#' }
compute_mh_p_abcl__afs__frnd_sum <- function(
    data,
    name = "mh_p_abcl__afs__frnd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__afs__frnd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__afs__frnd_tscore`
#' Adult Behavior Checklist \[Parent\] (Adaptive Functioning Scale -
#' Friends): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__afs__frnd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__afs__frnd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__afs__frnd_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__afs__frnd_tscore", vars_mh_p_abcl__afs__frnd))
#'   )
#' }
compute_mh_p_abcl__afs__frnd_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__afs__frnd_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__afs__frnd,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__cg2 ---------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__cg2_sex
#' @format `vars_mh_p_abcl__cg2` is vector of all column names
#' used to compute summary score of `mh_p_abcl__cg2` scores.
vars_mh_p_abcl__cg2 <- c(
  "mh_p_abcl__cg2_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] Sex Assignment"
#'
#' @description
#' Computes the summary score `mh_p_abcl__cg2_sex`
#' Adult Behavior Checklist \[Parent\] Sex Assignment
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__cg2 |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__cg2_sex(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__cg2_sex", vars_mh_p_abcl__cg2))
#'   )
#' }
compute_mh_p_abcl__cg2_sex <- function(
    data,
    name = "mh_p_abcl__cg2_sex",
    combine = TRUE) {
  check_col_names(data, name)
  chk::check_names(data, vars_mh_p_abcl__cg2)

  data_ss <- data |>
    mutate(
      across(
        all_of(vars_mh_p_abcl__cg2),
        ~ as.character(.x)
      ),
      "{name}" := case_when(
        mh_p_abcl__cg2_001 %in% c("1", "3", "5", "8", "10", "12") ~ "2",
        mh_p_abcl__cg2_001 %in% c("2", "4", "6", "9", "11", "13") ~ "1",
        .default = NA_character_
      )
    ) |>
    select(!!name)

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }
  data_ss
}



# mh_p_abcl__critic ------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__critic_nm
#' @format `vars_mh_p_abcl__critic` is vector of all column names
#' used to compute summary score of `mh_p_abcl__critic` scores.
vars_mh_p_abcl__critic <- c(
  "mh_p_abcl__rule_001",
  "mh_p_abcl__attn__adhd_002",
  "mh_p_abcl__tho_001",
  "mh_p_abcl__othpr__adhd_001",
  "mh_p_abcl__anxdep__dep_001",
  "mh_p_abcl__aggr__antsoc_003",
  "mh_p_abcl__tho__dep_001",
  "mh_p_abcl__othpr__antsoc_001",
  "mh_p_abcl__tho_002",
  "mh_p_abcl__aggr_001",
  "mh_p_abcl__aggr__antsoc_006",
  "mh_p_abcl__tho_003",
  "mh_p_abcl__tho_004",
  "mh_p_abcl__tho_006",
  "mh_p_abcl__rule_002",
  "mh_p_abcl__tho__dep_002",
  "mh_p_abcl__rule__antsoc_007",
  "mh_p_abcl__aggr__antsoc_008",
  "mh_p_abcl__anxdep__dep_004"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Critical items): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__critic_nm`
#' Adult Behavior Checklist \[Parent\] (Critical items): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__critic |> md_bullet(2, TRUE)
#'   ```
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__critic_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__critic_nm", vars_mh_p_abcl__critic))
#'   )
#' }
compute_mh_p_abcl__critic_nm <- function(
    data,
    name = "mh_p_abcl__critic_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__critic,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Critical items): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__critic_sum`
#' Adult Behavior Checklist \[Parent\] (Critical items): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__critic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 19 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__critic_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__critic_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__critic_sum", vars_mh_p_abcl__critic))
#'   )
#' }
compute_mh_p_abcl__critic_sum <- function(
    data,
    name = "mh_p_abcl__critic_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__critic,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Critical items): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__critic_tscore`
#' Adult Behavior Checklist \[Parent\] (Critical items): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__critic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 19 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__critic_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__critic_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__critic_tscore", vars_mh_p_abcl__critic))
#'   )
#' }
compute_mh_p_abcl__critic_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__critic_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__critic,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__adhd ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__adhd_nm
#' @format `vars_mh_p_abcl__dsm__adhd` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__adhd` scores.
vars_mh_p_abcl__dsm__adhd <- c(
  "mh_p_abcl__aggr__adhd_001",
  "mh_p_abcl__attn__adhd_001",
  "mh_p_abcl__attn__adhd_002",
  "mh_p_abcl__attn__adhd_003",
  "mh_p_abcl__attn__adhd_004",
  "mh_p_abcl__attn__adhd_005",
  "mh_p_abcl__attn__adhd_006",
  "mh_p_abcl__attn__adhd_007",
  "mh_p_abcl__othpr__adhd_001",
  "mh_p_abcl__othpr__adhd_002",
  "mh_p_abcl__othpr__adhd_003",
  "mh_p_abcl__othpr__adhd_004",
  "mh_p_abcl__rule__adhd_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__adhd_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__adhd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__adhd_nm", vars_mh_p_abcl__dsm__adhd))
#'   )
#' }
compute_mh_p_abcl__dsm__adhd_nm <- function(
    data,
    name = "mh_p_abcl__dsm__adhd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__adhd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__adhd_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__adhd_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__adhd_sum", vars_mh_p_abcl__dsm__adhd))
#'   )
#' }
compute_mh_p_abcl__dsm__adhd_sum <- function(
    data,
    name = "mh_p_abcl__dsm__adhd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__adhd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__adhd_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__adhd_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__adhd_tscore", vars_mh_p_abcl__dsm__adhd))
#'   )
#' }
compute_mh_p_abcl__dsm__adhd_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__adhd_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__adhd,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__antsoc -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__antsoc_nm
#' @format `vars_mh_p_abcl__dsm__antsoc` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__antsoc` scores.
vars_mh_p_abcl__dsm__antsoc <- c(
  "mh_p_abcl__aggr__antsoc_001",
  "mh_p_abcl__aggr__antsoc_002",
  "mh_p_abcl__aggr__antsoc_003",
  "mh_p_abcl__aggr__antsoc_004",
  "mh_p_abcl__aggr__antsoc_005",
  "mh_p_abcl__aggr__antsoc_006",
  "mh_p_abcl__aggr__antsoc_007",
  "mh_p_abcl__aggr__antsoc_008",
  "mh_p_abcl__attn__antsoc_001",
  "mh_p_abcl__othpr__antsoc_001",
  "mh_p_abcl__othpr__antsoc_002",
  "mh_p_abcl__rule__antsoc_001",
  "mh_p_abcl__rule__antsoc_002",
  "mh_p_abcl__rule__antsoc_003",
  "mh_p_abcl__rule__antsoc_004",
  "mh_p_abcl__rule__antsoc_005",
  "mh_p_abcl__rule__antsoc_006",
  "mh_p_abcl__rule__antsoc_007",
  "mh_p_abcl__rule__antsoc_008",
  "mh_p_abcl__rule__antsoc_009"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Antisocial personality problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__antsoc_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__antsoc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__antsoc_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__antsoc_nm", vars_mh_p_abcl__dsm__antsoc))
#'   )
#' }
compute_mh_p_abcl__dsm__antsoc_nm <- function(
    data,
    name = "mh_p_abcl__dsm__antsoc_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__antsoc,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Antisocial personality problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__antsoc_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__antsoc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 20 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__antsoc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__antsoc_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__antsoc_sum", vars_mh_p_abcl__dsm__antsoc))
#'   )
#' }
compute_mh_p_abcl__dsm__antsoc_sum <- function(
    data,
    name = "mh_p_abcl__dsm__antsoc_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__antsoc,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Antisocial personality problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__antsoc_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__antsoc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 20 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__antsoc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__antsoc_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__antsoc_tscore", vars_mh_p_abcl__dsm__antsoc))
#'   )
#' }
compute_mh_p_abcl__dsm__antsoc_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__antsoc_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__antsoc,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__anx ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__anx_nm
#' @format `vars_mh_p_abcl__dsm__anx` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__anx` scores.
vars_mh_p_abcl__dsm__anx <- c(
  "mh_p_abcl__anxdep__anx_001",
  "mh_p_abcl__anxdep__anx_002",
  "mh_p_abcl__anxdep__anx_003",
  "mh_p_abcl__othpr__anx_001",
  "mh_p_abcl__othpr__anx_002",
  "mh_p_abcl__othpr__anx_003"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__anx_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__anx_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__anx_nm", vars_mh_p_abcl__dsm__anx))
#'   )
#' }
compute_mh_p_abcl__dsm__anx_nm <- function(
    data,
    name = "mh_p_abcl__dsm__anx_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__anx,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__anx_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__anx_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__anx_sum", vars_mh_p_abcl__dsm__anx))
#'   )
#' }
compute_mh_p_abcl__dsm__anx_sum <- function(
    data,
    name = "mh_p_abcl__dsm__anx_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__anx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__anx_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__anx_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__anx_tscore", vars_mh_p_abcl__dsm__anx))
#'   )
#' }
compute_mh_p_abcl__dsm__anx_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__anx_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__anx,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__avoid --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__avoid_nm
#' @format `vars_mh_p_abcl__dsm__avoid` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__avoid` scores.
vars_mh_p_abcl__dsm__avoid <- c(
  "mh_p_abcl__anxdep__avoid_001",
  "mh_p_abcl__anxdep__avoid_002",
  "mh_p_abcl__othpr__avoid_001",
  "mh_p_abcl__wthdr__avoid_001",
  "mh_p_abcl__wthdr__avoid_002",
  "mh_p_abcl__wthdr__avoid_003",
  "mh_p_abcl__wthdr__avoid_004"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__avoid_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__avoid |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__avoid_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__avoid_nm", vars_mh_p_abcl__dsm__avoid))
#'   )
#' }
compute_mh_p_abcl__dsm__avoid_nm <- function(
    data,
    name = "mh_p_abcl__dsm__avoid_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__avoid,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__avoid_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__avoid |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__avoid_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__avoid_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__avoid_sum", vars_mh_p_abcl__dsm__avoid))
#'   )
#' }
compute_mh_p_abcl__dsm__avoid_sum <- function(
    data,
    name = "mh_p_abcl__dsm__avoid_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__avoid,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__avoid_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__avoid |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__avoid_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__avoid_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__avoid_tscore", vars_mh_p_abcl__dsm__avoid))
#'   )
#' }
compute_mh_p_abcl__dsm__avoid_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__avoid_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__avoid,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__dep ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__dep_nm
#' @format `vars_mh_p_abcl__dsm__dep` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__dep` scores.
vars_mh_p_abcl__dsm__dep <- c(
  "mh_p_abcl__anxdep__dep_001",
  "mh_p_abcl__anxdep__dep_002",
  "mh_p_abcl__anxdep__dep_003",
  "mh_p_abcl__anxdep__dep_004",
  "mh_p_abcl__anxdep__dep_005",
  "mh_p_abcl__attn__dep_001",
  "mh_p_abcl__attn__dep_002",
  "mh_p_abcl__attn__dep_003",
  "mh_p_abcl__othpr__dep_001",
  "mh_p_abcl__othpr__dep_002",
  "mh_p_abcl__othpr__dep_003",
  "mh_p_abcl__som__dep_001",
  "mh_p_abcl__tho__dep_001",
  "mh_p_abcl__tho__dep_002",
  "mh_p_abcl__wthdr__dep_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__dep_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__dep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__dep_nm", vars_mh_p_abcl__dsm__dep))
#'   )
#' }
compute_mh_p_abcl__dsm__dep_nm <- function(
    data,
    name = "mh_p_abcl__dsm__dep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__dep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__dep_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__dep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__dep_sum", vars_mh_p_abcl__dsm__dep))
#'   )
#' }
compute_mh_p_abcl__dsm__dep_sum <- function(
    data,
    name = "mh_p_abcl__dsm__dep_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__dep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__dep_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__dep_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__dep_tscore", vars_mh_p_abcl__dsm__dep))
#'   )
#' }
compute_mh_p_abcl__dsm__dep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__dep_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__dep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__dsm__somat --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__dsm__somat_nm
#' @format `vars_mh_p_abcl__dsm__somat` is vector of all column names
#' used to compute summary score of `mh_p_abcl__dsm__somat` scores.
vars_mh_p_abcl__dsm__somat <- c(
  "mh_p_abcl__som__somat_001",
  "mh_p_abcl__som__somat_002",
  "mh_p_abcl__som__somat_003",
  "mh_p_abcl__som__somat_004",
  "mh_p_abcl__som__somat_005",
  "mh_p_abcl__som__somat_006",
  "mh_p_abcl__som__somat_007"
)


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__somat_nm`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__somat_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__somat_nm", vars_mh_p_abcl__dsm__somat))
#'   )
#' }
compute_mh_p_abcl__dsm__somat_nm <- function(
    data,
    name = "mh_p_abcl__dsm__somat_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__somat,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__somat_sum`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__somat_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__somat_sum", vars_mh_p_abcl__dsm__somat))
#'   )
#' }
compute_mh_p_abcl__dsm__somat_sum <- function(
    data,
    name = "mh_p_abcl__dsm__somat_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__dsm__somat,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__dsm__somat_tscore`
#' Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__dsm__somat_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__dsm__somat_tscore", vars_mh_p_abcl__dsm__somat))
#'   )
#' }
compute_mh_p_abcl__dsm__somat_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__dsm__somat_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__dsm__somat,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__su ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__su_nm
#' @format `vars_mh_p_abcl__su` is vector of all column names
#' used to compute summary score of `mh_p_abcl__su` scores.
vars_mh_p_abcl__su <- c(
  "mh_p_abcl__drg_001",
  "mh_p_abcl__drunk_001",
  "mh_p_abcl__nic_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Substance use): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su_nm`
#' Adult Behavior Checklist \[Parent\] (Substance use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su_nm", vars_mh_p_abcl__su))
#'   )
#' }
compute_mh_p_abcl__su_nm <- function(
    data,
    name = "mh_p_abcl__su_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__su,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Substance use): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su_sum`
#' Adult Behavior Checklist \[Parent\] (Substance use): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su_sum", vars_mh_p_abcl__su))
#'   )
#' }
compute_mh_p_abcl__su_sum <- function(
    data,
    name = "mh_p_abcl__su_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__su,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Substance use): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su_tscore`
#' Adult Behavior Checklist \[Parent\] (Substance use): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 3 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su_tscore", vars_mh_p_abcl__su))
#'   )
#' }
compute_mh_p_abcl__su_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__su_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__su,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__su__drg ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__su__drg_nm
#' @format `vars_mh_p_abcl__su__drg` is vector of all column names
#' used to compute summary score of `mh_p_abcl__su__drg` scores.
vars_mh_p_abcl__su__drg <- c(
  "mh_p_abcl__drg_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Days drug use): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drg_nm`
#' Adult Behavior Checklist \[Parent\] (Days drug use): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drg_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drg_nm", vars_mh_p_abcl__su__drg))
#'   )
#' }
compute_mh_p_abcl__su__drg_nm <- function(
    data,
    name = "mh_p_abcl__su__drg_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__su__drg,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Days drug use): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drg_sum`
#' Adult Behavior Checklist \[Parent\] (Days drug use): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__drg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drg_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drg_sum", vars_mh_p_abcl__su__drg))
#'   )
#' }
compute_mh_p_abcl__su__drg_sum <- function(
    data,
    name = "mh_p_abcl__su__drg_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__su__drg,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Days drug use): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drg_tscore`
#' Adult Behavior Checklist \[Parent\] (Days drug use): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drg |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__drg_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drg_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drg_tscore", vars_mh_p_abcl__su__drg))
#'   )
#' }
compute_mh_p_abcl__su__drg_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__su__drg_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__su__drg,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__su__drunk ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__su__drunk_nm
#' @format `vars_mh_p_abcl__su__drunk` is vector of all column names
#' used to compute summary score of `mh_p_abcl__su__drunk` scores.
vars_mh_p_abcl__su__drunk <- c(
  "mh_p_abcl__drunk_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Days Drunk): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drunk_nm`
#' Adult Behavior Checklist \[Parent\] (Days Drunk): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drunk |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drunk_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drunk_nm", vars_mh_p_abcl__su__drunk))
#'   )
#' }
compute_mh_p_abcl__su__drunk_nm <- function(
    data,
    name = "mh_p_abcl__su__drunk_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__su__drunk,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Days Drunk): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drunk_sum`
#' Adult Behavior Checklist \[Parent\] (Days Drunk): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drunk |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__drunk_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drunk_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drunk_sum", vars_mh_p_abcl__su__drunk))
#'   )
#' }
compute_mh_p_abcl__su__drunk_sum <- function(
    data,
    name = "mh_p_abcl__su__drunk_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__su__drunk,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Days Drunk): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__drunk_tscore`
#' Adult Behavior Checklist \[Parent\] (Days Drunk): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__drunk |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__drunk_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__drunk_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__drunk_tscore", vars_mh_p_abcl__su__drunk))
#'   )
#' }
compute_mh_p_abcl__su__drunk_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__su__drunk_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__su__drunk,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__su__nic -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__su__nic_nm
#' @format `vars_mh_p_abcl__su__nic` is vector of all column names
#' used to compute summary score of `mh_p_abcl__su__nic` scores.
vars_mh_p_abcl__su__nic <- c(
  "mh_p_abcl__nic_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Tobacco per day): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__nic_nm`
#' Adult Behavior Checklist \[Parent\] (Tobacco per day): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__nic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__nic_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__nic_nm", vars_mh_p_abcl__su__nic))
#'   )
#' }
compute_mh_p_abcl__su__nic_nm <- function(
    data,
    name = "mh_p_abcl__su__nic_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__su__nic,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Tobacco per day): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__nic_sum`
#' Adult Behavior Checklist \[Parent\] (Tobacco per day): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__nic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__nic_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__nic_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__nic_sum", vars_mh_p_abcl__su__nic))
#'   )
#' }
compute_mh_p_abcl__su__nic_sum <- function(
    data,
    name = "mh_p_abcl__su__nic_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__su__nic,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Tobacco per day): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__su__nic_tscore`
#' Adult Behavior Checklist \[Parent\] (Tobacco per day): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__su__nic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 1 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__su__nic_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__su__nic_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__su__nic_tscore", vars_mh_p_abcl__su__nic))
#'   )
#' }
compute_mh_p_abcl__su__nic_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__su__nic_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__su__nic,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__aggr --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__aggr_nm
#' @format `vars_mh_p_abcl__synd__aggr` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__aggr` scores.
vars_mh_p_abcl__synd__aggr <- c(
  "mh_p_abcl__aggr_001",
  "mh_p_abcl__aggr_002",
  "mh_p_abcl__aggr_003",
  "mh_p_abcl__aggr_004",
  "mh_p_abcl__aggr_005",
  "mh_p_abcl__aggr_006",
  "mh_p_abcl__aggr_007",
  "mh_p_abcl__aggr__adhd_001",
  "mh_p_abcl__aggr__antsoc_001",
  "mh_p_abcl__aggr__antsoc_002",
  "mh_p_abcl__aggr__antsoc_003",
  "mh_p_abcl__aggr__antsoc_004",
  "mh_p_abcl__aggr__antsoc_005",
  "mh_p_abcl__aggr__antsoc_006",
  "mh_p_abcl__aggr__antsoc_007",
  "mh_p_abcl__aggr__antsoc_008"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__aggr_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__aggr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__aggr_nm", vars_mh_p_abcl__synd__aggr))
#'   )
#' }
compute_mh_p_abcl__synd__aggr_nm <- function(
    data,
    name = "mh_p_abcl__synd__aggr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__aggr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__aggr_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 16 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__aggr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__aggr_sum", vars_mh_p_abcl__synd__aggr))
#'   )
#' }
compute_mh_p_abcl__synd__aggr_sum <- function(
    data,
    name = "mh_p_abcl__synd__aggr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__aggr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__aggr_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 16 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__aggr_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__aggr_tscore", vars_mh_p_abcl__synd__aggr))
#'   )
#' }
compute_mh_p_abcl__synd__aggr_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__aggr_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__aggr,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__anxdep ------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__anxdep_nm
#' @format `vars_mh_p_abcl__synd__anxdep` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__anxdep` scores.
vars_mh_p_abcl__synd__anxdep <- c(
  "mh_p_abcl__anxdep_001",
  "mh_p_abcl__anxdep_002",
  "mh_p_abcl__anxdep_003",
  "mh_p_abcl__anxdep_004",
  "mh_p_abcl__anxdep__anx_001",
  "mh_p_abcl__anxdep__anx_002",
  "mh_p_abcl__anxdep__anx_003",
  "mh_p_abcl__anxdep__avoid_001",
  "mh_p_abcl__anxdep__avoid_002",
  "mh_p_abcl__anxdep__dep_001",
  "mh_p_abcl__anxdep__dep_002",
  "mh_p_abcl__anxdep__dep_003",
  "mh_p_abcl__anxdep__dep_004",
  "mh_p_abcl__anxdep__dep_005"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__anxdep_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__anxdep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__anxdep_nm", vars_mh_p_abcl__synd__anxdep))
#'   )
#' }
compute_mh_p_abcl__synd__anxdep_nm <- function(
    data,
    name = "mh_p_abcl__synd__anxdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__anxdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__anxdep_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__anxdep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__anxdep_sum", vars_mh_p_abcl__synd__anxdep))
#'   )
#' }
compute_mh_p_abcl__synd__anxdep_sum <- function(
    data,
    name = "mh_p_abcl__synd__anxdep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__anxdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__anxdep_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__anxdep_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__anxdep_tscore", vars_mh_p_abcl__synd__anxdep))
#'   )
#' }
compute_mh_p_abcl__synd__anxdep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__anxdep_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__anxdep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__attn --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__attn_nm
#' @format `vars_mh_p_abcl__synd__attn` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__attn` scores.
vars_mh_p_abcl__synd__attn <- c(
  "mh_p_abcl__attn_001",
  "mh_p_abcl__attn_002",
  "mh_p_abcl__attn_003",
  "mh_p_abcl__attn_004",
  "mh_p_abcl__attn_005",
  "mh_p_abcl__attn_006",
  "mh_p_abcl__attn__adhd_001",
  "mh_p_abcl__attn__adhd_002",
  "mh_p_abcl__attn__adhd_003",
  "mh_p_abcl__attn__adhd_004",
  "mh_p_abcl__attn__adhd_005",
  "mh_p_abcl__attn__adhd_006",
  "mh_p_abcl__attn__adhd_007",
  "mh_p_abcl__attn__antsoc_001",
  "mh_p_abcl__attn__dep_001",
  "mh_p_abcl__attn__dep_002",
  "mh_p_abcl__attn__dep_003"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__attn_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__attn_nm", vars_mh_p_abcl__synd__attn))
#'   )
#' }
compute_mh_p_abcl__synd__attn_nm <- function(
    data,
    name = "mh_p_abcl__synd__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__attn_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__attn_sum", vars_mh_p_abcl__synd__attn))
#'   )
#' }
compute_mh_p_abcl__synd__attn_sum <- function(
    data,
    name = "mh_p_abcl__synd__attn_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__attn_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__attn_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__attn_tscore", vars_mh_p_abcl__synd__attn))
#'   )
#' }
compute_mh_p_abcl__synd__attn_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__attn_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__attn,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__ext ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__ext_nm
#' @format `vars_mh_p_abcl__synd__ext` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__ext` scores.
vars_mh_p_abcl__synd__ext <- c(
  "mh_p_abcl__aggr_001",
  "mh_p_abcl__aggr_002",
  "mh_p_abcl__aggr_003",
  "mh_p_abcl__aggr_004",
  "mh_p_abcl__aggr_005",
  "mh_p_abcl__aggr_006",
  "mh_p_abcl__aggr_007",
  "mh_p_abcl__aggr__adhd_001",
  "mh_p_abcl__aggr__antsoc_001",
  "mh_p_abcl__aggr__antsoc_002",
  "mh_p_abcl__aggr__antsoc_003",
  "mh_p_abcl__aggr__antsoc_004",
  "mh_p_abcl__aggr__antsoc_005",
  "mh_p_abcl__aggr__antsoc_006",
  "mh_p_abcl__aggr__antsoc_007",
  "mh_p_abcl__aggr__antsoc_008",
  "mh_p_abcl__rule_001",
  "mh_p_abcl__rule_002",
  "mh_p_abcl__rule_003",
  "mh_p_abcl__rule__adhd_001",
  "mh_p_abcl__rule__antsoc_001",
  "mh_p_abcl__rule__antsoc_002",
  "mh_p_abcl__rule__antsoc_003",
  "mh_p_abcl__rule__antsoc_004",
  "mh_p_abcl__rule__antsoc_005",
  "mh_p_abcl__rule__antsoc_006",
  "mh_p_abcl__rule__antsoc_007",
  "mh_p_abcl__rule__antsoc_008",
  "mh_p_abcl__rule__antsoc_009",
  "mh_p_abcl__intru_001",
  "mh_p_abcl__intru_002",
  "mh_p_abcl__intru_003",
  "mh_p_abcl__intru_004",
  "mh_p_abcl__intru_005",
  "mh_p_abcl__intru_006"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - External):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__ext_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - External): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__ext_nm", vars_mh_p_abcl__synd__ext))
#'   )
#' }
compute_mh_p_abcl__synd__ext_nm <- function(
    data,
    name = "mh_p_abcl__synd__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - External):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__ext_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - External): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 35 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__ext_sum", vars_mh_p_abcl__synd__ext))
#'   )
#' }
compute_mh_p_abcl__synd__ext_sum <- function(
    data,
    name = "mh_p_abcl__synd__ext_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - External):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__ext_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - External): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 35 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__ext_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__ext_tscore", vars_mh_p_abcl__synd__ext))
#'   )
#' }
compute_mh_p_abcl__synd__ext_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__ext_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__ext,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__int ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__int_nm
#' @format `vars_mh_p_abcl__synd__int` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__int` scores.
vars_mh_p_abcl__synd__int <- c(
  "mh_p_abcl__anxdep_001",
  "mh_p_abcl__anxdep_002",
  "mh_p_abcl__anxdep_003",
  "mh_p_abcl__anxdep_004",
  "mh_p_abcl__anxdep__anx_001",
  "mh_p_abcl__anxdep__anx_002",
  "mh_p_abcl__anxdep__anx_003",
  "mh_p_abcl__anxdep__avoid_001",
  "mh_p_abcl__anxdep__avoid_002",
  "mh_p_abcl__anxdep__dep_001",
  "mh_p_abcl__anxdep__dep_002",
  "mh_p_abcl__anxdep__dep_003",
  "mh_p_abcl__anxdep__dep_004",
  "mh_p_abcl__anxdep__dep_005",
  "mh_p_abcl__wthdr_001",
  "mh_p_abcl__wthdr_002",
  "mh_p_abcl__wthdr_003",
  "mh_p_abcl__wthdr_004",
  "mh_p_abcl__wthdr__avoid_001",
  "mh_p_abcl__wthdr__avoid_002",
  "mh_p_abcl__wthdr__avoid_003",
  "mh_p_abcl__wthdr__avoid_004",
  "mh_p_abcl__wthdr__dep_001",
  "mh_p_abcl__som_001",
  "mh_p_abcl__som__dep_001",
  "mh_p_abcl__som__somat_001",
  "mh_p_abcl__som__somat_002",
  "mh_p_abcl__som__somat_003",
  "mh_p_abcl__som__somat_004",
  "mh_p_abcl__som__somat_005",
  "mh_p_abcl__som__somat_006",
  "mh_p_abcl__som__somat_007"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Internalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__int_nm`
#' Adult Behavior Checklist \[Parent\] (Internalizing): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__int_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__int_nm", vars_mh_p_abcl__synd__int))
#'   )
#' }
compute_mh_p_abcl__synd__int_nm <- function(
    data,
    name = "mh_p_abcl__synd__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Internalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__int_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__int_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__int_sum", vars_mh_p_abcl__synd__int))
#'   )
#' }
compute_mh_p_abcl__synd__int_sum <- function(
    data,
    name = "mh_p_abcl__synd__int_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale -
#' Internalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__int_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__int_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__int_tscore", vars_mh_p_abcl__synd__int))
#'   )
#' }
compute_mh_p_abcl__synd__int_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__int_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__int,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__intru -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__intru_nm
#' @format `vars_mh_p_abcl__synd__intru` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__intru` scores.
vars_mh_p_abcl__synd__intru <- c(
  "mh_p_abcl__intru_001",
  "mh_p_abcl__intru_002",
  "mh_p_abcl__intru_003",
  "mh_p_abcl__intru_004",
  "mh_p_abcl__intru_005",
  "mh_p_abcl__intru_006"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__intru_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__intru |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__intru_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__intru_nm", vars_mh_p_abcl__synd__intru))
#'   )
#' }
compute_mh_p_abcl__synd__intru_nm <- function(
    data,
    name = "mh_p_abcl__synd__intru_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__intru,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__intru_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__intru |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__intru_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__intru_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__intru_sum", vars_mh_p_abcl__synd__intru))
#'   )
#' }
compute_mh_p_abcl__synd__intru_sum <- function(
    data,
    name = "mh_p_abcl__synd__intru_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__intru,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__intru_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Intrusive):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__intru |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__intru_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__intru_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__intru_tscore", vars_mh_p_abcl__synd__intru))
#'   )
#' }
compute_mh_p_abcl__synd__intru_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__intru_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__intru,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__othpr -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__othpr_nm
#' @format `vars_mh_p_abcl__synd__othpr` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__othpr` scores.
vars_mh_p_abcl__synd__othpr <- c(
  "mh_p_abcl__othpr_001",
  "mh_p_abcl__othpr_002",
  "mh_p_abcl__othpr_003",
  "mh_p_abcl__othpr_004",
  "mh_p_abcl__othpr_005",
  "mh_p_abcl__othpr_006",
  "mh_p_abcl__othpr_007",
  "mh_p_abcl__othpr_008",
  "mh_p_abcl__othpr_009",
  "mh_p_abcl__othpr_010",
  "mh_p_abcl__othpr_011",
  "mh_p_abcl__othpr_012",
  "mh_p_abcl__othpr__adhd_001",
  "mh_p_abcl__othpr__adhd_002",
  "mh_p_abcl__othpr__adhd_003",
  "mh_p_abcl__othpr__adhd_004",
  "mh_p_abcl__othpr__antsoc_001",
  "mh_p_abcl__othpr__antsoc_002",
  "mh_p_abcl__othpr__anx_001",
  "mh_p_abcl__othpr__anx_002",
  "mh_p_abcl__othpr__anx_003",
  "mh_p_abcl__othpr__avoid_001",
  "mh_p_abcl__othpr__dep_001",
  "mh_p_abcl__othpr__dep_002",
  "mh_p_abcl__othpr__dep_003"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Other
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__othpr_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Other problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__othpr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__othpr_nm", vars_mh_p_abcl__synd__othpr))
#'   )
#' }
compute_mh_p_abcl__synd__othpr_nm <- function(
    data,
    name = "mh_p_abcl__synd__othpr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__othpr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Other
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__othpr_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Other problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 25 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__othpr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__othpr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__othpr_sum", vars_mh_p_abcl__synd__othpr))
#'   )
#' }
compute_mh_p_abcl__synd__othpr_sum <- function(
    data,
    name = "mh_p_abcl__synd__othpr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__othpr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_abcl__synd__rule --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__rule_nm
#' @format `vars_mh_p_abcl__synd__rule` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__rule` scores.
vars_mh_p_abcl__synd__rule <- c(
  "mh_p_abcl__rule_001",
  "mh_p_abcl__rule_002",
  "mh_p_abcl__rule_003",
  "mh_p_abcl__rule__adhd_001",
  "mh_p_abcl__rule__antsoc_001",
  "mh_p_abcl__rule__antsoc_002",
  "mh_p_abcl__rule__antsoc_003",
  "mh_p_abcl__rule__antsoc_004",
  "mh_p_abcl__rule__antsoc_005",
  "mh_p_abcl__rule__antsoc_006",
  "mh_p_abcl__rule__antsoc_007",
  "mh_p_abcl__rule__antsoc_008",
  "mh_p_abcl__rule__antsoc_009"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__rule_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__rule_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__rule_nm", vars_mh_p_abcl__synd__rule))
#'   )
#' }
compute_mh_p_abcl__synd__rule_nm <- function(
    data,
    name = "mh_p_abcl__synd__rule_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__rule,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__rule_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__rule_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__rule_sum", vars_mh_p_abcl__synd__rule))
#'   )
#' }
compute_mh_p_abcl__synd__rule_sum <- function(
    data,
    name = "mh_p_abcl__synd__rule_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__rule,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__rule_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__rule_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__rule_tscore", vars_mh_p_abcl__synd__rule))
#'   )
#' }
compute_mh_p_abcl__synd__rule_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__rule_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__rule,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__som ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__som_nm
#' @format `vars_mh_p_abcl__synd__som` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__som` scores.
vars_mh_p_abcl__synd__som <- c(
  "mh_p_abcl__som_001",
  "mh_p_abcl__som__dep_001",
  "mh_p_abcl__som__somat_001",
  "mh_p_abcl__som__somat_002",
  "mh_p_abcl__som__somat_003",
  "mh_p_abcl__som__somat_004",
  "mh_p_abcl__som__somat_005",
  "mh_p_abcl__som__somat_006",
  "mh_p_abcl__som__somat_007"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__som_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__som_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__som_nm", vars_mh_p_abcl__synd__som))
#'   )
#' }
compute_mh_p_abcl__synd__som_nm <- function(
    data,
    name = "mh_p_abcl__synd__som_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__som,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__som_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__som_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__som_sum", vars_mh_p_abcl__synd__som))
#'   )
#' }
compute_mh_p_abcl__synd__som_sum <- function(
    data,
    name = "mh_p_abcl__synd__som_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__som,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__som_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__som_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__som_tscore", vars_mh_p_abcl__synd__som))
#'   )
#' }
compute_mh_p_abcl__synd__som_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__som_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__som,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__tho ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__tho_nm
#' @format `vars_mh_p_abcl__synd__tho` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__tho` scores.
vars_mh_p_abcl__synd__tho <- c(
  "mh_p_abcl__tho_001",
  "mh_p_abcl__tho_002",
  "mh_p_abcl__tho_003",
  "mh_p_abcl__tho_004",
  "mh_p_abcl__tho_005",
  "mh_p_abcl__tho_006",
  "mh_p_abcl__tho_007",
  "mh_p_abcl__tho__dep_001",
  "mh_p_abcl__tho__dep_002"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__tho_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__tho_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__tho_nm", vars_mh_p_abcl__synd__tho))
#'   )
#' }
compute_mh_p_abcl__synd__tho_nm <- function(
    data,
    name = "mh_p_abcl__synd__tho_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__tho,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__tho_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__tho_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__tho_sum", vars_mh_p_abcl__synd__tho))
#'   )
#' }
compute_mh_p_abcl__synd__tho_sum <- function(
    data,
    name = "mh_p_abcl__synd__tho_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__tho,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__tho_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__tho_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__tho_tscore", vars_mh_p_abcl__synd__tho))
#'   )
#' }
compute_mh_p_abcl__synd__tho_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__tho_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__tho,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl__synd__wthdr -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_abcl__synd__wthdr_nm
#' @format `vars_mh_p_abcl__synd__wthdr` is vector of all column names
#' used to compute summary score of `mh_p_abcl__synd__wthdr` scores.
vars_mh_p_abcl__synd__wthdr <- c(
  "mh_p_abcl__wthdr_001",
  "mh_p_abcl__wthdr_002",
  "mh_p_abcl__wthdr_003",
  "mh_p_abcl__wthdr_004",
  "mh_p_abcl__wthdr__avoid_001",
  "mh_p_abcl__wthdr__avoid_002",
  "mh_p_abcl__wthdr__avoid_003",
  "mh_p_abcl__wthdr__avoid_004",
  "mh_p_abcl__wthdr__dep_001"
)


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__wthdr_nm`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__wthdr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__wthdr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__wthdr_nm", vars_mh_p_abcl__synd__wthdr))
#'   )
#' }
compute_mh_p_abcl__synd__wthdr_nm <- function(
    data,
    name = "mh_p_abcl__synd__wthdr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_abcl__synd__wthdr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__wthdr_sum`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__wthdr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__wthdr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__wthdr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__wthdr_sum", vars_mh_p_abcl__synd__wthdr))
#'   )
#' }
compute_mh_p_abcl__synd__wthdr_sum <- function(
    data,
    name = "mh_p_abcl__synd__wthdr_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_abcl__synd__wthdr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_abcl__synd__wthdr_tscore`
#' Adult Behavior Checklist \[Parent\] (Syndrome Scale - Withdrawn):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_abcl__synd__wthdr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_abcl__synd__wthdr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl__synd__wthdr_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_abcl__synd__wthdr_tscore", vars_mh_p_abcl__synd__wthdr))
#'   )
#' }
compute_mh_p_abcl__synd__wthdr_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_abcl__synd__wthdr_tscore",
    col_age = "mh_p_abcl__cg2__age_001",
    col_sex = "mh_p_abcl__cg2_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_abcl__synd__wthdr,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_abcl all ----------------------------------------------------------------
#' Compute all summary scores for mh_p_abcl.
#' @description
#' This function computes all summary scores for the mh_p_abcl form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_abcl_all(data)
#' }
compute_mh_p_abcl_all <- function(data) {
  data |>
    compute_mh_p_abcl__cg2_sex() |>
    compute_mh_p_abcl__afs__frnd_nm() |>
    compute_mh_p_abcl__afs__frnd_sum() |>
    compute_mh_p_abcl__afs__frnd_tscore() |>
    compute_mh_p_abcl__critic_nm() |>
    compute_mh_p_abcl__critic_sum() |>
    compute_mh_p_abcl__critic_tscore() |>
    compute_mh_p_abcl__dsm__adhd_nm() |>
    compute_mh_p_abcl__dsm__adhd_sum() |>
    compute_mh_p_abcl__dsm__adhd_tscore() |>
    compute_mh_p_abcl__dsm__antsoc_nm() |>
    compute_mh_p_abcl__dsm__antsoc_sum() |>
    compute_mh_p_abcl__dsm__antsoc_tscore() |>
    compute_mh_p_abcl__dsm__anx_nm() |>
    compute_mh_p_abcl__dsm__anx_sum() |>
    compute_mh_p_abcl__dsm__anx_tscore() |>
    compute_mh_p_abcl__dsm__avoid_nm() |>
    compute_mh_p_abcl__dsm__avoid_sum() |>
    compute_mh_p_abcl__dsm__avoid_tscore() |>
    compute_mh_p_abcl__dsm__dep_nm() |>
    compute_mh_p_abcl__dsm__dep_sum() |>
    compute_mh_p_abcl__dsm__dep_tscore() |>
    compute_mh_p_abcl__dsm__somat_nm() |>
    compute_mh_p_abcl__dsm__somat_sum() |>
    compute_mh_p_abcl__dsm__somat_tscore() |>
    compute_mh_p_abcl__synd__ext_nm() |>
    compute_mh_p_abcl__synd__int_nm() |>
    compute_mh_p_abcl__su__drg_nm() |>
    compute_mh_p_abcl__su__drg_sum() |>
    compute_mh_p_abcl__su__drg_tscore() |>
    compute_mh_p_abcl__su__drunk_nm() |>
    compute_mh_p_abcl__su__drunk_sum() |>
    compute_mh_p_abcl__su__drunk_tscore() |>
    compute_mh_p_abcl__su__nic_nm() |>
    compute_mh_p_abcl__su__nic_sum() |>
    compute_mh_p_abcl__su__nic_tscore() |>
    compute_mh_p_abcl__su_nm() |>
    compute_mh_p_abcl__su_sum() |>
    compute_mh_p_abcl__su_tscore() |>
    compute_mh_p_abcl__synd__aggr_nm() |>
    compute_mh_p_abcl__synd__aggr_sum() |>
    compute_mh_p_abcl__synd__aggr_tscore() |>
    compute_mh_p_abcl__synd__anxdep_nm() |>
    compute_mh_p_abcl__synd__anxdep_sum() |>
    compute_mh_p_abcl__synd__anxdep_tscore() |>
    compute_mh_p_abcl__synd__attn_nm() |>
    compute_mh_p_abcl__synd__attn_sum() |>
    compute_mh_p_abcl__synd__attn_tscore() |>
    compute_mh_p_abcl__synd__ext_sum() |>
    compute_mh_p_abcl__synd__ext_tscore() |>
    compute_mh_p_abcl__synd__int_sum() |>
    compute_mh_p_abcl__synd__int_tscore() |>
    compute_mh_p_abcl__synd__intru_nm() |>
    compute_mh_p_abcl__synd__intru_sum() |>
    compute_mh_p_abcl__synd__intru_tscore() |>
    compute_mh_p_abcl__synd__othpr_nm() |>
    compute_mh_p_abcl__synd__othpr_sum() |>
    compute_mh_p_abcl__synd__rule_nm() |>
    compute_mh_p_abcl__synd__rule_sum() |>
    compute_mh_p_abcl__synd__rule_tscore() |>
    compute_mh_p_abcl__synd__som_nm() |>
    compute_mh_p_abcl__synd__som_sum() |>
    compute_mh_p_abcl__synd__som_tscore() |>
    compute_mh_p_abcl__synd__tho_nm() |>
    compute_mh_p_abcl__synd__tho_sum() |>
    compute_mh_p_abcl__synd__tho_tscore() |>
    compute_mh_p_abcl__synd__wthdr_nm() |>
    compute_mh_p_abcl__synd__wthdr_sum() |>
    compute_mh_p_abcl__synd__wthdr_tscore() |>
    compute_mh_p_abcl_nm() |>
    compute_mh_p_abcl_sum() |>
    compute_mh_p_abcl_tscore()
}


# mh_p_asr ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr_nm
#' @format `vars_mh_p_asr` is vector of all column names
#' used to compute summary score of `mh_p_asr` scores.
vars_mh_p_asr <- c(
  "mh_p_asr__aggr_001",
  "mh_p_asr__aggr__antsoc_003",
  "mh_p_asr__aggr__antsoc_006",
  "mh_p_asr__aggr__antsoc_008",
  "mh_p_asr__anxdep__dep_001",
  "mh_p_asr__anxdep__dep_004",
  "mh_p_asr__anxdep__dep_005",
  "mh_p_asr__attn__inatt_002",
  "mh_p_asr__othpr__hypimp_001",
  "mh_p_asr__othpr__antsoc_001",
  "mh_p_asr__rule_001",
  "mh_p_asr__rule_003",
  "mh_p_asr__rule__antsoc_007",
  "mh_p_asr__tho_001",
  "mh_p_asr__tho_002",
  "mh_p_asr__tho_005",
  "mh_p_asr__tho_006",
  "mh_p_asr__tho_007",
  "mh_p_asr__tho__dep_001",
  "mh_p_asr__aggr__hypimp_001",
  "mh_p_asr__othpr__hypimp_002",
  "mh_p_asr__othpr__hypimp_003",
  "mh_p_asr__rule__hypimp_001",
  "mh_p_asr__tho__hypimp_001",
  "mh_p_asr__attn__inatt_001",
  "mh_p_asr__attn__inatt_003",
  "mh_p_asr__attn__inatt_004",
  "mh_p_asr__attn__inatt_005",
  "mh_p_asr__attn__inatt_006",
  "mh_p_asr__attn__inatt_007",
  "mh_p_asr__aggr__antsoc_001",
  "mh_p_asr__aggr__antsoc_002",
  "mh_p_asr__aggr__antsoc_004",
  "mh_p_asr__aggr__antsoc_005",
  "mh_p_asr__aggr__antsoc_007",
  "mh_p_asr__attn__antsoc_001",
  "mh_p_asr__othpr__antsoc_002",
  "mh_p_asr__rule__antsoc_001",
  "mh_p_asr__rule__antsoc_002",
  "mh_p_asr__rule__antsoc_003",
  "mh_p_asr__rule__antsoc_004",
  "mh_p_asr__rule__antsoc_005",
  "mh_p_asr__rule__antsoc_006",
  "mh_p_asr__rule__antsoc_008",
  "mh_p_asr__rule__antsoc_009",
  "mh_p_asr__anxdep__anx_001",
  "mh_p_asr__anxdep__anx_002",
  "mh_p_asr__anxdep__anx_003",
  "mh_p_asr__anxdep__anx_004",
  "mh_p_asr__othpr__anx_001",
  "mh_p_asr__othpr__anx_002",
  "mh_p_asr__anxdep__avoid_001",
  "mh_p_asr__anxdep__avoid_002",
  "mh_p_asr__othpr__avoid_001",
  "mh_p_asr__wthdr__avoid_001",
  "mh_p_asr__wthdr__avoid_002",
  "mh_p_asr__wthdr__avoid_003",
  "mh_p_asr__wthdr__avoid_004",
  "mh_p_asr__anxdep__dep_002",
  "mh_p_asr__anxdep__dep_003",
  "mh_p_asr__anxdep__dep_006",
  "mh_p_asr__attn__dep_001",
  "mh_p_asr__attn__dep_002",
  "mh_p_asr__othpr__dep_001",
  "mh_p_asr__othpr__dep_002",
  "mh_p_asr__som__dep_001",
  "mh_p_asr__som__dep_002",
  "mh_p_asr__wthdr__dep_001",
  "mh_p_asr__som__somat_001",
  "mh_p_asr__som__somat_002",
  "mh_p_asr__som__somat_003",
  "mh_p_asr__som__somat_004",
  "mh_p_asr__som__somat_005",
  "mh_p_asr__som__somat_006",
  "mh_p_asr__som__somat_007",
  "mh_p_asr__som__somat_008",
  "mh_p_asr__som__somat_009",
  "mh_p_asr__aggr_002",
  "mh_p_asr__aggr_003",
  "mh_p_asr__aggr_004",
  "mh_p_asr__aggr_005",
  "mh_p_asr__aggr_006",
  "mh_p_asr__anxdep_001",
  "mh_p_asr__anxdep_002",
  "mh_p_asr__anxdep_003",
  "mh_p_asr__anxdep_004",
  "mh_p_asr__anxdep_005",
  "mh_p_asr__anxdep_006",
  "mh_p_asr__attn_001",
  "mh_p_asr__attn_002",
  "mh_p_asr__attn_003",
  "mh_p_asr__attn_004",
  "mh_p_asr__attn_005",
  "mh_p_asr__intru_001",
  "mh_p_asr__intru_002",
  "mh_p_asr__intru_003",
  "mh_p_asr__intru_004",
  "mh_p_asr__intru_005",
  "mh_p_asr__intru_006",
  "mh_p_asr__rule_002",
  "mh_p_asr__rule_004",
  "mh_p_asr__som_001",
  "mh_p_asr__wthdr_001",
  "mh_p_asr__wthdr_002",
  "mh_p_asr__wthdr_003",
  "mh_p_asr__wthdr_004",
  "mh_p_asr__othpr_001",
  "mh_p_asr__othpr_002",
  "mh_p_asr__othpr_003",
  "mh_p_asr__othpr_004",
  "mh_p_asr__othpr_005",
  "mh_p_asr__othpr_006",
  "mh_p_asr__othpr_007",
  "mh_p_asr__othpr_008",
  "mh_p_asr__othpr_009",
  "mh_p_asr__othpr_010",
  "mh_p_asr__othpr_011",
  "mh_p_asr__tho_003",
  "mh_p_asr__tho_004",
  "mh_p_asr__tho_008"
)


#' Compute "Adult Self Report \[Parent\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr_nm`
#' Adult Self Report \[Parent\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr_nm", vars_mh_p_asr))
#'   )
#' }
compute_mh_p_asr_nm <- function(
    data,
    name = "mh_p_asr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\]: Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr_sum`
#' Adult Self Report \[Parent\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 8 of 120 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr_sum", vars_mh_p_asr))
#'   )
#' }
compute_mh_p_asr_sum <- function(
    data,
    name = "mh_p_asr_sum",
    max_na = 8,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__afs__strng ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__afs__strng_nm
#' @format `vars_mh_p_asr__afs__strng` is vector of all column names
#' used to compute summary score of `mh_p_asr__afs__strng` scores.
vars_mh_p_asr__afs__strng <- c(
  "mh_p_asr__strng_001",
  "mh_p_asr__strng_002",
  "mh_p_asr__strng_003",
  "mh_p_asr__strng_004",
  "mh_p_asr__strng_005",
  "mh_p_asr__strng_006",
  "mh_p_asr__strng_007",
  "mh_p_asr__strng_008",
  "mh_p_asr__strng_009",
  "mh_p_asr__strng_010",
  "mh_p_asr__strng_011"
)


#' Compute "Adult Self Report \[Parent\] (Adaptive Functioning Scale - Personal
#' strength): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__afs__strng_nm`
#' Adult Self Report \[Parent\] (Adaptive Functioning Scale - Personal
#' strength): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__afs__strng |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__afs__strng_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__afs__strng_nm", vars_mh_p_asr__afs__strng))
#'   )
#' }
compute_mh_p_asr__afs__strng_nm <- function(
    data,
    name = "mh_p_asr__afs__strng_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__afs__strng,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Adaptive Functioning Scale - Personal
#' strength): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__afs__strng_sum`
#' Adult Self Report \[Parent\] (Adaptive Functioning Scale - Personal
#' strength): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__afs__strng |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__afs__strng_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__afs__strng_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__afs__strng_sum", vars_mh_p_asr__afs__strng))
#'   )
#' }
compute_mh_p_asr__afs__strng_sum <- function(
    data,
    name = "mh_p_asr__afs__strng_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__afs__strng,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__critic -------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__critic_nm
#' @format `vars_mh_p_asr__critic` is vector of all column names
#' used to compute summary score of `mh_p_asr__critic` scores.
vars_mh_p_asr__critic <- c(
  "mh_p_asr__aggr_001",
  "mh_p_asr__aggr__antsoc_003",
  "mh_p_asr__aggr__antsoc_006",
  "mh_p_asr__aggr__antsoc_008",
  "mh_p_asr__anxdep__dep_001",
  "mh_p_asr__anxdep__dep_004",
  "mh_p_asr__anxdep__dep_005",
  "mh_p_asr__attn__inatt_002",
  "mh_p_asr__othpr__hypimp_001",
  "mh_p_asr__othpr__antsoc_001",
  "mh_p_asr__rule_001",
  "mh_p_asr__rule_003",
  "mh_p_asr__rule__antsoc_007",
  "mh_p_asr__tho_001",
  "mh_p_asr__tho_002",
  "mh_p_asr__tho_005",
  "mh_p_asr__tho_006",
  "mh_p_asr__tho_007",
  "mh_p_asr__tho__dep_001"
)


#' Compute "Adult Self Report \[Parent\] (Critical Items): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__critic_nm`
#' Adult Self Report \[Parent\] (Critical Items): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__critic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__critic_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__critic_nm", vars_mh_p_asr__critic))
#'   )
#' }
compute_mh_p_asr__critic_nm <- function(
    data,
    name = "mh_p_asr__critic_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__critic,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Critical Items): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__critic_sum`
#' Adult Self Report \[Parent\] (Critical Items): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__critic |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 19 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__critic_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__critic_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__critic_sum", vars_mh_p_asr__critic))
#'   )
#' }
compute_mh_p_asr__critic_sum <- function(
    data,
    name = "mh_p_asr__critic_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__critic,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__adhd ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__adhd_nm
#' @format `vars_mh_p_asr__dsm__adhd` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__adhd` scores.
vars_mh_p_asr__dsm__adhd <- c(
  "mh_p_asr__attn__inatt_001",
  "mh_p_asr__attn__inatt_002",
  "mh_p_asr__attn__inatt_003",
  "mh_p_asr__attn__inatt_004",
  "mh_p_asr__attn__inatt_005",
  "mh_p_asr__attn__inatt_006",
  "mh_p_asr__attn__inatt_007",
  "mh_p_asr__aggr__hypimp_001",
  "mh_p_asr__othpr__hypimp_001",
  "mh_p_asr__othpr__hypimp_002",
  "mh_p_asr__othpr__hypimp_003",
  "mh_p_asr__rule__hypimp_001",
  "mh_p_asr__tho__hypimp_001"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd_nm", vars_mh_p_asr__dsm__adhd))
#'   )
#' }
compute_mh_p_asr__dsm__adhd_nm <- function(
    data,
    name = "mh_p_asr__dsm__adhd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd_sum", vars_mh_p_asr__dsm__adhd))
#'   )
#' }
compute_mh_p_asr__dsm__adhd_sum <- function(
    data,
    name = "mh_p_asr__dsm__adhd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__adhd__hypimp --------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__adhd__hypimp_nm
#' @format `vars_mh_p_asr__dsm__adhd__hypimp` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__adhd__hypimp` scores.
vars_mh_p_asr__dsm__adhd__hypimp <- c(
  "mh_p_asr__aggr__hypimp_001",
  "mh_p_asr__othpr__hypimp_001",
  "mh_p_asr__othpr__hypimp_002",
  "mh_p_asr__othpr__hypimp_003",
  "mh_p_asr__rule__hypimp_001",
  "mh_p_asr__tho__hypimp_001"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Hyperactivity-Impulsivity): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd__hypimp_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Hyperactivity-Impulsivity): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd__hypimp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd__hypimp_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd__hypimp_nm", vars_mh_p_asr__dsm__adhd__hypimp))
#'   )
#' }
compute_mh_p_asr__dsm__adhd__hypimp_nm <- function(
    data,
    name = "mh_p_asr__dsm__adhd__hypimp_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd__hypimp,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Hyperactivity-Impulsivity): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd__hypimp_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Hyperactivity-Impulsivity): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd__hypimp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__adhd__hypimp_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd__hypimp_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd__hypimp_sum", vars_mh_p_asr__dsm__adhd__hypimp))
#'   )
#' }
compute_mh_p_asr__dsm__adhd__hypimp_sum <- function(
    data,
    name = "mh_p_asr__dsm__adhd__hypimp_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd__hypimp,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__adhd__inatt ---------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__adhd__inatt_nm
#' @format `vars_mh_p_asr__dsm__adhd__inatt` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__adhd__inatt` scores.
vars_mh_p_asr__dsm__adhd__inatt <- c(
  "mh_p_asr__attn__inatt_001",
  "mh_p_asr__attn__inatt_002",
  "mh_p_asr__attn__inatt_003",
  "mh_p_asr__attn__inatt_004",
  "mh_p_asr__attn__inatt_005",
  "mh_p_asr__attn__inatt_006",
  "mh_p_asr__attn__inatt_007"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Inattention): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd__inatt_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD Inattention):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd__inatt |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd__inatt_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd__inatt_nm", vars_mh_p_asr__dsm__adhd__inatt))
#'   )
#' }
compute_mh_p_asr__dsm__adhd__inatt_nm <- function(
    data,
    name = "mh_p_asr__dsm__adhd__inatt_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd__inatt,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD
#' Inattention): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__adhd__inatt_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD Inattention):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__adhd__inatt |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__adhd__inatt_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__adhd__inatt_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__adhd__inatt_sum", vars_mh_p_asr__dsm__adhd__inatt))
#'   )
#' }
compute_mh_p_asr__dsm__adhd__inatt_sum <- function(
    data,
    name = "mh_p_asr__dsm__adhd__inatt_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__adhd__inatt,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__antsoc --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__antsoc_nm
#' @format `vars_mh_p_asr__dsm__antsoc` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__antsoc` scores.
vars_mh_p_asr__dsm__antsoc <- c(
  "mh_p_asr__aggr__antsoc_001",
  "mh_p_asr__aggr__antsoc_002",
  "mh_p_asr__aggr__antsoc_003",
  "mh_p_asr__aggr__antsoc_004",
  "mh_p_asr__aggr__antsoc_005",
  "mh_p_asr__aggr__antsoc_006",
  "mh_p_asr__aggr__antsoc_007",
  "mh_p_asr__aggr__antsoc_008",
  "mh_p_asr__attn__antsoc_001",
  "mh_p_asr__othpr__antsoc_001",
  "mh_p_asr__othpr__antsoc_002",
  "mh_p_asr__rule__antsoc_001",
  "mh_p_asr__rule__antsoc_002",
  "mh_p_asr__rule__antsoc_003",
  "mh_p_asr__rule__antsoc_004",
  "mh_p_asr__rule__antsoc_005",
  "mh_p_asr__rule__antsoc_006",
  "mh_p_asr__rule__antsoc_007",
  "mh_p_asr__rule__antsoc_008",
  "mh_p_asr__rule__antsoc_009"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__antsoc_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__antsoc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__antsoc_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__antsoc_nm", vars_mh_p_asr__dsm__antsoc))
#'   )
#' }
compute_mh_p_asr__dsm__antsoc_nm <- function(
    data,
    name = "mh_p_asr__dsm__antsoc_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__antsoc,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__antsoc_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Antisocial
#' personality problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__antsoc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 20 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__antsoc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__antsoc_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__antsoc_sum", vars_mh_p_asr__dsm__antsoc))
#'   )
#' }
compute_mh_p_asr__dsm__antsoc_sum <- function(
    data,
    name = "mh_p_asr__dsm__antsoc_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__antsoc,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__anx -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__anx_nm
#' @format `vars_mh_p_asr__dsm__anx` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__anx` scores.
vars_mh_p_asr__dsm__anx <- c(
  "mh_p_asr__anxdep__anx_001",
  "mh_p_asr__anxdep__anx_002",
  "mh_p_asr__anxdep__anx_003",
  "mh_p_asr__anxdep__anx_004",
  "mh_p_asr__othpr__anx_001",
  "mh_p_asr__othpr__anx_002"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__anx_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Anxiety problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__anx_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__anx_nm", vars_mh_p_asr__dsm__anx))
#'   )
#' }
compute_mh_p_asr__dsm__anx_nm <- function(
    data,
    name = "mh_p_asr__dsm__anx_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__anx,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Anxiety
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__anx_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Anxiety problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__anx_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__anx_sum", vars_mh_p_asr__dsm__anx))
#'   )
#' }
compute_mh_p_asr__dsm__anx_sum <- function(
    data,
    name = "mh_p_asr__dsm__anx_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__anx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__avoid ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__avoid_nm
#' @format `vars_mh_p_asr__dsm__avoid` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__avoid` scores.
vars_mh_p_asr__dsm__avoid <- c(
  "mh_p_asr__anxdep__avoid_001",
  "mh_p_asr__anxdep__avoid_002",
  "mh_p_asr__othpr__avoid_001",
  "mh_p_asr__wthdr__avoid_001",
  "mh_p_asr__wthdr__avoid_002",
  "mh_p_asr__wthdr__avoid_003",
  "mh_p_asr__wthdr__avoid_004"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__avoid_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__avoid |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__avoid_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__avoid_nm", vars_mh_p_asr__dsm__avoid))
#'   )
#' }
compute_mh_p_asr__dsm__avoid_nm <- function(
    data,
    name = "mh_p_asr__dsm__avoid_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__avoid,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__avoid_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Avoidant
#' personality problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__avoid |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__avoid_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__avoid_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__avoid_sum", vars_mh_p_asr__dsm__avoid))
#'   )
#' }
compute_mh_p_asr__dsm__avoid_sum <- function(
    data,
    name = "mh_p_asr__dsm__avoid_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__avoid,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__dep -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__dep_nm
#' @format `vars_mh_p_asr__dsm__dep` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__dep` scores.
vars_mh_p_asr__dsm__dep <- c(
  "mh_p_asr__anxdep__dep_001",
  "mh_p_asr__anxdep__dep_002",
  "mh_p_asr__anxdep__dep_003",
  "mh_p_asr__anxdep__dep_004",
  "mh_p_asr__anxdep__dep_005",
  "mh_p_asr__anxdep__dep_006",
  "mh_p_asr__attn__dep_001",
  "mh_p_asr__attn__dep_002",
  "mh_p_asr__othpr__dep_001",
  "mh_p_asr__othpr__dep_002",
  "mh_p_asr__som__dep_001",
  "mh_p_asr__som__dep_002",
  "mh_p_asr__tho__dep_001",
  "mh_p_asr__wthdr__dep_001"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Depresssive
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__dep_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Depresssive
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__dep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__dep_nm", vars_mh_p_asr__dsm__dep))
#'   )
#' }
compute_mh_p_asr__dsm__dep_nm <- function(
    data,
    name = "mh_p_asr__dsm__dep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__dep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Depresssive
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__dep_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Depresssive
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__dep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__dep_sum", vars_mh_p_asr__dsm__dep))
#'   )
#' }
compute_mh_p_asr__dsm__dep_sum <- function(
    data,
    name = "mh_p_asr__dsm__dep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__dep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__dsm__somat ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__dsm__somat_nm
#' @format `vars_mh_p_asr__dsm__somat` is vector of all column names
#' used to compute summary score of `mh_p_asr__dsm__somat` scores.
vars_mh_p_asr__dsm__somat <- c(
  "mh_p_asr__som__somat_001",
  "mh_p_asr__som__somat_002",
  "mh_p_asr__som__somat_003",
  "mh_p_asr__som__somat_004",
  "mh_p_asr__som__somat_005",
  "mh_p_asr__som__somat_006",
  "mh_p_asr__som__somat_007",
  "mh_p_asr__som__somat_008",
  "mh_p_asr__som__somat_009"
)


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__somat_nm`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__somat_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__somat_nm", vars_mh_p_asr__dsm__somat))
#'   )
#' }
compute_mh_p_asr__dsm__somat_nm <- function(
    data,
    name = "mh_p_asr__dsm__somat_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__dsm__somat,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__dsm__somat_sum`
#' Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__dsm__somat_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__dsm__somat_sum", vars_mh_p_asr__dsm__somat))
#'   )
#' }
compute_mh_p_asr__dsm__somat_sum <- function(
    data,
    name = "mh_p_asr__dsm__somat_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__dsm__somat,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__aggr ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__aggr_nm
#' @format `vars_mh_p_asr__synd__aggr` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__aggr` scores.
vars_mh_p_asr__synd__aggr <- c(
  "mh_p_asr__aggr_001",
  "mh_p_asr__aggr_002",
  "mh_p_asr__aggr_003",
  "mh_p_asr__aggr_004",
  "mh_p_asr__aggr_005",
  "mh_p_asr__aggr_006",
  "mh_p_asr__aggr__hypimp_001",
  "mh_p_asr__aggr__antsoc_001",
  "mh_p_asr__aggr__antsoc_002",
  "mh_p_asr__aggr__antsoc_003",
  "mh_p_asr__aggr__antsoc_004",
  "mh_p_asr__aggr__antsoc_005",
  "mh_p_asr__aggr__antsoc_006",
  "mh_p_asr__aggr__antsoc_007",
  "mh_p_asr__aggr__antsoc_008"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Aggressive Behavior):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__aggr_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Aggressive Behavior):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__aggr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__aggr_nm", vars_mh_p_asr__synd__aggr))
#'   )
#' }
compute_mh_p_asr__synd__aggr_nm <- function(
    data,
    name = "mh_p_asr__synd__aggr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__aggr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Aggressive Behavior):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__aggr_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Aggressive Behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__aggr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__aggr_sum", vars_mh_p_asr__synd__aggr))
#'   )
#' }
compute_mh_p_asr__synd__aggr_sum <- function(
    data,
    name = "mh_p_asr__synd__aggr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__aggr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__anxdep -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__anxdep_nm
#' @format `vars_mh_p_asr__synd__anxdep` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__anxdep` scores.
vars_mh_p_asr__synd__anxdep <- c(
  "mh_p_asr__anxdep_001",
  "mh_p_asr__anxdep_002",
  "mh_p_asr__anxdep_003",
  "mh_p_asr__anxdep_004",
  "mh_p_asr__anxdep_005",
  "mh_p_asr__anxdep_006",
  "mh_p_asr__anxdep__anx_001",
  "mh_p_asr__anxdep__anx_002",
  "mh_p_asr__anxdep__anx_003",
  "mh_p_asr__anxdep__anx_004",
  "mh_p_asr__anxdep__avoid_001",
  "mh_p_asr__anxdep__avoid_002",
  "mh_p_asr__anxdep__dep_001",
  "mh_p_asr__anxdep__dep_002",
  "mh_p_asr__anxdep__dep_003",
  "mh_p_asr__anxdep__dep_004",
  "mh_p_asr__anxdep__dep_005",
  "mh_p_asr__anxdep__dep_006"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Anxious/Depressed):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__anxdep_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Anxious/Depressed):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__anxdep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__anxdep_nm", vars_mh_p_asr__synd__anxdep))
#'   )
#' }
compute_mh_p_asr__synd__anxdep_nm <- function(
    data,
    name = "mh_p_asr__synd__anxdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__anxdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Anxious/Depressed):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__anxdep_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Anxious/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 18 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__anxdep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__anxdep_sum", vars_mh_p_asr__synd__anxdep))
#'   )
#' }
compute_mh_p_asr__synd__anxdep_sum <- function(
    data,
    name = "mh_p_asr__synd__anxdep_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__anxdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__attn ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__attn_nm
#' @format `vars_mh_p_asr__synd__attn` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__attn` scores.
vars_mh_p_asr__synd__attn <- c(
  "mh_p_asr__attn_001",
  "mh_p_asr__attn_002",
  "mh_p_asr__attn_003",
  "mh_p_asr__attn_004",
  "mh_p_asr__attn_005",
  "mh_p_asr__attn__inatt_001",
  "mh_p_asr__attn__inatt_002",
  "mh_p_asr__attn__inatt_003",
  "mh_p_asr__attn__inatt_004",
  "mh_p_asr__attn__inatt_005",
  "mh_p_asr__attn__inatt_006",
  "mh_p_asr__attn__inatt_007",
  "mh_p_asr__attn__antsoc_001",
  "mh_p_asr__attn__dep_001",
  "mh_p_asr__attn__dep_002"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Attention problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__attn_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Attention problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__attn_nm", vars_mh_p_asr__synd__attn))
#'   )
#' }
compute_mh_p_asr__synd__attn_nm <- function(
    data,
    name = "mh_p_asr__synd__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Attention problems):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__attn_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Attention problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__attn_sum", vars_mh_p_asr__synd__attn))
#'   )
#' }
compute_mh_p_asr__synd__attn_sum <- function(
    data,
    name = "mh_p_asr__synd__attn_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__ext ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__ext_nm
#' @format `vars_mh_p_asr__synd__ext` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__ext` scores.
vars_mh_p_asr__synd__ext <- c(
  "mh_p_asr__intru_001",
  "mh_p_asr__intru_002",
  "mh_p_asr__intru_003",
  "mh_p_asr__intru_004",
  "mh_p_asr__intru_005",
  "mh_p_asr__intru_006",
  "mh_p_asr__rule_001",
  "mh_p_asr__rule_002",
  "mh_p_asr__rule_003",
  "mh_p_asr__rule_004",
  "mh_p_asr__rule__hypimp_001",
  "mh_p_asr__rule__antsoc_001",
  "mh_p_asr__rule__antsoc_002",
  "mh_p_asr__rule__antsoc_003",
  "mh_p_asr__rule__antsoc_004",
  "mh_p_asr__rule__antsoc_005",
  "mh_p_asr__rule__antsoc_006",
  "mh_p_asr__rule__antsoc_007",
  "mh_p_asr__rule__antsoc_008",
  "mh_p_asr__rule__antsoc_009",
  "mh_p_asr__aggr_001",
  "mh_p_asr__aggr_002",
  "mh_p_asr__aggr_003",
  "mh_p_asr__aggr_004",
  "mh_p_asr__aggr_005",
  "mh_p_asr__aggr_006",
  "mh_p_asr__aggr__hypimp_001",
  "mh_p_asr__aggr__antsoc_001",
  "mh_p_asr__aggr__antsoc_002",
  "mh_p_asr__aggr__antsoc_003",
  "mh_p_asr__aggr__antsoc_004",
  "mh_p_asr__aggr__antsoc_005",
  "mh_p_asr__aggr__antsoc_006",
  "mh_p_asr__aggr__antsoc_007",
  "mh_p_asr__aggr__antsoc_008"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Externalizing):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__ext_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Externalizing): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__ext_nm", vars_mh_p_asr__synd__ext))
#'   )
#' }
compute_mh_p_asr__synd__ext_nm <- function(
    data,
    name = "mh_p_asr__synd__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Externalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__ext_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Externalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 35 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__ext_sum", vars_mh_p_asr__synd__ext))
#'   )
#' }
compute_mh_p_asr__synd__ext_sum <- function(
    data,
    name = "mh_p_asr__synd__ext_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__int ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__int_nm
#' @format `vars_mh_p_asr__synd__int` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__int` scores.
vars_mh_p_asr__synd__int <- c(
  "mh_p_asr__anxdep_001",
  "mh_p_asr__anxdep_002",
  "mh_p_asr__anxdep_003",
  "mh_p_asr__anxdep_004",
  "mh_p_asr__anxdep_005",
  "mh_p_asr__anxdep_006",
  "mh_p_asr__anxdep__anx_001",
  "mh_p_asr__anxdep__anx_002",
  "mh_p_asr__anxdep__anx_003",
  "mh_p_asr__anxdep__anx_004",
  "mh_p_asr__anxdep__avoid_001",
  "mh_p_asr__anxdep__avoid_002",
  "mh_p_asr__anxdep__dep_001",
  "mh_p_asr__anxdep__dep_002",
  "mh_p_asr__anxdep__dep_003",
  "mh_p_asr__anxdep__dep_004",
  "mh_p_asr__anxdep__dep_005",
  "mh_p_asr__anxdep__dep_006",
  "mh_p_asr__som_001",
  "mh_p_asr__som__dep_001",
  "mh_p_asr__som__dep_002",
  "mh_p_asr__som__somat_001",
  "mh_p_asr__som__somat_002",
  "mh_p_asr__som__somat_003",
  "mh_p_asr__som__somat_004",
  "mh_p_asr__som__somat_005",
  "mh_p_asr__som__somat_006",
  "mh_p_asr__som__somat_007",
  "mh_p_asr__som__somat_008",
  "mh_p_asr__som__somat_009",
  "mh_p_asr__wthdr_001",
  "mh_p_asr__wthdr_002",
  "mh_p_asr__wthdr_003",
  "mh_p_asr__wthdr_004",
  "mh_p_asr__wthdr__avoid_001",
  "mh_p_asr__wthdr__avoid_002",
  "mh_p_asr__wthdr__avoid_003",
  "mh_p_asr__wthdr__avoid_004",
  "mh_p_asr__wthdr__dep_001"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Internalizing):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__int_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Internalizing): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__int_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__int_nm", vars_mh_p_asr__synd__int))
#'   )
#' }
compute_mh_p_asr__synd__int_nm <- function(
    data,
    name = "mh_p_asr__synd__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Internalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__int_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Internalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 39 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__int_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__int_sum", vars_mh_p_asr__synd__int))
#'   )
#' }
compute_mh_p_asr__synd__int_sum <- function(
    data,
    name = "mh_p_asr__synd__int_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__intru --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__intru_nm
#' @format `vars_mh_p_asr__synd__intru` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__intru` scores.
vars_mh_p_asr__synd__intru <- c(
  "mh_p_asr__intru_001",
  "mh_p_asr__intru_002",
  "mh_p_asr__intru_003",
  "mh_p_asr__intru_004",
  "mh_p_asr__intru_005",
  "mh_p_asr__intru_006"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Intrusive): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__intru_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Intrusive): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__intru |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__intru_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__intru_nm", vars_mh_p_asr__synd__intru))
#'   )
#' }
compute_mh_p_asr__synd__intru_nm <- function(
    data,
    name = "mh_p_asr__synd__intru_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__intru,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Intrusive): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__intru_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Intrusive): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__intru |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__intru_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__intru_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__intru_sum", vars_mh_p_asr__synd__intru))
#'   )
#' }
compute_mh_p_asr__synd__intru_sum <- function(
    data,
    name = "mh_p_asr__synd__intru_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__intru,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__othpr --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__othpr_nm
#' @format `vars_mh_p_asr__synd__othpr` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__othpr` scores.
vars_mh_p_asr__synd__othpr <- c(
  "mh_p_asr__othpr_001",
  "mh_p_asr__othpr_002",
  "mh_p_asr__othpr_003",
  "mh_p_asr__othpr_004",
  "mh_p_asr__othpr_005",
  "mh_p_asr__othpr_006",
  "mh_p_asr__othpr_007",
  "mh_p_asr__othpr_008",
  "mh_p_asr__othpr_009",
  "mh_p_asr__othpr_010",
  "mh_p_asr__othpr_011",
  "mh_p_asr__othpr__hypimp_001",
  "mh_p_asr__othpr__hypimp_002",
  "mh_p_asr__othpr__hypimp_003",
  "mh_p_asr__othpr__antsoc_001",
  "mh_p_asr__othpr__antsoc_002",
  "mh_p_asr__othpr__anx_001",
  "mh_p_asr__othpr__anx_002",
  "mh_p_asr__othpr__avoid_001",
  "mh_p_asr__othpr__dep_001",
  "mh_p_asr__othpr__dep_002"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Other problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__othpr_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Other problems): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__othpr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__othpr_nm", vars_mh_p_asr__synd__othpr))
#'   )
#' }
compute_mh_p_asr__synd__othpr_nm <- function(
    data,
    name = "mh_p_asr__synd__othpr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__othpr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Other problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__othpr_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Other problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 21 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__othpr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__othpr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__othpr_sum", vars_mh_p_asr__synd__othpr))
#'   )
#' }
compute_mh_p_asr__synd__othpr_sum <- function(
    data,
    name = "mh_p_asr__synd__othpr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__othpr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__rule ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__rule_nm
#' @format `vars_mh_p_asr__synd__rule` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__rule` scores.
vars_mh_p_asr__synd__rule <- c(
  "mh_p_asr__rule_001",
  "mh_p_asr__rule_002",
  "mh_p_asr__rule_003",
  "mh_p_asr__rule_004",
  "mh_p_asr__rule__hypimp_001",
  "mh_p_asr__rule__antsoc_001",
  "mh_p_asr__rule__antsoc_002",
  "mh_p_asr__rule__antsoc_003",
  "mh_p_asr__rule__antsoc_004",
  "mh_p_asr__rule__antsoc_005",
  "mh_p_asr__rule__antsoc_006",
  "mh_p_asr__rule__antsoc_007",
  "mh_p_asr__rule__antsoc_008",
  "mh_p_asr__rule__antsoc_009"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__rule_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Rule breaking behavior):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__rule_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__rule_nm", vars_mh_p_asr__synd__rule))
#'   )
#' }
compute_mh_p_asr__synd__rule_nm <- function(
    data,
    name = "mh_p_asr__synd__rule_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__rule,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__rule_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Rule breaking behavior):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__rule_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__rule_sum", vars_mh_p_asr__synd__rule))
#'   )
#' }
compute_mh_p_asr__synd__rule_sum <- function(
    data,
    name = "mh_p_asr__synd__rule_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__rule,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__som ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__som_nm
#' @format `vars_mh_p_asr__synd__som` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__som` scores.
vars_mh_p_asr__synd__som <- c(
  "mh_p_asr__som_001",
  "mh_p_asr__som__dep_001",
  "mh_p_asr__som__dep_002",
  "mh_p_asr__som__somat_001",
  "mh_p_asr__som__somat_002",
  "mh_p_asr__som__somat_003",
  "mh_p_asr__som__somat_004",
  "mh_p_asr__som__somat_005",
  "mh_p_asr__som__somat_006",
  "mh_p_asr__som__somat_007",
  "mh_p_asr__som__somat_008",
  "mh_p_asr__som__somat_009"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Somatic complaints):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__som_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Somatic complaints):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__som_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__som_nm", vars_mh_p_asr__synd__som))
#'   )
#' }
compute_mh_p_asr__synd__som_nm <- function(
    data,
    name = "mh_p_asr__synd__som_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__som,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Somatic complaints):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__som_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Somatic complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 12 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__som_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__som_sum", vars_mh_p_asr__synd__som))
#'   )
#' }
compute_mh_p_asr__synd__som_sum <- function(
    data,
    name = "mh_p_asr__synd__som_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__som,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__tho ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__tho_nm
#' @format `vars_mh_p_asr__synd__tho` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__tho` scores.
vars_mh_p_asr__synd__tho <- c(
  "mh_p_asr__tho_001",
  "mh_p_asr__tho_002",
  "mh_p_asr__tho_003",
  "mh_p_asr__tho_004",
  "mh_p_asr__tho_005",
  "mh_p_asr__tho_006",
  "mh_p_asr__tho_007",
  "mh_p_asr__tho_008",
  "mh_p_asr__tho__hypimp_001",
  "mh_p_asr__tho__dep_001"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Thought problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__tho_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Thought problems): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__tho_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__tho_nm", vars_mh_p_asr__synd__tho))
#'   )
#' }
compute_mh_p_asr__synd__tho_nm <- function(
    data,
    name = "mh_p_asr__synd__tho_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__tho,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Thought problems):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__tho_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Thought problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__tho_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__tho_sum", vars_mh_p_asr__synd__tho))
#'   )
#' }
compute_mh_p_asr__synd__tho_sum <- function(
    data,
    name = "mh_p_asr__synd__tho_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__tho,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr__synd__wthdr --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_asr__synd__wthdr_nm
#' @format `vars_mh_p_asr__synd__wthdr` is vector of all column names
#' used to compute summary score of `mh_p_asr__synd__wthdr` scores.
vars_mh_p_asr__synd__wthdr <- c(
  "mh_p_asr__wthdr_001",
  "mh_p_asr__wthdr_002",
  "mh_p_asr__wthdr_003",
  "mh_p_asr__wthdr_004",
  "mh_p_asr__wthdr__avoid_001",
  "mh_p_asr__wthdr__avoid_002",
  "mh_p_asr__wthdr__avoid_003",
  "mh_p_asr__wthdr__avoid_004",
  "mh_p_asr__wthdr__dep_001"
)


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Withdrawn): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__wthdr_nm`
#' Adult Self Report \[Parent\] (Syndrome Scale - Withdrawn): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__wthdr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__wthdr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__wthdr_nm", vars_mh_p_asr__synd__wthdr))
#'   )
#' }
compute_mh_p_asr__synd__wthdr_nm <- function(
    data,
    name = "mh_p_asr__synd__wthdr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_asr__synd__wthdr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Adult Self Report \[Parent\] (Syndrome Scale - Withdrawn): Sum"
#'
#' @description
#' Computes the summary score `mh_p_asr__synd__wthdr_sum`
#' Adult Self Report \[Parent\] (Syndrome Scale - Withdrawn): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_asr__synd__wthdr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_asr__synd__wthdr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr__synd__wthdr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_asr__synd__wthdr_sum", vars_mh_p_asr__synd__wthdr))
#'   )
#' }
compute_mh_p_asr__synd__wthdr_sum <- function(
    data,
    name = "mh_p_asr__synd__wthdr_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_asr__synd__wthdr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_asr all -----------------------------------------------------------------
#' Compute all summary scores for mh_p_asr.
#' @description
#' This function computes all summary scores for the mh_p_asr form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_asr_all(data)
#' }
compute_mh_p_asr_all <- function(data) {
  data |>
    compute_mh_p_asr__afs__strng_nm() |>
    compute_mh_p_asr__afs__strng_sum() |>
    compute_mh_p_asr__critic_nm() |>
    compute_mh_p_asr__critic_sum() |>
    compute_mh_p_asr__dsm__adhd__hypimp_nm() |>
    compute_mh_p_asr__dsm__adhd__hypimp_sum() |>
    compute_mh_p_asr__dsm__adhd__inatt_nm() |>
    compute_mh_p_asr__dsm__adhd__inatt_sum() |>
    compute_mh_p_asr__dsm__adhd_nm() |>
    compute_mh_p_asr__dsm__adhd_sum() |>
    compute_mh_p_asr__dsm__antsoc_nm() |>
    compute_mh_p_asr__dsm__antsoc_sum() |>
    compute_mh_p_asr__dsm__anx_nm() |>
    compute_mh_p_asr__dsm__anx_sum() |>
    compute_mh_p_asr__dsm__avoid_nm() |>
    compute_mh_p_asr__dsm__avoid_sum() |>
    compute_mh_p_asr__dsm__dep_nm() |>
    compute_mh_p_asr__dsm__dep_sum() |>
    compute_mh_p_asr__dsm__somat_nm() |>
    compute_mh_p_asr__dsm__somat_sum() |>
    compute_mh_p_asr__synd__aggr_nm() |>
    compute_mh_p_asr__synd__aggr_sum() |>
    compute_mh_p_asr__synd__anxdep_nm() |>
    compute_mh_p_asr__synd__anxdep_sum() |>
    compute_mh_p_asr__synd__attn_nm() |>
    compute_mh_p_asr__synd__attn_sum() |>
    compute_mh_p_asr__synd__ext_nm() |>
    compute_mh_p_asr__synd__ext_sum() |>
    compute_mh_p_asr__synd__int_nm() |>
    compute_mh_p_asr__synd__int_sum() |>
    compute_mh_p_asr__synd__intru_nm() |>
    compute_mh_p_asr__synd__intru_sum() |>
    compute_mh_p_asr__synd__othpr_nm() |>
    compute_mh_p_asr__synd__othpr_sum() |>
    compute_mh_p_asr__synd__rule_nm() |>
    compute_mh_p_asr__synd__rule_sum() |>
    compute_mh_p_asr__synd__som_nm() |>
    compute_mh_p_asr__synd__som_sum() |>
    compute_mh_p_asr__synd__tho_nm() |>
    compute_mh_p_asr__synd__tho_sum() |>
    compute_mh_p_asr__synd__wthdr_nm() |>
    compute_mh_p_asr__synd__wthdr_sum() |>
    compute_mh_p_asr_nm() |>
    compute_mh_p_asr_sum()
}


# mh_t_bpm ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_t_bpm_nm
#' @format `vars_mh_t_bpm` is vector of all column names
#' used to compute summary score of `mh_t_bpm` scores.
vars_mh_t_bpm <- c(
  "mh_t_bpm__attn_001",
  "mh_t_bpm__attn_002",
  "mh_t_bpm__attn_003",
  "mh_t_bpm__attn_004",
  "mh_t_bpm__attn_005",
  "mh_t_bpm__attn_006",
  "mh_t_bpm__ext_001",
  "mh_t_bpm__ext_002",
  "mh_t_bpm__ext_003",
  "mh_t_bpm__ext_004",
  "mh_t_bpm__ext_005",
  "mh_t_bpm__ext_006",
  "mh_t_bpm__int_001",
  "mh_t_bpm__int_002",
  "mh_t_bpm__int_003",
  "mh_t_bpm__int_004",
  "mh_t_bpm__int_005",
  "mh_t_bpm__int_006"
)


#' Compute "Brief Problem Monitor \[Teacher\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_t_bpm_nm`
#' Brief Problem Monitor \[Teacher\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm_nm(data) |>
#'   select(
#'     any_of(c("mh_t_bpm_nm", vars_mh_t_bpm))
#'   )
#' }
compute_mh_t_bpm_nm <- function(
    data,
    name = "mh_t_bpm_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_t_bpm,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\]: Sum"
#'
#' @description
#' Computes the summary score `mh_t_bpm_sum`
#' Brief Problem Monitor \[Teacher\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 18 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm_sum(data) |>
#'   select(
#'     any_of(c("mh_t_bpm_sum", vars_mh_t_bpm))
#'   )
#' }
compute_mh_t_bpm_sum <- function(
    data,
    name = "mh_t_bpm_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_t_bpm,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\]: T-score"
#'
#' @description
#' Computes the summary score `mh_t_bpm_tscore`
#' Brief Problem Monitor \[Teacher\]: T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 18 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm_tscore(data) |>
#'   select(
#'     any_of(c("mh_t_bpm_tscore", vars_mh_t_bpm))
#'   )
#' }
compute_mh_t_bpm_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_t_bpm_tscore",
    col_age = "mh_t_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_t_bpm,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_t_bpm__attn ---------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_t_bpm__attn_nm
#' @format `vars_mh_t_bpm__attn` is vector of all column names
#' used to compute summary score of `mh_t_bpm__attn` scores.
vars_mh_t_bpm__attn <- c(
  "mh_t_bpm__attn_001",
  "mh_t_bpm__attn_002",
  "mh_t_bpm__attn_003",
  "mh_t_bpm__attn_004",
  "mh_t_bpm__attn_005",
  "mh_t_bpm__attn_006"
)


#' Compute "Brief Problem Monitor \[Teacher\] (Attention): Number missing"
#'
#' @description
#' Computes the summary score `mh_t_bpm__attn_nm`
#' Brief Problem Monitor \[Teacher\] (Attention): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__attn_nm", vars_mh_t_bpm__attn))
#'   )
#' }
compute_mh_t_bpm__attn_nm <- function(
    data,
    name = "mh_t_bpm__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_t_bpm__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Attention): Sum"
#'
#' @description
#' Computes the summary score `mh_t_bpm__attn_sum`
#' Brief Problem Monitor \[Teacher\] (Attention): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__attn_sum", vars_mh_t_bpm__attn))
#'   )
#' }
compute_mh_t_bpm__attn_sum <- function(
    data,
    name = "mh_t_bpm__attn_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_t_bpm__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Attention): T-score"
#'
#' @description
#' Computes the summary score `mh_t_bpm__attn_tscore`
#' Brief Problem Monitor \[Teacher\] (Attention): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__attn_tscore(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__attn_tscore", vars_mh_t_bpm__attn))
#'   )
#' }
compute_mh_t_bpm__attn_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_t_bpm__attn_tscore",
    col_age = "mh_t_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_t_bpm__attn,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_t_bpm__ext ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_t_bpm__ext_nm
#' @format `vars_mh_t_bpm__ext` is vector of all column names
#' used to compute summary score of `mh_t_bpm__ext` scores.
vars_mh_t_bpm__ext <- c(
  "mh_t_bpm__ext_001",
  "mh_t_bpm__ext_002",
  "mh_t_bpm__ext_003",
  "mh_t_bpm__ext_004",
  "mh_t_bpm__ext_005",
  "mh_t_bpm__ext_006"
)


#' Compute "Brief Problem Monitor \[Teacher\] (Externalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_t_bpm__ext_nm`
#' Brief Problem Monitor \[Teacher\] (Externalizing): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__ext_nm", vars_mh_t_bpm__ext))
#'   )
#' }
compute_mh_t_bpm__ext_nm <- function(
    data,
    name = "mh_t_bpm__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_t_bpm__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Externalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_t_bpm__ext_sum`
#' Brief Problem Monitor \[Teacher\] (Externalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__ext_sum", vars_mh_t_bpm__ext))
#'   )
#' }
compute_mh_t_bpm__ext_sum <- function(
    data,
    name = "mh_t_bpm__ext_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_t_bpm__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Externalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_t_bpm__ext_tscore`
#' Brief Problem Monitor \[Teacher\] (Externalizing): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__ext_tscore(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__ext_tscore", vars_mh_t_bpm__ext))
#'   )
#' }
compute_mh_t_bpm__ext_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_t_bpm__ext_tscore",
    col_age = "mh_t_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_t_bpm__ext,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_t_bpm__int ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_t_bpm__int_nm
#' @format `vars_mh_t_bpm__int` is vector of all column names
#' used to compute summary score of `mh_t_bpm__int` scores.
vars_mh_t_bpm__int <- c(
  "mh_t_bpm__int_001",
  "mh_t_bpm__int_002",
  "mh_t_bpm__int_003",
  "mh_t_bpm__int_004",
  "mh_t_bpm__int_005",
  "mh_t_bpm__int_006"
)


#' Compute "Brief Problem Monitor \[Teacher\] (Internalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_t_bpm__int_nm`
#' Brief Problem Monitor \[Teacher\] (Internalizing): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__int_nm(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__int_nm", vars_mh_t_bpm__int))
#'   )
#' }
compute_mh_t_bpm__int_nm <- function(
    data,
    name = "mh_t_bpm__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_t_bpm__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Internalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_t_bpm__int_sum`
#' Brief Problem Monitor \[Teacher\] (Internalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__int_sum(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__int_sum", vars_mh_t_bpm__int))
#'   )
#' }
compute_mh_t_bpm__int_sum <- function(
    data,
    name = "mh_t_bpm__int_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_t_bpm__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Teacher\] (Internalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_t_bpm__int_tscore`
#' Brief Problem Monitor \[Teacher\] (Internalizing): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_t_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_t_bpm__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm__int_tscore(data) |>
#'   select(
#'     any_of(c("mh_t_bpm__int_tscore", vars_mh_t_bpm__int))
#'   )
#' }
compute_mh_t_bpm__int_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_t_bpm__int_tscore",
    col_age = "mh_t_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_t_bpm__int,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_t_bpm all -----------------------------------------------------------------
#' Compute all summary scores for mh_t_bpm.
#' @description
#' This function computes all summary scores for the mh_t_bpm form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_t_bpm_all(data)
#' }
compute_mh_t_bpm_all <- function(data) {
  data |>
    compute_mh_t_bpm__attn_nm() |>
    compute_mh_t_bpm__attn_sum() |>
    compute_mh_t_bpm__attn_tscore() |>
    compute_mh_t_bpm__ext_nm() |>
    compute_mh_t_bpm__ext_sum() |>
    compute_mh_t_bpm__ext_tscore() |>
    compute_mh_t_bpm__int_nm() |>
    compute_mh_t_bpm__int_sum() |>
    compute_mh_t_bpm__int_tscore() |>
    compute_mh_t_bpm_nm() |>
    compute_mh_t_bpm_sum() |>
    compute_mh_t_bpm_tscore()
}
# mh_y_bpm ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bpm_nm
#' @format `vars_mh_y_bpm` is vector of all column names
#' used to compute summary score of `mh_y_bpm` scores.
vars_mh_y_bpm <- c(
  "mh_y_bpm__attn_001",
  "mh_y_bpm__attn_002",
  "mh_y_bpm__attn_003",
  "mh_y_bpm__attn_004",
  "mh_y_bpm__attn_005",
  "mh_y_bpm__attn_006",
  "mh_y_bpm__ext_001",
  "mh_y_bpm__ext_002",
  "mh_y_bpm__ext_003",
  "mh_y_bpm__ext_004",
  "mh_y_bpm__ext_005",
  "mh_y_bpm__ext_006",
  "mh_y_bpm__ext_007",
  "mh_y_bpm__int_001",
  "mh_y_bpm__int_002",
  "mh_y_bpm__int_003",
  "mh_y_bpm__int_004",
  "mh_y_bpm__int_005",
  "mh_y_bpm__int_006"
)


#' Compute "Brief Problem Monitor \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bpm_nm`
#' Brief Problem Monitor \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bpm_nm", vars_mh_y_bpm))
#'   )
#' }
compute_mh_y_bpm_nm <- function(
    data,
    name = "mh_y_bpm_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bpm,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\]: Sum"
#'
#' @description
#' Computes the summary score `mh_y_bpm_sum`
#' Brief Problem Monitor \[Youth\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 19 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bpm_sum", vars_mh_y_bpm))
#'   )
#' }
compute_mh_y_bpm_sum <- function(
    data,
    name = "mh_y_bpm_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bpm,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\]: T-score"
#'
#' @description
#' Computes the summary score `mh_y_bpm_tscore`
#' Brief Problem Monitor \[Youth\]: T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 19 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_bpm_tscore", vars_mh_y_bpm))
#'   )
#' }
compute_mh_y_bpm_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_bpm_tscore",
    col_age = "mh_y_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_bpm,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_bpm__attn ---------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bpm__attn_nm
#' @format `vars_mh_y_bpm__attn` is vector of all column names
#' used to compute summary score of `mh_y_bpm__attn` scores.
vars_mh_y_bpm__attn <- c(
  "mh_y_bpm__attn_001",
  "mh_y_bpm__attn_002",
  "mh_y_bpm__attn_003",
  "mh_y_bpm__attn_004",
  "mh_y_bpm__attn_005",
  "mh_y_bpm__attn_006"
)


#' Compute "Brief Problem Monitor \[Youth\] (Attention): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bpm__attn_nm`
#' Brief Problem Monitor \[Youth\] (Attention): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__attn_nm", vars_mh_y_bpm__attn))
#'   )
#' }
compute_mh_y_bpm__attn_nm <- function(
    data,
    name = "mh_y_bpm__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bpm__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Attention): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bpm__attn_sum`
#' Brief Problem Monitor \[Youth\] (Attention): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__attn_sum", vars_mh_y_bpm__attn))
#'   )
#' }
compute_mh_y_bpm__attn_sum <- function(
    data,
    name = "mh_y_bpm__attn_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bpm__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Attention): T-score"
#'
#' @description
#' Computes the summary score `mh_y_bpm__attn_tscore`
#' Brief Problem Monitor \[Youth\] (Attention): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__attn_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__attn_tscore", vars_mh_y_bpm__attn))
#'   )
#' }
compute_mh_y_bpm__attn_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_bpm__attn_tscore",
    col_age = "mh_y_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_bpm__attn,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_bpm__ext ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bpm__ext_nm
#' @format `vars_mh_y_bpm__ext` is vector of all column names
#' used to compute summary score of `mh_y_bpm__ext` scores.
vars_mh_y_bpm__ext <- c(
  "mh_y_bpm__ext_001",
  "mh_y_bpm__ext_002",
  "mh_y_bpm__ext_003",
  "mh_y_bpm__ext_004",
  "mh_y_bpm__ext_005",
  "mh_y_bpm__ext_006",
  "mh_y_bpm__ext_007"
)


#' Compute "Brief Problem Monitor \[Youth\] (Externalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bpm__ext_nm`
#' Brief Problem Monitor \[Youth\] (Externalizing): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__ext_nm", vars_mh_y_bpm__ext))
#'   )
#' }
compute_mh_y_bpm__ext_nm <- function(
    data,
    name = "mh_y_bpm__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bpm__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Externalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bpm__ext_sum`
#' Brief Problem Monitor \[Youth\] (Externalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__ext_sum", vars_mh_y_bpm__ext))
#'   )
#' }
compute_mh_y_bpm__ext_sum <- function(
    data,
    name = "mh_y_bpm__ext_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bpm__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Externalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_y_bpm__ext_tscore`
#' Brief Problem Monitor \[Youth\] (Externalizing): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__ext_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__ext_tscore", vars_mh_y_bpm__ext))
#'   )
#' }
compute_mh_y_bpm__ext_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_bpm__ext_tscore",
    col_age = "mh_y_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_bpm__ext,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_bpm__int ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_bpm__int_nm
#' @format `vars_mh_y_bpm__int` is vector of all column names
#' used to compute summary score of `mh_y_bpm__int` scores.
vars_mh_y_bpm__int <- c(
  "mh_y_bpm__int_001",
  "mh_y_bpm__int_002",
  "mh_y_bpm__int_003",
  "mh_y_bpm__int_004",
  "mh_y_bpm__int_005",
  "mh_y_bpm__int_006"
)


#' Compute "Brief Problem Monitor \[Youth\] (Internalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_bpm__int_nm`
#' Brief Problem Monitor \[Youth\] (Internalizing): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__int_nm(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__int_nm", vars_mh_y_bpm__int))
#'   )
#' }
compute_mh_y_bpm__int_nm <- function(
    data,
    name = "mh_y_bpm__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_bpm__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Internalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_y_bpm__int_sum`
#' Brief Problem Monitor \[Youth\] (Internalizing): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__int_sum(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__int_sum", vars_mh_y_bpm__int))
#'   )
#' }
compute_mh_y_bpm__int_sum <- function(
    data,
    name = "mh_y_bpm__int_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_bpm__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Brief Problem Monitor \[Youth\] (Internalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_y_bpm__int_tscore`
#' Brief Problem Monitor \[Youth\] (Internalizing): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_bpm__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 6 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_bpm__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm__int_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_bpm__int_tscore", vars_mh_y_bpm__int))
#'   )
#' }
compute_mh_y_bpm__int_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_bpm__int_tscore",
    col_age = "mh_y_bpm_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_bpm__int,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_bpm all -----------------------------------------------------------------
#' Compute all summary scores for mh_y_bpm.
#' @description
#' This function computes all summary scores for the mh_y_bpm form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_bpm_all(data)
#' }
compute_mh_y_bpm_all <- function(data) {
  data |>
    compute_mh_y_bpm__attn_nm() |>
    compute_mh_y_bpm__attn_sum() |>
    compute_mh_y_bpm__attn_tscore() |>
    compute_mh_y_bpm__ext_nm() |>
    compute_mh_y_bpm__ext_sum() |>
    compute_mh_y_bpm__ext_tscore() |>
    compute_mh_y_bpm__int_nm() |>
    compute_mh_y_bpm__int_sum() |>
    compute_mh_y_bpm__int_tscore() |>
    compute_mh_y_bpm_nm() |>
    compute_mh_y_bpm_sum() |>
    compute_mh_y_bpm_tscore()
}


# mh_p_cbcl --------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl_nm
#' @format `vars_mh_p_cbcl` is vector of all column names
#' used to compute summary score of `mh_p_cbcl` scores.
vars_mh_p_cbcl <- c(
  "mh_p_cbcl__attn__adhd_001",
  "mh_p_cbcl__attn__adhd_002",
  "mh_p_cbcl__attn__adhd_003",
  "mh_p_cbcl__aggr__adhd_001",
  "mh_p_cbcl__attn__adhd_004",
  "mh_p_cbcl__attn__adhd_005",
  "mh_p_cbcl__othpr__adhd_001",
  "mh_p_cbcl__soc__anx_001",
  "mh_p_cbcl__anxdep__anx_007",
  "mh_p_cbcl__anxdep__anx_001",
  "mh_p_cbcl__anxdep__anx_002",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__anxdep__anx_004",
  "mh_p_cbcl__som__anx_001",
  "mh_p_cbcl__anxdep__anx_005",
  "mh_p_cbcl__anxdep__anx_006",
  "mh_p_cbcl__rule__cond_010",
  "mh_p_cbcl__rule__cond_011",
  "mh_p_cbcl__othpr__cond_001",
  "mh_p_cbcl__aggr__cond_001",
  "mh_p_cbcl__aggr__cond_002",
  "mh_p_cbcl__rule__cond_001",
  "mh_p_cbcl__rule__cond_002",
  "mh_p_cbcl__aggr__cond_003",
  "mh_p_cbcl__rule__cond_003",
  "mh_p_cbcl__rule__cond_004",
  "mh_p_cbcl__aggr__cond_004",
  "mh_p_cbcl__rule__cond_005",
  "mh_p_cbcl__rule__cond_006",
  "mh_p_cbcl__rule__cond_007",
  "mh_p_cbcl__rule__cond_008",
  "mh_p_cbcl__rule__cond_009",
  "mh_p_cbcl__aggr__cond_005",
  "mh_p_cbcl__wthdep__dep_001",
  "mh_p_cbcl__tho__dep_003",
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__wthdep__dep_003",
  "mh_p_cbcl__anxdep__dep_001",
  "mh_p_cbcl__tho__dep_001",
  "mh_p_cbcl__othpr__dep_001",
  "mh_p_cbcl__anxdep__dep_002",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__som__dep_001",
  "mh_p_cbcl__tho__dep_002",
  "mh_p_cbcl__othpr__dep_002",
  "mh_p_cbcl__anxdep__dep_004",
  "mh_p_cbcl__aggr__opp_001",
  "mh_p_cbcl__aggr__opp_002",
  "mh_p_cbcl__aggr__opp_003",
  "mh_p_cbcl__aggr__opp_004",
  "mh_p_cbcl__aggr__opp_005",
  "mh_p_cbcl__som__somat_001",
  "mh_p_cbcl__som__somat_002",
  "mh_p_cbcl__som__somat_003",
  "mh_p_cbcl__som__somat_004",
  "mh_p_cbcl__som__somat_005",
  "mh_p_cbcl__som__somat_006",
  "mh_p_cbcl__som__somat_007",
  "mh_p_cbcl__tho_001",
  "mh_p_cbcl__anxdep_001",
  "mh_p_cbcl__tho_007",
  "mh_p_cbcl__tho_010",
  "mh_p_cbcl__tho_011",
  "mh_p_cbcl__attn_002",
  "mh_p_cbcl__attn_003",
  "mh_p_cbcl__attn_005",
  "mh_p_cbcl__wthdep_005",
  "mh_p_cbcl__soc_004",
  "mh_p_cbcl__wthdep_003",
  "mh_p_cbcl__aggr_004",
  "mh_p_cbcl__aggr_001",
  "mh_p_cbcl__aggr_002",
  "mh_p_cbcl__aggr_003",
  "mh_p_cbcl__aggr_005",
  "mh_p_cbcl__aggr_006",
  "mh_p_cbcl__aggr_007",
  "mh_p_cbcl__anxdep_002",
  "mh_p_cbcl__attn_001",
  "mh_p_cbcl__attn_004",
  "mh_p_cbcl__rule_001",
  "mh_p_cbcl__rule_006",
  "mh_p_cbcl__rule_002",
  "mh_p_cbcl__rule_003",
  "mh_p_cbcl__rule_004",
  "mh_p_cbcl__rule_005",
  "mh_p_cbcl__wthdep_001",
  "mh_p_cbcl__wthdep_002",
  "mh_p_cbcl__wthdep_004",
  "mh_p_cbcl__som_001",
  "mh_p_cbcl__som_002",
  "mh_p_cbcl__othpr_001",
  "mh_p_cbcl__othpr_002",
  "mh_p_cbcl__othpr_009",
  "mh_p_cbcl__othpr_010",
  "mh_p_cbcl__othpr_011",
  "mh_p_cbcl__othpr_012",
  "mh_p_cbcl__othpr_003",
  "mh_p_cbcl__othpr_004",
  "mh_p_cbcl__othpr_005",
  "mh_p_cbcl__othpr_006",
  "mh_p_cbcl__othpr_007",
  "mh_p_cbcl__othpr_008",
  "mh_p_cbcl__soc_001",
  "mh_p_cbcl__soc_002",
  "mh_p_cbcl__soc_003",
  "mh_p_cbcl__soc_005",
  "mh_p_cbcl__soc_006",
  "mh_p_cbcl__soc_007",
  "mh_p_cbcl__soc_008",
  "mh_p_cbcl__soc_009",
  "mh_p_cbcl__soc_010",
  "mh_p_cbcl__tho_002",
  "mh_p_cbcl__tho_003",
  "mh_p_cbcl__tho_004",
  "mh_p_cbcl__tho_005",
  "mh_p_cbcl__tho_006",
  "mh_p_cbcl__tho_008",
  "mh_p_cbcl__tho_009",
  "mh_p_cbcl__tho_012"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl_nm", vars_mh_p_cbcl))
#'   )
#' }
compute_mh_p_cbcl_nm <- function(
    data,
    name = "mh_p_cbcl_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 8 of 119 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl_sum", vars_mh_p_cbcl))
#'   )
#' }
compute_mh_p_cbcl_sum <- function(
    data,
    name = "mh_p_cbcl_sum",
    max_na = 8,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 8 of 119 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl_tscore", vars_mh_p_cbcl))
#'   )
#' }
compute_mh_p_cbcl_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 8,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__adhd ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__adhd_nm
#' @format `vars_mh_p_cbcl__dsm__adhd` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__adhd` scores.
vars_mh_p_cbcl__dsm__adhd <- c(
  "mh_p_cbcl__attn__adhd_001",
  "mh_p_cbcl__attn__adhd_002",
  "mh_p_cbcl__attn__adhd_003",
  "mh_p_cbcl__aggr__adhd_001",
  "mh_p_cbcl__attn__adhd_004",
  "mh_p_cbcl__attn__adhd_005",
  "mh_p_cbcl__othpr__adhd_001"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__adhd_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__adhd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__adhd_nm", vars_mh_p_cbcl__dsm__adhd))
#'   )
#' }
compute_mh_p_cbcl__dsm__adhd_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__adhd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__adhd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__adhd_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__adhd_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__adhd_sum", vars_mh_p_cbcl__dsm__adhd))
#'   )
#' }
compute_mh_p_cbcl__dsm__adhd_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__adhd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__adhd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__adhd_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__adhd_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__adhd_tscore", vars_mh_p_cbcl__dsm__adhd))
#'   )
#' }
compute_mh_p_cbcl__dsm__adhd_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__adhd_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__adhd,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__anx ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__anx_nm
#' @format `vars_mh_p_cbcl__dsm__anx` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__anx` scores.
vars_mh_p_cbcl__dsm__anx <- c(
  "mh_p_cbcl__soc__anx_001",
  "mh_p_cbcl__anxdep__anx_007",
  "mh_p_cbcl__anxdep__anx_001",
  "mh_p_cbcl__anxdep__anx_002",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__anxdep__anx_004",
  "mh_p_cbcl__som__anx_001",
  "mh_p_cbcl__anxdep__anx_005",
  "mh_p_cbcl__anxdep__anx_006"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Anxiety): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__anx_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__anx_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__anx_nm", vars_mh_p_cbcl__dsm__anx))
#'   )
#' }
compute_mh_p_cbcl__dsm__anx_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__anx_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__anx,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Anxiety): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__anx_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__anx_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__anx_sum", vars_mh_p_cbcl__dsm__anx))
#'   )
#' }
compute_mh_p_cbcl__dsm__anx_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__anx_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__anx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Anxiety): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__anx_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Anxiety):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__anx_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__anx_tscore", vars_mh_p_cbcl__dsm__anx))
#'   )
#' }
compute_mh_p_cbcl__dsm__anx_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__anx_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__anx,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__cond ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__cond_nm
#' @format `vars_mh_p_cbcl__dsm__cond` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__cond` scores.
vars_mh_p_cbcl__dsm__cond <- c(
  "mh_p_cbcl__rule__cond_010",
  "mh_p_cbcl__rule__cond_011",
  "mh_p_cbcl__othpr__cond_001",
  "mh_p_cbcl__aggr__cond_001",
  "mh_p_cbcl__aggr__cond_002",
  "mh_p_cbcl__rule__cond_001",
  "mh_p_cbcl__rule__cond_002",
  "mh_p_cbcl__aggr__cond_003",
  "mh_p_cbcl__rule__cond_003",
  "mh_p_cbcl__rule__cond_004",
  "mh_p_cbcl__aggr__cond_004",
  "mh_p_cbcl__rule__cond_005",
  "mh_p_cbcl__rule__cond_006",
  "mh_p_cbcl__rule__cond_007",
  "mh_p_cbcl__rule__cond_008",
  "mh_p_cbcl__rule__cond_009",
  "mh_p_cbcl__aggr__cond_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__cond_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__cond_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__cond_nm", vars_mh_p_cbcl__dsm__cond))
#'   )
#' }
compute_mh_p_cbcl__dsm__cond_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__cond_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__cond,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__cond_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__cond_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__cond_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__cond_sum", vars_mh_p_cbcl__dsm__cond))
#'   )
#' }
compute_mh_p_cbcl__dsm__cond_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__cond_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__cond,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__cond_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Conduct
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__cond_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__cond_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__cond_tscore", vars_mh_p_cbcl__dsm__cond))
#'   )
#' }
compute_mh_p_cbcl__dsm__cond_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__cond_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__cond,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__dep ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__dep_nm
#' @format `vars_mh_p_cbcl__dsm__dep` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__dep` scores.
vars_mh_p_cbcl__dsm__dep <- c(
  "mh_p_cbcl__wthdep__dep_001",
  "mh_p_cbcl__tho__dep_003",
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__wthdep__dep_003",
  "mh_p_cbcl__anxdep__dep_001",
  "mh_p_cbcl__tho__dep_001",
  "mh_p_cbcl__othpr__dep_001",
  "mh_p_cbcl__anxdep__dep_002",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__som__dep_001",
  "mh_p_cbcl__tho__dep_002",
  "mh_p_cbcl__othpr__dep_002",
  "mh_p_cbcl__anxdep__dep_004"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__dep_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__dep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__dep_nm", vars_mh_p_cbcl__dsm__dep))
#'   )
#' }
compute_mh_p_cbcl__dsm__dep_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__dep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__dep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__dep_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__dep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__dep_sum", vars_mh_p_cbcl__dsm__dep))
#'   )
#' }
compute_mh_p_cbcl__dsm__dep_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__dep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__dep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Depressive problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__dep_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__dep_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__dep_tscore", vars_mh_p_cbcl__dsm__dep))
#'   )
#' }
compute_mh_p_cbcl__dsm__dep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__dep_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__dep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__opp ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__opp_nm
#' @format `vars_mh_p_cbcl__dsm__opp` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__opp` scores.
vars_mh_p_cbcl__dsm__opp <- c(
  "mh_p_cbcl__aggr__opp_001",
  "mh_p_cbcl__aggr__opp_002",
  "mh_p_cbcl__aggr__opp_003",
  "mh_p_cbcl__aggr__opp_004",
  "mh_p_cbcl__aggr__opp_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Oppositional Defiant problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__opp_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__opp_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__opp_nm", vars_mh_p_cbcl__dsm__opp))
#'   )
#' }
compute_mh_p_cbcl__dsm__opp_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__opp_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__opp,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Oppositional Defiant problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__opp_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 5 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__opp_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__opp_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__opp_sum", vars_mh_p_cbcl__dsm__opp))
#'   )
#' }
compute_mh_p_cbcl__dsm__opp_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__opp_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__opp,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale -
#' Oppositional Defiant problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__opp_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 5 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__opp_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__opp_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__opp_tscore", vars_mh_p_cbcl__dsm__opp))
#'   )
#' }
compute_mh_p_cbcl__dsm__opp_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__opp_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__opp,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__dsm__somat --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__dsm__somat_nm
#' @format `vars_mh_p_cbcl__dsm__somat` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__dsm__somat` scores.
vars_mh_p_cbcl__dsm__somat <- c(
  "mh_p_cbcl__som__somat_001",
  "mh_p_cbcl__som__somat_002",
  "mh_p_cbcl__som__somat_003",
  "mh_p_cbcl__som__somat_004",
  "mh_p_cbcl__som__somat_005",
  "mh_p_cbcl__som__somat_006",
  "mh_p_cbcl__som__somat_007"
)


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__somat_nm`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__somat_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__somat_nm", vars_mh_p_cbcl__dsm__somat))
#'   )
#' }
compute_mh_p_cbcl__dsm__somat_nm <- function(
    data,
    name = "mh_p_cbcl__dsm__somat_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__somat,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__somat_sum`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__somat_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__somat_sum", vars_mh_p_cbcl__dsm__somat))
#'   )
#' }
compute_mh_p_cbcl__dsm__somat_sum <- function(
    data,
    name = "mh_p_cbcl__dsm__somat_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__dsm__somat,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__dsm__somat_tscore`
#' Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Somatic
#' complaints): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__dsm__somat_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__dsm__somat_tscore", vars_mh_p_cbcl__dsm__somat))
#'   )
#' }
compute_mh_p_cbcl__dsm__somat_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__dsm__somat_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__dsm__somat,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__ocd ---------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__ocd_nm
#' @format `vars_mh_p_cbcl__ocd` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__ocd` scores.
vars_mh_p_cbcl__ocd <- c(
  "mh_p_cbcl__tho_001",
  "mh_p_cbcl__anxdep__anx_007",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__anxdep_001",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__tho_007",
  "mh_p_cbcl__tho_010",
  "mh_p_cbcl__tho_011"
)


#' Compute "Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__ocd_nm`
#' Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__ocd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__ocd_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__ocd_nm", vars_mh_p_cbcl__ocd))
#'   )
#' }
compute_mh_p_cbcl__ocd_nm <- function(
    data,
    name = "mh_p_cbcl__ocd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__ocd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__ocd_sum`
#' Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__ocd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__ocd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__ocd_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__ocd_sum", vars_mh_p_cbcl__ocd))
#'   )
#' }
compute_mh_p_cbcl__ocd_sum <- function(
    data,
    name = "mh_p_cbcl__ocd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__ocd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__ocd_tscore`
#' Child Behavior Checklist \[Parent\] (Obsessive-Compulsive Problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__ocd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__ocd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__ocd_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__ocd_tscore", vars_mh_p_cbcl__ocd))
#'   )
#' }
compute_mh_p_cbcl__ocd_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__ocd_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__ocd,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__sct ---------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__sct_nm
#' @format `vars_mh_p_cbcl__sct` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__sct` scores.
vars_mh_p_cbcl__sct <- c(
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__attn_002",
  "mh_p_cbcl__attn_003",
  "mh_p_cbcl__attn_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__sct_nm`
#' Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__sct |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__sct_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__sct_nm", vars_mh_p_cbcl__sct))
#'   )
#' }
compute_mh_p_cbcl__sct_nm <- function(
    data,
    name = "mh_p_cbcl__sct_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__sct,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__sct_sum`
#' Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__sct |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__sct_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__sct_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__sct_sum", vars_mh_p_cbcl__sct))
#'   )
#' }
compute_mh_p_cbcl__sct_sum <- function(
    data,
    name = "mh_p_cbcl__sct_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__sct,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__sct_tscore`
#' Child Behavior Checklist \[Parent\] (Sluggish Cognitive Tempo): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__sct |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 4 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__sct_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__sct_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__sct_tscore", vars_mh_p_cbcl__sct))
#'   )
#' }
compute_mh_p_cbcl__sct_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__sct_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__sct,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__strs --------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__strs_nm
#' @format `vars_mh_p_cbcl__strs` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__strs` scores.
vars_mh_p_cbcl__strs <- c(
  "mh_p_cbcl__aggr__opp_001",
  "mh_p_cbcl__attn__adhd_002",
  "mh_p_cbcl__tho_001",
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__soc__anx_001",
  "mh_p_cbcl__wthdep_005",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__soc_004",
  "mh_p_cbcl__anxdep__anx_004",
  "mh_p_cbcl__som__anx_001",
  "mh_p_cbcl__anxdep__anx_005",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__wthdep_003",
  "mh_p_cbcl__aggr_004"
)


#' Compute "Child Behavior Checklist \[Parent\] (Stress): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__strs_nm`
#' Child Behavior Checklist \[Parent\] (Stress): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__strs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__strs_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__strs_nm", vars_mh_p_cbcl__strs))
#'   )
#' }
compute_mh_p_cbcl__strs_nm <- function(
    data,
    name = "mh_p_cbcl__strs_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__strs,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Stress): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__strs_sum`
#' Child Behavior Checklist \[Parent\] (Stress): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__strs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__strs_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__strs_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__strs_sum", vars_mh_p_cbcl__strs))
#'   )
#' }
compute_mh_p_cbcl__strs_sum <- function(
    data,
    name = "mh_p_cbcl__strs_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__strs,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Stress): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__strs_tscore`
#' Child Behavior Checklist \[Parent\] (Stress): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__strs |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__strs_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__strs_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__strs_tscore", vars_mh_p_cbcl__strs))
#'   )
#' }
compute_mh_p_cbcl__strs_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__strs_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__strs,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__aggr --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__aggr_nm
#' @format `vars_mh_p_cbcl__synd__aggr` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__aggr` scores.
vars_mh_p_cbcl__synd__aggr <- c(
  "mh_p_cbcl__aggr__opp_001",
  "mh_p_cbcl__aggr__adhd_001",
  "mh_p_cbcl__aggr__cond_001",
  "mh_p_cbcl__aggr_001",
  "mh_p_cbcl__aggr_002",
  "mh_p_cbcl__aggr__cond_002",
  "mh_p_cbcl__aggr__opp_002",
  "mh_p_cbcl__aggr__opp_003",
  "mh_p_cbcl__aggr__cond_003",
  "mh_p_cbcl__aggr__cond_004",
  "mh_p_cbcl__aggr_003",
  "mh_p_cbcl__aggr__opp_004",
  "mh_p_cbcl__aggr_004",
  "mh_p_cbcl__aggr_005",
  "mh_p_cbcl__aggr_006",
  "mh_p_cbcl__aggr_007",
  "mh_p_cbcl__aggr__opp_005",
  "mh_p_cbcl__aggr__cond_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__aggr_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__aggr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__aggr_nm", vars_mh_p_cbcl__synd__aggr))
#'   )
#' }
compute_mh_p_cbcl__synd__aggr_nm <- function(
    data,
    name = "mh_p_cbcl__synd__aggr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__aggr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__aggr_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 18 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__aggr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__aggr_sum", vars_mh_p_cbcl__synd__aggr))
#'   )
#' }
compute_mh_p_cbcl__synd__aggr_sum <- function(
    data,
    name = "mh_p_cbcl__synd__aggr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__aggr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__aggr_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive
#' behavior): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 18 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__aggr_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__aggr_tscore", vars_mh_p_cbcl__synd__aggr))
#'   )
#' }
compute_mh_p_cbcl__synd__aggr_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__aggr_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__aggr,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__anxdep ------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__anxdep_nm
#' @format `vars_mh_p_cbcl__synd__anxdep` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__anxdep` scores.
vars_mh_p_cbcl__synd__anxdep <- c(
  "mh_p_cbcl__anxdep__anx_007",
  "mh_p_cbcl__anxdep__dep_001",
  "mh_p_cbcl__anxdep__anx_001",
  "mh_p_cbcl__anxdep__anx_002",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__anxdep_001",
  "mh_p_cbcl__anxdep_002",
  "mh_p_cbcl__anxdep__dep_002",
  "mh_p_cbcl__anxdep__anx_004",
  "mh_p_cbcl__anxdep__anx_005",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__anxdep__anx_006",
  "mh_p_cbcl__anxdep__dep_004"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__anxdep_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__anxdep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__anxdep_nm", vars_mh_p_cbcl__synd__anxdep))
#'   )
#' }
compute_mh_p_cbcl__synd__anxdep_nm <- function(
    data,
    name = "mh_p_cbcl__synd__anxdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__anxdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__anxdep_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__anxdep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__anxdep_sum", vars_mh_p_cbcl__synd__anxdep))
#'   )
#' }
compute_mh_p_cbcl__synd__anxdep_sum <- function(
    data,
    name = "mh_p_cbcl__synd__anxdep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__anxdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__anxdep_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Anxious/Depressed): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__anxdep_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__anxdep_tscore", vars_mh_p_cbcl__synd__anxdep))
#'   )
#' }
compute_mh_p_cbcl__synd__anxdep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__anxdep_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__anxdep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__attn --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__attn_nm
#' @format `vars_mh_p_cbcl__synd__attn` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__attn` scores.
vars_mh_p_cbcl__synd__attn <- c(
  "mh_p_cbcl__attn_001",
  "mh_p_cbcl__attn__adhd_001",
  "mh_p_cbcl__attn__adhd_002",
  "mh_p_cbcl__attn__adhd_003",
  "mh_p_cbcl__attn_002",
  "mh_p_cbcl__attn_003",
  "mh_p_cbcl__attn__adhd_004",
  "mh_p_cbcl__attn_004",
  "mh_p_cbcl__attn__adhd_005",
  "mh_p_cbcl__attn_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__attn_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__attn_nm", vars_mh_p_cbcl__synd__attn))
#'   )
#' }
compute_mh_p_cbcl__synd__attn_nm <- function(
    data,
    name = "mh_p_cbcl__synd__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__attn_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__attn_sum", vars_mh_p_cbcl__synd__attn))
#'   )
#' }
compute_mh_p_cbcl__synd__attn_sum <- function(
    data,
    name = "mh_p_cbcl__synd__attn_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__attn_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Attention
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__attn_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__attn_tscore", vars_mh_p_cbcl__synd__attn))
#'   )
#' }
compute_mh_p_cbcl__synd__attn_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__attn_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__attn,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__ext ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__ext_nm
#' @format `vars_mh_p_cbcl__synd__ext` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__ext` scores.
vars_mh_p_cbcl__synd__ext <- c(
  "mh_p_cbcl__rule_001",
  "mh_p_cbcl__rule__cond_010",
  "mh_p_cbcl__rule_006",
  "mh_p_cbcl__rule__cond_011",
  "mh_p_cbcl__rule__cond_001",
  "mh_p_cbcl__rule__cond_002",
  "mh_p_cbcl__rule__cond_003",
  "mh_p_cbcl__rule__cond_004",
  "mh_p_cbcl__rule_002",
  "mh_p_cbcl__rule__cond_005",
  "mh_p_cbcl__rule__cond_006",
  "mh_p_cbcl__rule_003",
  "mh_p_cbcl__rule__cond_007",
  "mh_p_cbcl__rule__cond_008",
  "mh_p_cbcl__rule__cond_009",
  "mh_p_cbcl__rule_004",
  "mh_p_cbcl__rule_005",
  "mh_p_cbcl__aggr__opp_001",
  "mh_p_cbcl__aggr__adhd_001",
  "mh_p_cbcl__aggr__cond_001",
  "mh_p_cbcl__aggr_001",
  "mh_p_cbcl__aggr_002",
  "mh_p_cbcl__aggr__cond_002",
  "mh_p_cbcl__aggr__opp_002",
  "mh_p_cbcl__aggr__opp_003",
  "mh_p_cbcl__aggr__cond_003",
  "mh_p_cbcl__aggr__cond_004",
  "mh_p_cbcl__aggr_003",
  "mh_p_cbcl__aggr__opp_004",
  "mh_p_cbcl__aggr_004",
  "mh_p_cbcl__aggr_005",
  "mh_p_cbcl__aggr_006",
  "mh_p_cbcl__aggr_007",
  "mh_p_cbcl__aggr__opp_005",
  "mh_p_cbcl__aggr__cond_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Externalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__ext_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Externalizing):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__ext_nm", vars_mh_p_cbcl__synd__ext))
#'   )
#' }
compute_mh_p_cbcl__synd__ext_nm <- function(
    data,
    name = "mh_p_cbcl__synd__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Externalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__ext_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Externalizing):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 35 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__ext_sum", vars_mh_p_cbcl__synd__ext))
#'   )
#' }
compute_mh_p_cbcl__synd__ext_sum <- function(
    data,
    name = "mh_p_cbcl__synd__ext_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Externalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__ext_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Externalizing):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 35 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__ext_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__ext_tscore", vars_mh_p_cbcl__synd__ext))
#'   )
#' }
compute_mh_p_cbcl__synd__ext_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__ext_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__ext,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__int ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__int_nm
#' @format `vars_mh_p_cbcl__synd__int` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__int` scores.
vars_mh_p_cbcl__synd__int <- c(
  "mh_p_cbcl__anxdep__anx_007",
  "mh_p_cbcl__anxdep__dep_001",
  "mh_p_cbcl__anxdep__anx_001",
  "mh_p_cbcl__anxdep__anx_002",
  "mh_p_cbcl__anxdep__anx_003",
  "mh_p_cbcl__anxdep_001",
  "mh_p_cbcl__anxdep_002",
  "mh_p_cbcl__anxdep__dep_002",
  "mh_p_cbcl__anxdep__anx_004",
  "mh_p_cbcl__anxdep__anx_005",
  "mh_p_cbcl__anxdep__dep_003",
  "mh_p_cbcl__anxdep__anx_006",
  "mh_p_cbcl__anxdep__dep_004",
  "mh_p_cbcl__wthdep__dep_001",
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__wthdep__dep_003",
  "mh_p_cbcl__wthdep_005",
  "mh_p_cbcl__wthdep_001",
  "mh_p_cbcl__wthdep_002",
  "mh_p_cbcl__wthdep_003",
  "mh_p_cbcl__wthdep_004",
  "mh_p_cbcl__som__anx_001",
  "mh_p_cbcl__som_001",
  "mh_p_cbcl__som_002",
  "mh_p_cbcl__som__dep_001",
  "mh_p_cbcl__som__somat_001",
  "mh_p_cbcl__som__somat_002",
  "mh_p_cbcl__som__somat_003",
  "mh_p_cbcl__som__somat_004",
  "mh_p_cbcl__som__somat_005",
  "mh_p_cbcl__som__somat_006",
  "mh_p_cbcl__som__somat_007"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Internalizing): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__int_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__int_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__int_nm", vars_mh_p_cbcl__synd__int))
#'   )
#' }
compute_mh_p_cbcl__synd__int_nm <- function(
    data,
    name = "mh_p_cbcl__synd__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Internalizing): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__int_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__int_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__int_sum", vars_mh_p_cbcl__synd__int))
#'   )
#' }
compute_mh_p_cbcl__synd__int_sum <- function(
    data,
    name = "mh_p_cbcl__synd__int_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Internalizing): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__int_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__int_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__int_tscore", vars_mh_p_cbcl__synd__int))
#'   )
#' }
compute_mh_p_cbcl__synd__int_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__int_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__int,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__othpr -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__othpr_nm
#' @format `vars_mh_p_cbcl__synd__othpr` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__othpr` scores.
vars_mh_p_cbcl__synd__othpr <- c(
  "mh_p_cbcl__othpr_001",
  "mh_p_cbcl__othpr_002",
  "mh_p_cbcl__othpr_009",
  "mh_p_cbcl__othpr_010",
  "mh_p_cbcl__othpr_011",
  "mh_p_cbcl__othpr_012",
  "mh_p_cbcl__othpr__cond_001",
  "mh_p_cbcl__othpr__dep_001",
  "mh_p_cbcl__othpr_003",
  "mh_p_cbcl__othpr_004",
  "mh_p_cbcl__othpr_005",
  "mh_p_cbcl__othpr_006",
  "mh_p_cbcl__othpr_007",
  "mh_p_cbcl__othpr__dep_002",
  "mh_p_cbcl__othpr__adhd_001",
  "mh_p_cbcl__othpr_008"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Other
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__othpr_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Other problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__othpr_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__othpr_nm", vars_mh_p_cbcl__synd__othpr))
#'   )
#' }
compute_mh_p_cbcl__synd__othpr_nm <- function(
    data,
    name = "mh_p_cbcl__synd__othpr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__othpr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Other
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__othpr_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Other problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 16 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__othpr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__othpr_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__othpr_sum", vars_mh_p_cbcl__synd__othpr))
#'   )
#' }
compute_mh_p_cbcl__synd__othpr_sum <- function(
    data,
    name = "mh_p_cbcl__synd__othpr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__othpr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_p_cbcl__synd__rule --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__rule_nm
#' @format `vars_mh_p_cbcl__synd__rule` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__rule` scores.
vars_mh_p_cbcl__synd__rule <- c(
  "mh_p_cbcl__rule_001",
  "mh_p_cbcl__rule__cond_010",
  "mh_p_cbcl__rule_006",
  "mh_p_cbcl__rule__cond_011",
  "mh_p_cbcl__rule__cond_001",
  "mh_p_cbcl__rule__cond_002",
  "mh_p_cbcl__rule__cond_003",
  "mh_p_cbcl__rule__cond_004",
  "mh_p_cbcl__rule_002",
  "mh_p_cbcl__rule__cond_005",
  "mh_p_cbcl__rule__cond_006",
  "mh_p_cbcl__rule_003",
  "mh_p_cbcl__rule__cond_007",
  "mh_p_cbcl__rule__cond_008",
  "mh_p_cbcl__rule__cond_009",
  "mh_p_cbcl__rule_004",
  "mh_p_cbcl__rule_005"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__rule_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__rule_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__rule_nm", vars_mh_p_cbcl__synd__rule))
#'   )
#' }
compute_mh_p_cbcl__synd__rule_nm <- function(
    data,
    name = "mh_p_cbcl__synd__rule_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__rule,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__rule_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__rule_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__rule_sum", vars_mh_p_cbcl__synd__rule))
#'   )
#' }
compute_mh_p_cbcl__synd__rule_sum <- function(
    data,
    name = "mh_p_cbcl__synd__rule_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__rule,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__rule_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking
#' behavior): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__rule_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__rule_tscore", vars_mh_p_cbcl__synd__rule))
#'   )
#' }
compute_mh_p_cbcl__synd__rule_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__rule_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__rule,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__soc ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__soc_nm
#' @format `vars_mh_p_cbcl__synd__soc` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__soc` scores.
vars_mh_p_cbcl__synd__soc <- c(
  "mh_p_cbcl__soc__anx_001",
  "mh_p_cbcl__soc_001",
  "mh_p_cbcl__soc_002",
  "mh_p_cbcl__soc_003",
  "mh_p_cbcl__soc_004",
  "mh_p_cbcl__soc_005",
  "mh_p_cbcl__soc_006",
  "mh_p_cbcl__soc_007",
  "mh_p_cbcl__soc_008",
  "mh_p_cbcl__soc_009",
  "mh_p_cbcl__soc_010"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -Social): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__soc_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -Social): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__soc_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__soc_nm", vars_mh_p_cbcl__synd__soc))
#'   )
#' }
compute_mh_p_cbcl__synd__soc_nm <- function(
    data,
    name = "mh_p_cbcl__synd__soc_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__soc,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -Social): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__soc_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -Social): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__soc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__soc_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__soc_sum", vars_mh_p_cbcl__synd__soc))
#'   )
#' }
compute_mh_p_cbcl__synd__soc_sum <- function(
    data,
    name = "mh_p_cbcl__synd__soc_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__soc,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -Social):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__soc_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -Social): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__soc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__soc_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__soc_tscore", vars_mh_p_cbcl__synd__soc))
#'   )
#' }
compute_mh_p_cbcl__synd__soc_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__soc_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__soc,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__som ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__som_nm
#' @format `vars_mh_p_cbcl__synd__som` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__som` scores.
vars_mh_p_cbcl__synd__som <- c(
  "mh_p_cbcl__som__anx_001",
  "mh_p_cbcl__som_001",
  "mh_p_cbcl__som_002",
  "mh_p_cbcl__som__dep_001",
  "mh_p_cbcl__som__somat_001",
  "mh_p_cbcl__som__somat_002",
  "mh_p_cbcl__som__somat_003",
  "mh_p_cbcl__som__somat_004",
  "mh_p_cbcl__som__somat_005",
  "mh_p_cbcl__som__somat_006",
  "mh_p_cbcl__som__somat_007"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__som_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__som_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__som_nm", vars_mh_p_cbcl__synd__som))
#'   )
#' }
compute_mh_p_cbcl__synd__som_nm <- function(
    data,
    name = "mh_p_cbcl__synd__som_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__som,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__som_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__som_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__som_sum", vars_mh_p_cbcl__synd__som))
#'   )
#' }
compute_mh_p_cbcl__synd__som_sum <- function(
    data,
    name = "mh_p_cbcl__synd__som_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__som,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__som_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Somatic
#' complaints): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__som_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__som_tscore", vars_mh_p_cbcl__synd__som))
#'   )
#' }
compute_mh_p_cbcl__synd__som_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__som_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__som,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__tho ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__tho_nm
#' @format `vars_mh_p_cbcl__synd__tho` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__tho` scores.
vars_mh_p_cbcl__synd__tho <- c(
  "mh_p_cbcl__tho_001",
  "mh_p_cbcl__tho__dep_003",
  "mh_p_cbcl__tho__dep_001",
  "mh_p_cbcl__tho_002",
  "mh_p_cbcl__tho_003",
  "mh_p_cbcl__tho_004",
  "mh_p_cbcl__tho_005",
  "mh_p_cbcl__tho_006",
  "mh_p_cbcl__tho_007",
  "mh_p_cbcl__tho_008",
  "mh_p_cbcl__tho__dep_002",
  "mh_p_cbcl__tho_009",
  "mh_p_cbcl__tho_010",
  "mh_p_cbcl__tho_011",
  "mh_p_cbcl__tho_012"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__tho_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__tho_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__tho_nm", vars_mh_p_cbcl__synd__tho))
#'   )
#' }
compute_mh_p_cbcl__synd__tho_nm <- function(
    data,
    name = "mh_p_cbcl__synd__tho_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__tho,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__tho_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__tho_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__tho_sum", vars_mh_p_cbcl__synd__tho))
#'   )
#' }
compute_mh_p_cbcl__synd__tho_sum <- function(
    data,
    name = "mh_p_cbcl__synd__tho_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__tho,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__tho_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__tho_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__tho_tscore", vars_mh_p_cbcl__synd__tho))
#'   )
#' }
compute_mh_p_cbcl__synd__tho_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__tho_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__tho,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl__synd__wthdep ------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_p_cbcl__synd__wthdep_nm
#' @format `vars_mh_p_cbcl__synd__wthdep` is vector of all column names
#' used to compute summary score of `mh_p_cbcl__synd__wthdep` scores.
vars_mh_p_cbcl__synd__wthdep <- c(
  "mh_p_cbcl__wthdep__dep_001",
  "mh_p_cbcl__wthdep__dep_002",
  "mh_p_cbcl__wthdep__dep_003",
  "mh_p_cbcl__wthdep_005",
  "mh_p_cbcl__wthdep_001",
  "mh_p_cbcl__wthdep_002",
  "mh_p_cbcl__wthdep_003",
  "mh_p_cbcl__wthdep_004"
)


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): Number missing"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__wthdep_nm`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__wthdep_nm(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__wthdep_nm", vars_mh_p_cbcl__synd__wthdep))
#'   )
#' }
compute_mh_p_cbcl__synd__wthdep_nm <- function(
    data,
    name = "mh_p_cbcl__synd__wthdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__wthdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): Sum"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__wthdep_sum`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__wthdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__wthdep_sum(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__wthdep_sum", vars_mh_p_cbcl__synd__wthdep))
#'   )
#' }
compute_mh_p_cbcl__synd__wthdep_sum <- function(
    data,
    name = "mh_p_cbcl__synd__wthdep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_p_cbcl__synd__wthdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): T-score"
#'
#' @description
#' Computes the summary score `mh_p_cbcl__synd__wthdep_tscore`
#' Child Behavior Checklist \[Parent\] (Syndrome Scale -
#' Withdrawn/Depressed): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_p_cbcl__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_p_cbcl__synd__wthdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl__synd__wthdep_tscore(data) |>
#'   select(
#'     any_of(c("mh_p_cbcl__synd__wthdep_tscore", vars_mh_p_cbcl__synd__wthdep))
#'   )
#' }
compute_mh_p_cbcl__synd__wthdep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_p_cbcl__synd__wthdep_tscore",
    col_age = "mh_p_cbcl_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_p_cbcl__synd__wthdep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_p_cbcl all ----------------------------------------------------------------
#' Compute all summary scores for mh_p_cbcl.
#' @description
#' This function computes all summary scores for the mh_p_cbcl form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_p_cbcl_all(data)
#' }
compute_mh_p_cbcl_all <- function(data) {
  data |>
    compute_mh_p_cbcl__dsm__adhd_nm() |>
    compute_mh_p_cbcl__dsm__adhd_sum() |>
    compute_mh_p_cbcl__dsm__adhd_tscore() |>
    compute_mh_p_cbcl__dsm__anx_nm() |>
    compute_mh_p_cbcl__dsm__anx_sum() |>
    compute_mh_p_cbcl__dsm__anx_tscore() |>
    compute_mh_p_cbcl__dsm__cond_nm() |>
    compute_mh_p_cbcl__dsm__cond_sum() |>
    compute_mh_p_cbcl__dsm__cond_tscore() |>
    compute_mh_p_cbcl__dsm__dep_nm() |>
    compute_mh_p_cbcl__dsm__dep_sum() |>
    compute_mh_p_cbcl__dsm__dep_tscore() |>
    compute_mh_p_cbcl__dsm__opp_nm() |>
    compute_mh_p_cbcl__dsm__opp_sum() |>
    compute_mh_p_cbcl__dsm__opp_tscore() |>
    compute_mh_p_cbcl__dsm__somat_nm() |>
    compute_mh_p_cbcl__dsm__somat_sum() |>
    compute_mh_p_cbcl__dsm__somat_tscore() |>
    compute_mh_p_cbcl__ocd_nm() |>
    compute_mh_p_cbcl__ocd_sum() |>
    compute_mh_p_cbcl__ocd_tscore() |>
    compute_mh_p_cbcl__sct_nm() |>
    compute_mh_p_cbcl__sct_sum() |>
    compute_mh_p_cbcl__sct_tscore() |>
    compute_mh_p_cbcl__strs_nm() |>
    compute_mh_p_cbcl__strs_sum() |>
    compute_mh_p_cbcl__strs_tscore() |>
    compute_mh_p_cbcl__synd__aggr_nm() |>
    compute_mh_p_cbcl__synd__aggr_sum() |>
    compute_mh_p_cbcl__synd__aggr_tscore() |>
    compute_mh_p_cbcl__synd__anxdep_nm() |>
    compute_mh_p_cbcl__synd__anxdep_sum() |>
    compute_mh_p_cbcl__synd__anxdep_tscore() |>
    compute_mh_p_cbcl__synd__attn_nm() |>
    compute_mh_p_cbcl__synd__attn_sum() |>
    compute_mh_p_cbcl__synd__attn_tscore() |>
    compute_mh_p_cbcl__synd__ext_nm() |>
    compute_mh_p_cbcl__synd__ext_sum() |>
    compute_mh_p_cbcl__synd__ext_tscore() |>
    compute_mh_p_cbcl__synd__int_nm() |>
    compute_mh_p_cbcl__synd__int_sum() |>
    compute_mh_p_cbcl__synd__int_tscore() |>
    compute_mh_p_cbcl__synd__othpr_nm() |>
    compute_mh_p_cbcl__synd__othpr_sum() |>
    compute_mh_p_cbcl__synd__rule_nm() |>
    compute_mh_p_cbcl__synd__rule_sum() |>
    compute_mh_p_cbcl__synd__rule_tscore() |>
    compute_mh_p_cbcl__synd__soc_nm() |>
    compute_mh_p_cbcl__synd__soc_sum() |>
    compute_mh_p_cbcl__synd__soc_tscore() |>
    compute_mh_p_cbcl__synd__som_nm() |>
    compute_mh_p_cbcl__synd__som_sum() |>
    compute_mh_p_cbcl__synd__som_tscore() |>
    compute_mh_p_cbcl__synd__tho_nm() |>
    compute_mh_p_cbcl__synd__tho_sum() |>
    compute_mh_p_cbcl__synd__tho_tscore() |>
    compute_mh_p_cbcl__synd__wthdep_nm() |>
    compute_mh_p_cbcl__synd__wthdep_sum() |>
    compute_mh_p_cbcl__synd__wthdep_tscore() |>
    compute_mh_p_cbcl_nm() |>
    compute_mh_p_cbcl_sum() |>
    compute_mh_p_cbcl_tscore()
}


# mh_y_ysr ---------------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr_nm
#' @format `vars_mh_y_ysr` is vector of all column names
#' used to compute summary score of `mh_y_ysr` scores.
vars_mh_y_ysr <- c(
  "mh_y_ysr__attn__adhd_001",
  "mh_y_ysr__attn__adhd_002",
  "mh_y_ysr__attn__adhd_003",
  "mh_y_ysr__attn__adhd_004",
  "mh_y_ysr__attn__adhd_005",
  "mh_y_ysr__othpr__adhd_001",
  "mh_y_ysr__aggr__adhd_001",
  "mh_y_ysr__soc__anx_001",
  "mh_y_ysr__anxdep__anx_001",
  "mh_y_ysr__anxdep__anx_002",
  "mh_y_ysr__anxdep__anx_003",
  "mh_y_ysr__anxdep__anx_004",
  "mh_y_ysr__som__anx_001",
  "mh_y_ysr__anxdep__anx_005",
  "mh_y_ysr__anxdep__anx_006",
  "mh_y_ysr__anxdep__anx_007",
  "mh_y_ysr__aggr__cond_001",
  "mh_y_ysr__aggr__cond_002",
  "mh_y_ysr__rule__cond_001",
  "mh_y_ysr__rule__cond_002",
  "mh_y_ysr__aggr__cond_003",
  "mh_y_ysr__rule__cond_003",
  "mh_y_ysr__rule__cond_004",
  "mh_y_ysr__aggr__cond_004",
  "mh_y_ysr__rule__cond_005",
  "mh_y_ysr__rule__cond_006",
  "mh_y_ysr__rule__cond_007",
  "mh_y_ysr__rule__cond_008",
  "mh_y_ysr__rule__cond_009",
  "mh_y_ysr__aggr__cond_005",
  "mh_y_ysr__rule__cond_010",
  "mh_y_ysr__wthdep__dep_001",
  "mh_y_ysr__anxdep__dep_001",
  "mh_y_ysr__tho__dep_001",
  "mh_y_ysr__othpr__dep_001",
  "mh_y_ysr__anxdep__dep_002",
  "mh_y_ysr__anxdep__dep_003",
  "mh_y_ysr__som__dep_001",
  "mh_y_ysr__tho__dep_002",
  "mh_y_ysr__othpr__dep_002",
  "mh_y_ysr__anxdep__dep_004",
  "mh_y_ysr__tho__dep_003",
  "mh_y_ysr__wthdep__dep_002",
  "mh_y_ysr__wthdep__dep_003",
  "mh_y_ysr__aggr__opp_001",
  "mh_y_ysr__aggr__opp_002",
  "mh_y_ysr__aggr__opp_003",
  "mh_y_ysr__aggr__opp_004",
  "mh_y_ysr__aggr__opp_005",
  "mh_y_ysr__som__somat_001",
  "mh_y_ysr__som__somat_002",
  "mh_y_ysr__som__somat_003",
  "mh_y_ysr__som__somat_004",
  "mh_y_ysr__som__somat_005",
  "mh_y_ysr__som__somat_006",
  "mh_y_ysr__som__somat_007",
  "mh_y_ysr__aggr_001",
  "mh_y_ysr__aggr_002",
  "mh_y_ysr__aggr_003",
  "mh_y_ysr__aggr_004",
  "mh_y_ysr__aggr_005",
  "mh_y_ysr__aggr_006",
  "mh_y_ysr__anxdep_001",
  "mh_y_ysr__anxdep_002",
  "mh_y_ysr__attn_001",
  "mh_y_ysr__attn_002",
  "mh_y_ysr__attn_003",
  "mh_y_ysr__attn_004",
  "mh_y_ysr__rule_001",
  "mh_y_ysr__rule_002",
  "mh_y_ysr__rule_003",
  "mh_y_ysr__rule_004",
  "mh_y_ysr__rule_005",
  "mh_y_ysr__wthdep_001",
  "mh_y_ysr__wthdep_002",
  "mh_y_ysr__wthdep_003",
  "mh_y_ysr__wthdep_004",
  "mh_y_ysr__wthdep_005",
  "mh_y_ysr__som_001",
  "mh_y_ysr__othpr_001",
  "mh_y_ysr__othpr_002",
  "mh_y_ysr__othpr_003",
  "mh_y_ysr__othpr_004",
  "mh_y_ysr__othpr_005",
  "mh_y_ysr__othpr_006",
  "mh_y_ysr__othpr_007",
  "mh_y_ysr__soc_001",
  "mh_y_ysr__soc_002",
  "mh_y_ysr__soc_003",
  "mh_y_ysr__soc_004",
  "mh_y_ysr__soc_005",
  "mh_y_ysr__soc_006",
  "mh_y_ysr__soc_007",
  "mh_y_ysr__soc_008",
  "mh_y_ysr__soc_009",
  "mh_y_ysr__soc_010",
  "mh_y_ysr__tho_001",
  "mh_y_ysr__tho_002",
  "mh_y_ysr__tho_003",
  "mh_y_ysr__tho_004",
  "mh_y_ysr__tho_005",
  "mh_y_ysr__tho_006",
  "mh_y_ysr__tho_007",
  "mh_y_ysr__tho_008",
  "mh_y_ysr__tho_009"
)


#' Compute "Youth Self Report \[Youth\]: Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr_nm`
#' Youth Self Report \[Youth\]: Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr_nm", vars_mh_y_ysr))
#'   )
#' }
compute_mh_y_ysr_nm <- function(
    data,
    name = "mh_y_ysr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\]: Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr_sum`
#' Youth Self Report \[Youth\]: Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 7 of 105 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr_sum", vars_mh_y_ysr))
#'   )
#' }
compute_mh_y_ysr_sum <- function(
    data,
    name = "mh_y_ysr_sum",
    max_na = 7,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\]: T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr_tscore`
#' Youth Self Report \[Youth\]: T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 7 of 105 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr_tscore", vars_mh_y_ysr))
#'   )
#' }
compute_mh_y_ysr_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 7,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__adhd ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__adhd_nm
#' @format `vars_mh_y_ysr__dsm__adhd` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__adhd` scores.
vars_mh_y_ysr__dsm__adhd <- c(
  "mh_y_ysr__attn__adhd_001",
  "mh_y_ysr__attn__adhd_002",
  "mh_y_ysr__attn__adhd_003",
  "mh_y_ysr__attn__adhd_004",
  "mh_y_ysr__attn__adhd_005",
  "mh_y_ysr__othpr__adhd_001",
  "mh_y_ysr__aggr__adhd_001"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__adhd_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__adhd_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__adhd_nm", vars_mh_y_ysr__dsm__adhd))
#'   )
#' }
compute_mh_y_ysr__dsm__adhd_nm <- function(
    data,
    name = "mh_y_ysr__dsm__adhd_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__adhd,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__adhd_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__adhd_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__adhd_sum", vars_mh_y_ysr__dsm__adhd))
#'   )
#' }
compute_mh_y_ysr__dsm__adhd_sum <- function(
    data,
    name = "mh_y_ysr__dsm__adhd_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__adhd,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__adhd_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - ADHD): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__adhd |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__adhd_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__adhd_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__adhd_tscore", vars_mh_y_ysr__dsm__adhd))
#'   )
#' }
compute_mh_y_ysr__dsm__adhd_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__adhd_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__adhd,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__anx -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__anx_nm
#' @format `vars_mh_y_ysr__dsm__anx` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__anx` scores.
vars_mh_y_ysr__dsm__anx <- c(
  "mh_y_ysr__soc__anx_001",
  "mh_y_ysr__anxdep__anx_001",
  "mh_y_ysr__anxdep__anx_002",
  "mh_y_ysr__anxdep__anx_003",
  "mh_y_ysr__anxdep__anx_004",
  "mh_y_ysr__som__anx_001",
  "mh_y_ysr__anxdep__anx_005",
  "mh_y_ysr__anxdep__anx_006",
  "mh_y_ysr__anxdep__anx_007"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__anx_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__anx_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__anx_nm", vars_mh_y_ysr__dsm__anx))
#'   )
#' }
compute_mh_y_ysr__dsm__anx_nm <- function(
    data,
    name = "mh_y_ysr__dsm__anx_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__anx,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__anx_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__anx_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__anx_sum", vars_mh_y_ysr__dsm__anx))
#'   )
#' }
compute_mh_y_ysr__dsm__anx_sum <- function(
    data,
    name = "mh_y_ysr__dsm__anx_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__anx,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__anx_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Anxiety problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__anx |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__anx_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__anx_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__anx_tscore", vars_mh_y_ysr__dsm__anx))
#'   )
#' }
compute_mh_y_ysr__dsm__anx_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__anx_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__anx,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__cond ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__cond_nm
#' @format `vars_mh_y_ysr__dsm__cond` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__cond` scores.
vars_mh_y_ysr__dsm__cond <- c(
  "mh_y_ysr__aggr__cond_001",
  "mh_y_ysr__aggr__cond_002",
  "mh_y_ysr__rule__cond_001",
  "mh_y_ysr__rule__cond_002",
  "mh_y_ysr__aggr__cond_003",
  "mh_y_ysr__rule__cond_003",
  "mh_y_ysr__rule__cond_004",
  "mh_y_ysr__aggr__cond_004",
  "mh_y_ysr__rule__cond_005",
  "mh_y_ysr__rule__cond_006",
  "mh_y_ysr__rule__cond_007",
  "mh_y_ysr__rule__cond_008",
  "mh_y_ysr__rule__cond_009",
  "mh_y_ysr__aggr__cond_005",
  "mh_y_ysr__rule__cond_010"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__cond_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__cond_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__cond_nm", vars_mh_y_ysr__dsm__cond))
#'   )
#' }
compute_mh_y_ysr__dsm__cond_nm <- function(
    data,
    name = "mh_y_ysr__dsm__cond_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__cond,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__cond_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct problems):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__cond_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__cond_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__cond_sum", vars_mh_y_ysr__dsm__cond))
#'   )
#' }
compute_mh_y_ysr__dsm__cond_sum <- function(
    data,
    name = "mh_y_ysr__dsm__cond_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__cond,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__cond_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__cond |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__cond_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__cond_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__cond_tscore", vars_mh_y_ysr__dsm__cond))
#'   )
#' }
compute_mh_y_ysr__dsm__cond_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__cond_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__cond,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__dep -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__dep_nm
#' @format `vars_mh_y_ysr__dsm__dep` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__dep` scores.
vars_mh_y_ysr__dsm__dep <- c(
  "mh_y_ysr__wthdep__dep_001",
  "mh_y_ysr__anxdep__dep_001",
  "mh_y_ysr__tho__dep_001",
  "mh_y_ysr__othpr__dep_001",
  "mh_y_ysr__anxdep__dep_002",
  "mh_y_ysr__anxdep__dep_003",
  "mh_y_ysr__som__dep_001",
  "mh_y_ysr__tho__dep_002",
  "mh_y_ysr__othpr__dep_002",
  "mh_y_ysr__anxdep__dep_004",
  "mh_y_ysr__tho__dep_003",
  "mh_y_ysr__wthdep__dep_002",
  "mh_y_ysr__wthdep__dep_003"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__dep_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__dep_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__dep_nm", vars_mh_y_ysr__dsm__dep))
#'   )
#' }
compute_mh_y_ysr__dsm__dep_nm <- function(
    data,
    name = "mh_y_ysr__dsm__dep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__dep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__dep_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__dep_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__dep_sum", vars_mh_y_ysr__dsm__dep))
#'   )
#' }
compute_mh_y_ysr__dsm__dep_sum <- function(
    data,
    name = "mh_y_ysr__dsm__dep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__dep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__dep_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Depressive
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__dep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__dep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__dep_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__dep_tscore", vars_mh_y_ysr__dsm__dep))
#'   )
#' }
compute_mh_y_ysr__dsm__dep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__dep_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__dep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__opp -----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__opp_nm
#' @format `vars_mh_y_ysr__dsm__opp` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__opp` scores.
vars_mh_y_ysr__dsm__opp <- c(
  "mh_y_ysr__aggr__opp_001",
  "mh_y_ysr__aggr__opp_002",
  "mh_y_ysr__aggr__opp_003",
  "mh_y_ysr__aggr__opp_004",
  "mh_y_ysr__aggr__opp_005"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__opp_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional Defiant
#' problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__opp_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__opp_nm", vars_mh_y_ysr__dsm__opp))
#'   )
#' }
compute_mh_y_ysr__dsm__opp_nm <- function(
    data,
    name = "mh_y_ysr__dsm__opp_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__opp,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__opp_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional Defiant
#' problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 5 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__opp_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__opp_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__opp_sum", vars_mh_y_ysr__dsm__opp))
#'   )
#' }
compute_mh_y_ysr__dsm__opp_sum <- function(
    data,
    name = "mh_y_ysr__dsm__opp_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__opp,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional
#' Defiant problems): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__opp_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional Defiant
#' problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__opp |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 5 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__opp_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__opp_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__opp_tscore", vars_mh_y_ysr__dsm__opp))
#'   )
#' }
compute_mh_y_ysr__dsm__opp_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__opp_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__opp,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__dsm__somat ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__dsm__somat_nm
#' @format `vars_mh_y_ysr__dsm__somat` is vector of all column names
#' used to compute summary score of `mh_y_ysr__dsm__somat` scores.
vars_mh_y_ysr__dsm__somat <- c(
  "mh_y_ysr__som__somat_001",
  "mh_y_ysr__som__somat_002",
  "mh_y_ysr__som__somat_003",
  "mh_y_ysr__som__somat_004",
  "mh_y_ysr__som__somat_005",
  "mh_y_ysr__som__somat_006",
  "mh_y_ysr__som__somat_007"
)


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic
#' complaints): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__somat_nm`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic complaints):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__somat_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__somat_nm", vars_mh_y_ysr__dsm__somat))
#'   )
#' }
compute_mh_y_ysr__dsm__somat_nm <- function(
    data,
    name = "mh_y_ysr__dsm__somat_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__somat,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic
#' complaints): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__somat_sum`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic complaints):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__somat_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__somat_sum", vars_mh_y_ysr__dsm__somat))
#'   )
#' }
compute_mh_y_ysr__dsm__somat_sum <- function(
    data,
    name = "mh_y_ysr__dsm__somat_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__dsm__somat,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic
#' complaints): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__dsm__somat_tscore`
#' Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Somatic complaints):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__dsm__somat |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 7 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__dsm__somat_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__dsm__somat_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__dsm__somat_tscore", vars_mh_y_ysr__dsm__somat))
#'   )
#' }
compute_mh_y_ysr__dsm__somat_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__dsm__somat_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__dsm__somat,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__pos ----------------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__pos_nm
#' @format `vars_mh_y_ysr__pos` is vector of all column names
#' used to compute summary score of `mh_y_ysr__pos` scores.
vars_mh_y_ysr__pos <- c(
  "mh_y_ysr__pos_001",
  "mh_y_ysr__pos_002",
  "mh_y_ysr__pos_003",
  "mh_y_ysr__pos_004",
  "mh_y_ysr__pos_005",
  "mh_y_ysr__pos_006",
  "mh_y_ysr__pos_007",
  "mh_y_ysr__pos_008",
  "mh_y_ysr__pos_009",
  "mh_y_ysr__pos_010",
  "mh_y_ysr__pos_011",
  "mh_y_ysr__pos_012",
  "mh_y_ysr__pos_013",
  "mh_y_ysr__pos_014"
)


#' Compute "Youth Self Report \[Youth\] (Positive): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__pos_nm`
#' Youth Self Report \[Youth\] (Positive): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__pos_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__pos_nm", vars_mh_y_ysr__pos))
#'   )
#' }
compute_mh_y_ysr__pos_nm <- function(
    data,
    name = "mh_y_ysr__pos_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__pos,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Positive): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__pos_sum`
#' Youth Self Report \[Youth\] (Positive): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__pos_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__pos_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__pos_sum", vars_mh_y_ysr__pos))
#'   )
#' }
compute_mh_y_ysr__pos_sum <- function(
    data,
    name = "mh_y_ysr__pos_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__pos,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Positive): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__pos_tscore`
#' Youth Self Report \[Youth\] (Positive): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__pos |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 14 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__pos_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__pos_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__pos_tscore", vars_mh_y_ysr__pos))
#'   )
#' }
compute_mh_y_ysr__pos_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__pos_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__pos,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__aggr ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__aggr_nm
#' @format `vars_mh_y_ysr__synd__aggr` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__aggr` scores.
vars_mh_y_ysr__synd__aggr <- c(
  "mh_y_ysr__aggr__opp_001",
  "mh_y_ysr__aggr__cond_001",
  "mh_y_ysr__aggr_001",
  "mh_y_ysr__aggr_002",
  "mh_y_ysr__aggr__cond_002",
  "mh_y_ysr__aggr__opp_002",
  "mh_y_ysr__aggr__opp_003",
  "mh_y_ysr__aggr__cond_003",
  "mh_y_ysr__aggr__cond_004",
  "mh_y_ysr__aggr_003",
  "mh_y_ysr__aggr__opp_004",
  "mh_y_ysr__aggr_004",
  "mh_y_ysr__aggr_005",
  "mh_y_ysr__aggr_006",
  "mh_y_ysr__aggr__opp_005",
  "mh_y_ysr__aggr__cond_005",
  "mh_y_ysr__aggr__adhd_001"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Aggressive behavior):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__aggr_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Aggressive behavior):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__aggr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__aggr_nm", vars_mh_y_ysr__synd__aggr))
#'   )
#' }
compute_mh_y_ysr__synd__aggr_nm <- function(
    data,
    name = "mh_y_ysr__synd__aggr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__aggr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Aggressive behavior):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__aggr_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Aggressive behavior): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__aggr_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__aggr_sum", vars_mh_y_ysr__synd__aggr))
#'   )
#' }
compute_mh_y_ysr__synd__aggr_sum <- function(
    data,
    name = "mh_y_ysr__synd__aggr_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__aggr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Aggressive): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__aggr_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Aggressive): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__aggr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 17 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__aggr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__aggr_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__aggr_tscore", vars_mh_y_ysr__synd__aggr))
#'   )
#' }
compute_mh_y_ysr__synd__aggr_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__aggr_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__aggr,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__anxdep -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__anxdep_nm
#' @format `vars_mh_y_ysr__synd__anxdep` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__anxdep` scores.
vars_mh_y_ysr__synd__anxdep <- c(
  "mh_y_ysr__anxdep__dep_001",
  "mh_y_ysr__anxdep__anx_001",
  "mh_y_ysr__anxdep__anx_002",
  "mh_y_ysr__anxdep__anx_003",
  "mh_y_ysr__anxdep_001",
  "mh_y_ysr__anxdep_002",
  "mh_y_ysr__anxdep__dep_002",
  "mh_y_ysr__anxdep__anx_004",
  "mh_y_ysr__anxdep__anx_005",
  "mh_y_ysr__anxdep__dep_003",
  "mh_y_ysr__anxdep__anx_006",
  "mh_y_ysr__anxdep__dep_004",
  "mh_y_ysr__anxdep__anx_007"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__anxdep_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__anxdep_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__anxdep_nm", vars_mh_y_ysr__synd__anxdep))
#'   )
#' }
compute_mh_y_ysr__synd__anxdep_nm <- function(
    data,
    name = "mh_y_ysr__synd__anxdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__anxdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__anxdep_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__anxdep_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__anxdep_sum", vars_mh_y_ysr__synd__anxdep))
#'   )
#' }
compute_mh_y_ysr__synd__anxdep_sum <- function(
    data,
    name = "mh_y_ysr__synd__anxdep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__anxdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__anxdep_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__anxdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 13 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__anxdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__anxdep_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__anxdep_tscore", vars_mh_y_ysr__synd__anxdep))
#'   )
#' }
compute_mh_y_ysr__synd__anxdep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__anxdep_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__anxdep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__attn ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__attn_nm
#' @format `vars_mh_y_ysr__synd__attn` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__attn` scores.
vars_mh_y_ysr__synd__attn <- c(
  "mh_y_ysr__attn_001",
  "mh_y_ysr__attn__adhd_001",
  "mh_y_ysr__attn__adhd_002",
  "mh_y_ysr__attn__adhd_003",
  "mh_y_ysr__attn_002",
  "mh_y_ysr__attn_003",
  "mh_y_ysr__attn__adhd_004",
  "mh_y_ysr__attn_004",
  "mh_y_ysr__attn__adhd_005"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Attention problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__attn_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Attention problems):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__attn_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__attn_nm", vars_mh_y_ysr__synd__attn))
#'   )
#' }
compute_mh_y_ysr__synd__attn_nm <- function(
    data,
    name = "mh_y_ysr__synd__attn_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__attn,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Attention problems):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__attn_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Attention problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__attn_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__attn_sum", vars_mh_y_ysr__synd__attn))
#'   )
#' }
compute_mh_y_ysr__synd__attn_sum <- function(
    data,
    name = "mh_y_ysr__synd__attn_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__attn,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Attention problems):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__attn_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Attention problems):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__attn |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 9 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__attn_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__attn_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__attn_tscore", vars_mh_y_ysr__synd__attn))
#'   )
#' }
compute_mh_y_ysr__synd__attn_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__attn_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__attn,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__ext ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__ext_nm
#' @format `vars_mh_y_ysr__synd__ext` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__ext` scores.
vars_mh_y_ysr__synd__ext <- c(
  "mh_y_ysr__rule_001",
  "mh_y_ysr__rule__cond_001",
  "mh_y_ysr__rule__cond_002",
  "mh_y_ysr__rule__cond_003",
  "mh_y_ysr__rule__cond_004",
  "mh_y_ysr__rule_002",
  "mh_y_ysr__rule__cond_005",
  "mh_y_ysr__rule__cond_006",
  "mh_y_ysr__rule__cond_007",
  "mh_y_ysr__rule__cond_008",
  "mh_y_ysr__rule__cond_009",
  "mh_y_ysr__rule_003",
  "mh_y_ysr__rule_004",
  "mh_y_ysr__rule__cond_010",
  "mh_y_ysr__rule_005",
  "mh_y_ysr__aggr__opp_001",
  "mh_y_ysr__aggr__cond_001",
  "mh_y_ysr__aggr_001",
  "mh_y_ysr__aggr_002",
  "mh_y_ysr__aggr__cond_002",
  "mh_y_ysr__aggr__opp_002",
  "mh_y_ysr__aggr__opp_003",
  "mh_y_ysr__aggr__cond_003",
  "mh_y_ysr__aggr__cond_004",
  "mh_y_ysr__aggr_003",
  "mh_y_ysr__aggr__opp_004",
  "mh_y_ysr__aggr_004",
  "mh_y_ysr__aggr_005",
  "mh_y_ysr__aggr_006",
  "mh_y_ysr__aggr__opp_005",
  "mh_y_ysr__aggr__cond_005",
  "mh_y_ysr__aggr__adhd_001"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - External): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__ext_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - External): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__ext_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__ext_nm", vars_mh_y_ysr__synd__ext))
#'   )
#' }
compute_mh_y_ysr__synd__ext_nm <- function(
    data,
    name = "mh_y_ysr__synd__ext_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__ext,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - External): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__ext_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - External): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__ext_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__ext_sum", vars_mh_y_ysr__synd__ext))
#'   )
#' }
compute_mh_y_ysr__synd__ext_sum <- function(
    data,
    name = "mh_y_ysr__synd__ext_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__ext,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - External): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__ext_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - External): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__ext |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 32 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__ext_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__ext_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__ext_tscore", vars_mh_y_ysr__synd__ext))
#'   )
#' }
compute_mh_y_ysr__synd__ext_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__ext_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__ext,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__int ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__int_nm
#' @format `vars_mh_y_ysr__synd__int` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__int` scores.
vars_mh_y_ysr__synd__int <- c(
  "mh_y_ysr__anxdep__dep_001",
  "mh_y_ysr__anxdep__anx_001",
  "mh_y_ysr__anxdep__anx_002",
  "mh_y_ysr__anxdep__anx_003",
  "mh_y_ysr__anxdep_001",
  "mh_y_ysr__anxdep_002",
  "mh_y_ysr__anxdep__dep_002",
  "mh_y_ysr__anxdep__anx_004",
  "mh_y_ysr__anxdep__anx_005",
  "mh_y_ysr__anxdep__dep_003",
  "mh_y_ysr__anxdep__anx_006",
  "mh_y_ysr__anxdep__dep_004",
  "mh_y_ysr__anxdep__anx_007",
  "mh_y_ysr__wthdep__dep_001",
  "mh_y_ysr__wthdep_001",
  "mh_y_ysr__wthdep_002",
  "mh_y_ysr__wthdep_003",
  "mh_y_ysr__wthdep_004",
  "mh_y_ysr__wthdep__dep_002",
  "mh_y_ysr__wthdep__dep_003",
  "mh_y_ysr__wthdep_005",
  "mh_y_ysr__som__anx_001",
  "mh_y_ysr__som_001",
  "mh_y_ysr__som__dep_001",
  "mh_y_ysr__som__somat_001",
  "mh_y_ysr__som__somat_002",
  "mh_y_ysr__som__somat_003",
  "mh_y_ysr__som__somat_004",
  "mh_y_ysr__som__somat_005",
  "mh_y_ysr__som__somat_006",
  "mh_y_ysr__som__somat_007"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Internaling): Number
#' missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__int_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Internaling): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__int_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__int_nm", vars_mh_y_ysr__synd__int))
#'   )
#' }
compute_mh_y_ysr__synd__int_nm <- function(
    data,
    name = "mh_y_ysr__synd__int_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__int,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Internaling): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__int_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Internaling): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 31 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__int_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__int_sum", vars_mh_y_ysr__synd__int))
#'   )
#' }
compute_mh_y_ysr__synd__int_sum <- function(
    data,
    name = "mh_y_ysr__synd__int_sum",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__int,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Internaling): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__int_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Internaling): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__int |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 2 of 31 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__int_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__int_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__int_tscore", vars_mh_y_ysr__synd__int))
#'   )
#' }
compute_mh_y_ysr__synd__int_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__int_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 2,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__int,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__othpr --------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__othpr_nm
#' @format `vars_mh_y_ysr__synd__othpr` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__othpr` scores.
vars_mh_y_ysr__synd__othpr <- c(
  "mh_y_ysr__othpr_001",
  "mh_y_ysr__othpr__dep_001",
  "mh_y_ysr__othpr_002",
  "mh_y_ysr__othpr_003",
  "mh_y_ysr__othpr_004",
  "mh_y_ysr__othpr_005",
  "mh_y_ysr__othpr_006",
  "mh_y_ysr__othpr__dep_002",
  "mh_y_ysr__othpr__adhd_001",
  "mh_y_ysr__othpr_007"
)


#' Compute "Youth Self Report \[Youth\] (Other problems): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__othpr_nm`
#' Youth Self Report \[Youth\] (Other problems): Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__othpr_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__othpr_nm", vars_mh_y_ysr__synd__othpr))
#'   )
#' }
compute_mh_y_ysr__synd__othpr_nm <- function(
    data,
    name = "mh_y_ysr__synd__othpr_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__othpr,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Other problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__othpr_sum`
#' Youth Self Report \[Youth\] (Other problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__othpr |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__othpr_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__othpr_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__othpr_sum", vars_mh_y_ysr__synd__othpr))
#'   )
#' }
compute_mh_y_ysr__synd__othpr_sum <- function(
    data,
    name = "mh_y_ysr__synd__othpr_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__othpr,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


# mh_y_ysr__synd__rule ---------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__rule_nm
#' @format `vars_mh_y_ysr__synd__rule` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__rule` scores.
vars_mh_y_ysr__synd__rule <- c(
  "mh_y_ysr__rule_001",
  "mh_y_ysr__rule__cond_001",
  "mh_y_ysr__rule__cond_002",
  "mh_y_ysr__rule__cond_003",
  "mh_y_ysr__rule__cond_004",
  "mh_y_ysr__rule_002",
  "mh_y_ysr__rule__cond_005",
  "mh_y_ysr__rule__cond_006",
  "mh_y_ysr__rule__cond_007",
  "mh_y_ysr__rule__cond_008",
  "mh_y_ysr__rule__cond_009",
  "mh_y_ysr__rule_003",
  "mh_y_ysr__rule_004",
  "mh_y_ysr__rule__cond_010",
  "mh_y_ysr__rule_005"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking
#' behavior): Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__rule_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking behavior):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__rule_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__rule_nm", vars_mh_y_ysr__synd__rule))
#'   )
#' }
compute_mh_y_ysr__synd__rule_nm <- function(
    data,
    name = "mh_y_ysr__synd__rule_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__rule,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking
#' behavior): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__rule_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking behavior):
#' Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__rule_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__rule_sum", vars_mh_y_ysr__synd__rule))
#'   )
#' }
compute_mh_y_ysr__synd__rule_sum <- function(
    data,
    name = "mh_y_ysr__synd__rule_sum",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__rule,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking
#' behavior): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__rule_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking behavior):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__rule |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 1 of 15 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__rule_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__rule_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__rule_tscore", vars_mh_y_ysr__synd__rule))
#'   )
#' }
compute_mh_y_ysr__synd__rule_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__rule_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 1,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__rule,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__soc ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__soc_nm
#' @format `vars_mh_y_ysr__synd__soc` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__soc` scores.
vars_mh_y_ysr__synd__soc <- c(
  "mh_y_ysr__soc__anx_001",
  "mh_y_ysr__soc_001",
  "mh_y_ysr__soc_002",
  "mh_y_ysr__soc_003",
  "mh_y_ysr__soc_004",
  "mh_y_ysr__soc_005",
  "mh_y_ysr__soc_006",
  "mh_y_ysr__soc_007",
  "mh_y_ysr__soc_008",
  "mh_y_ysr__soc_009",
  "mh_y_ysr__soc_010"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale -Social problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__soc_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale -Social problems): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__soc_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__soc_nm", vars_mh_y_ysr__synd__soc))
#'   )
#' }
compute_mh_y_ysr__synd__soc_nm <- function(
    data,
    name = "mh_y_ysr__synd__soc_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__soc,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale -Social problems): Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__soc_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale -Social problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__soc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__soc_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__soc_sum", vars_mh_y_ysr__synd__soc))
#'   )
#' }
compute_mh_y_ysr__synd__soc_sum <- function(
    data,
    name = "mh_y_ysr__synd__soc_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__soc,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale -Social): T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__soc_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale -Social): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__soc |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 11 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__soc_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__soc_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__soc_tscore", vars_mh_y_ysr__synd__soc))
#'   )
#' }
compute_mh_y_ysr__synd__soc_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__soc_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__soc,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__som ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__som_nm
#' @format `vars_mh_y_ysr__synd__som` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__som` scores.
vars_mh_y_ysr__synd__som <- c(
  "mh_y_ysr__som__anx_001",
  "mh_y_ysr__som_001",
  "mh_y_ysr__som__dep_001",
  "mh_y_ysr__som__somat_001",
  "mh_y_ysr__som__somat_002",
  "mh_y_ysr__som__somat_003",
  "mh_y_ysr__som__somat_004",
  "mh_y_ysr__som__somat_005",
  "mh_y_ysr__som__somat_006",
  "mh_y_ysr__som__somat_007"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__som_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__som_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__som_nm", vars_mh_y_ysr__synd__som))
#'   )
#' }
compute_mh_y_ysr__synd__som_nm <- function(
    data,
    name = "mh_y_ysr__synd__som_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__som,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__som_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__som_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__som_sum", vars_mh_y_ysr__synd__som))
#'   )
#' }
compute_mh_y_ysr__synd__som_sum <- function(
    data,
    name = "mh_y_ysr__synd__som_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__som,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__som_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Somatic complaints):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__som |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 10 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__som_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__som_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__som_tscore", vars_mh_y_ysr__synd__som))
#'   )
#' }
compute_mh_y_ysr__synd__som_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__som_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__som,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__tho ----------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__tho_nm
#' @format `vars_mh_y_ysr__synd__tho` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__tho` scores.
vars_mh_y_ysr__synd__tho <- c(
  "mh_y_ysr__tho_001",
  "mh_y_ysr__tho__dep_001",
  "mh_y_ysr__tho_002",
  "mh_y_ysr__tho_003",
  "mh_y_ysr__tho_004",
  "mh_y_ysr__tho_005",
  "mh_y_ysr__tho_006",
  "mh_y_ysr__tho__dep_002",
  "mh_y_ysr__tho_007",
  "mh_y_ysr__tho_008",
  "mh_y_ysr__tho_009",
  "mh_y_ysr__tho__dep_003"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Thought problems):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__tho_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Thought problems): Number
#' missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__tho_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__tho_nm", vars_mh_y_ysr__synd__tho))
#'   )
#' }
compute_mh_y_ysr__synd__tho_nm <- function(
    data,
    name = "mh_y_ysr__synd__tho_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__tho,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Thought problems):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__tho_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Thought problems): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 12 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__tho_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__tho_sum", vars_mh_y_ysr__synd__tho))
#'   )
#' }
compute_mh_y_ysr__synd__tho_sum <- function(
    data,
    name = "mh_y_ysr__synd__tho_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__tho,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Thought problems):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__tho_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Thought problems): T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__tho |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 12 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__tho_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__tho_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__tho_tscore", vars_mh_y_ysr__synd__tho))
#'   )
#' }
compute_mh_y_ysr__synd__tho_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__tho_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__tho,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr__synd__wthdep -------------------------------------------------------
#' @export
#' @autoglobal
#' @rdname compute_mh_y_ysr__synd__wthdep_nm
#' @format `vars_mh_y_ysr__synd__wthdep` is vector of all column names
#' used to compute summary score of `mh_y_ysr__synd__wthdep` scores.
vars_mh_y_ysr__synd__wthdep <- c(
  "mh_y_ysr__wthdep__dep_001",
  "mh_y_ysr__wthdep_001",
  "mh_y_ysr__wthdep_002",
  "mh_y_ysr__wthdep_003",
  "mh_y_ysr__wthdep_004",
  "mh_y_ysr__wthdep__dep_002",
  "mh_y_ysr__wthdep__dep_003",
  "mh_y_ysr__wthdep_005"
)


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed):
#' Number missing"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__wthdep_nm`
#' Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed):
#' Number missing
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#'
#' @inherit dummy_aseba params return references
#'
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__wthdep_nm(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__wthdep_nm", vars_mh_y_ysr__synd__wthdep))
#'   )
#' }
compute_mh_y_ysr__synd__wthdep_nm <- function(
    data,
    name = "mh_y_ysr__synd__wthdep_nm",
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_nm(
      name    = name,
      vars    = vars_mh_y_ysr__synd__wthdep,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed):
#' Sum"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__wthdep_sum`
#' Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed): Sum
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__wthdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__wthdep_sum(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__wthdep_sum", vars_mh_y_ysr__synd__wthdep))
#'   )
#' }
compute_mh_y_ysr__synd__wthdep_sum <- function(
    data,
    name = "mh_y_ysr__synd__wthdep_sum",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  data |>
    ss_sum(
      name    = name,
      vars    = vars_mh_y_ysr__synd__wthdep,
      max_na  = max_na,
      exclude = exclude,
      combine = combine
    )
}


#' Compute "Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed):
#' T-score"
#'
#' @description
#' Computes the summary score `mh_y_ysr__synd__wthdep_tscore`
#' Youth Self Report \[Youth\] (Syndrome Scale - Withdrawn/Depressed):
#' T-score
#'
#' - *Summarized variables:*
#'   ```{r, echo=FALSE, results='asis'}
#'   vars_mh_y_ysr__synd__wthdep |> md_bullet(2, TRUE)
#'   ```
#' - *Excluded values:*
#'   - 777
#'   - 999
#' - *Validation criterion:* maximally 0 of 8 items missing
#'
#' @inherit dummy_aseba params return references
#' @seealso [compute_mh_y_ysr__synd__wthdep_nm()]
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr__synd__wthdep_tscore(data) |>
#'   select(
#'     any_of(c("mh_y_ysr__synd__wthdep_tscore", vars_mh_y_ysr__synd__wthdep))
#'   )
#' }
compute_mh_y_ysr__synd__wthdep_tscore <- function(
    data,
    data_norm = NULL,
    name = "mh_y_ysr__synd__wthdep_tscore",
    col_age = "mh_y_ysr_age",
    col_sex = "ab_g_stc__cohort_sex",
    max_na = 0,
    exclude = c("777", "999"),
    combine = TRUE) {
  check_col_names(data, name)

  ss_tscore(
    data,
    data_norm = data_norm,
    vars = vars_mh_y_ysr__synd__wthdep,
    name = name,
    max_na = max_na,
    exclude = exclude,
    col_age = col_age,
    col_sex = col_sex,
    combine = combine
  )
}


# mh_y_ysr all -----------------------------------------------------------------
#' Compute all summary scores for mh_y_ysr.
#' @description
#' This function computes all summary scores for the mh_y_ysr form.
#' Make sure to have all necessary columns in the data frame.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @return tbl. The input data frame with the summary
#' scores appended as new columns.
#' @export
#' @autoglobal
#' @examples
#' \dontrun{
#' compute_mh_y_ysr_all(data)
#' }
compute_mh_y_ysr_all <- function(data) {
  data |>
    compute_mh_y_ysr__dsm__adhd_nm() |>
    compute_mh_y_ysr__dsm__adhd_sum() |>
    compute_mh_y_ysr__dsm__adhd_tscore() |>
    compute_mh_y_ysr__dsm__anx_nm() |>
    compute_mh_y_ysr__dsm__anx_sum() |>
    compute_mh_y_ysr__dsm__anx_tscore() |>
    compute_mh_y_ysr__dsm__cond_nm() |>
    compute_mh_y_ysr__dsm__cond_sum() |>
    compute_mh_y_ysr__dsm__cond_tscore() |>
    compute_mh_y_ysr__dsm__dep_nm() |>
    compute_mh_y_ysr__dsm__dep_sum() |>
    compute_mh_y_ysr__dsm__dep_tscore() |>
    compute_mh_y_ysr__dsm__opp_nm() |>
    compute_mh_y_ysr__dsm__opp_sum() |>
    compute_mh_y_ysr__dsm__opp_tscore() |>
    compute_mh_y_ysr__dsm__somat_nm() |>
    compute_mh_y_ysr__dsm__somat_sum() |>
    compute_mh_y_ysr__dsm__somat_tscore() |>
    compute_mh_y_ysr__pos_nm() |>
    compute_mh_y_ysr__pos_sum() |>
    compute_mh_y_ysr__pos_tscore() |>
    compute_mh_y_ysr__synd__aggr_nm() |>
    compute_mh_y_ysr__synd__aggr_sum() |>
    compute_mh_y_ysr__synd__aggr_tscore() |>
    compute_mh_y_ysr__synd__anxdep_nm() |>
    compute_mh_y_ysr__synd__anxdep_sum() |>
    compute_mh_y_ysr__synd__anxdep_tscore() |>
    compute_mh_y_ysr__synd__attn_nm() |>
    compute_mh_y_ysr__synd__attn_sum() |>
    compute_mh_y_ysr__synd__attn_tscore() |>
    compute_mh_y_ysr__synd__ext_nm() |>
    compute_mh_y_ysr__synd__ext_sum() |>
    compute_mh_y_ysr__synd__ext_tscore() |>
    compute_mh_y_ysr__synd__int_nm() |>
    compute_mh_y_ysr__synd__int_sum() |>
    compute_mh_y_ysr__synd__int_tscore() |>
    compute_mh_y_ysr__synd__othpr_nm() |>
    compute_mh_y_ysr__synd__othpr_sum() |>
    compute_mh_y_ysr__synd__rule_nm() |>
    compute_mh_y_ysr__synd__rule_sum() |>
    compute_mh_y_ysr__synd__rule_tscore() |>
    compute_mh_y_ysr__synd__soc_nm() |>
    compute_mh_y_ysr__synd__soc_sum() |>
    compute_mh_y_ysr__synd__soc_tscore() |>
    compute_mh_y_ysr__synd__som_nm() |>
    compute_mh_y_ysr__synd__som_sum() |>
    compute_mh_y_ysr__synd__som_tscore() |>
    compute_mh_y_ysr__synd__tho_nm() |>
    compute_mh_y_ysr__synd__tho_sum() |>
    compute_mh_y_ysr__synd__tho_tscore() |>
    compute_mh_y_ysr__synd__wthdep_nm() |>
    compute_mh_y_ysr__synd__wthdep_sum() |>
    compute_mh_y_ysr__synd__wthdep_tscore() |>
    compute_mh_y_ysr_nm() |>
    compute_mh_y_ysr_sum() |>
    compute_mh_y_ysr_tscore()
}
