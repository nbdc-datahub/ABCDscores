# Filter TLFB data

This function filters the TLFB (Timeline Followback) data based on
specified substance(s); period (estimated vs. detailed); number of days
before the TLFB interview; weekend-only usage; co-use of other
substances; and/or binge use.

## Usage

``` r
filter_tlfb(
  data,
  substance = NULL,
  period = NULL,
  days = NULL,
  wknd = NULL,
  co_use = NULL,
  binge = NULL
)
```

## Arguments

- data:

  tibble. A data frame containing the TLFB raw data.

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

- wknd:

  logical. Whether the score should be computed for weekends only
  (`TRUE`) or for week days only (`FALSE`). (Default: `NULL`, i.e., all
  days are considered).

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

## Value

A filtered data frame based on the specified criteria.

## Examples

``` r
if (FALSE) { # \dontrun{
filtered_data <- filter_tlfb(
  data,
  substance = "Alcohol",
  wknd_only = TRUE,
  period = "estimated",
  days = 30
)
} # }
```
