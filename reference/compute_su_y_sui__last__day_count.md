# Count days since last use of a given substance

Computes the number of days since the last use of a given substance as
of the day of the substance use interview. Returns `NA` for the
participants with no reported use of the provided substance.

## Usage

``` r
compute_su_y_sui__last__day_count(data, name, substance, combine = TRUE)
```

## Arguments

- data:

  tibble. A data frame containing the data.

- name:

  character. The name of the output column for the computed score.

- substance:

  character (vector). The substance to compute the score for. Must be
  one of the following values:

  - `"alc"`

  - `"alc__sip"`

  - `"rxstim"`

  - `"cath"`

  - `"cbd"`

  - `"coc"`

  - `"dxm"`

  - `"ghb"`

  - `"hall"`

  - `"inh"`

  - `"ket"`

  - `"meth"`

  - `"mdma"`

  - `"mj__blunt"`

  - `"mj__conc"`

  - `"mj__conc__smoke"`

  - `"mj__conc__vape"`

  - `"mj__drink"`

  - `"mj__edbl"`

  - `"mj__smoke"`

  - `"mj__vape"`

  - `"mj__synth"`

  - `"mj__tinc"`

  - `"nic__chew"`

  - `"nic__cigar"`

  - `"nic__cig"`

  - `"nic__hookah"`

  - `"nic__pipe"`

  - `"nic__rplc"`

  - `"nic__vape"`

  - `"opi"`

  - `"othdrg"`

  - `"qc"`

  - `"roid"`

  - `"rxopi"`

  - `"salv"`

  - `"shroom"`

  - `"rxsed"`

  - `"vape"`

  - `"vape__flav"`

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: \`TRUE“).

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_su_y_sui__last__day_count(
  data = data_sui,
  name = "su_y_sui__alc__last__day_count",
  substance = "alc"
)
} # }
```
