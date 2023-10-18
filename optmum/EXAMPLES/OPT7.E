/*
**   OPT7.e  - Extended Powell Singular Function
**             More, Garbow and Hillstrom, 1981, "Testing Unconstrained
**             Optimization Software", TOMS 7, 17-41.
**                          or
**             J.E. Dennis and R. B. Schnabel,
**             _Numerical Methods for Unconstrained Optimization and
**             Nonlinear Equations_, EngleWood Cliffs, NJ: Prentice Hall,
**             page 362.
*/

library optmum;
#include optmum.ext;
#include gradient.ext;

n = 2;   /*  can be any value - 4*n coefficients will be estimated */

proc  F(x);
    local i,j,f;
    f = zeros(4*n,1);
    i = 1;
    do until i > n;
      j = seqa(4*i-3,1,4);
      f[j[1]] = x[j[1]] + 10*x[j[2]];
      f[j[2]] = sqrt(5)*(x[j[3]] - x[j[4]]);
      f[j[3]] = (x[j[2]] - 2*x[j[3]])^2;
      f[j[4]] = sqrt(10)*(x[j[1]] - x[j[4]])^2;
      i = i + 1;
    endo;
    retp(f'f);
endp;

output file = opt7.out reset;

optset;

/* starting values */
x00 = { 3, -1, 0, 1};
x0 = vec(x00.*.ones(n,1));

__title = "Extended Powell Singular Function";

_opgtol = 1e-8;
_opstmth = "newton brent";

call optprt(optmum(&f,x0));

output off;

