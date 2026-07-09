# fmt: skip file

#' @export
#' @autoglobal
#' @rdname compute_tlfb_abst
#' @format `tlfb_substances` is a character vector of all substances that can be
#' reported in the TLFB.
tlfb_substances <- c(
  "'Fake' Marijuana or Synthetics",
  "Alcohol",
  "Anabolic Steroids",
  "Any Other Drug They Used to Get High",
  "Blunts or Combined Tobacco and Marijuana in Joints",
  "CBD (Non-Medical Use)",
  "Cathinones such as Bath Salts, Drone, or Meph",
  "Cigars, Little Cigars, or Cigarillos",
  "Cocaine or Crack Cocaine",
  "Concentrated Marijuana Tinctures",
  "Ecstasy, Molly, or MDMA",
  "Electronic Nicotine or Vaping Products",
  "GHB, Liquid G, or Georgia Homeboy",
  "Hallucinogen Drugs including LSD, PCP, Peyote, Mescaline, DMT, AMT, or Foxy",
  "Heroin, Opium, Junk, Smack, or Dope",
  "Hookah with Tobacco",
  "Inhalants",
  "Ketamine or Special K",
  "Marijuana Edibles",
  "Marijuana Infused Alcohol Drinks",
  "Methamphetamine, Meth, or Crystal Meth",
  "Nicotine Replacements",
  "OTC Cough or Cold Medicine, DXM, 'Lean', or 'Purple Drank'",
  "Prescription Anxiolytics, Tranquilizers, or Sedatives",
  "Prescription Pain Relievers or Opioids",
  "Prescription Stimulants",
  "Psilocybin, Magic Mushrooms, or Shrooms",
  "Salvia",
  "Smokeless Tobacco, Chew, or Snus",
  "Smoking Marijuana Flower",
  "Smoking Marijuana Oils or Concentrates",
  "Tobacco Cigarette",
  "Tobacco in a Pipe",
  "Vaped Marijuana Flower",
  "Vaped Marijuana Oils or Concentrates",
  # Combined:
  "Marijuana (all forms)",
  "Nicotine (all forms)"
)

#' Compute TLFB length of abstinence
#'
#' @description Computes the length of abstinence in days for a given (set of)
#'   substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; and/or only binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_abst(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__cum_abst",
#'   substance = "Alcohol"
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_abst <- function(data,
                              name,
                              substance = NULL,
                              period = NULL,
                              days = NULL,
                              binge = NULL) {
  check_args_tlfb(
    data      = data,
    name      = name,
    substance = substance,
    period    = period,
    days      = days,
    binge     = binge
  )

  data <- data |>
    add_combined_substances(substance, NULL)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      binge     = binge
    )

  suppressWarnings(
    data_filtered |>
      summarize(
        {{ name }} := as.integer(first(dt_tlfb) - max(dt_use)),
        .by = c("participant_id", "session_id")
      )
  )
}

#' Compute TLFB first or last date of substance use
#'
#' @description Computes either the first or last date of use for a given (set
#'   of) substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; only considering days with co-use of (a)other substance(s);
#'   and/or only binge use.
#' @inheritParams check_args_tlfb
#' @param position character. The position of the substance use event. Must be
#'   one of `"first"` or `"last"`.
#'
#' @return A tibble with the computed score for each participant/event.
#' @seealso [compute_tlfb_abst()]
#'
#' @examples
#' \dontrun{
#' compute_tlfb_dt(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__first__cum_dt",
#'   substance = "Alcohol",
#'   position = "first"
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_dt <- function(data,
                            name,
                            substance = NULL,
                            period = NULL,
                            days = NULL,
                            co_use = NULL,
                            binge = NULL,
                            position) {
  chk::chk_not_null(position)

  check_args_tlfb(
    data      = data,
    name      = name,
    substance = substance,
    period    = period,
    days      = days,
    co_use    = co_use,
    binge     = binge,
    position  = position
  )

  data <- data |>
    add_combined_substances(substance, co_use)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      co_use    = co_use,
      binge     = binge
    )

  summary_function <- if (position == "first") {
    min
  } else if (position == "last") {
    max
  }

  suppressWarnings(
    data_filtered |>
      summarize(
        {{ name }} := summary_function(dt_use),
        .by = c("participant_id", "session_id")
      )
  )
}

#' Compute TLFB maximum dose
#'
#' @description Computes the maximum dose over all use days for a given (set of)
#'   substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; only considering specific day types (weekends or week days);
#'   only considering days with co-use of (a)other substance(s); and/or only
#'   binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_maxdose(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__3mo_maxdose",
#'   substance = "Alcohol",
#'   days = 90
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_maxdose <- function(data,
                                 name,
                                 substance = NULL,
                                 period = NULL,
                                 days = NULL,
                                 wknd = NULL,
                                 co_use = NULL,
                                 binge = NULL) {
  check_args_tlfb(
    data      = data,
    name      = name,
    substance = substance,
    period    = period,
    days      = days,
    wknd      = wknd,
    co_use    = co_use,
    binge     = binge
  )

  data <- data |>
    add_combined_substances(substance, co_use)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      wknd      = wknd,
      co_use    = co_use,
      binge     = binge
    )

  suppressWarnings(
    data_filtered |>
      summarize(
        dt_qty = sum(quantity),
        .by = c(participant_id, session_id, dt_use)
      ) |>
      summarize(
        {{ name }} := max(dt_qty),
        .by = c(participant_id, session_id)
      )
  )
}

#' Compute TLFB mean quantity
#'
#' @description Computes the mean quantity per use day for a given (set of)
#'   substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; only considering specific day types (weekends or week days);
#'   only considering days with co-use of (a)other substance(s); and/or only
#'   binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_mean(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__1mo_mean",
#'   substance = "Alcohol",
#'   days = 30
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_mean <- function(data,
                              name,
                              substance = NULL,
                              period = NULL,
                              days = NULL,
                              wknd = NULL,
                              co_use = NULL,
                              binge = NULL) {
  check_args_tlfb(
    data      = data,
    name      = name,
    substance = substance,
    period    = period,
    days      = days,
    wknd      = wknd,
    co_use    = co_use,
    binge     = binge
  )

  data <- data |>
    add_combined_substances(substance, co_use)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      wknd      = wknd,
      co_use    = co_use,
      binge     = binge
    )

  data_filtered |>
    summarize(
      ud  = n_distinct(dt_use),
      qty = sum(quantity),
      .by = c(participant_id, session_id)
    ) |>
    transmute(
      participant_id,
      session_id,
      {{ name }} := round(qty / ud, 3)
    )
}

#' Compute TLFB total dose
#'
#' @description Computes the total dose over all use day for a given (set of)
#'   substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; only considering specific day types (weekends or week days);
#'   only considering days with co-use of (a)other substance(s); and/or only
#'   binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_totdose(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__binge_totdose",
#'   substance = "Alcohol",
#'   binge = list("F" = 4, "M" = 5)
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_totdose <- function(data,
                                 name,
                                 substance = NULL,
                                 period = NULL,
                                 days = NULL,
                                 wknd = NULL,
                                 co_use = NULL,
                                 binge = NULL) {
  check_args_tlfb(
    data      = data,
    name      = name,
    substance = substance,
    period    = period,
    days      = days,
    wknd      = wknd,
    co_use    = co_use,
    binge     = binge
  )

  data <- data |>
    add_combined_substances(substance, co_use)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      wknd      = wknd,
      co_use    = co_use,
      binge     = binge
    )

  data_filtered |>
    summarize(
      {{ name }} := sum(quantity),
      .by = c(participant_id, session_id)
    )
}

#' Compute TLFB lifetime total dose
#'
#' @description Computes the lifetime total dose over all use day for a given
#'   (set of) substance(s). Optionally, allows to filter by period (detailed
#'   and/or estimated); only considering a specified number of days before the
#'   TLFB interview; only considering specific day types (weekends or week
#'   days); only considering days with co-use of (a)other substance(s); and/or
#'   only binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_totdose_sum(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__totdose_sum",
#'   substance = "Alcohol"
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_totdose_sum <- function(data,
                                     name,
                                     substance = NULL,
                                     period = NULL,
                                     days = NULL,
                                     wknd = NULL,
                                     co_use = NULL,
                                     binge = NULL) {
  compute_tlfb_totdose(
    data,
    "tlfb_totdose",
    substance,
    period,
    days,
    wknd,
    co_use,
    binge
  ) |>
    create_session_num() |>
    arrange(participant_id, session_num) |>
    mutate(
      {{ name }} := cumsum(tlfb_totdose),
      .by = participant_id
    ) |>
    select(-tlfb_totdose, -session_num)
}

#' Compute TLFB use days
#'
#' @description Computes the number of use days for a given (set of)
#'   substance(s). Optionally, allows to filter by period (detailed and/or
#'   estimated); only considering a specified number of days before the TLFB
#'   interview; only considering specific day types (weekends or week days);
#'   only considering days with co-use of (a)other substance(s); and/or only
#'   binge use.
#'
#' @inheritParams check_args_tlfb
#'
#' @return A tibble with the computed score for each participant/event.
#'
#' @examples
#' \dontrun{
#' compute_tlfb_ud(
#'   data = data_tlfb,
#'   name = "su_y_tlfb__alc__1mo__wknd_ud",
#'   substance = "Alcohol",
#'   days = 30,
#'   wknd = TRUE
#' )
#' }
#' @export
#' @autoglobal
compute_tlfb_ud <- function(data,
                            name,
                            substance = NULL,
                            period = NULL,
                            days = NULL,
                            wknd = NULL,
                            co_use = NULL,
                            binge = NULL) {
  check_args_tlfb(
    data           = data,
    name           = name,
    substance      = substance,
    period         = period,
    days           = days,
    wknd           = wknd,
    co_use         = co_use,
    binge          = binge
  )

  data <- data |>
    add_combined_substances(substance, co_use)

  data_filtered <- data |>
    filter_tlfb(
      substance = substance,
      period    = period,
      days      = days,
      wknd      = wknd,
      co_use    = co_use,
      binge     = binge
    )

  data_filtered |>
    summarize(
      {{ name }} := as.integer(n_distinct(dt_use)),
      .by = c(participant_id, session_id)
    )
}

#' Add combined substance quantities
#'
#' Adds use days with combined quantities for marijuana and/or nicotine by
#' combining all individually reported substance quantities for the respective
#' substance class on a given day and applying standard factors to convert them
#' into the same unit.
#'
#' @inheritParams compute_tlfb_mean
#'
#' @return A data frame with the original data and, if `substance` contains
#' either one of `"Marijuana (all forms)"` or `"Nicotine (all forms)"`, newly
#' created combined substance(s) use days and quantities.
#' @autoglobal
#' @noRd
#' @examples
#' \dontrun{
#' data <- tibble::tibble(
#'   substance = c(
#'     "Smoking Marijuana Flower",
#'     "Vaped Marijuana Oils or Concentrates",
#'     "Tobacco Cigarette"
#'   ),
#'   quantity = c(10, 5, 20)
#' )
#' add_combined_substances(data, "Marijuana (all forms)")
#' add_combined_substances(data, "Smoking Marijuana Flower")
#' }
add_combined_substances <- function(data,
                                    substance,
                                    co_use = NULL) {
  if (
    "Marijuana (all forms)" %in% substance | "Marijuana (all forms)" %in% co_use
  ) {
    data <- bind_rows(
      data,
      data |>
        inner_join(
          tibble::tribble(
            ~substance, ~standard_factor,
            "'Fake' Marijuana or Synthetics", 0.5,
            "Blunts or Combined Tobacco and Marijuana in Joints", 0.5,
            # CBD uses are excluded from combined cannabis scores
            "Concentrated Marijuana Tinctures", 1,
            "Marijuana Edibles", 1,
            "Marijuana Infused Alcohol Drinks", 1,
            "Smoking Marijuana Flower", 0.5,
            "Smoking Marijuana Oils or Concentrates", 1,
            "Vaped Marijuana Flower", 0.5,
            "Vaped Marijuana Oils or Concentrates", 1
          ),
          by = "substance"
        ) |>
        mutate(
          substance = "Marijuana (all forms)",
          quantity = standard_factor * quantity
        )
    ) |>
      select(-standard_factor)
  }


  if (
    "Nicotine (all forms)" %in% substance | "Nicotine (all forms)" %in% co_use
  ) {
    data <- bind_rows(
      data,
      data |>
        inner_join(
          tibble::tribble(
            ~substance, ~standard_factor,
            "Cigars, Little Cigars, or Cigarillos", 14,
            "Electronic Nicotine or Vaping Products", 1,
            "Hookah with Tobacco", 1,
            "Nicotine Replacements", 1,
            "Smokeless Tobacco, Chew, or Snus", 4,
            "Tobacco Cigarette", 1,
            "Tobacco in a Pipe", 1
          ),
          by = "substance"
        ) |>
        mutate(
          substance = "Nicotine (all forms)",
          quantity = standard_factor * quantity
        ) |>
        select(-standard_factor)
    )
  }

  data
}

#' Filter TLFB data
#'
#' This function filters the TLFB (Timeline Followback) data based on specified
#' substance(s); period (estimated vs. detailed); number of days before the TLFB
#' interview; weekend-only usage; co-use of other substances; and/or binge use.
#'
#' @inheritParams compute_tlfb_mean
#'
#' @return A filtered data frame based on the specified criteria.
#' @examples
#' \dontrun{
#' filtered_data <- filter_tlfb(
#'   data,
#'   substance = "Alcohol",
#'   wknd_only = TRUE,
#'   period = "estimated",
#'   days = 30
#' )
#' }
#' @export
#' @autoglobal
filter_tlfb <- function(data,
                        substance = NULL,
                        period = NULL,
                        days = NULL,
                        wknd = NULL,
                        co_use = NULL,
                        binge = NULL) {
  # co-use (has to be first filter)
  if (!is.null(co_use)) {
    data <- data |>
      filter_co_use(co_use)
  }

  # substance(s)
  if (!is.null(substance)) {
    data <- data |>
      dplyr::filter(substance %in% !!substance)
  }

  # period
  if (!is.null(period)) {
    data <- data |>
      dplyr::filter(period %in% !!period)
  }

  # weekend / week days
  if (!is.null(wknd)) {
    data <- data |>
      dplyr::filter(dt_use_wknd == wknd)
  }

  # days before TLFB interview
  if (!is.null(days)) {
    data <- data |>
      dplyr::filter(dt_use >= (dt_tlfb - days))
  }

  # binge use
  if (!is.null(binge)) {
    data <- data |>
      filter_binge(binge)
  }

  data
}

#' @autoglobal
#' @noRd
filter_co_use <- function(data, co_use) {
  data |>
    group_by(
      participant_id,
      session_id,
      dt_use
    ) |>
    dplyr::filter(
      any(substance %in% !!co_use)
    ) |>
    ungroup()
}

filter_binge <- function(data, binge) {
  if (typeof(binge) == "list") {
    quant_f <- binge[["F"]]
    quant_m <- binge[["M"]]

    data_binge <- data |>
      mutate(
        binge = case_when(
          sex == "F" & quantity >= quant_f ~ TRUE,
          sex == "M" & quantity >= quant_m ~ TRUE,
          .default = FALSE
        )
      )
  } else {
    data_binge <- data |>
      mutate(
        binge = if_else(
          quantity >= binge,
          TRUE,
          FALSE
        )
      )
  }

  data_binge |>
    dplyr::filter(binge) |>
    select(-binge)
}

#' Check arguments for TLFB summary score functions
#'
#' @description
#' Validates the arguments to compute a TLFB substance use score.
#'
#' @param data tibble. A data frame containing the TLFB raw data.
#' @param name character. The name of the output column for the computed score.
#' @param substance character (vector). The substance(s) to compute the score
#'   for. Must be one or several of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", tlfb_substances, "\"") |> md_bullet(2, TRUE)
#'   ```
#'
#'   (Default: `NULL`, i.e., all substances are considered.)
#' @param period character (vector). The period for which the score is
#'   computed for. Must be one of `"detailed"` (last year before date of TLFB
#'   interview) or `"estimated"` (more than one year before date of TLFB).
#'   (Default: `NULL`, i.e., all periods are considered). Cannot be used in
#'   combination with `days`.
#' @param days integer. Number of days before the TLFB interview to consider.
#'    (Default: `NULL`, i.e., all days are considered). Cannot be used in
#'    combination with `period`.
#' @param wknd logical. Whether the score should be computed for weekends only
#'   (`TRUE`) or for week days only (`FALSE`). (Default: `NULL`, i.e., all days
#'   are considered).
#' @param co_use character (vector). Co-use substance(s). Must be one or several
#'   of the possible values for `substance` listed above. Only days where the
#'   specified substance(s) was/were used together with (one of) the co-use
#'   substance(s) are considered. (Default: `NULL`, i.e., co-use is not
#'   considered). `co_use` cannot be specified without `substance` and
#'   can only contain substance(s) that are not specified in `substance`.
#' @param binge (named list of) numeric. Binge threshold(s) for the
#'   substance(s). If only one value is provided, it is used, independent of the
#'   sex of the participant. If a list is provided, it must contain two named
#'   elements: `"F"` (female) and `"M"` (male) with the respective sex-specific
#'   binge thresholds. Only days where the the quantity of the substance(s)
#'   exceeds the specified threshold(s) are considered. (Default: `NULL`, i.e.,
#'   binge behavior is not considered).
#' @param position character. The position of the substance use event. Must be
#'   one of `"first"` or `"last"`. (Default: `NULL`, i.e., position is not
#'   considered).
#'
#' @return `NULL`. Invisibly returns `NULL` if all checks pass. Otherwise, an
#'  error is raised.
#' @export
#' @autoglobal
#' @keywords internal
check_args_tlfb <- function(data,
                            name,
                            substance = NULL,
                            period = NULL,
                            days = NULL,
                            wknd = NULL,
                            co_use = NULL,
                            binge = NULL,
                            position = NULL) {
  chk::chk_data(data)
  check_col_names(data, name)
  chk::chk_character(name)
  chk::chk_scalar(name)

  if (!is.null(substance)) {
    chk::chk_subset(
      substance,
      tlfb_substances
    )
  }

  if (!is.null(period)) {
    chk::chk_subset(
      period,
      c("estimated", "detailed")
    )
  }

  if (!is.null(days)) {
    chk::chk_numeric(
      days
    )
    chk::chk_gte(
      days,
      value = 1
    )
  }

  if (!is.null(period) & !is.null(days)) {
    chk::abort_chk(
      "`period` and `days` cannot be used in combination."
    )
  }

  if (!is.null(wknd)) {
    chk::chk_flag(
      wknd
    )
  }

  if (!is.null(co_use)) {
    chk::chk_subset(
      co_use,
      tlfb_substances
    )
    if (is.null(substance)) {
      chk::abort_chk(
        "`substance` must be specified when `co_use` is specified."
      )
    }
    if (chk::vld_subset(co_use, substance)) {
      chk::abort_chk(
        "`co_use` cannot contain substance(s) specified for `substance`."
      )
    }
  }

  if (!is.null(binge)) {
    if (!(chk::vld_list(binge) | chk::vld_numeric(binge))) {
      chk::abort_chk("`binge`", " must be a list or a numeric value.")
    }

    if (is.list(binge)) {
      chk::chk_length(binge, 2)
      chk::chk_named(binge)
      chk::chk_subset(
        names(binge),
        c("F", "M")
      )
      chk::chk_numeric(binge[["F"]])
      chk::chk_scalar(binge[["F"]])
      chk::chk_numeric(binge[["M"]])
      chk::chk_scalar(binge[["M"]])
    }

    if (is.numeric(binge)) {
      chk::chk_scalar(binge)
    }
  }

  if (!is.null(position)) {
    chk::chk_subset(
      position,
      c("first", "last")
    )
  }

  NULL
}

#' @export
#' @autoglobal
#' @rdname compute_su_y_sui__onset_useage
#' @format `sui_substances` is a character vector of substances keywords.
sui_substances <- c(
  "alc",
  "alc__sip",
  "rxstim",
  "cath",
  "cbd",
  "coc",
  "dxm",
  "ghb",
  "hall",
  "inh",
  "ket",
  "meth",
  "mdma",
  "mj__blunt",
  "mj__conc",
  "mj__conc__smoke",
  "mj__conc__vape",
  "mj__drink",
  "mj__edbl",
  "mj__smoke",
  "mj__vape",
  "mj__synth",
  "mj__tinc",
  "nic__chew",
  "nic__cigar",
  "nic__cig",
  "nic__hookah",
  "nic__pipe",
  "nic__rplc",
  "nic__vape",
  "opi",
  "othdrg",
  "qc",
  "roid",
  "rxopi",
  "salv",
  "shroom",
  "rxsed",
  "vape",
  "vape__flav"
)

#' Compute age of onset use for a given substance
#'
#' @description
#' Computes the age (in years) of onset use of a given substance.
#' Returns `NA` for the participants with no onset use of the provided
#' substance reported.
#'
#' @param data tibble. A data frame containing the data.
#' @param name character. The name of the output column for the computed score.
#' @param substance character (vector). The substance to compute the score
#'   for. Must be one of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sui_substances, "\"") |> md_bullet(2, TRUE)
#'   ```
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: `TRUE``).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @examples
#' \dontrun{
#' compute_su_y_sui__onset_useage(
#'   data = data_sui,
#'   name = "su_y_sui__alc__onset_useage",
#'   substance = "alc"
#' )
#' }
#'
#' @export
#' @autoglobal
compute_su_y_sui__onset_useage <- function(
  data,
  name,
  substance,
  combine = TRUE
) {
  var <- glue::glue("su_y_sui__{substance}__onset_dt")

  chk::chk_data(data)
  chk::check_names(data, c("ab_g_stc__cohort_dob", var))
  check_col_names(data, name)

  if (!is.null(substance)) {
    chk::chk_subset(
      substance,
      sui_substances
    )
  }

  chk::chk_logical(combine)

  data_ss <- data |>
    transmute(
      {{ name }} := compute_age(
        ab_g_stc__cohort_dob,
        .data[[var]],
        unit = "years"
      )
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

#' Compute age of regular use for a given substance
#'
#' @description
#' Computes the age (in years) of regular use of a given substance.
#' Returns `NA` for the participants with no regular use of the provided
#' substance reported.
#'
#' @param data tibble. A data frame containing the data.
#' @param name character. The name of the output column for the computed score.
#' @param substance character (vector). The substance to compute the score
#'   for. Must be one of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sui_substances, "\"") |> md_bullet(2, TRUE)
#'   ```
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: `TRUE``).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @examples
#' \dontrun{
#' compute_su_y_sui__reg_useage(
#'   data = data_sui,
#'   name = "su_y_sui__alc__reg_useage",
#'   substance = "alc"
#' )
#' }
#'
#' @export
#' @autoglobal
compute_su_y_sui__reg_useage <- function(
  data,
  name,
  substance,
  combine = TRUE
) {
  var <- glue::glue("su_y_sui__{substance}__reg_dt")

  chk::chk_data(data)
  chk::check_names(data, c("ab_g_stc__cohort_dob", var))
  check_col_names(data, name)

  if (!is.null(substance)) {
    chk::chk_subset(
      substance,
      sui_substances
    )
  }

  chk::chk_logical(combine)

  data_ss <- data |>
    transmute(
      {{ name }} := compute_age(
        ab_g_stc__cohort_dob,
        .data[[var]],
        unit = "years"
      )
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

#' Count days since last use of a given substance
#'
#' @description
#' Computes the number of days since the last use of a given substance
#' as of the day of the substance use interview.
#' Returns `NA` for the participants with no reported use of the provided
#' substance.
#'
#' @param data tibble. A data frame containing the data.
#' @param name character. The name of the output column for the computed score.
#' @param substance character (vector). The substance to compute the score
#'   for. Must be one of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sui_substances, "\"") |> md_bullet(2, TRUE)
#'   ```
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: `TRUE``).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @examples
#' \dontrun{
#' compute_su_y_sui__last__day_count(
#'   data = data_sui,
#'   name = "su_y_sui__alc__last__day_count",
#'   substance = "alc"
#' )
#' }
#'
#' @export
#' @autoglobal
compute_su_y_sui__last__day_count <- function(
  data,
  name,
  substance,
  combine = TRUE
) {
  var <- glue::glue("su_y_sui__{substance}__last_dt")

  chk::chk_data(data)
  chk::check_names(data, c("ab_g_dyn__visit_dtt", var))
  check_col_names(data, name)

  if (!is.null(substance)) {
    chk::chk_subset(
      substance,
      sui_substances
    )
  }

  chk::chk_logical(combine)

  data_ss <- data |>
    transmute(
      {{ name }} := compute_age(
        .data[[var]],
        lubridate::as_date(ab_g_dyn__visit_dtt),
        unit = "days"
      ) |>
        as.integer()
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


#' Prepare data for applying mid-year strategy
#'
#' @description
#' Clean and prepare data for Static and Dynamic Substance Use (SDSU)
#' scoring:
#' - derive `session_type` ("A" for annual, "M" for mid-year),
#' - compute `session_date` and `session_age`,
#' - fill missing session dates within each participant and sort by filled date,
#' - map mid-year sessions to the next observed annual session (`session_id_mapped`),
#' - compute `last_session_id`, `forecast_next_annual`, and `session_id_mapped_forecast`.
#'
#' @param data tibble. Dataset with columns from several tables (e.g. `su_y_lowuse`, `su_y_sui`, `su_y_mypi`, `su_y_mysu`, `su_y_tlfb`) and
#' containing at minimum `participant_id`, `session_id`, `ab_g_dyn__visit_dtt`, `ab_g_dyn__visit_age`, and `su_y_mypi_dtt`.
#' @return tibble. Input tibble with added/modified columns:
#'   `session_type`, `session_date`, `session_date_filled`, `session_id_mapped`,
#'   `last_session_id`, `forecast_next_annual`, and `session_id_mapped_forecast`.
#' @examples
#' \dontrun{
#' prepare_data_sdsu(dplyr::tibble(
#'   participant_id = "sub-1",
#'   session_id = "ses-01A",
#'   ab_g_dyn__visit_dtt = as.Date("2020-01-01"),
#'   su_y_mypi_dtt = as.Date(NA)
#' ))
#' }
#' @export
#' @autoglobal
#' @keywords internal
prepare_data_sdsu <- function(data) {
  data |>
    mutate(
      session_type = case_when(
        stringr::str_detect(session_id, "A$") ~ "A",
        stringr::str_detect(session_id, "M$") ~ "M",
        .default = "UNCATEGORIZED"
      ),
      session_date = case_when(
        session_type == "A" ~ ab_g_dyn__visit_dtt,
        session_type == "M" ~ su_y_mypi_dtt,
        .default = NA
      ),
      session_age = case_when(
        session_type == "A" ~ ab_g_dyn__visit_age,
        session_type == "M" ~ su_y_mypi_age,
        .default = NA
      ),
      session_date_filled = session_date
    ) |>
    group_by(participant_id) |>
    tidyr::fill(
      session_date_filled,
      .direction = "downup"
    ) |>
    arrange(
      session_date_filled,
      .by_group = TRUE
    ) |>
    mutate(
      session_id_mapped = if_else(
        session_type == "A",
        session_id,
        NA
      )
    ) |>
    tidyr::fill(
      session_id_mapped,
      .direction = "up"
    ) |>
    mutate(
      last_session_id = last(session_id),
      forecast_next_annual = next_annual_session_id(last_session_id),
      session_id_mapped_forecast = if_else(
        is.na(session_id_mapped),
        forecast_next_annual,
        session_id_mapped
      )
    ) |>
    ungroup()
}

#' Strategy for dealing with mid-year sessions
#'
#' @description
#' Remove or map mid-year session records to full-year sessions according to a
#' chosen algorithm. Operations are performed per participant on data prepared
#' by [prepare_data_sdsu()].
#'
#' @param data tibble. A dataframe produced by [prepare_data_sdsu()].
#' @param algo character. Mapping algorithm to apply to mid‑year
#'   sessions. Allowed values:
#'   - `"next_existing_fy"`: assign a mid year to the next existing full year.
#'     If a participant ends with mid‑year visits, those terminal mid‑year
#'     records are dropped.
#'   - `"next_potential_fy"`: assign a mid year to the next existing full year when
#'     present, otherwise assign to the next forecasted full year
#'     (that may never materialize).
#'   - `"next_immediate_fy"`: assign a mid year to the next full year regardless of
#'     whether that full year record exists or not.
#'   - `"remove_my"`: drop mid-year events and keep only full-year events.
#'   If `NULL` (default) no mapping is performed and `data` is returned unchanged.
#'
#' @return tibble. A tibble with `session_id` remapped or rows filtered.
#' @examples
#' \dontrun{
#' map_mid_years(data, algo = "next_immediate_fy")
#' }
#' @export
#' @autoglobal
#' @keywords internal
map_mid_years <- function(
  data,
  algo = NULL
) {
  chk::chk_subset(
    algo,
    c(
      "next_existing_fy",
      "next_potential_fy",
      "next_immediate_fy",
      "remove_my"
    )
  )

  if (is.null(algo)) {
    data
  } else if (algo == "next_existing_fy") {
    data |>
      mutate(
        session_id = session_id_mapped
      ) |>
      filter(!is.na(session_id))
  } else if (algo == "next_potential_fy") {
    data |>
      mutate(
        session_id = session_id_mapped_forecast
      )
  } else if (algo == "next_immediate_fy") {
    data |>
      mutate(
        session_id = case_when(
          session_type == "A" ~ session_id,
          session_type == "M" ~ next_annual_session_id(session_id)
        )
      )
  } else if (algo == "remove_my") {
    data |>
      filter(session_type == "A")
  }
}

#' Compute the next annual session id following a mid-year session
#'
#' @description
#' For a mid-year session id (e.g. `"ses-06M"`), returns the next annual
#' session id (`"ses-07A"`). Session ids that do not end in a mid-year
#' pattern are returned unchanged.
#'
#' @param session_id character. Session id(s) to convert.
#' @return character. The next annual session id(s).
#' @noRd
next_annual_session_id <- function(session_id) {
  stringr::str_replace(
    session_id,
    "(\\d+)M$",
    function(x) {
      paste0(sprintf("%02d", as.integer(gsub("\\D", "", x)) + 1), "A")
    }
  )
}


#' Check arguments for Static and Dynamic Substance Use (SDSU) scores functions
#'
#' @description
#' Validates the arguments to compute a SDSU score.
#'
#' @param data tibble. Input data frame to validate.
#' @param name character(1). Name of the output score column to validate.
#' @return invisible NULL. Throws an error if checks fail.
#' @export
#' @autoglobal
#' @keywords internal
check_args_sdsu <- function(
  data = data,
  name = name
) {
  chk::chk_data(data)
  check_col_names(data, name)
}


#' Compute substance use Y/N for a participant
#'
#' @description
#' For each participant computes a binary (1/0) indicator indicating any use
#' of (one of) the given substance(s) at a session (or cumulatively up to and
#' including that session when `cumulative = TRUE`).
#' Parameter `algo` is set to "next_existing_fy".
#'
#' @inheritParams map_mid_years
#' @inheritParams check_args_sdsu
#' @param substance character (vector). The substance(s) to compute the score
#'   for. Must be one or several of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sdsu_config |> pull(substance), "\"") |> md_bullet(2, TRUE)
#'   ```
#' @param cumulative logical(1). If `FALSE` (default), returns use at each
#'   session. If `TRUE`, returns 1 from the first session where use was
#'   observed onward (i.e. ever used up to and including that session).
#'
#' @return A tibble with columns `participant_id`, `session_id` and a numeric
#'   column named by `name` containing 1 (use) or 0 (no use).
#' @seealso [map_mid_years()]
#'
#' @examples
#' \dontrun{
#' deap_data |>
#'   prepare_data_sdsu() |>
#'   compute_ss_use_yn(
#'     name = "su_y_alc_use_yn",
#'     substance = "Alcohol"
#'   )
#' }
#' @export
#' @autoglobal
compute_ss_use_yn <- function(
  data,
  name,
  substance,
  algo = "next_existing_fy",
  cumulative = FALSE
) {
  check_args_sdsu(
    data = data,
    name = name
  )

  chk::chk_subset(
    substance,
    ABCDscores::sdsu_config |>
      pull(substance)
  )

  chk::chk_flag(cumulative)

  substance_vars <- ABCDscores::sdsu_config |>
    filter(substance %in% .env[["substance"]]) |>
    pull(vars) |>
    purrr::list_c()

  result <- data |>
    map_mid_years(algo) |>
    mutate(
      across(
        all_of(substance_vars),
        ~ as.numeric(as.character(.x))
      ),
      use_yn = if_else(
        rowSums(
          across(any_of(substance_vars), ~ .x > 0 & !(.x %in% c(777, 888))),
          na.rm = TRUE
        ) >
          0,
        1,
        0,
        missing = 0
      )
    ) |>
    group_by(participant_id, session_id) |>
    summarise(
      !!name := as.numeric(any(as.logical(use_yn))),
      .groups = "drop"
    )

  if (cumulative) {
    result <- result |>
      arrange(participant_id, session_id) |>
      mutate(
        !!name := cummax(.data[[name]]),
        .by = participant_id
      )
  }

  result
}

#' Compute substance use onset session for each participant
#'
#' @description
#' For each participant returns the session (character `session_id`) of first
#'  use for the requested substance(s). The function:
#' - maps or removes mid‑year sessions according to `algo` (see [map_mid_years()]) by default no.
#' - for each participant selects the earliest session where any use was observed.
#'
#' @inheritParams map_mid_years
#' @inheritParams check_args_sdsu
#' @param substance character (vector). The substance(s) to compute the score
#'   for. Must be one or several of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sdsu_config |> pull(substance), "\"") |> md_bullet(2, TRUE)
#'   ```
#'
#' @return A tibble with columns `participant_id` and a character
#'   column named by `name` containing the session of onset or `NA` if there was no use.
#' @seealso [map_mid_years()]
#'
#' @examples
#' \dontrun{
#' deap_data |>
#'   prepare_data_sdsu() |>
#'   compute_ss_use_onset_event(
#'     name = "su_alc_onset_event",
#'     substance = "Alcohol"
#'   )
#' }
#' @export
#' @autoglobal
compute_ss_use_onset_event <- function(data, name, substance, algo = NULL) {
  check_args_sdsu(
    data = data,
    name = name
  )

  chk::chk_subset(
    substance,
    ABCDscores::sdsu_config |>
      pull(substance)
  )

  substance_vars <- ABCDscores::sdsu_config |>
    filter(substance %in% .env[["substance"]]) |>
    pull(vars) |>
    purrr::list_c()

  data_1yr_yn <- data |>
    map_mid_years(algo) |>
    mutate(
      across(
        all_of(substance_vars),
        ~ as.numeric(as.character(.x))
      ),
      tmp_yn = if_else(
        rowSums(
          across(any_of(substance_vars), ~ .x > 0 & !(.x %in% c(777, 888))),
          na.rm = TRUE
        ) >
          0,
        1,
        0,
        missing = 0
      )
    ) |>
    group_by(participant_id, session_id) |>
    summarise(
      tmp_yn_ps = as.numeric(any(as.logical(tmp_yn))),
      .groups = "drop"
    ) |>
    create_session_num(name = "tmp_session_num")

  data_1yr_yn |>
    summarise(
      !!name := if (any(tmp_yn_ps == 1)) {
        sessions <- session_id[tmp_yn_ps == 1]
        nums <- tmp_session_num[tmp_yn_ps == 1]
        idx <- which.min(nums)
        if (length(idx) == 0L) NA_character_ else as.character(sessions[idx])
      } else {
        NA_character_
      },
      .by = "participant_id"
    )
}

#' Compute annual session substance use age of onset for a participant
#'
#' @description
#' For each participant returns the age of onset for the requested
#' substance(s). The function:
#' - determines the session of first use (via [compute_ss_use_onset_event()])
#'   and extracts the reported age at that visit;
#' - for substance(s) that have detailed first-use age items, also extracts the
#'   earliest reported age of first use across the relevant substance-specific
#'   onset items; and
#' - returns the age of first use if available, otherwise returns the age
#'   reported at the visit. If neither value is available the result is `NA`.
#'
#' @inheritParams map_mid_years
#' @inheritParams check_args_sdsu
#' @param substance character (vector). The substance(s) to compute the score
#'   for. Must be one or several of the following values:
#'   ```{r, echo=FALSE, results='asis'}
#'   paste0("\"", sdsu_config |> pull(substance), "\"") |> md_bullet(2, TRUE)
#'   ```
#'
#' @return A tibble with columns `participant_id` and a numeric
#'   column named by `name` containing the age of onset or `NA` if there was no use.
#' @seealso [map_mid_years()]
#'
#' @examples
#' \dontrun{
#' deap_data |>
#'   prepare_data_sdsu() |>
#'   compute_ss_use_onset_age(
#'     name = "su_alc_onset_age",
#'     substance = "Alcohol"
#'   )
#' }
#' @export
#' @autoglobal
compute_ss_use_onset_age <- function(data, name, substance, algo = NULL) {
  # Age of self report
  onset_age_report <- compute_ss_use_onset_event(
    data,
    "session_onset",
    substance,
    algo
  ) |>
    left_join(
      data,
      by = c("participant_id", "session_onset" = "session_id")
    ) |>
    select(
      participant_id,
      age_report = session_age
    )

  # Age of first use (for substances that have detailed age items)
  substances_with_age_fu <- ABCDscores::sdsu_config |>
    filter(has_age_fu, substance %in% .env[["substance"]]) |>
    pull(substance)

  if (length(substances_with_age_fu) > 0) {
    # Expand marijuana and nicotine to their component substances
    expanded_substances <- purrr::map(substances_with_age_fu, function(subst) {
      if (subst == "Marijuana") {
        c(
          "Smoking Marijuana Flower",
          "Marijuana Edibles",
          "Marijuana Infused Alcohol Drinks",
          "Smoking Marijuana Oils or Concentrates",
          "Concentrated Marijuana Tinctures",
          "Blunts or Combined Tobacco and Marijuana in Joints",
          "Vaped Marijuana Flower",
          "Vaped Marijuana Oils or Concentrates",
          "CBD (Non-Medical Use)"
        )
      } else if (subst == "Nicotine") {
        c(
          "Electronic Nicotine or Vaping Products",
          "Tobacco Cigarette",
          "Cigars, Little Cigars, or Cigarillos",
          "Tobacco in a Pipe",
          "Hookah with Tobacco",
          "Nicotine Replacements",
          "Smokeless Tobacco, Chew, or Snus"
        )
      } else {
        subst
      }
    }) |>
      purrr::list_c()

    keywords <- ABCDscores::sdsu_config$keyword[
      ABCDscores::sdsu_config$substance %in% expanded_substances
    ]

    vars <- purrr::map_chr(keywords, function(keyword) {
      case_when(
        keyword == "flav__vape" ~ "su_y_sui__vape__flav__onset_useage",
        keyword == "mj__conc" ~ "su_y_sui__mj__conc__vape__onset_useage",
        keyword == "mj__vape__flwr" ~ "su_y_sui__mj__vape__onset_useage",
        keyword == "mj__vape__oil" ~ "su_y_sui__mj__conc__vape__onset_useage",
        .default = glue::glue("su_y_sui__{keyword}__onset_useage")
      )
    })

    first_use_dfs <- purrr::map(vars, function(var) {
      data |>
        select(participant_id, session_id, all_of(var)) |>
        tidyr::pivot_wider(
          names_from = session_id,
          values_from = all_of(var),
          values_fn = first
        ) |>
        transmute(
          participant_id,
          temp_age = do.call(coalesce, across(-participant_id))
        )
    })

    onset_age_fu <- purrr::reduce(
      first_use_dfs,
      left_join,
      by = "participant_id"
    ) |>
      mutate(
        age_sui = do.call(
          pmin,
          c(across(starts_with("temp_age")), na.rm = TRUE)
        )
      ) |>
      select(participant_id, age_sui)

    output <- list(
      sui = onset_age_fu,
      report = onset_age_report
    ) |>
      purrr::reduce(full_join, by = "participant_id") |>
      transmute(
        participant_id,
        !!name := case_when(
          !is.na(age_sui) ~ age_sui,
          !is.na(age_report) ~ age_report,
          TRUE ~ NA_real_
        )
      )
  } else {
    output <- onset_age_report |>
      rename(
        !!name := age_report
      )
  }
  output
}
