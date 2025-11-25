# Substance Use Interview (SUI) summary scores

## Introduction

The Substance Use Interview (SUI) survey is used to collect background
information on a participant’s substance use since their last visit.
Additionally, the survey gathers follow-up information about use
context, first use date, and other details. Scientifically, this survey
allows us to understand the initiation and patterns of substance use in
our participants. The information provided in the SUI is also used to
decide whether a Timeline Followback interview is done with a given
participant to access their substance use in more detail.

## SUI summary score functions

We developed three basic functions that can be used to compute the SUI
summary scores for all relevant substances by changing the value of the
`substance` function parameter:

- [`compute_su_y_sui__onset_useage()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__onset_useage.md):
  Computes the *age of use onset* for a given substance.
- [`compute_su_y_sui__reg_useage()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__reg_useage.md):
  Compute the *age of regular use* for a given substance.
- [`compute_su_y_sui__last__day_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__last__day_count.md):
  Counts *days since last use* for a given substance.

### ❗Data requirements

The SUI item-level data is available to authorized users of the [NBDC
Data Hub](https://nbdc-datahub.org) as part of the tabulated data
resource. Please refer to the [Get
started](https://software.nbdc-datahub.org/ABCDscores/articles/ABCDscores.md)
page for general information on how to assemble and download a dataset.
For the computation of the SUI summary scores, please note the following
requirements:

- [`compute_su_y_sui__onset_useage()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__onset_useage.md)
  and
  [`compute_su_y_sui__reg_useage()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__reg_useage.md)
  require the `ab_g_stc__cohort_dob` column.
- [`compute_su_y_sui__last__day_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_sui__last__day_count.md)
  requires the `ab_g_dyn__visit_dtt` column.

### Summary scores

The following table gives an overview of how each of the 100 SUI summary
scores that are reported in the ABCD tabulated data resource have been
computed using the three basic functions:

### Substances dictionary

The following table provides the mapping of keywords used in the SUI
summary scores to the substances they refer to:
