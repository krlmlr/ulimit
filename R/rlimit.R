#' Query and set memory limits
#'
#' This function is used to manage the total memory allocation
#' for the current session and for child processes.  On POSIX
#' systems, the \href{http://linux.die.net/man/2/getrlimit}{\code{getrlimit64(2)} and  \code{setrlimit64(2)} APIs}
#' with resource \code{RLIMIT_AS} are used.
#' Support for Windows might become available in the future; in the meantime,
#' use \code{utils::\link[utils]{memory.limit}}.
#'
#' @param size numeric. If \code{NA} report the memory size, otherwise request
#' a new limit, in MiB.
#' @return A named vector with the (new) soft and hard limits in MiB.
#' @seealso \link[base]{Memory-limits} for other limits.
#' @export
memory_limit <- function(size = NA) {
  limits <- .Call(C_memsize, as.numeric(size)[[1L]])
  names(limits) <- c("soft", "hard")
  limits
}
