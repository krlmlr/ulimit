#include <sys/time.h>
#include <sys/resource.h>

#include <R.h>
#include <Rinternals.h>
#include <R_ext/RS.h>

SEXP memsize(SEXP ssize)
{
  SEXP ans;

  int maxmem = NA_LOGICAL;

  if(isLogical(ssize))
    maxmem = asLogical(ssize);
  else if(isReal(ssize)) {
    double mem = asReal(ssize);
    rlim_t newmax;
    if (!R_FINITE(mem)) {
      newmax = RLIM_INFINITY;
    } else {
      mem *= 1 << 20;
      if (mem > RLIM_INFINITY)
        newmax = RLIM_INFINITY;
      else
        newmax = (rlim_t)mem;
    }

    struct rlimit rlimit_as;
    getrlimit(RLIMIT_AS, &rlimit_as);
    rlimit_as.rlim_cur = newmax;
    setrlimit(RLIMIT_AS, &rlimit_as);
    getrlimit(RLIMIT_AS, &rlimit_as);

    PROTECT(ans = allocVector(REALSXP, 1));
    if (rlimit_as.rlim_cur == RLIM_INFINITY)
      REAL(ans)[0] = R_PosInf;
    else
      REAL(ans)[0] = rlimit_as.rlim_cur / (1 << 20);
    UNPROTECT(1);
    return ans;
  } else
    /*error(_("incorrect argument"))*/;

  PROTECT(ans = allocVector(REALSXP, 1));
  REAL(ans)[0] = NA_REAL;
  UNPROTECT(1);
  return ans;
}
