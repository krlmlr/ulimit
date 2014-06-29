#' @name ulimit-package
#' @aliases ulimit
#' @docType package
#' @title Enforce memory limits on POSIX systems
#' @description This package provides a way to enforce memory limits for a
#'   running R process on POSIX systems.  The function \code{\link{memory_limit}}
#'   shows and optionally sets the limits on main memory.
#' @author Kirill Müller
#' @keywords package
#' @details
#' \tabular{ll}{
#'   Package: \tab ulimit\cr
#'   Type: \tab Package\cr
#'   Version: \tab 0.0-2\cr
#'   Date: \tab 2014-06-29\cr
#'   License: \tab GPL v3\cr
#' }
#' @examples
#' \dontrun{
#' # Limit available memory to 6000 GiB
#' memory_limit(6000)}
#' @useDynLib ulimit, .registration = TRUE, .fixes = "C_"
NULL
