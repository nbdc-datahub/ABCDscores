.onAttach <- function(libname, pkgname) {
  if (!getOption("abcdscores_start_msg_displayed", FALSE)) {
    packageStartupMessage(glue::glue(
      "Welcome to the `ABCDscores` package! For more information, ",
      "visit: https://software.nbdc-datahub.org/ABCDscores/"
    ))
    packageStartupMessage(glue::glue(
      "This package is developed by the ABCD Data Analysis, Informatics & ",
      "Resource Center (DAIRC) at the J. Craig Venter Institute (JCVI)."
    ))
    packageStartupMessage(glue::glue(
      "If `ABCDscores` is helpful to your research, please cite:\n",
      "Zhang, L., Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C. J., ",
      "Dale, A. M., & Linkersd\u00f6rfer, J. (2025). ",
      "ABCDscores: An R package for computing summary scores in the ABCD Study. ",
      "bioRxiv. https://doi.org/10.1101/2025.09.04.674066"
    ))
    options(abcdscores_start_msg_displayed = TRUE)
  }
}
