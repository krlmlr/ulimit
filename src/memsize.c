#include <sys/time.h>
#include <sys/resource.h>

#include <R.h>
#include <Rinternals.h>
#include <R_ext/RS.h>

double rlim_to_mem(rlim_t rlim) {
  if (rlim == RLIM_INFINITY)
    return R_PosInf;
  else
    return rlim / (1 << 20);
}

rlim_t mem_to_rlim(double mem) {
  if (mem < 0)
    return 0;
  else if (!R_FINITE(mem))
    return RLIM_INFINITY;

  mem *= (1 << 20);
  if (mem > RLIM_INFINITY)
    return RLIM_INFINITY;

  return (rlim_t)mem;
}

SEXP memsize(SEXP ssize)
{
  SEXP ans;

  int maxmem = NA_LOGICAL;

  if(isLogical(ssize))
    maxmem = asLogical(ssize);
  else if(isReal(ssize)) {
    double mem = asReal(ssize);
    rlim_t newmax = mem_to_rlim(mem);

    struct rlimit rlimit_as;
    getrlimit(RLIMIT_AS, &rlimit_as);
    rlimit_as.rlim_cur = newmax;
    setrlimit(RLIMIT_AS, &rlimit_as);
    getrlimit(RLIMIT_AS, &rlimit_as);

    PROTECT(ans = allocVector(REALSXP, 1));
    REAL(ans)[0] = rlim_to_mem(rlimit_as.rlim_cur);
    UNPROTECT(1);
    return ans;
  } else
    /*error(_("incorrect argument"))*/;

  PROTECT(ans = allocVector(REALSXP, 1));
  REAL(ans)[0] = NA_REAL;
  UNPROTECT(1);
  return ans;
}
