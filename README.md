# ulimit [![wercker status](https://app.wercker.com/status/57cc89a49512feba9d94346177f84b1f/s/master "wercker status")](https://app.wercker.com/project/bykey/57cc89a49512feba9d94346177f84b1f) [![codecov.io](https://codecov.io/github/krlmlr/ulimit/coverage.svg?branch=master)](https://codecov.io/github/krlmlr/ulimit?branch=master)

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

See also the [package documentation](http://krlmlr.github.io/ulimit) and the small [vignette](http://krlmlr.github.io/ulimit/vignettes/ulimit.html).


## Related

[RAppArmor](https://github.com/jeroenooms/RAppArmor) has the `rlimit_as()` function and much, much more.

