#include <R.h>
#include <Rinternals.h>

SEXP memsize(SEXP ssize)
{
    SEXP ans;
    PROTECT(ans = allocVector(REALSXP, 1));
    REAL(ans)[0] = NA_REAL;
    UNPROTECT(1);
    return ans;
}
