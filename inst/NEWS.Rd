\name{NEWS}
\title{News for Package 'ulimit'}
\encoding{UTF-8}
\section{Changes in ulimit version 0.0-2 (2014-06-29)}{
  \itemize{
    \item Redesign API: Support only one function \code{memory_limits} that returns and
      optionally sets memory limits in MiB.  Both soft and hard limits are returned,
      but (obviously) only the soft limit can be set.
  }
}
\section{Changes in ulimit version 0.0-1 (2014-06-27)}{
  \itemize{
    \item R interface and C implementation stub
    \item Initial package structure
  }
}
