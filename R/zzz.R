.onAttach <- function(libname, pkgname) {
  if (!getOption("abcdscores_start_msg_displayed", FALSE)) {
    packageStartupMessage(glue::glue(
      "Welcome to the `ABCDscores` package! For more information, ",
      "visit: https://software.nbdc-datahub.org/ABCDscores/"
    ))
    packageStartupMessage(glue::glue(
      "This package is developed by the ABCD Data Analysis, Informatics & ",
      "Resource Center (DAIRC) at the J. Craig Venter Institute (JCVI)"
    ))
    # TODO uncomment once we have a paper
    # packageStartupMessage(glue::glue(
    #   "If `ABCDscores` is helpful to your research, ",
    #   "please kindly cite it as:\n",
    #   "L Zhang, xxx & J Linkersdörfer. ABCDscores: xxx. 2025. xxx",
    # ))
    options(abcdscores_start_msg_displayed = TRUE)
  }
}
