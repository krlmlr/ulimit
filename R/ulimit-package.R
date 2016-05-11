#' @name ulimit-package
#' @aliases ulimit
#' @docType package
#' @title Enforce memory limits on POSIX systems
#' @description This package provides a way to enforce memory limits for a
#'   running R process on POSIX systems.  The function \code{\link{memory_limit}}
#'   shows and optionally sets the limits on main memory.
#' @author Kirill Müller
#' @keywords package
#' @examples
#' \dontrun{
#' # Limit available memory to 6000 MiB
#' memory_limit(6000)}
#' @useDynLib ulimit, .registration = TRUE, .fixes = "C_"
# EXCLUDE COVERAGE START
NULL
# EXCLUDE COVERAGE END
