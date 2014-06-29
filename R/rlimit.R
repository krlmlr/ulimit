#' Report on Memory Allocation
#'
#' This function is used to manage the total memory allocation.  On POSIX
#' systems, the \code{getrlimit64(2)} and  \code{setrlimit64(2)} APIs are used.
#' On Windows, these calls are
#' forwarded to \code{utils::\link[utils]{memory.limit}}.
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
