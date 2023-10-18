/*
** OPT1.E
**
** The following example is taken from D.G. Luenberger (1984) Linear
** and Nonlinear Programming, Addison-Wesley, page 219.
*/

library optmum;
#include optmum.ext;
optset;

q = { 0.78 -0.02 -0.12 -0.14,
     -0.02  0.86 -0.04  0.06,
     -0.12 -0.04  0.72 -0.08,
     -0.14  0.06 -0.08  0.74 };

b = { 0.76, 0.08, 1.12, 0.68 };

x0 = { 1, 1, 1, 1 };

proc  qfct(x);
    retp(.5*x'*q*x-x'b);
endp;

output file = opt1.out reset;

_opstmth = "NEWTON STEPBT";

{ x,fmin,g,retcode } = optprt(optmum(&qfct,x0));

output off;

