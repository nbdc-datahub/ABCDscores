
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ABCDscores

<!-- badges: start -->

<!-- badges: end -->

This R package provides functions to compute all non-proprietary summary
scores that are included in the tabulated data resource from the
Adolescent Brain Cognitive Development (ABCD) Study<sup>TM</sup>. The
ABCD Study<sup>®</sup> is the largest long-term study of brain
development and child health in the United States, following the
biological and behavioral development of over 11,800 children at 21
research sites across the US through adolescence into young adulthood.

To learn more about the study, visit the

- [ABCD Study<sup>®</sup> website](https://abcdstudy.org/) for general
  information
- [ABCD data documentation](https://docs.abcdstudy.org/) for detailed
  information about the data resource
- [Data Exploration and Analysis Portal
  (DEAP)](https://abcd.deapscience.com/#/my-datasets/create-dataset) to
  explore the ABCD data dictionary
- [NIH Brain Development Cohorts (NBDC) Data
  Hub](https://www.nbdc-datahub.org) to apply for data access

## Versioning

The package major version number (first two digits) matches the ABCD
data release version number. For example, the package version `6.0.0`
and other `6.0.*` versions (e.g., `6.0.1`, `6.0.2`, etc.) are compatible
with the ABCD data release 6.0, `7.0.*` package versions are compatible
with the ABCD release 7.0, and so forth.

The following table lists which version of the package was used to
compute the summary scores in the tabulated data resource for each ABCD
data release, starting with the introduction of the package with release
6.0.

| Release version | Package version |
|:----------------|:----------------|
| 6.0             | 6.0.0           |
| 6.1             | 6.1.0           |

## Installation

To install the *latest version* of `ABCDscores` from CRAN, use the
following command:

``` r
install.packages("ABCDscores")
```

To install the *latest version* of `ABCDscores` from
[GitHub](https://github.com/nbdc-datahub/ABCDscores), use the following
command:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
  
remotes::install_github("nbdc-datahub/ABCDscores")
```

To install a *specific version* of the package, specify the version
number in the `remotes::install_github()` call. For example, to install
version 6.0.0, use the following command:

``` r
remotes::install_github("nbdc-datahub/ABCDscores@v6.0.0")
```

## Usage

For a general overview of how to use the R package to compute summary
scores, see the [Get
Started](https://software.nbdc-datahub.org/ABCDscores/articles/ABCDscores.html)
page. To browse the documentation of all available functions, see the
[Reference](https://software.nbdc-datahub.org/ABCDscores/reference/index.html)
page. For more detailed information about specific summary scores, refer
to the
[vignettes](https://software.nbdc-datahub.org/ABCDscores/articles/).

## Issues

If you encounter issues while using the package, please report them by
submitting a [GitHub
issue](https://github.com/nbdc-datahub/ABCDscores/issues). Please do not
submit any issues related to the ABCD data resource itself (see [ABCD
Data documentation](https://docs.abcdstudy.org/latest/info/issues.html)
for information on how to report issues with the data resource).

## Citation

If you use any summary scores from ABCD data release or compute summary
scores using this package, please kindly cite the following paper:

> Zhang, L., Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C.
> J., Dale, A. M., & Linkersdörfer, J. (2025). *ABCDscores: An R package
> for computing summary scores in the ABCD Study®*. bioRxiv.
> <https://doi.org/10.1101/2025.09.04.674066>
