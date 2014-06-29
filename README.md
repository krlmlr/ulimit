# ulimit [![Build Status](https://travis-ci.org/krlmlr/ulimit.png?branch=master)](https://travis-ci.org/krlmlr/ulimit)

When experimenting in an interactive R session, it's very easy to create a problem instance where the RAM just isn't quite enough to compute the solution.  (At least it happened to me on more than one occasion.)  A somewhat trivial example, but you get the idea:




```r
# No problem nowadays
N <- 1000
dim(matrix(nrow = N, ncol = N))
```

```
## [1] 1000 1000
```

```r
# Got enough RAM?
N <- 10000
dim(matrix(nrow = N, ncol = N))
```

```
## [1] 10000 10000
```

```r
# Probably not...
N <- 100000
dim(matrix(nrow = N, ncol = N))
```

```
## Error: Swapping a huge amount of memory. Machine unusable, please reboot
```

Unless you're equipped with 64 GiB of RAM (or more), running the last two lines will probably render your machine unusable for quite a while.  This would not happen if the memory available to R was restricted to a sensible value.

For restricting memory, the function `memory.limit()` in the `utils` package is available.  Unfortunately, it is implemented only for Windows -- users of POSIX systems are referred to the `ulimit` functionality of the shell.  There seems to be no way to limit the memory of an *already running* process; this also applies for RStudio sessions.

The `ulimit` package attemts to fill this gap by providing an interface to the [`getrlimit(2)` and `setrlimit(2)` APIs](http://linux.die.net/man/2/getrlimit), which are also used when you execute the `ulimit` built-in in your `bash` shell.  Only a single function `memory_limit` is exported -- it allows querying and optionally setting the maximum amount of virtual memory available to the running process (and also to child processes), this corresponds to the `RLIMIT_AS` resource of the aformentioned APIs.  If you add the line


```r
invisible(ulimit::memory_limit(6000))
```

to your `.Rprofile`, only 6000 MiB will be available for each newly started R session, including RStudio sessions.  (This would be a sensible setting for a computer with 8 GiB RAM.)  Now you are safeguarded against this kind of nuisance:




```r
N <- 100000
dim(matrix(nrow = N, ncol = N))
```

```
## Error: cannot allocate vector of size 37.3 Gb
```
