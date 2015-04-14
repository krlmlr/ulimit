# ulimit [![Build Status](https://travis-ci.org/krlmlr/ulimit.png?branch=master)](https://travis-ci.org/krlmlr/ulimit)

Limit R memory on POSIX systems (Linux, [~~OS X~~](http://stackoverflow.com/q/3274385/946850), ...).

## Installation

```
devtools::install_github("krlmlr/ulimit")
```

## Usage

Execute the following to limit the memory available to R to 2000 MiB:

```r
ulimit::memory_limit(2000)
```

See also the [package documentation](http://krlmlr.github.io/ulimit) and the small [vignette](http://krlmlr.github.io/ulimit).
