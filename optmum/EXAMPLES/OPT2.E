/*
**   OPT2.E
**
**   This command file illustrates nonlinear least squares
**   estimation using OPTMUM.  The data for this example
**   have been created using NLIN.SIM.
*/

library optmum;
#include optmum.ext;
optset;

@ -- data -- @

  nldat = loadd("nlin");

@ -- model -- @

proc fct(b);
    retp(b[1]+b[2]*exp(-b[3]*nldat[.,2]));
endp;

@ -- procedure to compute sum of squared deviations -- @

proc ssq(b);
    local dev;
    dev = nldat[.,1] - fct(b);
    retp(dev'*dev);
endp;


output file = opt2.out reset;

startv = { .8, 1.2, .2 };
_opgtol = 1e-5;
{ bh,fmin,g,retcode } = optmum(&ssq,startv);

call optprt(bh,fmin,g,retcode);

grd = gradp(&fct,bh);
cov = fmin*invpd(grd'*grd);

   print cov;
   print;
   print "standard errors of parameters";
   sd = sqrt(diag(cov));
   print sd';
   print;
   print "t-statistics";
   print (bh./sd)';

output off;
