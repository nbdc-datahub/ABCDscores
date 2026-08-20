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
      "Abad, S., Dale, A. M., & Linkersd\u00f6rfer, J. (2026). ",
      "ABCDscores: an R package for computing summary scores in the ",
      "ABCD Study\u00ae. Frontiers in Neuroinformatics, 20, 1858950. ",
      "https://doi.org/10.3389/fninf.2026.1858950"
    ))
    options(abcdscores_start_msg_displayed = TRUE)
  }
}
