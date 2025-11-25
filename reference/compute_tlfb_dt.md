# Compute TLFB first or last date of substance use

Computes either the first or last date of use for a given (set of)
substance(s). Optionally, allows to filter by period (detailed and/or
estimated); only considering a specified number of days before the TLFB
interview; only considering days with co-use of (a)other substance(s);
and/or only binge use.

## Usage

``` r
compute_tlfb_dt(
  data,
  name,
  substance = NULL,
  period = NULL,
  days = NULL,
  co_use = NULL,
  binge = NULL,
  position
)
```

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

- co_use:

  character (vector). Co-use substance(s). Must be one or several of the
  possible values for `substance` listed above. Only days where the
  specified substance(s) was/were used together with (one of) the co-use
  substance(s) are considered. (Default: `NULL`, i.e., co-use is not
  considered). `co_use` cannot be specified without `substance` and can
  only contain substance(s) that are not specified in `substance`.

- binge:

  (named list of) numeric. Binge threshold(s) for the substance(s). If
  only one value is provided, it is used, independent of the sex of the
  participant. If a list is provided, it must contain two named
  elements: `"F"` (female) and `"M"` (male) with the respective
  sex-specific binge thresholds. Only days where the the quantity of the
  substance(s) exceeds the specified threshold(s) are considered.
  (Default: `NULL`, i.e., binge behavior is not considered).

- position:

  character. The position of the substance use event. Must be one of
  `"first"` or `"last"`.

## Value

A tibble with the computed score for each participant/event.

## See also

[`compute_tlfb_abst()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_tlfb_abst.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_tlfb_dt(
  data = data_tlfb,
  name = "su_y_tlfb__alc__first__cum_dt",
  substance = "Alcohol",
  position = "first"
)
} # }
```
