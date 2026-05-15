# Compute substance use Y/N for a participant

For each participant computes a binary (1/0) indicator indicating any
use of (one of) the given substance(s) at a session (or cumulatively up
to and including that session when `cumulative = TRUE`). Parameter
`algo` is set to "next_existing_fy".

## Usage

``` r
compute_ss_use_yn(
  data,
  name,
  substance,
  algo = "next_existing_fy",
  cumulative = FALSE
)
```

## Arguments

- data:

  tibble. A dataframe produced by
  [`prepare_data_sdsu()`](https://software.nbdc-datahub.org/ABCDscores/reference/prepare_data_sdsu.md).

- name:

  character(1). Name of the output score column to validate.

- substance:

  character (vector). The substance(s) to compute the score for. Must be
  one or several of the following values:

  - `"Alcohol (Sipping)"`

  - `"Nicotine (Puffing)"`

  - `"Marijuana (Puffing)"`

  - `"Alcohol"`

  - `"Nicotine"`

  - `"Marijuana"`

  - `"Cocaine or Crack Cocaine"`

  - `"Methamphetamine, Meth, or Crystal Meth"`

  - `"Ketamine or Special K"`

  - `"Heroin, Opium, Junk, Smack, or Dope"`

  - `"Cathinones such as Bath Salts, Drone, or Meph"`

  - `"Ecstasy, Molly, or MDMA"`

  - `"GHB, Liquid G, or Georgia Homeboy"`

  - `"Hallucinogen Drugs including LSD, PCP, Peyote, Mescaline, DMT, AMT, or Foxy"`

  - `"Psilocybin, Magic Mushrooms, or Shrooms"`

  - `"Anabolic Steroids"`

  - `"Inhalants"`

  - `"Prescription Anxiolytics, Tranquilizers, or Sedatives"`

  - `"OTC Cough or Cold Medicine, DXM, 'Lean', or 'Purple Drank'"`

  - `"Salvia"`

  - `"Prescription Stimulants"`

  - `"Prescription Opioids"`

  - `"'Fake' Marijuana or Synthetics"`

  - `"Other substances"`

  - `"Nicotine Vaping Products"`

  - `"Tobacco Cigarette"`

  - `"Cigars, Little Cigars, or Cigarillos"`

  - `"Tobacco in a Pipe"`

  - `"Hookah with Tobacco"`

  - `"Nicotine Replacements"`

  - `"Smokeless Tobacco, Chew, or Snus"`

  - `"Flavored Vaping Products"`

  - `"Smoking Marijuana Flower"`

  - `"Marijuana Edibles"`

  - `"Marijuana Infused Alcohol Drinks"`

  - `"Marijuana Concentrates"`

  - `"Concentrated Marijuana Tinctures"`

  - `"Blunts or Combined Tobacco and Marijuana in Joints"`

  - `"Vaped Marijuana Flower"`

  - `"Vaped Marijuana Oils or Concentrates"`

  - `"CBD (Non-Medical Use)"`

  - `"Alcohol (Including low-level use)"`

  - `"Nicotine (Including low-level use)"`

  - `"Marijuana (Including low-level use)"`

  - `"Substance use (Not including alcohol, nicotine, and cannabis)"`

  - `"Substance use"`

  - `"Substance use (Including low-level use)"`

- algo:

  character. Mapping algorithm to apply to mid‑year sessions. Allowed
  values:

  - `"next_existing_fy"`: assign a mid year to the next existing full
    year. If a participant ends with mid‑year visits, those terminal
    mid‑year records are dropped.

  - `"next_potential_fy"`: assign a mid year to the next existing full
    year when present, otherwise assign to the next forecasted full year
    (that may never materialize).

  - `"next_immediate_fy"`: assign a mid year to the next full year
    regardless of whether that full year record exists or not.

  - `"remove_my"`: drop mid-year events and keep only full-year events.
    If `NULL` (default) no mapping is performed and `data` is returned
    unchanged.

- cumulative:

  logical(1). If `FALSE` (default), returns use at each session. If
  `TRUE`, returns 1 from the first session where use was observed onward
  (i.e. ever used up to and including that session).

## Value

A tibble with columns `participant_id`, `session_id` and a numeric
column named by `name` containing 1 (use) or 0 (no use).

## See also

[`map_mid_years()`](https://software.nbdc-datahub.org/ABCDscores/reference/map_mid_years.md)

## Examples

``` r
if (FALSE) { # \dontrun{
deap_data |>
  prepare_data_sdsu() |>
  compute_ss_use_yn(
    name = "su_y_alc_use_yn",
    substance = "Alcohol"
  )
} # }
```
