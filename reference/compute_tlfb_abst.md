# Compute TLFB length of abstinence

Computes the length of abstinence in days for a given (set of)
substance(s). Optionally, allows to filter by period (detailed and/or
estimated); only considering a specified number of days before the TLFB
interview; and/or only binge use.

## Usage

``` r
tlfb_substances

compute_tlfb_abst(
  data,
  name,
  substance = NULL,
  period = NULL,
  days = NULL,
  binge = NULL
)
```

## Format

`tlfb_substances` is a character vector of all substances that can be
reported in the TLFB.

## Arguments

- data:

  tibble. A data frame containing the TLFB raw data.

- name:

  character. The name of the output column for the computed score.

- substance:

  character (vector). The substance(s) to compute the score for. Must be
  one or several of the following values:

  - `"'Fake' Marijuana or Synthetics"`

  - `"Alcohol"`

  - `"Anabolic Steroids"`

  - `"Any Other Drug They Used to Get High"`

  - `"Blunts or Combined Tobacco and Marijuana in Joints"`

  - `"CBD (Non-Medical Use)"`

  - `"Cathinones such as Bath Salts, Drone, or Meph"`

  - `"Cigars, Little Cigars, or Cigarillos"`

  - `"Cocaine or Crack Cocaine"`

  - `"Concentrated Marijuana Tinctures"`

  - `"Ecstasy, Molly, or MDMA"`

  - `"Electronic Nicotine or Vaping Products"`

  - `"GHB, Liquid G, or Georgia Homeboy"`

  - `"Hallucinogen Drugs including LSD, PCP, Peyote, Mescaline, DMT, AMT, or Foxy"`

  - `"Heroin, Opium, Junk, Smack, or Dope"`

  - `"Hookah with Tobacco"`

  - `"Inhalants"`

  - `"Ketamine or Special K"`

  - `"Marijuana Edibles"`

  - `"Marijuana Infused Alcohol Drinks"`

  - `"Methamphetamine, Meth, or Crystal Meth"`

  - `"Nicotine Replacements"`

  - `"OTC Cough or Cold Medicine, DXM, 'Lean', or 'Purple Drank'"`

  - `"Prescription Anxiolytics, Tranquilizers, or Sedatives"`

  - `"Prescription Pain Relievers or Opioids"`

  - `"Prescription Stimulants"`

  - `"Psilocybin, Magic Mushrooms, or Shrooms"`

  - `"Salvia"`

  - `"Smokeless Tobacco, Chew, or Snus"`

  - `"Smoking Marijuana Flower"`

  - `"Smoking Marijuana Oils or Concentrates"`

  - `"Tobacco Cigarette"`

  - `"Tobacco in a Pipe"`

  - `"Vaped Marijuana Flower"`

  - `"Vaped Marijuana Oils or Concentrates"`

  - `"Marijuana (all forms)"`

  - `"Nicotine (all forms)"`

  (Default: `NULL`, i.e., all substances are considered.)

- period:

  character (vector). The period for which the score is computed for.
  Must be one of `"detailed"` (last year before date of TLFB interview)
  or `"estimated"` (more than one year before date of TLFB). (Default:
  `NULL`, i.e., all periods are considered). Cannot be used in
  combination with `days`.

- days:

  integer. Number of days before the TLFB interview to consider.
  (Default: `NULL`, i.e., all days are considered). Cannot be used in
  combination with `period`.

- binge:

  (named list of) numeric. Binge threshold(s) for the substance(s). If
  only one value is provided, it is used, independent of the sex of the
  participant. If a list is provided, it must contain two named
  elements: `"F"` (female) and `"M"` (male) with the respective
  sex-specific binge thresholds. Only days where the the quantity of the
  substance(s) exceeds the specified threshold(s) are considered.
  (Default: `NULL`, i.e., binge behavior is not considered).

## Value

A tibble with the computed score for each participant/event.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_tlfb_abst(
  data = data_tlfb,
  name = "su_y_tlfb__alc__cum_abst",
  substance = "Alcohol"
)
} # }
```
