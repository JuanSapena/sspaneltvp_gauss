/*
**   OPT6.E - Nonlinear Least Squares
**
**   The data for this example have been created using NLIN.SIM.
*/

library optmum;
#include optmum.ext;
optset;


z = loadd("nlin");


proc lnlk(b);
    local dev,f,s2;
    dev = z[.,1] - (b[1] * exp(-b[2]*z[.,2]));
    s2 = dev'dev/rows(dev);
    retp(.5*(dev'dev/s2 + ln(2*pi*s2)));
endp;

startv = { .8, .2 };

__title = "Nonlinear Least Squares";
_opstmth = "newton half";
__output = 1;
output file = opt6.out reset;
{ x,f0,g,retcode } = optprt(optmum(&lnlk,startv));
output off;
