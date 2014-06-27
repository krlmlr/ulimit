#' Report on Memory Allocation
#'
#' \code{memory.size} and \code{memory.limit} are used to manage the total
#' memory allocation.  On POSIX systems, the \code{getrlimit64(2)}
#' and  \code{setrlimit64(2)} APIs are used.  On Windows, these calls are
#' forwarded to the corresponding functions in the \code{utils} package.
#'
#' @usage memory.size(max = FALSE)
#' @usage memory.limit(size = NA)
#' @aliases memory.size memory.limit
#' @param max logical. If true the maximum amount of memory obtained from the
#' OS is reported, otherwise the amount currently in use.
#' @param size numeric. If \code{NA} report the memory size, otherwise request
#' a new limit, in Mb.
#' @return Size in bytes
#' @seealso \link[utils]{Memory-limits} for other limits.
#' @export
memory.size <- function(max = FALSE) round(.Call(C_memsize, max), 2L)

#' @rdname memory.size
#' @export
memory.limit <- function(size = NA) trunc(.Call(C_memsize, size))
