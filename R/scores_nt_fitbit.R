#   ____________________________________________________________________________
#   Exported Functions                                                      ####

##  ............................................................................
##  Daily scores                                                            ####

#' Computes Daily Activity Summaries
#'
#' @description
#' Pipeline wrapper that processes Fitbit minute-level activity data into a
#' daily summary table. Applies heart rate-based exclusions and recovery
#' identification, then aggregates minute totals, exclusion summaries, step
#' counts, intensity scores, and sleep presence into a single day-level data
#' frame. Optionally appends Fitbit-generated daily QC measures.
#'
#' @param data_activity tbl. Data frame with `dtt` (timestamp), `hrate`
#' (heart rate), `steps`, `intnst` (intensity), `mets` and `is_slp` (sleep flag)
#' variables.
#' @param data_daily tbl. Daily-level Fitbit-generated summary data containing
#' `hrate_rest_fitb` (resting heart rate) and optionally step counts
#' (steps_fitb).
#' @param hr_low numeric. Lower bound threshold for valid heart rate values.
#' @param hr_high numeric or NULL. Optional upper bound threshold for valid
#' heart rate values.
#' If NULL, no upper threshold is applied.
#' @param hr_rep_day numeric. Threshold (number of epochs) for identifying
#' repeated heart rate
#' values during wake/activity periods.
#' @param hr_rep_sleep numeric. Threshold (number of epochs) for identifying
#' repeated heart rate
#' values during sleep periods.
#' @param bin_minutes numeric. Number of minutes used to bin activity data when
#' computing intensity scores (e.g., 1440 for daily aggregation).
#' @param append_daily_fitbit_qc logical. If TRUE, add Fitbit-provided step
#' count and QC measures.
#' @param qc_threshold numeric, between 0 and 1. Minimum percentage of Fitbit
#'  step count that must be met by computed active step count for QC to pass
#'  (Default: 0.8).
#' @param offset character. Time of day (HH:MM) cutoff.
#' @param min_actv_minutes numeric. Minimum number of active minutes required
#'   for a day to pass quality control. Used to create a `{qc_Xmin}` flag
#'   column in the output.
#' @return tbl.  A daily-level summarized data frame with the following
#' components:
#'
#' **Identifiers and time variables:**
#'  - `participant_id`, `session_id`
#'  - `wk`: Study week index
#'  - `day`: Study day index
#'  - `dt`: Calendar date
#'  - `dt_day`: Day of week (labeled)
#'  - `dt_wknd`: Indicator for weekend days
#'
#' **Activity and sleep measures:**
#'  - `min_total`: Total valid minutes
#'  - `min_actv`: Active (non-sleep) minutes
#'  - `min_slp`: Sleep minutes
#'  - `min_nap_slp`: Nap sleep minutes
#'
#' **Step count measures:**
#'  - `steps_total`: Total steps after exclusions
#'  - `steps_actv`: Steps during active minutes after exclusions
#'  - `steps`: Total steps before exclusions
#'  - `steps_fitb`: Fitbit-reported daily steps
#'
#' **Energy expenditure and intensity-based  activity measures:**
#'  - `mets`: Mean METs
#'  - `mets_actv`: Mean METs during active minutes
#'  - `min_intnst_*`: Minutes spent in sedentary, light, moderate, and
#'    vigorous activity (total and active-only variants)
#'
#' **Heart rate exclusion summaries:**
#'  - `excl_min_*`: Minutes excluded due to heart rate criteria (low, high,
#'     missing, repeated) for both activity and sleep domains
#'
#' **Heart rate and QC metrics:**
#'  - `hrate_rest_fitb`: Resting heart rate (Fitbit daily summary)
#'  - `qc_600min`: Indicator for >= 600 valid active minutes
#'  - `qc_steps`: Indicator for valid step counts based on Fitbit comparison
#'  - `pcnt_steps_fitb`: Proportion of calculated steps relative to
#'    Fitbit-reported steps
#'
#' **Flags:**
#'  - `flg_30sec`: Indicator that valid 30-second sleep data exists for the day
#'  - `flg_any`: Indicator that any valid data exists for the day
#'
#' @export
#' @autoglobal
compute_fitbit_activity_table <- function(
  data_activity,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = 1440,
  append_daily_fitbit_qc,
  qc_threshold = 0.8,
  offset = "12:00",
  min_actv_minutes
) {
  check_params_compute_fitbit_activity_table(
    data_activity,
    data_daily,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep,
    bin_minutes = bin_minutes,
    append_daily_fitbit_qc = append_daily_fitbit_qc,
    qc_threshold = qc_threshold,
    offset = offset,
    min_actv_minutes = min_actv_minutes
  )

  exclusions <- identify_hr_exclusions(
    data_activity,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep
  )

  recovery <- identify_hr_recovery(exclusions)

  min_totals <- compute_fitbit_min_totals(
    recovery,
    bin_minutes = bin_minutes
  )

  exclusion_summary <- compute_fitbit_score_minutes_exclusion(
    recovery,
    bin_minutes = bin_minutes
  )

  steps_summary <- compute_fitbit_score_steps(
    data_exclusions = exclusions,
    data_daily_qc = data_daily,
    bin_minutes = bin_minutes,
    qc_threshold = qc_threshold,
    append_daily_fitbit_qc = append_daily_fitbit_qc
  )

  mets_summary <- compute_fitbit_intensity_scores(
    exclusions,
    bin_minutes = bin_minutes
  )

  heartrate <- data_daily |>
    select(participant_id, session_id, dt, hrate_rest_fitb)


  if (!is.null(offset)) {
    exclusions_offset <- make_offset(exclusions, offset = offset)
    slp_30_exist <- create_sleep_indicator(exclusions_offset)
  } else {
    slp_30_exist <- create_sleep_indicator(
      exclusions,
      bin_minutes = bin_minutes
    )
  }

  distinct_day_no <- data_activity |>
    mutate(
      date = lubridate::as_date(dtt)
    ) |>
    distinct(
      participant_id, session_id, date, day
    ) |>
    left_join(
      heartrate,
      by = c("participant_id", "session_id", "date" = "dt")
    )

  base <- exclusion_summary |>
    # mutate(dt = as.Date(dtt)) |>
    mutate(
      dt = if (bin_minutes == 1440) as.Date(date) else date,
      calendar_date = as.Date(date)
    ) |>
    distinct(
      participant_id, session_id, dt, date, calendar_date
    ) |>
    left_join(
      distinct_day_no,
      by = c("participant_id", "session_id", "calendar_date" = "date")
    ) |>
    filter(
      day != 0
    ) |>
    mutate(
      dt_day = lubridate::wday(dt, label = TRUE),
      dt_wknd = as.character(dt_day) %in% c("Sat", "Sun"),
      wk = (day - 1) %/% 7 + 1
    ) |>
    select(
      -c(date, calendar_date)
    )

  drop_cols <- if (bin_minutes == 1440) c("start", "end") else c()

  summary <- base |>
    left_join(
      min_totals |> select(-any_of(drop_cols)),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      exclusion_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      steps_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      mets_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      slp_30_exist |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    mutate(
      dt = lubridate::as_date(dt),
      flg_30sec = tidyr::replace_na(has_sleep_30, FALSE),
      # qc_600min = replace_na(min_actv > 599, FALSE),
      !!paste0("qc_", min_actv_minutes, "min") := min_actv >= min_actv_minutes,
      flg_any = min_total > 0,
      session_id = as.factor(session_id),
      across(
        c(
          wk,
          matches("^steps"),
          hrate_rest_fitb
        ),
        as.integer
      )
    ) |>
    select(
      participant_id,
      session_id,
      wk,
      day,
      dt,
      dt_day,
      dt_wknd,
      any_of(c("start", "end")),
      # scores below
      min_total,
      min_actv,
      min_slp,
      min_nap_slp,
      steps_total,
      steps_actv,
      steps,
      any_of("steps_fitb"),
      mets,
      mets_actv,
      min_intnst_sed_total,
      min_intnst_light_total,
      min_intnst_mod_total,
      min_intnst_vigor_total,
      min_intnst_sed_actv,
      min_intnst_light_actv,
      min_intnst_mod_actv,
      min_intnst_vigor_actv,
      excl_min_total_actv,
      excl_min_lowhrate_actv,
      any_of("excl_min_highhrate_actv"),
      excl_min_nohrate_actv,
      excl_min_repeathrate_actv,
      excl_min_total_slp,
      excl_min_lowhrate_slp,
      any_of("excl_min_highhrate_slp"),
      excl_min_nohrate_slp,
      excl_min_repeathrate_slp,
      hrate_rest_fitb,
      # qc_600min,
      !!paste0("qc_", min_actv_minutes, "min"),
      any_of("qc_steps"),
      any_of("pcnt_steps_fitb"),
      flg_30sec,
      flg_any
    ) |>
    arrange(
      participant_id,
      session_id,
      dt
    )

  summary
}

#' Computes extended daily activity summaries
#'
#' @description
#' Computes all daily activity scores (extended).
#'
#' @param data_activity tbl. Data frame with activity data.
#' @param data_daily tbl. Data frame with daily Fitbit summary data.
#' @param gap numeric. Maximum allowed gap.
#' @param hr_low numeric. Lower bound threshold for valid heart rate values.
#' @param hr_high numeric or NULL. Optional upper bound threshold.
#' @param hr_rep_day numeric. Threshold for identifying repeated HR.
#' @param hr_rep_sleep numeric. Threshold for identifying repeated HR.
#' @param bin_minutes numeric. Number of minutes used to bin data.
#' @param append_daily_fitbit_qc logical. If TRUE, add Fitbit-provided steps.
#' @param qc_threshold numeric, between 0 and 1. Minimum percentage of Fitbit
#'  step count that must be met by computed active step count for QC to pass.
#' @param offset character. Time of day (HH:MM) cutoff.
#' @param min_actv_minutes numeric. Minimum number of active minutes required
#'   for a day to pass quality control. Used to create a `{qc_Xmin}` flag
#'   column in the output.
#' @param main_duration numeric. Minimum duration in minutes.
#'
#' @return tbl. A daily-level extended activity summary.
#'
#' @seealso [compute_fitbit_activity_table()]
#'
#' @note
#' - `data_activity`: fitbit_raw_activity or fitbit_covid_raw_activity
#' - `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics
#'
#' @export
#' @autoglobal
compute_fitbit_activity_table_ext <- function(
  data_activity,
  data_daily = NULL,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = 1440,
  append_daily_fitbit_qc = TRUE,
  qc_threshold = 0.8,
  offset = "12:00",
  min_actv_minutes,
  main_duration,
  gap = 90
) {
  check_params_compute_fitbit_activity_table(
    data_activity,
    data_daily,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep,
    bin_minutes = bin_minutes,
    append_daily_fitbit_qc = append_daily_fitbit_qc,
    qc_threshold = qc_threshold,
    offset = offset,
    min_actv_minutes = min_actv_minutes
  )
  chk::chk_numeric(gap)
  chk::chk_gt(gap, 0)
  chk::chk_numeric(main_duration)
  chk::chk_gt(main_duration, 0) # main_duration should at least be 1m

  exclusions <- identify_hr_exclusions(
    data_activity,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep
  )

  recovery <- identify_hr_recovery(exclusions)

  blocks <- create_block_ranges(recovery, gap = gap)

  activity_blocked <- add_sleep_flags(
    recovery,
    blocks,
    main_duration = main_duration
  )

  # need to recompute hr exclusion on new classification of sleep and activity
  activity_blocked_hr <- identify_hr_exclusions(
    activity_blocked,
    hr_low       = hr_low,
    hr_high      = hr_high,
    hr_rep_day   = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep
  )

  min_totals <- compute_fitbit_min_totals(
    activity_blocked_hr,
    bin_minutes = bin_minutes
  )

  exclusion_summary <- compute_fitbit_score_minutes_exclusion(
    activity_blocked_hr,
    bin_minutes = bin_minutes
  )

  steps_summary <- compute_fitbit_score_steps(
    data_exclusions = activity_blocked_hr,
    data_daily_qc = data_daily,
    bin_minutes = bin_minutes,
    qc_threshold = qc_threshold,
    append_daily_fitbit_qc = TRUE
  )

  mets_summary <- compute_fitbit_intensity_scores(
    activity_blocked_hr,
    bin_minutes = bin_minutes
  )

  heartrate <- data_daily |>
    select(participant_id, session_id, dt, hrate_rest_fitb)

  if (!is.null(offset)) {
    exclusions_offset <- make_offset(exclusions, offset = offset)
    slp_30_exist <- create_sleep_indicator(exclusions_offset)
  } else {
    slp_30_exist <- create_sleep_indicator(
      exclusions,
      bin_minutes = bin_minutes
    )
  }

  distinct_day_no <- data_activity |>
    mutate(date = lubridate::as_date(dtt)) |>
    distinct(participant_id, session_id, date, day) |>
    left_join(heartrate, by = c("participant_id", "session_id", "date" = "dt"))

  base <- exclusion_summary |>
    # mutate(dt = as.Date(dtt)) |>
    mutate(
      dt = if (bin_minutes == 1440) as.Date(date) else date,
      calendar_date = as.Date(date)
    ) |>
    distinct(
      participant_id, session_id, dt, date, calendar_date
    ) |>
    left_join(
      distinct_day_no,
      by = c("participant_id", "session_id", "calendar_date" = "date")
    ) |>
    filter(
      day != 0
    ) |>
    mutate(
      dt_day = lubridate::wday(dt, label = TRUE),
      dt_wknd = as.character(dt_day) %in% c("Sat", "Sun"),
      wk = (day - 1) %/% 7 + 1
    ) |>
    select(
      -c(date, calendar_date)
    )

  drop_cols <- if (bin_minutes == 1440) c("start", "end") else c()

  summary <- base |>
    left_join(
      min_totals |> select(-any_of(drop_cols)),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      exclusion_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      steps_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      mets_summary |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    left_join(
      slp_30_exist |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "dt" = "date")
    ) |>
    mutate(
      dt = lubridate::as_date(dt),
      flg_30sec = tidyr::replace_na(has_sleep_30, FALSE),
      # qc_600min = replace_na(min_actv > 599, FALSE),
      !!paste0("qc_", min_actv_minutes, "min") := min_actv >= min_actv_minutes,
      flg_any = min_total > 0,
      session_id = as.factor(session_id),
      across(
        c(
          wk,
          matches("^steps"),
          hrate_rest_fitb
        ),
        as.integer
      )
    ) |>
    select(
      participant_id,
      session_id,
      wk,
      day,
      dt,
      dt_day,
      dt_wknd,
      any_of(c("start", "end")),
      # scores below
      min_total,
      min_actv,
      min_slp,
      min_nap_slp,
      steps_total,
      steps_actv,
      steps,
      any_of("steps_fitb"),
      mets,
      mets_actv,
      min_intnst_sed_total,
      min_intnst_light_total,
      min_intnst_mod_total,
      min_intnst_vigor_total,
      min_intnst_sed_actv,
      min_intnst_light_actv,
      min_intnst_mod_actv,
      min_intnst_vigor_actv,
      excl_min_total_actv,
      excl_min_lowhrate_actv,
      any_of("excl_min_highhrate_actv"),
      excl_min_nohrate_actv,
      excl_min_repeathrate_actv,
      excl_min_total_slp,
      excl_min_lowhrate_slp,
      any_of("excl_min_highhrate_slp"),
      excl_min_nohrate_slp,
      excl_min_repeathrate_slp,
      hrate_rest_fitb,
      # qc_600min,
      !!paste0("qc_", min_actv_minutes, "min"),
      any_of("qc_steps"),
      any_of("pcnt_steps_fitb"),
      flg_30sec,
      flg_any
    ) |>
    arrange(
      participant_id,
      session_id,
      dt
    )

  summary
}

#' Compute daily sleep summaries
#'
#' @description
#' Processes Fitbit minute-level data to generate daily sleep summary
#' scores. This function integrates multiple processing steps, including heart
#' rate-based exclusions and calculation of sleep measures, aggregated
#' at the day level.
#'
#' @param data_activity tbl. Data frame with the following columns with
#' minute-level epoch data with the following columns:
#'   - `participant_id`: Participant identifier
#'   - `session_id`: Session identifier
#'   - `dtt`: POSIXct epoch timestamp
# `   - `hrate`: Heart rate in beats per minute
# `   - `is_slp`: Indicator whether epoch was classified as sleep.
#'   - `dtt` POSIXct epoch timestamp.
#'
#' @param data_sleep_combined tbl. Data frame with the following columns in
#' 30-second epoch level with the following columns:
#'   - `participant_id`: Participant identifier
#'   - `session_id`: Session identifier
#'   - `dtt`: POSIXct epoch timestamp
#'   - `stage`: Sleep stage classification (e.g., `"light"`,  `"deep"`, `"rem"`,
#'  `"awake"`).
#'   - `main_slp`: logical. Indicates if epoch is associated with 'main' sleep.
#'
#' @param data_daily tbl. Daily-level Fitbit-generated summary data containing:
#'   - `participant_id`: Participant identifier
#'   - `session_id`: Session identifier
#'   - `dt`: Calendar date
#'   - `hrate_rest_fitb`: Fitbit-reported resting heart rate in beats per
#' minute.
#' @param hr_low numeric. Lower bound threshold for valid heart rate values.
#' @param hr_high numeric or NULL. Optional upper bound threshold for valid
#' heart rate values. If NULL, no upper threshold is applied.
#' @param hr_rep_day numeric. Threshold (number of epochs) for identifying
#' repeated heart rate values during wake/activity periods.
#' @param hr_rep_sleep numeric. Threshold (number of epochs) for identifying
#' repeated heart rate values during sleep periods.
#' @param bin_minutes numeric. Number of minutes used to bin activity data when
#' computing intensity scores (e.g., 1440 for daily aggregation). Default is
#'  NULL. When NULL, it uses `offset` to split days, which by default is
#'  `12:00` (noon).
#' @param offset character. Time of day (HH:MM) used as the cutoff for defining
#' the sleep day. Timestamps occuring after this time are assigned to the next
#' day.
#' @param min_slp_minutes numeric. Minimum number of sleep minutes required
#'   for a day to pass quality control. Used to create a \code{qc_Xmin} flag
#'   column in the output.
#' @return tbl.  A daily-level summarized data frame with the following
#' components:
#'
#' **Identifiers and time variables:**
#'  - `participant_id`, `session_id`
#'  - `wk`: Study week index
#'  - `day`: Study day index
#'  - `dt`: Calendar date
#'  - `dt_day`: Day of week (labeled)
#'  - `dt_wknd`: Indicator for weekend days
#'
#' **Sleep timing measures:**
#'  - `dtt_start_bed`, `dtt_end_bed`: Bed interval start and end times
#'  - `dtt_start_slp`, `dtt_end_slp`: Sleep interval start and end times
#'
#' **Sleep duration measures:**
#'  - `min_total_slp`: Total sleep duration
#'  - `min_asleep_slp`, `min_restless_slp`, `min_light_slp`,
#'    `min_deep_slp`, `min_rem_slp`: Stage-specific sleep durations
#'  - `min_nap_slp`: Nap sleep duration
#'  - `min_wake`: Wake minutes during sleep intervals
#'  - `min_waso`: Wake after sleep onset (WASO)
#'  - `n_waso`: Number of WASO episodes
#'
#' **Heart rate summaries by sleep stage:**
#'  - `hrate_awake_slp`, `hrate_restless_slp`, `hrate_asleep_slp`
#'  - `hrate_light_slp`, `hrate_deep_slp`, `hrate_rem_slp`
#'  - `hrate_nap_slp`: Mean heart rate during nap sleep
#'  - `hrate_rest_fitb`: Daily resting heart rate from Fitbit
#'
#' **Heart rate exclusion measures:**
#'  - `excl_min_total_slp`: Total excluded sleep minutes
#'  - `excl_min_lowhrate_slp`: Minutes excluded due to low heart rate
#'  - `excl_min_nohrate_slp`: Minutes excluded due to missing heart rate
#'  - `excl_min_highhrate_slp`: Minutes excluded due to high heart rate
#'  - `excl_min_repeathrate_slp`: Minutes excluded due to repeated heart rate
#'  - `min_extra_nohrate_slp`: Additional plausible sleep minutes excluded
#'
#' **Quality control and flags:**
#'  - `qc_300min`: Indicator for >= 300 minutes of valid sleep
#'  - `flg_slp`: Indicator for implausible sleep structure
#'  - `flg_any`: Indicator that any sleep data are present
#'
#' @note
#' `flg_slp`, sleep timing and WASO variables are only calculated when
#' `bin_minutes` is NULL. Calculations depend on offset dates and cannot operate
#' on binned intervals. Returns an empty columns otherwise.
#'
#' - `data_activity`: fitbit_raw_activity or fitbit_covid_raw_activity
#' - `data_sleep_combined`: fitbit_raw_sleep or fitbit_covid_raw_sleep
#' - `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics
#'
#' @export
#' @autoglobal
compute_fitbit_sleep_table <- function(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = NULL,
  offset = "12:00",
  min_slp_minutes = 300
) {
  check_params_compute_fitbit_sleep_table(
    data_activity = data_activity,
    data_sleep_combined = data_sleep_combined,
    data_daily = data_daily,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep,
    offset = offset,
    bin_minutes = bin_minutes,
    min_slp_minutes = min_slp_minutes
  )

  # calculate exclusions based on minute-level data
  exclusions <- identify_hr_exclusions(
    data_activity,
    hr_low       = hr_low,
    hr_high      = hr_high,
    hr_rep_day   = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep
  )

  recovery <- identify_hr_recovery(exclusions)

  heartrate <- data_daily |>
    select(participant_id, session_id, dt, hrate_rest_fitb)

  distinct_day_no <- data_activity |>
    mutate(date = lubridate::as_date(dtt)) |>
    distinct(participant_id, session_id, date, day) |>
    left_join(heartrate, by = c("participant_id", "session_id", "date" = "dt"))

  # join exclusions and sleep data.
  sleep30_exclusions <- join_sleep30_and_exclusions(
    data_sleep_combined,
    recovery
  ) # exclusion inner join sleep

  sleep30_hr_offset <- make_offset(sleep30_exclusions, offset = offset)

  ## I changed this so it doesn't run for implausible, don't want to alter function too much
  implausible_offset <- if (is.null(bin_minutes)) {
    implausible <- flag_implausible_sleep(recovery)
    make_offset(implausible) |>
      select(participant_id, sleep_date) |>
      mutate(implaus = TRUE)
  } else {
    tibble::tibble(
      participant_id = character(),
      sleep_date     = as.Date(character()),
      implaus        = logical()
    )
  }

  # if bin_minutes is not null, then don't calculate range/waso columns
  sleep30_hr_range <- compute_sleep_ranges_waso(
    sleep30_hr_offset,
    bin_minutes = bin_minutes
  )

  sleep_min_exclusions <- compute_fitbit_sleep_hr_exclusions(
    sleep30_hr_offset,
    bin_minutes = bin_minutes
  )

  sleep30_stage_min <- compute_sleep_stage_min(
    sleep30_hr_offset,
    bin_minutes = bin_minutes
  )

  sleep30_stage_hr <- compute_sleep_stage_hr(
    sleep30_hr_offset,
    bin_minutes = bin_minutes
  )

  base <- sleep_min_exclusions |>
    mutate(
      dt = if (is.null(bin_minutes)) as.Date(sleep_date) else sleep_date,
      calendar_date = as.Date(sleep_date)
    ) |>
    distinct(
      participant_id, session_id, sleep_date, calendar_date
    ) |>
    left_join(
      distinct_day_no,
      by = c("participant_id", "session_id", "calendar_date" = "date")
    ) |>
    # filter(day != 0) |>
    mutate(
      dt_day  = lubridate::wday(sleep_date, label = TRUE),
      dt_wknd = as.character(dt_day) %in% c("Sat", "Sun"),
      wk      = (day - 1) %/% 7 + 1
    ) |>
    select(-calendar_date)

  drop_cols <- if (bin_minutes == 1440 || is.null(bin_minutes)) {
    c("start", "end")
  } else {
    c()
  }

  summary <- base |>
    left_join(
      sleep30_stage_min |> select(-any_of(drop_cols)),
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep30_hr_range,
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep30_stage_hr |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep_min_exclusions |> select(-any_of(c("start", "end"))),
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      implausible_offset,
      by = c("participant_id", "sleep_date")
    ) |>
    mutate(
      dt = if (is.null(bin_minutes)) {
        lubridate::as_date(sleep_date)
      } else {
        sleep_date
      },
      !!paste0("qc_", min_slp_minutes, "min") := min_total_slp >= min_slp_minutes,
      flg_slp = !is.na(implaus),
      flg_any = min_total_slp > 0,
      session_id = as.factor(session_id),
      across(
        c(
          wk,
          n_waso,
          hrate_rest_fitb,
          matches("^excl_min"),
          min_extra_nohrate_slp
        ),
        as.integer
      )
    ) |>
    select(
      participant_id,
      session_id,
      wk,
      day,
      dt,
      # dt = sleep_date,
      dt_day,
      dt_wknd,
      # scores below
      dtt_start_bed,
      dtt_end_bed,
      dtt_start_slp,
      dtt_end_slp,
      min_total_slp,
      min_asleep_slp,
      min_restless_slp,
      min_light_slp,
      min_deep_slp,
      min_rem_slp,
      min_nap_slp,
      min_wake,
      min_waso,
      n_waso,
      hrate_awake_slp,
      hrate_restless_slp,
      hrate_asleep_slp,
      hrate_light_slp,
      hrate_deep_slp,
      hrate_rem_slp,
      hrate_nap_slp,
      hrate_rest_fitb,
      excl_min_total_slp,
      any_of("excl_min_lowhrate_slp"),
      any_of("excl_min_highhrate_slp"),
      excl_min_nohrate_slp,
      excl_min_repeathrate_slp,
      min_extra_nohrate_slp,
      # qc_300min,
      !!paste0("qc_", min_slp_minutes, "min"),
      flg_slp,
      flg_any
    ) |>
    # filter(!is.na(day)) |>
    arrange(
      participant_id,
      session_id,
      dt
    )

  summary
}

#' Computes episode-based daily sleep summary measures.
#'
#' @description
#' This function extends the standard sleep pipeline by grouping 30-second sleep
#' epochs into continuous sleep blocks based on a configurable gap threshold,
#' and redefining main sleep periods based on block duration. Heart rate
#' exclusion logic is applied both prior to and after block construction to
#' ensure consistency across raw and reconstructed sleep structures.
#'
#' @param data_activity tbl. Epoch-level activity data used to derive heart rate
#'  exclusion flags.
#' @param data_sleep_combined tbl. 30-second sleep epoch data containing sleep
#'  stage and timestamp information.
#' @param data_daily tbl. Daily Fitbit summary data including resting heart
#' rate.
#' @param hr_low numeric. Lower threshold for valid heart rate values.
#' @param hr_high numeric or NULL. Optional upper threshold for valid heart rate
#'  values.
#' @param hr_rep_day numeric. Threshold (number of epochs) for repeated heart
#'  rate detection in daytime activity.
#' @param hr_rep_sleep numeric. Threshold (number of epochs) for repeated heart
#' rate detection in sleep.
#' @param gap numeric. Maximum allowed gap (in minutes) between consecutive
#' sleep epochs before a new sleep episode is defined.
#' @param offset character. Time-of-day cutoff used to define sleep-day
#' boundaries.
#' @param main_duration numeric. Minumum duration in minutes for a sleep episode
#' to be qualify as a main sleep episode.
#' @param bin_minutes numeric. Number of minutes used to bin data.
#' @param min_slp_minutes numeric. Minimum number of sleep minutes required
#'   for a day to pass quality control. Used to create a \code{qc_Xmin} flag
#'   column in the output.
#'
#' @return tbl. A daily-level extended sleep summary table containing:
#'
#' **Identifiers and time variables:**
#'  - `participant_id`, `session_id`
#'  - `wk`: Study week index
#'  - `day`: Study day index
#'  - `dt`: Sleep-aligned date
#'  - `dt_day`: Day of week
#'  - `dt_wknd`: Weekend indicator
#'
#' **Sleep timing and block structure:**
#'  - `dtt_start_bed`, `dtt_end_bed`
#'  - `dtt_start_slp`, `dtt_end_slp`
#'
#' **Sleep duration metrics:**
#'  - `min_total_slp`, `min_asleep_slp`, `min_restless_slp`,
#'    `min_light_slp`, `min_deep_slp`, `min_rem_slp`, `min_nap_slp`
#'  - `min_waso`, `min_wake`, `n_waso`
#'
#' **Heart rate summaries by sleep stage:**
#'  - `hrate_awake_slp`, `hrate_restless_slp`, `hrate_asleep_slp`
#'  - `hrate_light_slp`, `hrate_deep_slp`, `hrate_rem_slp`
#'  - `hrate_nap_slp`, `hrate_rest_fitb`
#'
#' **Heart rate exclusion metrics:**
#'  - `excl_min_total_slp`, `excl_min_lowhrate_slp`
#'  - `excl_min_nohrate_slp`, `excl_min_highhrate_slp`
#'  - `excl_min_repeathrate_slp`, `min_extra_nohrate_slp`
#'
#' **Quality control flags:**
#'  - `qc_300min`: Indicator for >= 300 minutes of sleep
#'  - `flg_slp`: Flag for implausible sleep structure
#'  - `flg_any`: Indicator for any valid sleep data
#'
#' @details
#' This extended pipeline differs from the standard sleep table by introducing a
#' episode-based reconstruction step. Sleep epochs are grouped into continuous
#' episodes using a configurable gap threshold, and episode duration is used to
#' define main sleep.
#'
#' @note
#' - `data_activity`:  fitbit_raw_activity or fitbit_covid_raw_activity
#' - `data_sleep_combined`: fitbit_raw_sleep or fitbit_covid_raw_sleep
#' - `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics
#'
#' @export
#' @autoglobal
compute_fitbit_sleep_table_ext <- function(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = NULL,
  offset = "12:00",
  min_slp_minutes,
  main_duration = 180,
  gap = 90
) {
  check_params_compute_fitbit_sleep_table(
    data_activity = data_activity,
    data_sleep_combined = data_sleep_combined,
    data_daily = data_daily,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep = hr_rep_sleep,
    offset = offset,
    bin_minutes = bin_minutes,
    min_slp_minutes = min_slp_minutes
  )

  chk::chk_numeric(gap)
  chk::chk_numeric(main_duration)

  exclusions <- identify_hr_exclusions(
    data = data_activity,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day,
    hr_rep_sleep
  )

  recovery <- identify_hr_recovery(exclusions)

  heartrate <- data_daily |>
    select(participant_id, session_id, dt, hrate_rest_fitb)

  distinct_day_no <- data_activity |>
    mutate(date = as.Date(dtt)) |>
    distinct(participant_id, session_id, date, day) |>
    left_join(heartrate, by = c("participant_id", "session_id", "date" = "dt"))

  sleep30_exclusions <- join_sleep30_and_exclusions(
    data_sleep_combined,
    recovery
  )

  blocks <- create_block_ranges(
    sleep30_exclusions,
    gap = gap,
    offset = offset
  )

  sleep_blocked <- add_sleep_flags(
    sleep30_exclusions,
    blocks,
    main_duration = main_duration
  )

  sleep_blocked <- identify_hr_exclusions(
    sleep_blocked,
    hr_low = hr_low,
    hr_high = hr_high,
    hr_rep_day = hr_rep_day * 2,
    hr_rep_sleep = hr_rep_sleep * 2
  )

  sleep_blocked <- make_offset(sleep_blocked)

  block_counts <- compute_block_counts(blocks, main_dur = main_duration)

  implausible_offset <- if (is.null(bin_minutes)) {
    implausible <- flag_implausible_sleep(recovery)
    make_offset(implausible) |>
      select(participant_id, sleep_date) |>
      mutate(implaus = TRUE)
  } else {
    tibble::tibble(
      participant_id = character(),
      sleep_date     = as.Date(character()),
      implaus        = logical()
    )
  }

  sleep_ranges <- compute_sleep_ranges_waso_ext(
    sleep_blocked,
    block_counts,
    bin_minutes = bin_minutes
  )

  sleep_min_exclusions <- compute_fitbit_sleep_hr_exclusions(
    sleep_blocked,
    bin_minutes = bin_minutes
  )

  sleep30_stage_min <- compute_sleep_stage_min(
    sleep_blocked,
    bin_minutes = bin_minutes
  )

  sleep30_stage_hr <- compute_sleep_stage_hr(
    sleep_blocked,
    bin_minutes = bin_minutes
  )

  base <- sleep_min_exclusions |>
    mutate(
      dt = if (is.null(bin_minutes)) as.Date(sleep_date) else sleep_date,
      calendar_date = as.Date(sleep_date)
    ) |>
    distinct(
      participant_id, session_id, sleep_date, calendar_date
    ) |>
    left_join(
      distinct_day_no,
      by = c("participant_id", "session_id", "calendar_date" = "date")
    ) |>
    # filter(day != 0) |>
    mutate(
      dt_day  = lubridate::wday(sleep_date, label = TRUE),
      dt_wknd = as.character(dt_day) %in% c("Sat", "Sun"),
      wk      = (day - 1) %/% 7 + 1
    ) |>
    select(-calendar_date)

  drop_cols <- if (bin_minutes == 1440 || is.null(bin_minutes)) {
    c("start", "end")
  } else {
    c()
  }

  summary <- base |>
    left_join(
      sleep_ranges,
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep30_stage_min,
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep30_stage_hr,
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      sleep_min_exclusions,
      by = c("participant_id", "session_id", "sleep_date")
    ) |>
    left_join(
      implausible_offset,
      by = c("participant_id", "sleep_date")
    ) |>
    mutate(
      dt = if (is.null(bin_minutes)) {
        lubridate::as_date(sleep_date)
      } else {
        sleep_date
      },
      !!paste0("qc_", min_slp_minutes, "min") := min_total_slp >= min_slp_minutes,
      # qc_300min = min_total_slp > 299,
      flg_slp = !is.na(implaus),
      flg_any = min_total_slp > 0,
      session_id = as.factor(session_id),
      across(
        c(
          wk,
          n_waso,
          hrate_rest_fitb,
          matches("^excl_min"),
          min_extra_nohrate_slp
        ),
        as.integer
      )
    ) |>
    select(
      participant_id,
      session_id,
      wk,
      day,
      dt = sleep_date,
      dt_day,
      dt_wknd,
      dtt_start_bed,
      dtt_end_bed,
      dtt_start_slp,
      dtt_end_slp,
      min_total_slp,
      min_asleep_slp,
      min_restless_slp,
      min_light_slp,
      min_deep_slp,
      min_rem_slp,
      min_nap_slp,
      min_waso,
      min_wake,
      n_waso,
      hrate_awake_slp,
      hrate_restless_slp,
      hrate_asleep_slp,
      hrate_light_slp,
      hrate_deep_slp,
      hrate_rem_slp,
      hrate_nap_slp,
      hrate_rest_fitb,
      excl_min_total_slp,
      # excl_min_lowhrate_slp,
      any_of("excl_min_lowhrate_slp"),
      any_of("excl_min_highhrate_slp"),
      excl_min_nohrate_slp,
      excl_min_repeathrate_slp,
      min_extra_nohrate_slp,
      # qc_300min,
      !!paste0("qc_", min_slp_minutes, "min"),
      flg_slp,
      flg_any
    ) |>
    filter(!is.na(day)) |>
    arrange(
      participant_id,
      session_id,
      dt
    )

  summary
}

##  ............................................................................
##  Weekly scores                                                           ####


#' Generates weekly summary tables
#'
#' @description
#' Generates weekly summary tables using a user-supplied summarization function,
#' with stratification by weekday, weekend, and full-week estimates.
#'
#' This function standardizes weekly aggregation by:
#' (1) filtering valid records,
#' (2) computing day counts for quality control,
#' (3) applying a user-defined summarization function, and
#' (4) producing three parallel weekly summaries (whole week, weekday-only,
#' and weekend-only).
#'
#' @param df tbl. Input daily-level dataset containing at minimum:
#' `participant_id`, `session_id`, `wk`, and `dt_wknd`.
#'
#' @param wkdy_min numeric. Minimum number of weekday observations required
#' for a valid weekly weekday estimate.
#'
#' @param wknd_min numeric. Minimum number of weekend observations required
#' for a valid weekly weekend estimate.
#'
#' @param summarize_fn function. A user-defined function that takes a filtered
#' dataset and returns weekly summaries grouped by
#' `participant_id`, `session_id`, and `wk`.
#'
#' @param filter_expr expression. Logical filtering condition applied to the
#' input dataset before summarization (e.g., QC thresholds).
#'
#' @return tbl. A combined weekly dataset containing three types of summaries:
#'  - `wk_type = 2`: Whole-week estimates (weekday + weekend combined)
#'  - `wk_type = 1`: Weekend-only estimates
#'  - `wk_type = 0`: Weekday-only estimates
#'
#' Each row includes:
#'  - Weekly summary metrics from `summarize_fn`
#'  - Day count variables (`n_day`, `n_wkdy`, `n_wknd`)
#'  - Quality control flag `qc_wk` indicating sufficient coverage
#'
#' @details
#' The function uses stratified counting to ensure that weekly estimates are
#' interpretable in the context of data completeness. The QC rule differs by
#' strata:
#'  - Whole week: requires both weekday and weekend minimum counts
#'  - Weekday/weekend: require minimum counts within their respective subsets
#'
#' The `summarize_fn` argument allows flexible reuse across sleep and activity
#' pipelines while maintaining consistent weekly structure.
#'
#' @export
#' @autoglobal
compute_fitbit_weekly_summary <- function(
  df,
  wkdy_min = 3,
  wknd_min = 1,
  summarize_fn,
  filter_expr
) {
  chk::chk_data(df)
  chk::chk_numeric(wkdy_min)
  chk::chk_numeric(wknd_min)

  # ---- filter to valid days (parameterized) ---- #
  df_valid <- df |>
    filter({{ filter_expr }})

  # ---- counts ---- #
  counts_all <- compute_day_counts(df_valid)
  counts_wknd <- compute_day_counts(df_valid |> filter(dt_wknd))
  counts_wkdy <- compute_day_counts(df_valid |> filter(!dt_wknd))

  # ---- summaries ---- #
  whole <- summarize_fn(df_valid) |>
    left_join(counts_all, by = c("participant_id", "session_id", "wk")) |>
    mutate(
      wk_type = 2,
      qc_wk = n_wknd >= wknd_min & n_wkdy >= wkdy_min
    )

  weekend <- summarize_fn(df_valid |> filter(dt_wknd)) |>
    left_join(counts_wknd, by = c("participant_id", "session_id", "wk")) |>
    mutate(
      wk_type = 1,
      qc_wk = n_day >= wknd_min
    )

  weekday <- summarize_fn(df_valid |> filter(!dt_wknd)) |>
    left_join(counts_wkdy, by = c("participant_id", "session_id", "wk")) |>
    mutate(
      wk_type = 0,
      qc_wk = n_day >= wkdy_min
    )

  # ---- combine ---- #
  bind_rows(whole, weekend, weekday) |>
    arrange(participant_id, session_id, wk, wk_type)
}

#' Generates weekly activity summaries
#'
#' @description
#' Generates weekly activity summaries from daily Fitbit activity data.
#'
#' This wrapper function applies a standardized weekly aggregation pipeline
#' using `compute_fitbit_weekly_summary()` and the `summarize_activity()`
#' function to compute weekly activity metrics at the participant-session level.
#'
#' Only days passing minimum quality control thresholds (`qc_600min` and
#' `qc_steps`) are included in the weekly aggregation.
#'
#' @param df tbl. Daily-level Fitbit activity dataset (standard or extended),
#' typically `fitbit_ss_activity_day` or `fitbit_ss_ext_activity_day`.
#' @param filter_expr expression. Logical filtering condition applied to the
#' input dataset before summarization (e.g., QC thresholds).
#' which retains only days with at least 600 valid minutes and passing step
#' count quality checks.
#'
#' @return tbl. Weekly activity dataset containing:
#'  - Week identifiers (`wk`, `wk_type`)
#'  - Day counts (`n_day`, `n_wkdy`, `n_wknd`)
#'  - Activity summary metrics (steps, METs, intensity minutes, heart rate)
#'  - Weekly quality control flag (`qc_wk`)
#'
#' @details
#' This function standardizes weekly activity computation across datasets by
#' enforcing consistent filtering, aggregation, and output structure.
#'
#' @note
#' - `df`: fitbit_ss_activity_day or fitbit_ss_ext_activity_day
#' (daily Fitbit activity dataset with QC flags)
#'
#' @export
#' @autoglobal
compute_fitbit_activity_week <- function(
  df,
  filter_expr = qc_600min & qc_steps
) {
  chk::chk_data(df)
  chk::chk_not_missing(filter_expr)

  compute_fitbit_weekly_summary(
    df = df,
    summarize_fn = summarize_activity,
    filter_expr = filter_expr
  ) |>
    select(
      participant_id,
      session_id,
      wk,
      wk_type,
      n_day,
      n_wkdy,
      n_wknd,
      mean_min_actv,
      mean_min_slp,
      sum_steps_actv,
      mean_steps_actv,
      mean_steps_fitb,
      mean_mets_actv,
      sum_min_intnst_sed_actv,
      sum_min_intnst_light_actv,
      sum_min_intnst_mod_actv,
      sum_min_intnst_vigor_actv,
      mean_min_intnst_sed_actv,
      mean_min_intnst_light_actv,
      mean_min_intnst_mod_actv,
      mean_min_intnst_vigor_actv,
      mean_rest_hrate_fitb,
      qc_wk
    )
}

#' Generates weekly sleep summaries from daily Fitbit sleep data.
#'
#' @description
#' This wrapper function applies a standardized weekly aggregation pipeline
#' using `compute_fitbit_weekly_summary()` and the `summarize_sleep()` function
#' to compute weekly sleep metrics at the participant-session level.
#'
#' Only days passing minimum quality control thresholds (`qc_300min`) are
#' included in the weekly aggregation.
#'
#' @param df tbl. Daily-level Fitbit sleep dataset (standard or extended),
#' typically `fitbit_ss_sleep_day` or `fitbit_ss_ext_sleep_day`.
#' @param filter_expr expression. Logical filtering condition applied to the
#' input dataset before summarization (e.g., QC thresholds).
#'
#' @return tbl. Weekly sleep dataset containing:
#'  - Week identifiers (`wk`, `wk_type`)
#'  - Day counts (`n_day`, `n_wkdy`, `n_wknd`)
#'  - Sleep timing metrics (bed/sleep onset and offset)
#'  - Sleep duration and stage summaries
#'  - Heart rate–derived sleep metrics
#'  - Wake-after-sleep-onset metrics
#'  - Weekly quality control flag (`qc_wk`)
#'
#' @details
#' This function ensures consistent weekly aggregation of sleep metrics across
#' standard and extended Fitbit datasets. It inherits QC filtering from the
#' parent pipeline and preserves both total and stage-specific sleep summaries.
#'
#' @note
#' - `df`: fitbit_ss_sleep_day or fitbit_ss_ext_sleep_day
#' (daily Fitbit sleep dataset with QC flags)
#'
#' @export
#' @autoglobal
compute_fitbit_sleep_week <- function(
  df,
  filter_expr = qc_300min
) {
  chk::chk_data(df)
  chk::chk_not_missing(filter_expr)

  compute_fitbit_weekly_summary(
    df = df,
    summarize_fn = summarize_sleep,
    filter_expr = filter_expr
  ) |>
    select(
      participant_id,
      session_id,
      wk,
      wk_type,
      n_day,
      n_wkdy,
      n_wknd,
      mean_t_start_bed,
      mean_t_end_bed,
      mean_t_start_slp,
      mean_t_end_slp,
      sum_min_total_slp,
      sum_min_asleep_slp,
      sum_min_restless_slp,
      sum_min_light_slp,
      sum_min_deep_slp,
      sum_min_rem_slp,
      sum_min_wake_slp,
      sum_min_waso,
      sum_n_waso,
      mean_min_slp_total,
      mean_min_asleep_slp,
      mean_min_restless,
      mean_min_slp_light,
      mean_min_slp_deep,
      mean_min_slp_rem,
      mean_min_wake,
      mean_min_waso,
      mean_n_waso,
      hrate_awake_slp,
      hrate_asleep_slp,
      hrate_restless_slp,
      hrate_light_slp,
      hrate_deep_slp,
      hrate_rem_slp,
      qc_wk
    )
}


#   ____________________________________________________________________________
#   Internal Functions                                                      ####

##  ............................................................................
##  Chk functions                                                           ####

#' Check parameters for compute_fitbit_activity_table
#'
#' @description
#' Validates all input parameters for \code{\link{compute_fitbit_activity_table}},
#' including data frame structure, required column presence, and numeric
#' parameter constraints.
#'
#' @inheritParams compute_fitbit_activity_table
#'
#' @return NULL. Called for its side effects (parameter validation).
#'
#' @keywords internal
check_params_compute_fitbit_activity_table <- function(
  data_activity,
  data_daily,
  hr_low,
  hr_high,
  hr_rep_day,
  hr_rep_sleep,
  bin_minutes,
  append_daily_fitbit_qc,
  qc_threshold,
  offset,
  min_actv_minutes
) {
  # Data checks
  chk::chk_data(data_activity)
  chk::check_names(
    data_activity,
    c(
      "participant_id",
      "session_id",
      "dtt",
      "hrate",
      "steps",
      "intnst",
      "mets",
      "is_slp"
    )
  )
  if (!is.null(data_daily)) chk::chk_data(data_daily)
  chk::check_names(
    data_daily,
    c(
      "participant_id",
      "session_id",
      "dt",
      "steps_fitb",
      "hrate_rest_fitb"
    )
  )
  # Param checks
  if (!is.null(hr_low)) {
    chk::chk_numeric(hr_low)
    chk::chk_scalar(hr_low)
    chk::chk_gt(hr_low, 0)
  }
  if (!is.null(hr_high)) {
    chk::chk_numeric(hr_high)
    chk::chk_scalar(hr_high)
    chk::chk_gt(hr_high, 0)
  }

  if (!is.null(hr_rep_day)) {
    chk::chk_numeric(hr_rep_day)
    chk::chk_scalar(hr_rep_day)
    chk::chk_gt(hr_rep_day, 0)
  }

  if (!is.null(hr_rep_sleep)) {
    chk::chk_numeric(hr_rep_sleep)
    chk::chk_scalar(hr_rep_sleep)
    chk::chk_gt(hr_rep_sleep, 0)
  }

  chk::chk_numeric(hr_rep_day)
  chk::chk_numeric(hr_rep_sleep)
  chk::chk_numeric(bin_minutes)
  # if (!is.null(bin_minutes)) {
  chk::chk_scalar(bin_minutes)
  chk::chk_gt(bin_minutes, 0)
  # }
  chk::chk_flag(append_daily_fitbit_qc)

  if (append_daily_fitbit_qc) {
    chk::chk_data(data_daily)
    chk::chk_numeric(qc_threshold)
    chk::chk_range(qc_threshold, c(0, 1))
  }

  if (!is.null(offset)) {
    chk::chk_string(offset)
    if (!grepl("^([01]\\d|2[0-3]):[0-5]\\d$", offset)) {
      cli::cli_abort("`offset` must be in HH:MM format (e.g. '12:00').")
    }
  }

  chk::chk_scalar(min_actv_minutes)
  chk::chk_scalar(min_actv_minutes)
  chk::chk_gt(min_actv_minutes, 0)
}

#' Check parameters for compute_fitbit_sleep_table
#'
#' @description
#' Validates all input parameters for \code{\link{compute_fitbit_sleep_table}},
#' including data frame structure, required column presence, and numeric
#' parameter constraints.
#'
#' @inheritParams compute_fitbit_sleep_table
#'
#' @return NULL. Called for its side effects (parameter validation).
#'
#' @keywords internal
check_params_compute_fitbit_sleep_table <- function(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low,
  hr_high,
  hr_rep_day,
  hr_rep_sleep,
  bin_minutes,
  offset,
  min_slp_minutes
) {
  # Data checks
  chk::chk_data(data_activity)
  chk::chk_data(data_daily)
  chk::chk_data(data_sleep_combined)
  chk::check_names(
    data_activity,
    c(
      "participant_id",
      "session_id",
      "dtt",
      "hrate",
      "steps",
      "intnst",
      "mets",
      "is_slp"
    )
  )
  if (!is.null(data_daily)) chk::chk_data(data_daily)
  chk::check_names(
    data_daily,
    c(
      "participant_id",
      "session_id",
      "dt",
      "steps_fitb",
      "hrate_rest_fitb"
    )
  )
  # Param checks
  if (!is.null(hr_low)) {
    chk::chk_numeric(hr_low)
    chk::chk_scalar(hr_low)
    chk::chk_gt(hr_low, 0)
  }
  if (!is.null(hr_high)) {
    chk::chk_numeric(hr_high)
    chk::chk_scalar(hr_high)
    chk::chk_gt(hr_high, 0)
  }

  # if (!is.null(hr_rep_day)) {
  chk::chk_numeric(hr_rep_day)
  chk::chk_scalar(hr_rep_day)
  chk::chk_gt(hr_rep_day, 0)
  # }

  # if (!is.null(hr_rep_sleep)) {
  chk::chk_numeric(hr_rep_sleep)
  chk::chk_scalar(hr_rep_sleep)
  chk::chk_gt(hr_rep_sleep, 0)
  # }

  # if (!is.null(bin_minutes)) {
  #   chk::chk_scalar(bin_minutes)
  #   chk::chk_gt(bin_minutes, 0)}

  # if(!is.null(bin_minutes)) {
  #   chk::chk_numeric(bin_minutes)
  #   cli::cli_warn("Ignoring `offset` parameter!")
  # } else {
  #   chk::chk_string(offset)
  #   # check that format matches expectation of HH:MM
  # }

  if (!is.null(bin_minutes)) {
    chk::chk_numeric(bin_minutes)
    chk::chk_scalar(bin_minutes)
    chk::chk_gt(bin_minutes, 0)
    cli::cli_warn("Ignoring `offset` parameter!")
  } else {
    chk::chk_string(offset)
    if (!grepl("^([01]\\d|2[0-3]):[0-5]\\d$", offset)) {
      cli::cli_abort("`offset` must be in HH:MM format (e.g. '12:00').")
    }
  }

  chk::chk_numeric(min_slp_minutes)
  chk::chk_scalar(min_slp_minutes)
  chk::chk_gte(min_slp_minutes, 0)
}


##  ............................................................................
##  Lower-level functions                                                   ####

#' Identify heart rate based exclusions
#' @description
#' Flags implausible or poor-quality heart rate observations based on
#' physiologic thresholds, missingness and repeated values.
#'
#'
#' @param data tbl. Data frame with the following columns with minute-level
#' epoch data with the following columns:
#'   - `participant_id`: Participant identifier
#'   - `session_id`: Session identifier
#'   - `dtt`: POSIXct epoch timestamp
# `   - `hrate`: Heart rate in beats per minute
# `   - `is_slp`: Indicator whether epoch was classified as sleep.
#'   - `dtt` POSIXct epoch timestamp.
#' @param hr_low numeric, positive whole number. Lower bound for plausible heart
#'  rate (Default: 50 bpm)
#' @param hr_high numeric, positive whole number. Upper bound for plausible
#'  heart rate. If NULL, no upper bound is applied (Default: NULL)
#' @param hr_rep_day numeric, positive whole number. Number of consecutive
#'  missing heart rate values allowed during non-sleep minutes (Default: 10).
#' @param hr_rep_sleep numeric, positive whole number. Number of consecutive
#'  missing heart rate values allowed during sleep minutes (Default: 30).
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `hrate_low`: TRUE if heart rate is below `hr_low` threshold, FALSE
#'  otherwise.
#'  - `hrate_hi`: TRUE if heart rate is above `hr_high` threshold (if `hr_high`
#'  is not NULL), FALSE otherwise. Column is not created if `hr_high` is NULL.
#'  - `hrate_no`: TRUE if heart rate is missing, FALSE otherwise.
#'  - `hrate_repeat_actv`: TRUE if there are more than `hr_rep_day` consecutive
#'  identical heart rate values during non-sleep minutes, FALSE otherwise.
#'  - `hrate_repeat_slp`: TRUE if there are more than `hr_rep_sleep` consecutive
#'  identical heart rate values during sleep minutes, FALSE otherwise.
#'  - `hrate_excluded`: TRUE if any above exclusion criteria are met, FALSE
#'  otherwise.
#'
#' @note `data` is either `fitbit_raw_activity` or `fitbit_covid_raw_activity`
#'   downloaded from LASSO.
#' @details
#' Missing values are handled using a bounded approach. When a consecutive
#' sequence of missing values are bounded by identical values, exclusions are
#' flagged as repeat exclusions if the length of sequence meets repeat
#' threshold parameters.
#'
#' @keywords internal
#' @autoglobal
identify_hr_exclusions <- function(
  data,
  hr_low,
  hr_high = NULL,
  hr_rep_day,
  hr_rep_sleep
) {
  data.table::setDT(data)
  data.table::setorder(data, participant_id, session_id, dtt)

  # 1. Preserve original missingness
  data[, hr_missing_orig := is.na(hrate)]

  # 2. Conservative bookend fill
  data[, `:=`(
    prev_hr = data.table::shift(hrate),
    next_hr = data.table::shift(hrate, type = "lead")
  ), by = participant_id]

  data[, na_run := data.table::rleid(is.na(hrate)), by = participant_id]

  data[, fill_value := {
    left <- prev_hr[1]
    right <- next_hr[.N]
    same_bookend <- !is.na(left) && !is.na(right) && identical(left, right)

    if (all(is.na(hrate)) && same_bookend) left else NA_real_
  }, by = .(participant_id, na_run)]

  data[, hr_filled :=
    data.table::fifelse(
      is.na(hrate) & !is.na(fill_value),
      fill_value,
      hrate
    )]

  # 3. Physiologic bounds
  if (!is.null(hr_low)) {
    data[, hrate_low := hr_filled < hr_low]
  } else {
    data[, hrate_low := FALSE]
  }

  if (!is.null(hr_high)) {
    data[, hrate_hi := hr_filled > hr_high]
  } else {
    data[, hrate_hi := FALSE]
  }

  data[, hrate_no := hr_missing_orig]

  # 4. Plateau detection
  data[, hr_for_repeat := hr_filled]
  data[, run_id := data.table::rleid(hr_for_repeat), by = participant_id]

  data[, run_length :=
    if (all(is.na(hr_for_repeat))) 0L else .N,
  by = .(participant_id, run_id)
  ]

  if (!is.null(hr_rep_day)) {
    data[, hrate_repeat_actv_init := run_length > hr_rep_day]
  } else {
    data[, hrate_repeat_actv_init := FALSE]
  }

  if (!is.null(hr_rep_sleep)) {
    data[, hrate_repeat_slp_init := run_length > hr_rep_sleep]
  } else {
    data[, hrate_repeat_slp_init := FALSE]
  }

  data[, hrate_repeat := hrate_repeat_actv_init | hrate_repeat_slp_init]

  # 5. Priority rules
  data[
    hrate_repeat == TRUE,
    `:=`(
      hrate_low = FALSE,
      hrate_hi  = FALSE,
      hrate_no  = FALSE
    )
  ]

  data[
    (hrate_low | hrate_hi) & !hrate_repeat,
    hrate_no := FALSE
  ]

  # Make repeat types mutually exclusive (day vs sleep)
  data[, `:=`(
    hrate_repeat_actv = hrate_repeat_actv_init & !is_slp,
    hrate_repeat_slp  = hrate_repeat_slp_init & is_slp
  )]

  # 6. Composite bad signal flags
  data[, bad_signal_day :=
    hrate_low |
      hrate_hi |
      hrate_no |
      hrate_repeat_actv]

  data[, bad_signal_sleep :=
    hrate_low |
      hrate_hi |
      hrate_no |
      hrate_repeat_slp]

  # 7. Apply day vs sleep exclusions
  data[, hr_exc_day := (!is_slp) & bad_signal_day]
  data[, hr_exc_night := (is_slp) & bad_signal_sleep]

  data[, hrate_excluded := hr_exc_day | hr_exc_night]

  # Track optional outputs to drop
  cols_to_drop_optional <- c()

  if (is.null(hr_low)) {
    cols_to_drop_optional <- c(cols_to_drop_optional, "hrate_low")
  }

  if (is.null(hr_high)) {
    cols_to_drop_optional <- c(cols_to_drop_optional, "hrate_hi")
  }

  if (is.null(hr_rep_day)) {
    cols_to_drop_optional <- c(cols_to_drop_optional, "hrate_repeat_actv")
  }

  if (is.null(hr_rep_sleep)) {
    cols_to_drop_optional <- c(cols_to_drop_optional, "hrate_repeat_slp")
  }


  # 8. Cleanup helper columns
  ## need to keep hr_exc_day and hr_exc_night for extended sleep flags
  data[, c(
    "prev_hr", "next_hr", "na_run",
    "fill_value", "run_id", "run_length",
    "hr_for_repeat", "hr_missing_orig", "hr_filled",
    "hrate_repeat_actv_init", "hrate_repeat_slp_init", "hrate_repeat",
    "bad_signal_day", "bad_signal_sleep", # "hr_exc_day", "hr_exc_night",
    cols_to_drop_optional
  ) := NULL]


  data.table::setindex(data, NULL)

  # remove internal pointer that can bloat serialization
  attr(data, ".internal.selfref") <- NULL


  return(data[])
}

#' Identify Recoverable Heart Rate Gaps During Sleep
#'
#' @description
#' Identifies period of missing heart rate during sleep that can be recovered
#' based on adjacent sleep minutes with valid heart rate. Specifically,
#' identifies sequences of heart rate values during sleep that end at 23:59 and
#' immediately followed by sleep periods with valid heart rate values. These
#' segments are marked as recoverable.
#'
#' @param data tbl. Data frame heart rate column `hrate`, `session_id` & `dtt`.
#'  `data` is the output from the `identify_hr_exclusions()`.
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `recover_hr`: TRUE if interval can should be excluded based on adjacency
#'    to plausible sleep.
#'
#' @keywords internal
#' @autoglobal
identify_hr_recovery <- function(data) {
  # Convert input data frame to data.table for fast grouped operations
  dt <- data.table::as.data.table(data)

  # Ensure rows are ordered by participant, session, and time
  # This is required for run detection and time comparisons
  data.table::setorder(dt, participant_id, session_id, dtt)

  dt[, `:=`(
    # Indicator for missing heart rate
    hr_missing = is.na(hrate)
  )]

  # Identify contiguous runs of identical sleep + HR-missing states
  # ------------------------------------------------------------------ #

  # rleid() assigns a unique ID whenever the combination of
  # participant_id, session_id, is_sleep, or hr_missing changes
  dt[, run_id := data.table::rleid(participant_id, session_id, is_slp, hr_missing)]

  # Summarize each run to analyze run boundaries
  # ------------------------------------------------------------------ #

  runs <- dt[, .(
    start_time = first(dtt), # start timestamp of run
    end_time = last(dtt), # end timestamp of run
    is_slp = first(is_slp),
    hr_missing = first(hr_missing)
  ), by = .(participant_id, session_id, run_id)]

  # Examine the next run within each participant/session
  # ------------------------------------------------------------------ #

  runs[, `:=`(
    next_is_sleep   = data.table::shift(is_slp, type = "lead"), # sleep status of next run
    next_hr_missing = data.table::shift(hr_missing, type = "lead"), # HR missing status of next run
    next_start      = data.table::shift(start_time, type = "lead") # start time of next run
  ), by = .(participant_id, session_id)]

  # Identify runs that end exactly at 23:59 and continue immediately
  # ------------------------------------------------------------------ #

  runs[, `:=`(
    # TRUE if run ends at 23:59
    ends_at_2359 = format(end_time, "%H:%M") == "23:59",

    # TRUE if the next run starts exactly 1 minute later
    contiguous = !is.na(next_start) &
      as.numeric(next_start - end_time, units = "secs") == 60
  )]

  # Identify runs where HR should be recovered
  recoverable_runs <- runs[
    # Run is sleep
    is_slp == TRUE &
      # HR is missing during this run
      hr_missing == TRUE &
      # Run ends at midnight boundary
      ends_at_2359 == TRUE &
      # Next run is still sleep
      next_is_sleep == TRUE &
      # Next run has valid HR
      next_hr_missing == FALSE &
      # Runs are contiguous (no time gap)
      contiguous == TRUE
  ]

  # Flag rows in original dataset that belong to recoverable runs
  # Initialize recovery flag
  dt[, recover_hr := FALSE]
  # Update rows whose run_id matches recoverable runs
  dt[
    recoverable_runs,
    on = .(participant_id, session_id, run_id),
    recover_hr := TRUE
  ]

  # cleanup of intermediate columns
  dt[, c("run_id", "hr_missing") := NULL]

  # Return the original dataset with recover_hr appended
  dt
}


#' Computes steps summary scores by day or by specified time bins
#'
#' @description
#' Computes steps summary scores by day or by specified time bins (e.g.,
#' 15-min, 30-min, 60-min), with optional integration of daily step count QC
#' from raw metrics.
#' @param data_exclusions tbl. Data frame with `hrate_excluded` flag.
#' @param bin_minutes numeric, positive whole number. Number of minutes to bin
#'  data by.
#' @param data_daily_qc tbl. Data frame with Fitbit provided daily step count.
#' @param qc_threshold numeric, between 0 and 1. Minimum percentage of Fitbit
#'  step count that must be met by computed active step count for QC to pass.
#' @param append_daily_fitbit_qc logical. If TRUE, appends daily Fitbit step
#'  count and QC results to output (Default: FALSE). If TRUE, `data_daily_qc`
#'  and `qc_threshold` must be provided and `bin_minutes` must be NULL.
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
#'  stamp of bin.
#'  - `end`:  If non-daily bin selected (i.e., != 1440 minutes), end time stamp
#'  of the bin.
#'  - `steps_total`: Total steps after excluding minutes with invalid heart
#'  rate.
#'  - `steps_actv`: Total steps during non-sleep, non-excluded minutes.
#'  - `steps`: Total steps, regardless of heart rate exclusions.
#'  - `steps_fitb`:
#'  - `prct_steps_fitb`: percent accordance between steps_actv and Fitbit
#'  calculated daily step count, if append_daily_fitbit_qc = TRUE.
#'  - `qc_steps`: percent accordance between steps_actv and Fitbit calculated
#'  daily step count >= selected qc_threshold.
#'
#'  @note
#'  - data_exclusions input: output of identify_hr_exclusions() or
#'  identify_hr_recovery(); needs exclusion flags
#'  - data_daily_qc input: fitbit_raw_metrics raw dataset
#'
#' @keywords internal
#' @autoglobal
compute_fitbit_score_steps <- function(
  data_exclusions,
  bin_minutes = 1440,
  data_daily_qc,
  qc_threshold,
  append_daily_fitbit_qc = FALSE
) {
  chk::chk_data(data_exclusions)

  # ----- Create time variable ----- #
  data_summarized <- data_exclusions |>
    mutate(
      time_unit = as.POSIXct(
        floor(as.numeric(dtt) / (bin_minutes * 60)) * (bin_minutes * 60),
        origin = "1970-01-01",
        tz = attr(dtt, "tzone")
      )
    ) |>
    summarize(
      steps_total = sum(steps[!hrate_excluded], na.rm = TRUE),
      steps_actv = sum(steps[!hrate_excluded & !is_slp], na.rm = TRUE),
      steps = sum(steps, na.rm = TRUE),
      .by = c("participant_id", "session_id", "time_unit")
    )

  # ----- Daily-only join + QC ----- #
  out <- if (append_daily_fitbit_qc & bin_minutes == 1440) {
    data_summarized |>
      left_join(
        data_daily_qc |> select(participant_id, dt, steps_fitb),
        by = c("participant_id", "time_unit" = "dt")
      ) |>
      mutate(
        pcnt_steps_fitb = case_when(
          steps_fitb == steps_actv ~ 1,
          steps_fitb > 0 ~ steps_actv / steps_fitb,
          TRUE ~ NA_real_
        ),
        qc_steps = case_when(
          steps_fitb == steps_actv ~ TRUE,
          steps_fitb > 0 ~ steps_actv >= qc_threshold * steps_fitb,
          TRUE ~ NA
        )
      )
  } else {
    data_summarized |>
      left_join(
        data_daily_qc |> select(participant_id, dt, steps_fitb),
        by = c("participant_id", "time_unit" = "dt")
      )
  }

  # ----- Final formatting ----- #
  result <- out |>
    arrange(participant_id, session_id, time_unit) |>
    rename(date = time_unit) |>
    mutate(session_id = factor(session_id))

  if (bin_minutes != 1440) {
    result <- result |>
      mutate(
        start = date,
        end   = date + bin_minutes * 60
      )
  }

  result
}

#' Compute METs and activity intensity summary metrics
#'
#' @description
#' Computes METS and activity summary scores by day or by specified time bins
#' (e.g., 15-min, 30-min, 60-min), with optional integration of daily step count
#' QC from raw metrics.
#'
#' @param data tbl. Activity dataframe with `mets` and `intnst`
#'  (intensity) variables with heart rate exclusions (`hrate_excluded`).
#' @param bin_minutes numeric, positive whole number. Number of minutes to bin
#'  data by.
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `mets`: mean METs after heart rate exclusions.
#'  - `mets_actv`: mean METS for non-sleep minutes after heart rate exclusions.
#'  - `min_intnst_sed_total`: Minutes spent in sedentary active, after heart
#'  rate exclusions.
#'  - `min_intnst_light_total`: Minutes spent in light active, after heart rate
#'  exclusions.
#'  - `min_intnst_mod_total`: Minutes spent in moderate active, after heart rate
#'  exclusions.
#'  - `min_intnst_vigor_total`: Minutes spent in vigorous active, after heart
#'  rate exclusions.
#'  - `min_intnst_sed_actv`: Non-sleep minutes spent in sedentary active, after
#'  heart rate exclusions.
#'  - `min_intnst_light_actv`: Non-sleep minutes spent in light active, after
#'  heart rate exclusions.
#'  - `min_intnst_mod_actv`: Non-sleep minutes spent in moderate active, after
#'  heart rate exclusions.
#'  - `min_intnst_vigor_actv`: Non-sleep minutes spent in vigorous active, after
#'  heart rate exclusions.
#'  - `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
#'  stamp of bin.
#'  - `end`:  If non-daily bin selected (i.e., != 1440 minutes), end time stamp
#'  of the bin.
#'
#' @note
#' - `data`: output of identify_hr_exclusions() or identify_hr_recovery();
#' needs exclusion flags
#'
#' @keywords internal
#' @autoglobal
compute_fitbit_intensity_scores <- function(data, bin_minutes) {
  data_binned <- data |>
    mutate(
      period = as.POSIXct(
        floor(as.numeric(dtt) / (bin_minutes * 60)) * (bin_minutes * 60),
        origin = "1970-01-01",
        tz = attr(dtt, "tzone")
      )
    )

  # this doesn't work
  # data_binned <- data |>
  #   mutate(
  #     period = lubridate::floor_date(dtt, paste0(bin_minutes, " minutes")),
  #     start  = period,
  #     end    = period + bin_minutes * 60
  #   )

  result <- data_binned |>
    filter(!hrate_excluded) |>
    mutate(
      date = period,
      mets_dbl = mets / 10
    ) |>
    group_by(participant_id, session_id, date) |>
    summarize(
      mets = mean(mets_dbl, na.rm = TRUE),
      mets_actv = mean(mets_dbl[!is_slp], na.rm = TRUE),
      min_intnst_sed_total = sum(intnst == 0, na.rm = TRUE),
      min_intnst_light_total = sum(intnst == 1, na.rm = TRUE),
      min_intnst_mod_total = sum(intnst == 2, na.rm = TRUE),
      min_intnst_vigor_total = sum(intnst == 3, na.rm = TRUE),
      min_intnst_sed_actv = sum(intnst == 0 & !is_slp, na.rm = TRUE),
      min_intnst_light_actv = sum(intnst == 1 & !is_slp, na.rm = TRUE),
      min_intnst_mod_actv = sum(intnst == 2 & !is_slp, na.rm = TRUE),
      min_intnst_vigor_actv = sum(intnst == 3 & !is_slp, na.rm = TRUE),
      .groups = "drop"
    ) |>
    # mutate(across(contains("min"), ~ round(.x, 1))) |>
    mutate(session_id = as.factor(session_id)) |>
    select(
      participant_id,
      session_id,
      date,
      # start,
      # end,
      mets,
      mets_actv,
      min_intnst_sed_total,
      min_intnst_light_total,
      min_intnst_mod_total,
      min_intnst_vigor_total,
      min_intnst_sed_actv,
      min_intnst_light_actv,
      min_intnst_mod_actv,
      min_intnst_vigor_actv
    ) |>
    arrange(participant_id, session_id, date)

  if (bin_minutes != 1440) {
    result <- result |>
      mutate(
        start = date,
        end   = date + bin_minutes * 60
      )
  }
  result
}

#' Assign sleep-aligned date using time-of-day offset
#'
#' @description
#' Assigns a sleep-aligned date (`sleep_date`) based on a specified daily
#' offset time. This is used to shift the day boundary (e.g noon-to-noon) so
#' that overnight sleep periods are grouped within a single "sleep day" rather
#' than split across calendar days.
#'
#' @param sleep_dataframe tbl. Data frame with POSIXct timestamp column `dtt`.
#' @param offset character. Time of day (HH:MM) used as the cutoff for defining
#' the sleep day. Timestamps occuring after this time are assigned to the next
#' day.
#'
#' @return tbl. The input data frame with the `sleep_date` column.
#'
#' @keywords internal
make_offset <- function(sleep_dataframe, offset = "12:00") {
  sleep_dataframe |>
    mutate(
      date = as.Date(dtt),
      sleep_date = if_else(
        condition = format(dtt, "%H:%M") <= offset,
        true = as.Date(date),
        false = as.Date(date) + 1
      )
    )
}

#' Create a sleep presence indicator
#'
#' @description
#' Filters out heart-rate-excluded epochs and non-main sleep periods, then
#' marks each remaining record with a binary sleep presence flag
#' (`has_sleep_30 = TRUE`). The date column used to represent each record
#' is determined by `offset`: either the pre-computed `sleep_date` or a floored
#' time bin derived from `dtt`.
#'
#' @param df tbl. Sleep data processed for exclusions. Requires columns:
#'   `hrate_excluded`, `main_slp`, `session_id`, `participant_id`, and either
#' `sleep_date` or  `dtt`.
#' @param bin_minutes numeric, positive whole number or NULL. Width of time bins
#'   in minutes. If NULL (default), data is returned at the sleep-date level.
#'   Otherwise, data is aggregated into bins of the specified width (e.g., 60
#'   for hourly, 1440 for calendar day).
#' bin data. If FALSE, bins will be created based on the `dtt` timestamp column.
#'
#' @return tbl with the following columns:
#'   - `participant_id`: Participant identifier.
#'   - `session_id`: Session identifier, coerced to factor.
#'   - `date`: Date of the sleep period.
#'   - `has_sleep_30`: logical
#'
#' @note
#' Input dataframe should be output if identify_hr_exclusions() or
#' identify_hr_recovery() functions. If `offset` parameter is `NULL`, the
#' `sleep_date` column will be used to bin data. Otherwise, bins will be created
#' based on the `dtt` timestamp column, with bin boundaries aligned to the epoch
#' start (e.g., 00:00, 01:00 for hourly bins).
#'
#' @keywords internal
#' @autoglobal
create_sleep_indicator <- function(df, bin_minutes = NULL) {
  df |>
    filter(!hrate_excluded, main_slp) |>
    mutate(
      session_id = as.factor(session_id),
      has_sleep_30 = TRUE,
      date = if (is.null(bin_minutes)) {
        sleep_date
      } else {
        as.POSIXct(
          floor(as.numeric(dtt) / (bin_minutes * 60)) * (bin_minutes * 60),
          origin = "1970-01-01", tz = attr(dtt, "tzone")
        )
      }
    ) |>
    transmute(participant_id, session_id, date, has_sleep_30) |>
    distinct()
}

#' Identify contiguous sleep episodes.
#'
#' @description
#' Identifies contiguous sleep episodes based on temporal gaps between valid
#' sleep minutes.  A new block is begins whenever the time difference between
#' consecutive sleep records exceeds specified threshold. Function provides
#' start and end times for each block and indicates whether they contain 'main'
#' sleep.
#'
#' @param exclusions_df tbl. Data frame with columns `is_slp`, `dtt`,
#' `hrate_excluded`, and `main_slp`.
#' @param offset character. Time of day `"HH:MM"` used as the cutoff for
#' defining the sleep day. Timestamps occuring after this time are assigned to
#' the next day.
#' @param gap numeric. Maximum allowed gap.
#'
#' @return tbl. A dataframe summarized at the sleep-block level, with the
#' following columns:
#'  - `participant_id`: participant identifier
#'  - `block_id`: identifier for each sleep block
#'  - `block_start`: Start timestamp of each continous sleep block.
#'  - `block_end`: End timestamp of each continous sleep block.
#'  - `main_block`: Logical indicator of whether the block contains any main
#'  sleep.
#'  - `duration_min`: Duration of each sleep block in minutes.
#'  - `sleep_date`:  Sleep-aligned date based on specified `offset`.
#'
#' @note
#' `exclusions_df`: output of identify_hr_exclusions() or
#' identify_hr_recovery(); needs exclusion flags
#' function is specific to extended framework
#' input: offset sleep data with exclusion flags
#'
#' @keywords internal
#' @autoglobal
create_block_ranges <- function(
  exclusions_df,
  offset = "12:00",
  gap
) {
  blocks <- exclusions_df |>
    filter(!hrate_excluded & is_slp) |>
    arrange(participant_id, dtt) |>
    group_by(participant_id) |>
    mutate(
      prev_dt   = lag(dtt),
      gap_sec   = as.numeric(difftime(dtt, prev_dt, units = "mins")),
      new_block = if_else(is.na(prev_dt) | gap_sec > gap, 1, 0),
      block_id  = cumsum(new_block)
    ) |>
    ungroup() |>
    group_by(participant_id, block_id) |>
    summarize(
      block_start = min(dtt),
      block_end   = max(dtt),
      main_block  = any(main_slp, na.rm = TRUE)
    ) |>
    ungroup() |>
    mutate(
      duration_min = as.numeric(
        difftime(
          block_end, block_start,
          units = "mins"
        )
      ),
      sleep_date = if_else(
        format(block_start, "%H:%M") > offset,
        as.Date(block_start) + 1, as.Date(block_start)
      )
    )
}

#' Compute total valid minutes by day or by specified time bins
#'
#' @description Computes the number of valid minutes, valid non-sleep minutes,
#' and valid sleep minutes for each participant and session, either by day or
#' by specified time bins.
#'
#' @param data tbl. Data frame with exclusion flags.
#' @param bin_minutes numeric, positive whole number. Number of minutes.
#'
#' @return A tibble with valid minute totals for each participant-event-period.
#' The output adds the following columns:
#'  - `min_total`: Total valid minutes (not excluded by heart rate criteria).
#'  - `min_actv`: Total valid non-sleep minutes.
#'  - `min_slp`: Total valid sleep minutes.
#'  - `min_nap_slp`: Total valid nap sleep minutes (sleep minutes that are not
#' main sleep).
#'  - `start`: If `bin_minutes` not daily (1440 minutes), start datetime of
#'  period
#'  - `end`:  If `bin_minutes` not daily (1440 minutes), end datetime of period.
#'
#' @note
#' - output of identify_hr_exclusions() or identify_hr_recovery()
#' - needs exclusion flags
#'
#' @keywords internal
#' @autoglobal
compute_fitbit_min_totals <- function(data, bin_minutes) {
  data_binned <- data |>
    mutate(
      period = as.POSIXct(
        floor(as.numeric(dtt) / (bin_minutes * 60)) * (bin_minutes * 60),
        origin = "1970-01-01",
        tz = attr(dtt, "tzone")
      )
      # start = period,
      # end   = period + bin_minutes * 60
    )

  result <- data_binned |>
    group_by(participant_id, session_id, period) |>
    summarize(
      # Total minutes retained
      min_total = sum(!hrate_excluded, na.rm = TRUE),
      min_actv = sum(!is_slp & !hrate_excluded, na.rm = TRUE),
      min_slp = sum(main_slp & !hrate_excluded, na.rm = TRUE),
      min_nap_slp = sum(is_slp & !main_slp & !hrate_excluded, na.rm = TRUE),
      .groups = "drop"
    ) |>
    arrange(participant_id, session_id, period) |>
    rename(date = period)

  if (bin_minutes != 1440) {
    result <- result |>
      mutate(
        start = date,
        end   = date + bin_minutes * 60
      )
  }

  result <- result |>
    mutate(session_id = factor(session_id))

  result
}

#' Computes heart rate based exclusions totals by time period
#'
#' @description
#' Computes heart rate based exclusions by day or by specified time bins.
#'
#' @param data tbl. Data frame with exclusion flag columns `is_slp`,
#' `session_id`, `dtt`, `hrate_excluded`, `hrate_low`, `hrate_hi` (optional),
#' `hrate_no`, `hrate_repeat_actv`, and `hrate_repeat_slp`.
#' @param bin_minutes numeric, positive whole number. Number of minutes to
#' bin data by.
#'
#' @return tbl. The input data frame with the following additional columns:
#'
#'  - `excl_min_total_actv`: Total number of non-sleep minutes excluded by
#'  heart rate criteria.
#'  - `excl_min_lowhrate_actv`: Total number of non-sleep minutes excluded by
#'  low heart rate criteria.
#'  - `excl_min_highhrate_actv`: Total number of non-sleep minutes excluded by
#'  high heart rate criteria (if `hrate_hi` exists). Column is not created if
#'  `hrate_hi` does not exist.
#'  - `excl_min_nohrate_actv`: Total number of non-sleep minutes excluded by
#'  missing heart rate criteria.
#'  - `excl_min_repeathrate_actv`: Total number of non-sleep minutes excluded by
#'   repeat heart rate criteria.
#'  - `excl_min_total_slp`: Total number of sleep minutes excluded by heart rate
#'   criteria.
#'  - `excl_min_lowhrate_slp`: Total number of sleep minutes excluded by low
#'   heart rate criteria.
#'  - `excl_min_highhrate_slp`: Total number of sleep minutes excluded by high
#'   heart rate criteria (if `hrate_hi` exists). Column is not created if
#'   `hrate_hi` does not exist.
#'  - `excl_min_nohrate_slp`: Total number of sleep minutes excluded by missing
#'   heart rate criteria.
#'  - `excl_min_repeathrate_slp`: Total number of sleep minutes excluded by
#'   repeat heart rate criteria.
#'  - `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
#'  stamp of bin.
#'  - `end`:  If non-daily bin selected (i.e., != 1440 minutes), end time stamp
#'  of the bin.
#'
#' @note
#' - output of identify_hr_exclusions() or identify_hr_recovery();
#' - needs exclusion flags
#'
#' @keywords internal
#' @autoglobal
compute_fitbit_score_minutes_exclusion <- function(data, bin_minutes) {
  has_hi <- "hrate_hi" %in% names(data)
  has_low <- "hrate_low" %in% names(data)

  data_binned <- if (is.null(bin_minutes)) {
    data |>
      mutate(period = as.Date(dtt))
  } else {
    data |>
      mutate(
        period = as.POSIXct(
          floor(as.numeric(dtt) / (bin_minutes * 60)) *
            (bin_minutes * 60),
          origin = "1970-01-01",
          tz = attr(dtt, "tzone")
        )
      )
  }

  result <- data_binned |>
    summarize(
      excl_min_total_actv =
        sum(!is_slp & hrate_excluded, na.rm = TRUE),
      excl_min_lowhrate_actv =
        sum(!is_slp & if (has_low) hrate_low else FALSE, na.rm = TRUE),
      excl_min_nohrate_actv =
        sum(!is_slp & hrate_no, na.rm = TRUE),
      excl_min_highhrate_actv =
        sum(!is_slp & if (has_hi) hrate_hi else FALSE, na.rm = TRUE),
      excl_min_repeathrate_actv =
        sum(!is_slp & hrate_repeat_actv, na.rm = TRUE),
      excl_min_total_slp =
        sum(is_slp & hrate_excluded, na.rm = TRUE),
      excl_min_lowhrate_slp =
        sum(is_slp & if (has_low) hrate_low else FALSE, na.rm = TRUE),
      excl_min_nohrate_slp =
        sum(is_slp & hrate_no, na.rm = TRUE),
      excl_min_highhrate_slp =
        sum(is_slp & if (has_hi) hrate_hi else FALSE, na.rm = TRUE),
      excl_min_repeathrate_slp =
        sum(is_slp & hrate_repeat_slp, na.rm = TRUE),
      .by = c("participant_id", "session_id", "period")
    )

  # Drop columns AFTER if they didn't exist
  if (!has_low) {
    result <- result |>
      select(-contains("lowhrate"))
  }

  if (!has_hi) {
    result <- result |>
      select(-contains("highhrate"))
  }

  result <- result |>
    arrange(participant_id, session_id, period) |>
    mutate(session_id = factor(session_id)) |>
    rename(date = period)

  if (!is.null(bin_minutes) && bin_minutes != 1440) {
    result <- result |>
      mutate(
        start = date,
        end   = date + bin_minutes * 60
      )
  }
  result
}

#' Append Sleep Episode Metadata to Epoch-Level Data
#'
#' @description
#' Joins sleep block metadata onto epoch-level data via a temporal overlap join,
#' then derives two flags: a revised `is_slp` indicator and a `main_slp`
#' indicator. Epochs are considered sleep if they fall within a detected sleep
#' block or were originally flagged as sleep during a heart-rate-excluded night.
#'
#' @param data tbl. Data frame with epoch-level sleep data that contains
#'   - `participant_id`: Participant identifier.
#'   - `dtt`: POSIXct epoch timestamp.
#'   - `is_slp`: Logical. Original sleep flag prior to block-based revision.
#'   - `hr_exc_night`: Logical. Indicates whether the epoch occurred on a
#'     heart-rate-excluded night.
#' @param blocks tbl.  A `tbl` or `data.frame` of sleep block ranges,
#' typically the output of `create_block_ranges()`. Must contain
#' `participant_id`, `block_start`, `block_end`, `main_block`, and
#' `duration_min`.
#' @param main_duration Positive numeric. Minimum duration in minutes required
#' for a block to be considered main sleep. Blocks shorter than this threshold
#' will not be classified as main sleep even if main block contains main sleep.
#'
#' @return The input `data` with all columns from `blocks` appended via
#'   temporal overlap join, plus two derived columns:
#'   - `is_slp`: Revised sleep flag, overwriting the original. `TRUE` if the
#'     epoch falls within a detected sleep block or was originally flagged as
#'     sleep on a heart-rate-excluded night.
#'   - `main_slp`: `TRUE` if the epoch's block has `main_block == TRUE` and
#'     `duration_min >= main_duration`. `FALSE` otherwise, including unmatched
#'     epochs.
#'
#' @note
#' `is_slp` and `main_slp` are present in `data` on entry but are both
#' overwritten. `is_slp` is revised using block membership and the
#' `hr_exc_night` flag; `main_slp` is recomputed entirely from the joined
#' block metadata. Neither original value is retained in the output.
#'
#' @keywords internal
#' @autoglobal
add_sleep_flags <- function(data, blocks, main_duration) {
  data.table::setDT(data)
  data.table::setDT(blocks)

  # point intervals for data
  data[, `:=`(start_interval = dtt, end_interval = dtt)]

  # keys for overlap join
  data.table::setkey(data, participant_id, start_interval, end_interval)
  data.table::setkey(blocks, participant_id, block_start, block_end)

  # overlap
  res <- data.table::foverlaps(data, blocks, nomatch = NA)

  # flags
  # res[, is_slp := !is.na(block_start)]
  res[, is_slp_original := is_slp]
  res[, is_slp := !is.na(block_start) | (is_slp_original & hr_exc_night)]
  res[, main_slp := data.table::fcoalesce(main_block & duration_min >= main_duration, FALSE)]

  # cleanup

  data.table::setcolorder(res, names(data))

  res[, c("start_interval", "end_interval", "is_slp_original") := NULL]

  res[]
}

#' Joins 30-second sleep epoch data with heart rate exclusion flags
#'
#' @description
#' Joins 30-second sleep epoch data with heart rate exclusion flags using a
#' minute-level timestamp alignment.
#'
#' This function aligns sleep epoch data with exclusion information by first
#' converting each sleep observation into a minute-level timestamp (`dtt_min`),
#' then performing an exact join to attach heart rate–based exclusion flags.
#'
#' Sleep data are recorded in fixed 30-second epochs, where each row represents
#' a discrete sleep observation. These epochs are aggregated to the minute level
#' to ensure compatibility with exclusion data that operate at minute
#' resolution.
#'
#' @param data_sleep tbl. Sleep epoch-level data containing at minimum:
#' `participant_id`, `dtt`, and `stage`.
#' @param data_exclusions tbl. Heart rate exclusion dataset containing
#' `participant_id` and minute-level timestamp (`dtt`).
#'
#' @return tbl. A data frame of sleep epochs with attached heart rate exclusion
#' information, matched at the minute level. The output includes all columns
#' from `data_exclusions` along with sleep stage information.
#'
#' @note
#' - `data_sleep`: fitbit_raw_sleep or fitbit_covid_raw_sleep
#' - `data_exclusions`: output of identify_hr_exclusions() or
#' identify_hr_recovery(); needs exclusion flags
#' - data input: 30-second sleep epoch data and heart rate exclusion data
#'
#' @keywords internal
#' @autoglobal
join_sleep30_and_exclusions <- function(data_sleep, data_exclusions) {
  chk::chk_data(data_sleep)
  chk::chk_data(data_exclusions)

  data_sleep <- data_sleep |>
    mutate(
      # is_slp = !is.na(stage),
      dtt_min = lubridate::floor_date(dtt, "minute")
    ) |>
    select(participant_id, dtt_min, stage)

  data.table::setDT(data_sleep)
  data.table::setDT(data_exclusions)

  # rename exclusions dtt to match
  # setnames(data_exclusions, "dtt", "dtt_min")
  result <- data_exclusions[
    data_sleep,
    on = .(participant_id, dtt = dtt_min),
    nomatch = 0
  ]

  return(result)
}

#' Flag Implausible Sleep Periods
#'
#' @description
#' Identifies days containing implausible sleep periods by detecting sequences
#' of heart rate issues that immediate follow sleep runs. A sleep period is
#' considered implausible when a sufficiently long run of HR-flagged "awake"
#' minutes immediate follows a sleep run that contained no HR issues, suggesting
#' the device may have been have been removed or malfunctioned during what was
#' recorded as sleep.
#'
#' @param dt tbl. Data frame with `participant_id`, `dtt`, `is_slp`, `hrate_no`,
#' and `hrate_repeat_actv` columns. This should be the output of
#' `identify_hr_exclusions()` or 'identify_hr_recovery()'.
#' @param min_minutes numeric, positive whole number. Minimum number of
#' consecutive HR-flagged "awake" minutes required to flag an implausible sleep
#' period.
#' @param epoch_seconds numeric, positive whole number. Duration of each epoch
#' in seconds.
#'
#' @return tbl. A dataframe that returns a row for each flagged implausible
#' sleep event:
#'  - `participant_id`: Participant identifier.
#'  - `dtt`: Timestamp of the start of the flagged HR issue run.
#'
#' @note
#' - input: output of identify_hr_exclusions; need exclusions flags
#'
#' @keywords internal
#' @autoglobal
flag_implausible_sleep <- function(
  dt,
  min_minutes = 30,
  epoch_seconds = 60
) {
  data.table::setDT(dt)

  # Remove if already sorted
  data.table::setorder(dt, participant_id, dtt)

  min_rows <- (min_minutes * 60) / epoch_seconds

  # Base state (sleep vs hr_issue_awake vs other)
  # ------------------------------------------------- #
  dt[, state :=
    data.table::fifelse(
      is_slp, 1L,
      data.table::fifelse(!is_slp & (hrate_no | hrate_repeat_actv), 2L, 0L)
    )]

  # Detect time gaps
  # ------------------------------------------------- #
  dt[, gap :=
    is.na(data.table::shift(dtt)) |
      (dtt - data.table::shift(dtt)) != epoch_seconds,
  by = participant_id
  ]

  # Run IDs (break on state OR gap)
  # ------------------------------------------------- #
  dt[, run_id := data.table::rleid(state, gap),
    by = participant_id
  ]

  # Run length
  # ------------------------------------------------- #
  dt[, run_length := .N,
    by = .(participant_id, run_id)
  ]

  # Run-level summaries
  # ------------------------------------------------- #

  # Is this run sleep?
  dt[, run_is_sleep := state[1L] == 1L,
    by = .(participant_id, run_id)
  ]

  # Does this run contain ANY HR issue?
  dt[, run_has_hr_issue :=
    any(hrate_no | hrate_repeat_actv),
  by = .(participant_id, run_id)
  ]

  # Previous run indicators
  dt[, prev_run_is_sleep := data.table::shift(run_is_sleep),
    by = participant_id
  ]

  dt[, prev_run_has_hr_issue := data.table::shift(run_has_hr_issue),
    by = participant_id
  ]

  # Flag FIRST ROW of qualifying HR runs
  # ------------------------------------------------- #
  dt[, implausible_sleep :=
    state == 2L & # current run is HR issue awake
      run_length >= min_rows & # >= required duration
      prev_run_is_sleep == TRUE & # previous run was sleep
      prev_run_has_hr_issue == FALSE & # sleep had NO HR issues
      run_id != data.table::shift(run_id, fill = data.table::first(run_id)),
  by = participant_id
  ]

  # Cleanup
  dt[, c(
    "state", "gap", "run_length",
    "run_is_sleep", "run_has_hr_issue",
    "prev_run_is_sleep", "prev_run_has_hr_issue"
  ) := NULL]

  # invisible(dt)

  implausible_days <- unique(
    dt[implausible_sleep == TRUE, .(participant_id, dtt)]
  )

  implausible_days
}

#' Compute sleep timing and WASO Metrics from Epoch-Level Data
#' @description
#' Computes sleep onset, sleep offset, and WASO (wake after sleep onset) metrics
#' from 30-second sleep epoch data.
#'
#' This function summarizes nightly sleep timing and wake fragmentation by
#' identifying transitions in sleep stages and calculating
#' wake-after-sleep-onset characteristics.
#'
#' @param sleep_offset tbl. Sleep epoch-level dataset containing at minimum:
#' `participant_id`, `session_id`, `sleep_date`, `dtt`, `stage`,
#' `hrate_excluded`, and `main_slp`.
#' @param bin_minutes numeric. Number of minutes to bin data by.
#'
#' @return tbl. A participant-night level summary containing:
#'  - `dtt_start_slp`: First detected sleep epoch (light/deep/rem/asleep).
#'  - `dtt_end_slp`: End of sleep period (last awake onset or end of bed).
#'  - `dtt_start_bed`: Start of recording interval for the sleep period.
#'  - `dtt_end_bed`: End of recording interval for the sleep period.
#'  - `n_waso`: Number of wake-after-sleep-onset (WASO) episodes.
#'  - `min_waso`: Total WASO duration (in minutes, 30-sec epoch units).
#'
#' @note input data should be output of `join_sleep30_and_exclusion()`. Input
#' data must be in 30-second epochs. `min_wake` includes minutes with stage of
#' "wake", "awake", "unknown", or NA  (for activity minutes that become sleep
#' under extended framework).
#' - data input: sleep epoch-level data with sleep stage and exclusion flags
#'
#' @details
#' Sleep stages labeled as `"awake"` or `"wake"` are treated as wake periods.
#' Missing stages are also recoded as `"awake"` to ensure consistency in
#' wake detection. Wake episodes at the beginning and end of the sleep window
#' are excluded from WASO calculations.
#'
#' @keywords internal
#' @autoglobal
compute_sleep_ranges_waso <- function(sleep_offset, bin_minutes) {
  chk::chk_data(sleep_offset)
  chk::chk_null_or(bin_minutes, vld = chk::vld_number)
  chk::chk_subset(
    c(
      "participant_id", "session_id", "sleep_date", "stage", "dtt",
      "hrate_excluded", "main_slp"
    ),
    names(sleep_offset)
  )

  if (!is.null(bin_minutes)) {
    result <- sleep_offset |>
      distinct(participant_id, session_id, sleep_date) |>
      mutate(
        dtt_start_slp       = NA_real_,
        dtt_end_slp         = NA_real_,
        dtt_start_bed       = NA_real_,
        dtt_end_bed         = NA_real_,
        n_waso              = NA_integer_,
        min_waso            = NA_real_
      )

    return(result)
  }

  result <- sleep_offset |>
    # filter((!hrate_excluded | recover_hr), main_slp) |>
    filter(!hrate_excluded & main_slp) |>
    group_by(participant_id, session_id, sleep_date) |>
    group_modify(~ {
      df <- .x

      # make wake and awake and NA stages all awake
      df <- df |>
        mutate(
          stage_clean = case_when(
            is.na(stage) ~ "awake",
            stage %in% c("awake", "wake") ~ "awake",
            TRUE ~ stage
          )
        )

      # Bed and sleep times
      vals <- df$dtt[df$stage_clean %in% c("light", "deep", "rem", "asleep")]

      first_sleep <- if (length(vals) == 0 || all(is.na(vals))) {
        as.POSIXct(NA)
      } else {
        min(vals, na.rm = TRUE)
      }

      start_bed <- min(df$dtt, na.rm = TRUE)
      end_bed <- max(df$dtt, na.rm = TRUE)

      # Identify wake runs
      awake_rle <- rle(df$stage_clean)
      awake_indices <- which(awake_rle$values %in% c("awake", "wake"))
      num_wake_runs <- length(awake_indices)

      # Exclude first/last wake runs
      if (length(awake_indices) > 0) {
        if (awake_rle$values[1] %in% c("awake", "wake")) {
          num_wake_runs <- num_wake_runs - 1
        }
        if (tail(awake_rle$values, 1) %in% c("awake", "wake")) {
          num_wake_runs <- num_wake_runs - 1
        }
      }
      num_wake_runs <- max(num_wake_runs, 0)

      # Last awake start time
      last_awake_start_time <- NA

      if (length(awake_indices) > 0 &&
        tail(awake_rle$values, 1) %in% c("awake", "wake")) {
        ends <- cumsum(awake_rle$lengths)
        starts <- ends - awake_rle$lengths + 1

        last_awake_rle_idx <- tail(awake_indices, 1)
        last_awake_start_time <- df$dtt[starts[last_awake_rle_idx]]
      }
      # Total awake minutes excluding first/last wake
      awake_lengths <- awake_rle$lengths[awake_indices]
      if (length(awake_indices) > 0 &&
        awake_rle$values[1] %in% c("awake", "wake")) {
        awake_lengths[1] <- 0
      }
      if (length(awake_indices) > 1 &&
        tail(awake_rle$values, 1) %in% c("awake", "wake")) {
        awake_lengths[length(awake_lengths)] <- 0
      }
      wake_minutes <- sum(awake_lengths) / 2 # 30s epochs → minutes

      tibble(
        dtt_start_slp = first_sleep,
        dtt_end_slp = if_else(
          is.na(last_awake_start_time),
          end_bed,
          last_awake_start_time
        ),
        dtt_start_bed = start_bed,
        dtt_end_bed = end_bed,
        n_waso = num_wake_runs,
        min_waso = wake_minutes # check this
      )
    }) |>
    ungroup()

  result
}

#' Compute total minutes excluded by heart rate criteria
#'
#' @description
#' Computes heart rate based exclusions by sleep offset or by specified time
#'  bins (e.g., 15-min, 30-min, 60-min).
#'
#' @param data tbl. Data frame heart rate columns `is_slp`, `session_id`,
#' `dtt`, `hrate_excluded`, `hrate_low`, `hrate_hi` (optional), `hrate_no`,
#' `hrate_repeat_actv`, and `hrate_repeat_slp` in 30-second resolution.
#' @param bin_minutes numeric, positive whole number. Number of minutes to bin
#'  data by. If NULL, defaults to sleep_date column created from `make_offset`
#'  function.
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `excl_min_total_slp`: Total number of sleep minutes excluded by heart rate
#'  criteria.
#'  - `excl_min_lowhrate_slp`: Total number of sleep minutes excluded by low
#'  heart rate criteria.
#'  - `excl_min_highhrate_slp`: Total number of sleep minutes excluded by
#'  high heart rate criteria (if `hrate_hi` exists). Column is not created if
#'  `hrate_hi` does not exist.
#'  - `excl_min_nohrate_slp`: Total number of sleep minutes excluded by
#'  missing heart rate criteria.
#'  - `excl_min_repeathrate_slp`: Total number of sleep minutes excluded by
#'  repeat heart rate criteria.
#'  - `min_extra_nohrate_slp`: Total number of minutes of plausible sleep
#'  minutes but excluded for missing heart rate.
#'  - `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
#'  stamp of bin.
#'  - `end`:  If non-daily bin selected (i.e., != 1440 minutes), end time
#'  stamp of the bin.
#'
#' @note input data should be output of `join_sleep30_and_exclusion()`. Input
#' data must be in 30-second epochs. `min_wake` includes minutes with stage of
#' "wake", "awake", "unknown", or NA  (for activity minutes that become sleep
#' under extended framework).
#' - data input: exclusion data in offset format
#'
#' @keywords internal
#' @autoglobal
compute_fitbit_sleep_hr_exclusions <- function(data, bin_minutes = NULL) {
  has_hi <- "hrate_hi" %in% names(data)
  has_low <- "hrate_low" %in% names(data)

  # ---- create period ---- #
  data$period <- if (is.null(bin_minutes)) {
    data$sleep_date
  } else {
    as.POSIXct(
      floor(as.numeric(data$dtt) / (bin_minutes * 60)) *
        (bin_minutes * 60),
      origin = "1970-01-01",
      tz = attr(data$dtt, "tzone")
    )
  }

  # ---- summarize ---- #
  result <- data |>
    filter(is_slp) |>
    summarize(
      excl_min_total_slp = sum(hrate_excluded, na.rm = TRUE) / 2,
      excl_min_nohrate_slp = sum(hrate_no, na.rm = TRUE) / 2,
      excl_min_repeathrate_slp = sum(hrate_repeat_slp, na.rm = TRUE) / 2,
      min_extra_nohrate_slp = sum(recover_hr, na.rm = TRUE) / 2,
      excl_min_lowhrate_slp =
        if (has_low) sum(hrate_low, na.rm = TRUE) / 2 else NA_real_,
      excl_min_highhrate_slp =
        if (has_hi) sum(hrate_hi, na.rm = TRUE) / 2 else NA_real_,
      .by = c("participant_id", "session_id", "period")
    )

  drop_cols <- c()

  if (!has_low) drop_cols <- c(drop_cols, "excl_min_lowhrate_slp")
  if (!has_hi) drop_cols <- c(drop_cols, "excl_min_highhrate_slp")


  result <- result |>
    dplyr::select(-dplyr::any_of(drop_cols))

  # ---- final formatting ---- #

  result <- result |>
    rename(sleep_date = period)

  if (!is.null(bin_minutes)) {
    result <- result |>
      mutate(
        start = sleep_date,
        end   = sleep_date + bin_minutes * 60
      )
  }

  result
}

# this is used for sleep table
#' Compute total minutes by sleep stage
#' @description
#' Computes valid minutes spent in each sleep stage by offset date or by
#' specified time bins (e.g., 15-min, 30-min), not excluded by heart rate
#'  criteria.
#'
#' @param data tbl. Dataframe for sleep data processed for exclusions, requires
#'  columns `is_slp`, `session_id`, `sleep_date` or `dtt`, `hrate_excluded`, and
#' `stage`.
#' @param bin_minutes numeric, positive whole number. Optional number of minutes
#'  to bin data by. If NULL, defaults to sleep_date column created from
#' `make_offset` function.
#'
#' @return tbl. The input data frame with the following additional columns:
#'  - `min_total_slp`: Total number of main sleep minutes
#'  - `min_asleep_slp`: Total number of main sleep minutes in asleep stage.
#'  - `min_restless_slp`: Total number of main sleep minutes in restless stage.
#'  - `min_light_slp`: Total number of main sleep minutes in light stage.
#'  - `min_deep_slp`: Total number of main sleep minutes in deep stage.
#'  - `min_rem_slp`: Total number of main sleep minutes in REM stage.
#'  - `min_nap_slp`: Total number of non-main sleep minutes.
#'  - `min_wake`: Total number of main sleep minutes spent in wake stage.
#'  - `start`: Start timestamp of the bin.
#'  - `end`: End timestamp of the bin.
#'
#' `start` and `end` are only present when `bin_minutes` is non-`NULL` and
#' not equal to `1440`.
#' @note input data should be output of `join_sleep30_and_exclusion()`. Input
#' data must be in 30-second epochs. `min_wake` includes minutes with stage of
#' "wake", "awake", "unknown", or NA  (for activity minutes that become sleep
#' under extended framework).
#'
#' @keywords internal
#' @autoglobal
compute_sleep_stage_min <- function(
  data,
  bin_minutes = NULL
) {
  data$period <- if (is.null(bin_minutes)) {
    data$sleep_date
  } else {
    as.POSIXct(
      floor(as.numeric(data$dtt) / (bin_minutes * 60)) *
        (bin_minutes * 60),
      origin = "1970-01-01",
      tz = attr(data$dtt, "tzone")
    )
  }

  result <- data |>
    filter(!hrate_excluded, is_slp) |>
    summarize(
      min_total_slp = sum(main_slp, na.rm = TRUE) / 2,
      min_asleep_slp = sum(main_slp & stage == "asleep", na.rm = TRUE) / 2,
      min_restless_slp = sum(main_slp & stage == "restless", na.rm = TRUE) / 2,
      min_light_slp = sum(main_slp & stage == "light", na.rm = TRUE) / 2,
      min_deep_slp = sum(main_slp & stage == "deep", na.rm = TRUE) / 2,
      min_rem_slp = sum(main_slp & stage == "rem", na.rm = TRUE) / 2,
      min_nap_slp = sum(!main_slp, na.rm = TRUE) / 2,
      # is.na(stage) for activity minutes that become sleep under extended
      min_wake = sum(
        main_slp & (stage %in% c("wake", "awake", "unknown") | is.na(stage)),
        na.rm = TRUE
      ) / 2,
      .by = c("participant_id", "session_id", "period")
    ) |>
    rename(sleep_date = period)

  if (!is.null(bin_minutes)) {
    result <- result |>
      mutate(
        start = sleep_date,
        end   = sleep_date + bin_minutes * 60
      )
  }
  result
}

# input: offset sleep data with exclusion flags
#' Compute daily average heart rate
#' @description
#' Calculates mean heart rate within each sleep stage, either by sleep date or
#' aggregated into fixed-width time bins (e.g., 15, 30, or 60 minutes). Epochs
#' flagged by heart rate criteria are included.
#' @param data tbl. Data frame heart rate columns `is_slp`, `session_id`,
#'  `sleep_date` or `dtt`, `hrate`, `hrate_excluded`, `stage`.
#' @param bin_minutes numeric, positive whole number. Optional number of minutes
#'  to bin data by. If NULL, defaults to sleep_date column created from
#' `make_offset` function.
#
#' @return tbl. The input data frame with the following additional columns:
#'  - `hrate_awake_slp`: Mean heart rate during wake stage, includes awake and
#'  NULL stage minutes from extended framework.
#'  - `hrate_restless_slp`: Mean heart rate during 'restless' stage
#'  - `hrate_asleep_slp`: Mean heart rate during 'asleep' stage
#'  - `hrate_light_slp`: Mean heart rate during 'light' stage
#'  - `hrate_deep_slp`: Mean heart rate during 'deep' stage.
#'  - `hrate_rem_slp`: Mean heart rate during 'rem' stage.
#'  - `start`: Start timestamp of the bin.
#'  - `end`: End timestamp of the bin.
#'
#' `start` and `end` are only present when `bin_minutes` is non-`NULL` and
#' not equal to `1440`.
#'
#' @note input data should be output of `join_sleep30_and_exclusion()`. Input
#' data must be in 30-second epochs. `min_wake` includes minutes with stage of
#' "wake", "awake", "unknown", or NA  (for activity minutes that become sleep
#' under extended framework). All `hrate_` columns are rounded to one decimal
#' place.
#'
#' @keywords internal
#' @autoglobal
compute_sleep_stage_hr <- function(
  data,
  bin_minutes = NULL
) {
  data$period <- if (is.null(bin_minutes)) {
    data$sleep_date
  } else {
    as.POSIXct(
      floor(as.numeric(data$dtt) / (bin_minutes * 60)) *
        (bin_minutes * 60),
      origin = "1970-01-01",
      tz = attr(data$dtt, "tzone")
    )
  }

  result <- data |>
    filter(!hrate_excluded, is_slp) |>
    summarize(
      hrate_awake_slp = mean(
        hrate[main_slp &
          (stage %in% c("wake", "awake", "unknown") | is.na(stage))],
        na.rm = TRUE
      ),
      hrate_restless_slp = mean(
        hrate[main_slp & stage == "restless"],
        na.rm = TRUE
      ),
      hrate_asleep_slp = mean(
        hrate[main_slp & stage == "asleep"],
        na.rm = TRUE
      ),
      hrate_light_slp = mean(
        hrate[main_slp & stage == "light"],
        na.rm = TRUE
      ),
      hrate_deep_slp = mean(
        hrate[main_slp & stage == "deep"],
        na.rm = TRUE
      ),
      hrate_rem_slp = mean(
        hrate[main_slp & stage == "rem"],
        na.rm = TRUE
      ),
      hrate_nap_slp = mean(
        hrate[!main_slp],
        na.rm = TRUE
      ),
      .by = c("participant_id", "session_id", "period")
    ) |>
    rename(sleep_date = period) |>
    mutate(across(starts_with("hrate"), ~ round(.x, 1)))

  if (!is.null(bin_minutes)) {
    result <- result |>
      mutate(
        start = sleep_date,
        end   = sleep_date + bin_minutes * 60
      )
  }

  result
}

# input: output of create_block_ranges()
# data input: sleep block-level data with block indicators
#' Compute count of valid main sleep episodes per participant-day
#' @description
#' This function evaluates sleep blocks and identifies whether each sleep day
#' contains a single valid main sleep episode based on a minimum duration
#' threshold.
#'
#' @param data tbl. Sleep block-level dataset containing at minimum:
#' `participant_id`, `sleep_date`, `main_block`, and `duration_min`.
#'
#' @param main_dur numeric. Minimum block duration (in minutes) required for a
#' sleep block to be considered a main sleep period.
#'
#' @return tbl. A summarized data frame at the participant-day level with:
#'  - `n`: Number of main sleep blocks meeting the minimum duration threshold.
#'  - `single_block`: Logical indicator of whether exactly one valid main sleep
#' episode is present.
#'
#' @details
#' The function is used to assess sleep fragmentation at the block level by
#' counting how many blocks satisfy both the `main_block` flag and the
#' minimum duration requirement. This is commonly used in extended sleep
#' pipelines to distinguish consolidated sleep from fragmented sleep patterns.
#'
#' @keywords internal
#' @autoglobal
compute_block_counts <- function(data, main_dur) {
  chk::chk_data(data)
  chk::chk_number(main_dur)
  chk::chk_gte(main_dur, 0)
  chk::chk_subset(
    c("participant_id", "sleep_date", "main_block", "duration_min"),
    names(data)
  )
  data |>
    group_by(participant_id, sleep_date) |>
    summarize(
      n = sum(main_block & duration_min >= main_dur, na.rm = TRUE),
      single_block = n == 1,
      .groups = "drop"
    )
}


# data_blocks: output of add_sleep_flags()
# data_counts: output of compute_block_counts()
# data input: block-level sleep data and block count summaries

#' Computes sleep timing and WASO metrics
#'
#' @description
#' Computes sleep timing and WASO metrics at the sleep-block level,
#' incorporating block structure constraints to ensure sleep ranges are only
#' calculated when a single valid main sleep block is present.
#'
#' This function extends `compute_sleep_ranges_waso()` by restricting sleep
#' range calculations to nights with exactly one valid sleep block, improving
#' robustness in fragmented sleep recordings.
#'
#' @param data_blocks tbl. Output from `add_sleep_flags()`, containing sleep
#' epoch data with block assignments and sleep stage information.
#'
#' @param data_counts tbl. Output from `compute_block_counts()`, containing
#' the number of valid main sleep blocks per participant-night.
#'
#' @param bin_minutes numeric. Number of minutes to bin data by.
#'
#' @return tbl. A participant-night level summary containing:
#'  - `dtt_start_slp`: Sleep onset time (if a single valid block exists).
#'  - `dtt_end_slp`: Sleep offset time (based on last wake transition or block end).
#'  - `dtt_start_bed`: Start of sleep recording interval.
#'  - `dtt_end_bed`: End of sleep recording interval.
#'  - `n_waso`: Number of wake-after-sleep-onset episodes (adjusted for block structure).
#'  - `min_waso`: Total wake-after-sleep-onset duration in minutes (30-sec epochs).
#'
#' @details
#' Sleep metrics are only computed when exactly one valid main sleep block is
#' present for a given participant-night. If multiple blocks exist, sleep timing
#' variables are set to `NA` to avoid ambiguity.
#'
#' Wake episodes are identified using run-length encoding of cleaned sleep
#' stages, where `"awake"` and `"wake"` are treated as wake states and missing
#' values are recoded as `"awake"`.
#'
#' @keywords internal
compute_sleep_ranges_waso_ext <- function(
  data_blocks,
  data_counts,
  bin_minutes
) {
  if (!is.null(bin_minutes)) {
    result <- data_blocks |>
      distinct(participant_id, session_id, sleep_date) |>
      mutate(
        dtt_start_slp       = NA_real_,
        dtt_end_slp         = NA_real_,
        dtt_start_bed       = NA_real_,
        dtt_end_bed         = NA_real_,
        n_waso              = NA_integer_,
        min_waso            = NA_real_
      )
    return(result)
  }

  chk::chk_data(data_blocks)
  chk::chk_data(data_counts)
  chk::chk_null_or(bin_minutes, vld = chk::vld_number)
  chk::chk_subset(
    c("participant_id", "session_id", "sleep_date", "stage", "dtt"),
    names(data_blocks)
  )
  chk::chk_subset(
    c("participant_id", "sleep_date", "n"),
    names(data_counts)
  )

  sleep_blocked_counts <- data_blocks |>
    left_join(data_counts, by = c("participant_id", "sleep_date"))

  result <- sleep_blocked_counts |>
    group_by(participant_id, session_id, sleep_date) |>
    group_modify(~ {
      df <- .x
      n_blocks <- first(df$n)

      # ---- normalize stage ---- #
      df <- df |>
        mutate(
          stage_clean = case_when(
            is.na(stage) ~ "awake",
            stage %in% c("awake", "wake") ~ "awake",
            TRUE ~ stage
          )
        )

      # ---- Identify wake runs ---- #
      awake_rle <- rle(df$stage_clean)
      awake_idx <- which(awake_rle$values %in% c("awake", "wake"))

      # ---- WASO count ---- #
      n_waso <- length(awake_idx)

      if (length(awake_idx) > 0) {
        if (awake_rle$values[1] %in% c("awake", "wake")) {
          n_waso <- n_waso - 1
        }
        if (tail(awake_rle$values, 1) %in% c("awake", "wake")) {
          n_waso <- n_waso - 1
        }
      }
      n_waso <- max(n_waso, 0)

      # ---- WASO duration ---- #
      awake_lengths <- awake_rle$lengths[awake_idx]

      if (length(awake_idx) > 0 &&
        awake_rle$values[1] %in% c("awake", "wake")) {
        awake_lengths[1] <- 0
      }
      if (length(awake_idx) > 1 &&
        tail(awake_rle$values, 1) %in% c("awake", "wake")) {
        awake_lengths[length(awake_lengths)] <- 0
      }

      min_waso_onset <- sum(awake_lengths) / 2 # 30s epochs → minutes

      # --------------------------- #
      # Sleep range ONLY if n == 1
      # --------------------------- #

      if (!is.na(n_blocks) && n_blocks == 1) {
        # ---- SAFE first sleep ---- #
        vals <- df$dtt[df$stage_clean %in% c("light", "deep", "rem", "asleep")]

        first_sleep <- if (length(vals) == 0 || all(is.na(vals))) {
          as.POSIXct(NA)
        } else {
          min(vals, na.rm = TRUE)
        }

        start_bed <- min(df$dtt, na.rm = TRUE)
        end_bed <- max(df$dtt, na.rm = TRUE)

        # ---- Correct last awake start ---- #
        last_awake_start <- NA

        if (length(awake_idx) > 0 &&
          tail(awake_rle$values, 1) %in% c("awake", "wake")) {
          ends <- cumsum(awake_rle$lengths)
          starts <- ends - awake_rle$lengths + 1
          last_awake_rle_idx <- tail(awake_idx, 1)
          last_awake_start <- df$dtt[starts[last_awake_rle_idx]]
        }

        dtt_end_slp <- if_else(
          is.na(last_awake_start),
          end_bed,
          last_awake_start
        )
      } else {
        first_sleep <- as.POSIXct(NA)
        dtt_end_slp <- as.POSIXct(NA)
        start_bed <- as.POSIXct(NA)
        end_bed <- as.POSIXct(NA)
      }

      tibble(
        dtt_start_slp = first_sleep,
        dtt_end_slp   = dtt_end_slp,
        dtt_start_bed = start_bed,
        dtt_end_bed   = end_bed,
        n_waso        = n_waso,
        min_waso      = min_waso_onset
      )
    }) |>
    ungroup()
  result
}


## WEEEKLY FUNCTIONS

#' Computes the number of valid observation days
#'
#' @description
#' This helper function summarizes the number of available days contributing to
#' weekly sleep or activity estimates, with separation into weekday and weekend
#' counts.
#'
#' @param df tbl. Data frame containing at minimum:
#' `participant_id`, `session_id`, `wk`, and `dt_wknd` (logical indicator of
#' weekend).
#'
#' @return tbl. A weekly summary dataset with:
#'  - `n_day`: Total number of valid days in the week.
#'  - `n_wkdy`: Number of weekday observations.
#'  - `n_wknd`: Number of weekend observations.
#'
#' @keywords internal
compute_day_counts <- function(df) {
  chk::chk_data(df)
  df |>
    group_by(participant_id, session_id, wk) |>
    summarize(
      n_day = n(),
      n_wkdy = sum(!dt_wknd, na.rm = TRUE),
      n_wknd = sum(dt_wknd, na.rm = TRUE),
      .groups = "drop"
    )
}

#' Summarize weekly activity scores
#' @description
#' Computes weekly summary activity metrics at the participant-session-week
#' level.
#'
#' Aggregates daily-level activity measures into weekly summaries, including
#' step counts, active minutes, intensity distributions, MET values, and
#' resting heart rate.
#'
#' @param data tbl. A daily-level activity dataset containing activity summary
#' scores.
#'
#' @return tbl. A weekly aggregated dataset with the following summaries:
#'
#' @keywords internal
#' @autoglobal
summarize_activity <- function(data) {
  chk::chk_data(data)
  data |>
    # filter(qc_600min, qc_steps) |>
    group_by(participant_id, session_id, wk) |>
    summarize(
      mean_min_actv = mean(min_actv, na.rm = TRUE),
      mean_min_slp = mean(min_slp, na.rm = TRUE),
      sum_steps_actv = sum(steps_actv, na.rm = TRUE),
      mean_steps_actv = mean(steps_actv, na.rm = TRUE),
      mean_steps_fitb = mean(steps_fitb, na.rm = TRUE),
      mean_mets_actv = mean(mets_actv, na.rm = TRUE),
      mean_min_intnst_sed_actv = mean(min_intnst_sed_actv, na.rm = TRUE),
      mean_min_intnst_light_actv = mean(min_intnst_light_actv, na.rm = TRUE),
      mean_min_intnst_mod_actv = mean(min_intnst_mod_actv, na.rm = TRUE),
      mean_min_intnst_vigor_actv = mean(min_intnst_vigor_actv, na.rm = TRUE),
      sum_min_intnst_sed_actv = sum(min_intnst_sed_actv, na.rm = TRUE),
      sum_min_intnst_light_actv = sum(min_intnst_light_actv, na.rm = TRUE),
      sum_min_intnst_mod_actv = sum(min_intnst_mod_actv, na.rm = TRUE),
      sum_min_intnst_vigor_actv = sum(min_intnst_vigor_actv, na.rm = TRUE),
      mean_rest_hrate_fitb = mean(hrate_rest_fitb, na.rm = TRUE),
      .groups = "drop"
    ) |>
    mutate(
      across(contains("mean_min"), ~ round(.x, 1)),
      across(contains("hrate"), ~ round(.x, 1)),
      across(
        c(
          session_id,
          wk_type
        ),
        as.factor
      ),
      across(
        c(
          wk,
          sum_steps_actv
        ),
        as.integer
      )
    ) |>
    arrange(
      participant_id,
      session_id,
      wk
    )
}

#' Computes weekly summary sleep metrics
#'
#' @description
#' Computes weekly summary sleep metrics at the participant-session-week level.
#'
#' Aggregates daily-level sleep measures into weekly summaries, including
#' totals, means, circular time averages, and heart rate metrics.
#'
#' @param data tbl. Sleep dataset containing at daily-level sleep summary
#' scores.
#'
#' @return tbl. A weekly aggregated dataset with the following summaries:
#'
#' Time-based summaries:
#' - `mean_t_start_bed`: Circular mean bed start time.
#' - `mean_t_end_bed`: Circular mean bed end time.
#' - `mean_t_start_slp`: Circular mean sleep onset time.
#' - `mean_t_end_slp`: Circular mean sleep end time.
#'
#' Total sleep metrics:
#' - `sum_min_total_slp`, `sum_min_asleep_slp`, `sum_min_restless_slp`,
#'   `sum_min_light_slp`, `sum_min_deep_slp`, `sum_min_rem_slp`,
#'   `sum_min_nap_slp`, `sum_min_wake_slp`, `sum_min_waso`
#'
#' Mean sleep metrics:
#' - `mean_min_slp_total`, `mean_min_asleep_slp`, `mean_min_restless`,
#'   `mean_min_slp_light`, `mean_min_slp_deep`, `mean_min_slp_rem`,
#'   `mean_min_wake`, `mean_min_waso`
#'
#' Heart rate–weighted metrics:
#' - `hrate_awake_slp`: Mean HR during awake periods (weighted by minutes awake)
#' - `hrate_restless_slp`: Mean HR during restless sleep
#' - `hrate_asleep_slp`: Mean HR during asleep periods
#' - `hrate_light_slp`: Mean HR during light sleep
#' - `hrate_deep_slp`: Mean HR during deep sleep
#' - `hrate_rem_slp`: Mean HR during REM sleep
#'
#' Wake fragmentation:
#' - `sum_n_waso`: Total number of wake-after-sleep-onset events
#' - `mean_n_waso`: Mean number of WASO events per day
#'
#' @details
#' Heart rate–weighted metrics are computed using duration-weighted averages,
#' ensuring that longer stage durations contribute proportionally more to the
#' final estimate. All mean-based outputs are rounded to one decimal place.
#'
#' Circular time variables are computed using circular statistics to correctly
#' handle times near midnight.
#'
#' @keywords internal
summarize_sleep <- function(data) {
  chk::chk_data(data)
  data |>
    # filter(qc_300min) |>
    group_by(participant_id, session_id, wk) |>
    summarize(
      # circular times
      mean_t_start_bed = circular_mean_time(dtt_start_bed),
      mean_t_end_bed = circular_mean_time(dtt_end_bed),
      mean_t_start_slp = circular_mean_time(dtt_start_slp),
      mean_t_end_slp = circular_mean_time(dtt_end_slp),

      # totals
      sum_min_total_slp = sum(min_total_slp, na.rm = TRUE),
      sum_min_asleep_slp = sum(min_asleep_slp, na.rm = TRUE),
      sum_min_restless_slp = sum(min_restless_slp, na.rm = TRUE),
      sum_min_light_slp = sum(min_light_slp, na.rm = TRUE),
      sum_min_deep_slp = sum(min_deep_slp, na.rm = TRUE),
      sum_min_rem_slp = sum(min_rem_slp, na.rm = TRUE),
      sum_min_nap_slp = sum(min_nap_slp, na.rm = TRUE),
      sum_min_wake_slp = sum(min_wake, na.rm = TRUE),
      sum_min_waso = sum(min_waso, na.rm = TRUE),

      # means
      mean_min_slp_total = mean(min_total_slp, na.rm = TRUE),
      mean_min_asleep_slp = mean(min_asleep_slp, na.rm = TRUE),
      mean_min_restless = mean(min_restless_slp, na.rm = TRUE),
      mean_min_slp_light = mean(min_light_slp, na.rm = TRUE),
      mean_min_slp_deep = mean(min_deep_slp, na.rm = TRUE),
      mean_min_slp_rem = mean(min_rem_slp, na.rm = TRUE),
      mean_min_wake = mean(min_wake, na.rm = TRUE),
      mean_min_waso = mean(min_waso, na.rm = TRUE),

      # heart rate
      mean_hrate_awake_slp =
        sum(hrate_awake_slp * min_wake, na.rm = TRUE) /
          sum(min_wake, na.rm = TRUE),
      mean_hrate_restless_slp =
        sum(hrate_restless_slp * min_restless_slp, na.rm = TRUE) /
          sum(min_restless_slp, na.rm = TRUE),
      mean_hrate_asleep_slp =
        sum(hrate_asleep_slp * min_asleep_slp, na.rm = TRUE) /
          sum(min_asleep_slp, na.rm = TRUE),

      # hrate_light_slp     = mean(hrate_light_slp, na.rm = TRUE),
      mean_hrate_light_slp =
        sum(hrate_light_slp * min_light_slp, na.rm = TRUE) /
          sum(min_light_slp, na.rm = TRUE),

      # hrate_deep_slp      = mean(hrate_deep_slp, na.rm = TRUE),
      mean_hrate_deep_slp =
        sum(hrate_deep_slp * min_deep_slp, na.rm = TRUE) /
          sum(min_deep_slp, na.rm = TRUE),

      # hrate_rem_slp       = mean(hrate_rem_slp, na.rm = TRUE),
      mean_hrate_rem_slp =
        sum(hrate_rem_slp * min_rem_slp, na.rm = TRUE) /
          sum(min_rem_slp, na.rm = TRUE),

      # WASO counts
      sum_n_waso = sum(n_waso, na.rm = TRUE),
      mean_n_waso = mean(n_waso, na.rm = TRUE),
      .groups = "drop"
    ) |>
    mutate(
      across(contains("mean_min"), ~ round(.x, 1)),
      across(contains("hrate"), ~ round(.x, 1)),
      across(
        c(
          session_id,
          wk_type
        ),
        as.factor
      ),
      across(
        c(
          wk,
          sum_n_waso
        ),
        as.integer
      )
    ) |>
    arrange(
      participant_id,
      session_id,
      wk
    )
}

#' Computes the circular mean of time-of-day values.
#'
#' @description
#' This function calculates an average time while accounting for the circular
#' nature of clock time. It converts times to angles on the unit circle,
#' computes the mean direction, and converts the result back to HH:MM format.
#'
#' @param time_vec vector. A vector of time values (typically `POSIXct` or
#' `hms`) representing times of day.
#'
#' @return character. A single time value in `"HH:MM"` format representing the
#' circular mean of the input times. Returns `NA` if all inputs are missing.
#'
#' @keywords internal
circular_mean_time <- function(time_vec) {
  # Convert to seconds
  secs <- as.numeric(hms::as_hms(time_vec))

  # Handle all-NA or empty input
  if (all(is.na(secs))) {
    return(NA_character_)
  }

  # Convert to radians
  rad <- 2 * pi * secs / (24 * 60 * 60)

  # Mean sin and cos
  s <- mean(sin(rad), na.rm = TRUE)
  c <- mean(cos(rad), na.rm = TRUE)

  # Mean angle
  ang <- atan2(s, c)
  if (ang < 0) ang <- ang + 2 * pi

  # Back to seconds (rounded)
  mean_sec <- round(ang * 24 * 60 * 60 / (2 * pi))

  # Return formatted time
  format(hms::as_hms(mean_sec %% (24 * 60 * 60)), "%H:%M")
}
