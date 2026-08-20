# Static and Dynamic Substance Use (SDSU) summary scores

## Introduction

The ABCD Study Substance Use Battery collects self-reported information
on substance use across a variety of measures (i.e., Substance Use
Interview, Timeline Follow-back, and Mid-year Phone Interview).

**The calculation of these SDSU summary variables is an effort to
consolidate data across measures and resolve inconsistencies in
reporting.** These summary scores were created to be directly utilized
in summarizing substance use rates of the cohort and for statistical
analysis of the ABCD data.

Scores were created in line with prior reports of substance use in the
ABCD cohort. However, unlike previously released code, this code can be
continually used in 7.0 and all future data releases. The instructions
below detail how to create lifetime substance use (yes/no) values for
the assessed session, substance use onset event, and substance use onset
age.

``` r

suppressPackageStartupMessages({
  library(dplyr)
})
library(ABCDscores)
#> Welcome to the `ABCDscores` package! For more information, visit: https://software.nbdc-datahub.org/ABCDscores/
#> This package is developed by the ABCD Data Analysis, Informatics & Resource Center (DAIRC) at the J. Craig Venter Institute (JCVI).
#> If `ABCDscores` is helpful to your research, please cite:
#> Zhang, L., Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C. J., Abad, S., Dale, A. M., & Linkersdörfer, J. (2026). ABCDscores: an R package for computing summary scores in the ABCD Study®. Frontiers in Neuroinformatics, 20, 1858950. https://doi.org/10.3389/fninf.2026.1858950
```

## Data

### Raw data

The required raw data is available to authorized users of the [NBDC Data
Hub](https://nbdc-datahub.org). You can create the dataset on which to
compute the scores either manually on DEAP or with `NBDCtools`.

### Manually in DEAP

If using DEAP to create your dataset, include all variables from all
timepoints from the following ontology path:
`ABCD -> Core -> Substance Use -> SU Patterns -> Youth`

- `Low Level Use Questionnaire [Youth]`
- `Substance Use Interview [Youth]`
- `Substance Use Phone Interview (Mid Year) - Introduction [Youth]`
- `Substance Use Phone Interview (Mid Year) [Youth]`
- `Timeline Followback Interview Results [Youth]`

Additionally, include all DAIRC “recommended” variables prompted at the
end of dataset creation in the following tabs: “Design/Nesting”, “Visit
Information”, “Cohort Description”.

Export in the format of your choice (e.g. parquet) before reading it in
R.

### With `NBDCtools`

``` r

dir_data <- "~/Downloads/data/DEAP-S3-0_0-2026-02-12/data" # edit to match the local folder that contains DEAP data

deap_data <- NBDCtools::create_dataset(
  dir_data = dir_data,
  study = "abcd",
  vars = c(
    "ab_g_dyn__visit_dtt",
    "ab_g_dyn__visit_age"
  ),
  tables = c(
    "su_y_lowuse",
    "su_y_sui",
    "su_y_mypi",
    "su_y_mysu",
    "su_y_tlfb"
  )
)
```

### Pre-processing requirement

To compute the summary scores, the data needs to be prepared with the
function `prepare_data_sdsu`:

``` r

data_sdsu <- deap_data |>
  prepare_data_sdsu()
```

## SDSU summary score functions

While summary scores for other domains typically define one function per
summary score, SDSU summary scores are computed using a set of basic
functions with user-defined parameters. This allows for a more flexible
and modular approach to computing the SDSU summary scores. This section
describes the basic functions and how to use them.

The basic functions are:

- [`compute_ss_use_yn()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ss_use_yn.md):
  Compute substance use for a participant at each session (Y/N).
- [`compute_ss_use_onset_event()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ss_use_onset_event.md):
  Compute substance use onset event.
- [`compute_ss_use_onset_age()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ss_use_onset_age.md):
  Compute substance use onset age in years.

The functions take the following parameters:

- `name`: Name of the score.
- `substance`: One or more substances to compute the score for.
- `algo`: Strategy used for dealing with mid-year sessions.
- `cumulative` (`compute_ss_use_yn` only): If `FALSE` (default), returns
  use at each session independently. If `TRUE`, returns 1 from the first
  session where use was observed onward (ever-used up to and including
  that session).

### Substances

The following substances can be selected:

- *“Alcohol (Sipping)”*
- *“Nicotine (Puffing)”*
- *“Marijuana (Puffing)”*
- *“Alcohol”*
- *“Nicotine”*
- *“Marijuana”*
- *“Cocaine or Crack Cocaine”*
- *“Methamphetamine, Meth, or Crystal Meth”*
- *“Ketamine or Special K”*
- *“Heroin, Opium, Junk, Smack, or Dope”*
- *“Cathinones such as Bath Salts, Drone, or Meph”*
- *“Ecstasy, Molly, or MDMA”*
- *“GHB, Liquid G, or Georgia Homeboy”*
- *“Hallucinogen Drugs including LSD, PCP, Peyote, Mescaline, DMT, AMT,
  or Foxy”*
- *“Psilocybin, Magic Mushrooms, or Shrooms”*
- *“Anabolic Steroids”*
- *“Inhalants”*
- *“Prescription Anxiolytics, Tranquilizers, or Sedatives”*
- *“OTC Cough or Cold Medicine, DXM, ‘Lean’, or ‘Purple Drank’”*
- *“Salvia”*
- *“Prescription Stimulants”*
- *“Prescription Opioids”*
- *“‘Fake’ Marijuana or Synthetics”*
- *“Other substances”*
- *“Nicotine Vaping Products”*
- *“Tobacco Cigarette”*
- *“Cigars, Little Cigars, or Cigarillos”*
- *“Tobacco in a Pipe”*
- *“Hookah with Tobacco”*
- *“Nicotine Replacements”*
- *“Smokeless Tobacco, Chew, or Snus”*
- *“Flavored Vaping Products”*
- *“Smoking Marijuana Flower”*
- *“Marijuana Edibles”*
- *“Marijuana Infused Alcohol Drinks”*
- *“Marijuana Concentrates”*
- *“Concentrated Marijuana Tinctures”*
- *“Blunts or Combined Tobacco and Marijuana in Joints”*
- *“Vaped Marijuana Flower”*
- *“Vaped Marijuana Oils or Concentrates”*
- *“CBD (Non-Medical Use)”*
- *“Alcohol (Including low-level use)”*
- *“Nicotine (Including low-level use)”*
- *“Marijuana (Including low-level use)”*
- *“Substance use (Not including alcohol, nicotine, and cannabis)”*
- *“Substance use”*
- *“Substance use (Including low-level use)”*

### Strategy for dealing with mid-year sessions

The ABCD Study collects data at both annual (full-year) and mid-year
timepoints. When computing substance use summary scores, you need to
decide how to handle mid-year data. The `algo` parameter in SDSU
functions provides five strategies:

#### Available Strategies

1.  **`NULL`**: No mapping - keeps all sessions as-is
2.  **`"next_existing_fy"`**: Maps mid-year to the next *existing*
    annual session (drops terminal mid-years)
3.  **`"next_potential_fy"`**: Maps mid-year to the next existing
    annual, or forecasts one if none exists
4.  **`"next_immediate_fy"`**: Maps mid-year to the immediately
    following annual (e.g., ses-01M → ses-02A), regardless of whether it
    exists
5.  **`"remove_my"`**: Removes all mid-year sessions, keeping only
    annual sessions

> **Default Algorithm**: The following examples use default `algo`
> values: `algo = "next_existing_fy"` for `compute_ss_use_yn` and
> `algo = NULL` for `compute_ss_use_onset_event` and
> `compute_ss_use_onset_age`. To use a different strategy, add the
> `algo` parameter to each function call.

#### Choosing a Strategy

Use `NULL` when:

- You want to preserve the original session structure
- Performing session-level analyses

Use `"next_existing_fy"` when:

- You want conservative estimates using only confirmed annual visits
- Terminal mid-years should be excluded from analysis

Use `"next_potential_fy"` when:

- You want to retain terminal mid-years by forecasting the next annual
  session
- It is acceptable to include data that may be updated in future
  releases

Use `"next_immediate_fy"` when:

- You want consistent mapping regardless of data availability
- Useful for imputation or forecasting scenarios

Use “remove_my” when:

- You only want annual assessment data
- Mid-year data should be completely excluded

### Cumulative vs. session-level use (`cumulative`)

The `cumulative` parameter applies only to `compute_ss_use_yn` and
controls whether use is assessed at each session independently or
accumulated over time:

- **`cumulative = FALSE` (default)**: Returns 1 if use was reported at
  that session, 0 otherwise. This is a session-level snapshot, suitable
  for static summaries.
- **`cumulative = TRUE`**: Returns 1 from the first session where use
  was observed onward, regardless of later sessions. This “ever used up
  to this point” view is suited for longitudinal or dynamic analyses.

`cumulative` does not apply to `compute_ss_use_onset_event` or
`compute_ss_use_onset_age`, which are inherently lifetime/onset
measures.

### Lifetime Use (Y/N)

Substance-by-substance analysis:

``` r

output <- purrr::map2(
  sdsu_config |>
    pull(name_score_use_yn),
  sdsu_config |>
    pull(substance),
  \(x, y) compute_ss_use_yn(data_sdsu, x, y, cumulative = TRUE)
) |>
  purrr::reduce(full_join, by = c("participant_id", "session_id"))

output |>
  tidyr::pivot_longer(
    -c(participant_id, session_id),
    names_to = "variable",
    values_to = "value"
  ) |>
  summarise(
    no = sum(value == 0, na.rm = TRUE),
    yes = sum(value == 1, na.rm = TRUE),
    missing = sum(is.na(value)),
    .by = c(variable, session_id)
  ) |>
  tidyr::pivot_wider(
    names_from  = session_id,
    values_from = c(no, yes, missing),
    names_glue  = "{session_id}_{.value}"
  ) |>
  arrange(variable) |>
  print(n = Inf)
```

For a custom combination of substances, set `cumulative = FALSE` to get
a session-level snapshot instead:

``` r

compute_ss_use_yn(
  data_sdsu,
  "combined_alc_flav__vape_lft_yn",
  c("Alcohol", "Flavored Vaping Products"),
  cumulative = FALSE
)
```

### Onset event

Substance-by-substance analysis:

``` r

output <- purrr::map2(
  sdsu_config |>
    pull(name_score_onset_event),
  sdsu_config |>
    pull(substance),
  \(x, y) compute_ss_use_onset_event(data_sdsu, x, y)
) |>
  purrr::reduce(full_join, by = "participant_id")

output |>
  select(-participant_id) |>
  tidyr::pivot_longer(
    everything(),
    names_to = "variable",
    values_to = "value"
  ) |>
  mutate(value = if_else(is.na(value), "never", value)) |>
  count(variable, value) |>
  tidyr::pivot_wider(names_from = value, values_from = n, values_fill = 0) |>
  print(n = Inf)
```

Example with combined substances:

``` r

compute_ss_use_onset_event(
  data_sdsu,
  "combined_alc_flav__vape_onset_event",
  c("Alcohol", "Flavored Vaping Products")
)
```

### Onset age

Substance-by-substance analysis:

``` r

output <- purrr::map2(
  sdsu_config |>
    pull(name_score_onset_age),
  sdsu_config |>
    pull(substance),
  \(x, y) compute_ss_use_onset_age(data_sdsu, x, y)
) |>
  purrr::reduce(full_join, by = "participant_id")

output |>
  select(-participant_id) |>
  tidyr::pivot_longer(
    everything(),
    names_to = "variable",
    values_to = "value"
  ) |>
  summarise(
    min = min(value, na.rm = TRUE),
    mean = mean(value, na.rm = TRUE),
    max = max(value, na.rm = TRUE),
    .by = variable
  ) |>
  print(n = Inf)
```

Example with combined substances:

``` r

compute_ss_use_onset_age(
  data_sdsu,
  "combined_alc_flav__vape_onset_age",
  c("Alcohol", "Flavored Vaping Products")
)
```

## Compute all scores

The SDSU scores fall into two families:

- **Dynamic scores** (`data_sdsu_ss_dynamic`): one row per participant
  and session. Includes substance use Y/N (computed with
  `cumulative = TRUE`).
- **Static scores** (`data_sdsu_ss_static`): one row per participant.
  Includes onset event (first session of use) and onset age.

The example below reads the raw data into `deap_data` and passes it
explicitly through the pipeline (any data frame name works as long as
you use it consistently). For example, to compute the summary scores,
run:

``` r

# read raw data
deap_data <- arrow::read_parquet("~/Downloads/data/DEAP/sdsu_dataset.parquet")

# prepare data
data_sdsu <- deap_data |>
  prepare_data_sdsu()


# compute all dynamic SDSU summary scores in the ABCD data resource
data_sdsu_ss_dynamic <-
  purrr::map2(
    sdsu_config |>
      pull(name_score_use_yn),
    sdsu_config |>
      pull(substance),
    \(x, y) compute_ss_use_yn(data_sdsu, x, y, cumulative = TRUE)
  ) |>
  purrr::reduce(
    full_join,
    by = c("participant_id", "session_id")
  )


# compute all static SDSU summary scores in the ABCD data resource
data_sdsu_ss_static <- c(
  # Onset event:
  purrr::map2(
    sdsu_config |>
      pull(name_score_onset_event),
    sdsu_config |>
      pull(substance),
    \(x, y) compute_ss_use_onset_event(data_sdsu, x, y)
  ),
  # Onset age:
  purrr::map2(
    sdsu_config |>
      pull(name_score_onset_age),
    sdsu_config |>
      pull(substance),
    \(x, y) compute_ss_use_onset_age(data_sdsu, x, y)
  )
) |>
  purrr::reduce(
    full_join,
    by = "participant_id"
  )
```
