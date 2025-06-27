source("renv/activate.R")

if (Sys.info()["sysname"] != "Darwin" && interactive()) {
  # use the PPM binary CRAN mirror on non-MacOS systems
  options(repos = c(PPM = "https://packagemanager.posit.co/cran/latest"))
}

local({
  need_install <- c()
  if (!requireNamespace("roxygen2", quietly = TRUE)) {
    cat("Package 'arrow' is required for the development, consider install it.\n")
    need_install <- c(need_install, "roxygen2")
  }

  if (!requireNamespace("devtools", quietly = TRUE)) {
    cat("Package 'devtools' is required for the development, consider install it.\n")
    need_install <- c(need_install, "devtools")
  }

  if (!requireNamespace("arrow", quietly = TRUE)) {
    cat("Package 'arrow' is required for the development, consider install it.\n")
    need_install <- c(need_install, "arrow")
  }
  if (!requireNamespace("roxyglobals", quietly = TRUE)) {
    cat("Package 'roxyglobals' is required for the development, consider install it.\n")
    need_install <- c(need_install, "roxyglobals")
  }

  if (length(need_install) > 0) {
    cat(
      'Use `renv::install(c("',
      paste(need_install, collapse = '", "'),
      '"))\n',
      sep = ""
    )
  }
})


if (Sys.getenv("INSIDE_DOCKER") == "true") {
  cat("Running inside Docker container\n")
  renv::settings$use.cache(FALSE)
  # add docker pre-installed packages to the library path to speed up package install
  .libPaths(c(.libPaths(), "/usr/local/lib/R/site-library"))
  # change addtional install path to current renv for cache
  Sys.setenv(RENV_PATHS_LIBRARY = file.path(getwd(), "renv/library"))

  if (!requireNamespace("pkgdown", quietly = TRUE)) {
    renv::install("pkgdown")
  }
}

# {renv} aliases, make the shortcuts always start with "r"
if (requireNamespace("renv", quietly = TRUE)) {
  rstatus <- renv::status
  rinstall <- renv::install
  rremove <- renv::remove
  rsnapshot <- renv::snapshot
  rrestore <- renv::restore
}
