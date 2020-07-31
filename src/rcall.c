#include <R.h>
#include <Rinternals.h>

/* The R function we save to avoid passing character strings in fortran! */

static SEXP rfunc;
/* static SEXP rho; */

/* Store the R function */
SEXP store_rfun(SEXP rfun) {
  rfunc = rfun;
  return(R_NilValue);
}

void F77_NAME(rfcall)(int *n, double *y, double *z, double *w, double *result) {

  int num_protected = 0;  
  SEXP ry, rz, rw;
  
  printf("Before PROTECT\n");
  PROTECT(ry = allocVector(REALSXP, *n));
  num_protected++;
  PROTECT(rz = allocVector(REALSXP, *n));
  num_protected++;
  PROTECT(rw = allocVector(REALSXP, *n));
  num_protected++;
  printf("AFTER PROTECT\n");
  
  double *yvec = REAL(ry); double *zvec = REAL(rz); double *wvec = REAL(rw);
  printf("AFTER REAL\n");
  for (int i = 0; i < *n; i++) {
    yvec[i] = y[i]; zvec[i] = z[i]; wvec[i] = w[i];
  }

  SEXP rho = R_GetCurrentEnv();

  printf("build call\n");  
  
  SEXP call = PROTECT(LCONS(rfunc, LCONS(ry, LCONS(rz, LCONS(rw, R_NilValue)))));
  num_protected++;

  printf("Start eval\n");
  
  SEXP r_result = R_forceAndCall(call, 3, rho);
  
  /* SEXP r_result; */
  /* PROTECT(r_result = eval(rfunc, rho)); */
  printf("Done eval\n");  
  /* num_protected++; */

  R_len_t len = length(r_result);
  if (len > 1) {
    error("R discrepancy function result length > 1");
  }
  *result = REAL(r_result)[0];
  printf("%f\n", *result);

  UNPROTECT(num_protected);
}

  
  
  /* SEXP s, t; */
  /* /\* printf("%d\n", *val); *\/ */
  /* t = s = PROTECT(allocList(4)); */
  /* num_protected++; */
  
  /* SET_TYPEOF(s, LANGSXP); */
  /* SETCAR(t, install(rfunc)); t = CDR(t); */
  /* SETCAR(t,  ry); SET_TAG(t, install("y"));  t = CDR(t); */
  /* SETCAR(t,  rz); SET_TAG(t, install("z"));  t = CDR(t); */
  /* SETCAR(t,  rw); SET_TAG(t, install("w")); */
