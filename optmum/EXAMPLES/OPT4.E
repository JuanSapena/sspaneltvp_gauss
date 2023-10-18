/*
**   OPT4.E  -  The Mitcherlitz Equation
**
**   This command file illustrates nonlinear least squares
**   estimation using OPTMUM.  The data for this example
**   is taken from G.P.Y. Clarke, "Approximate Confidence
**   Limits for a Parameter Function in Nonlinear Regression",
**   JASA, 82:221-230, 1987.
*/

library optmum;
#include optmum.ext;
optset;

/*
** data  -  weight of cut grass from 10 randomly sited quadrants taken
**          each week for 13 weeks from a grazing pasture.
*/

   wgt = { 3.183,
           3.059,
           2.871,
           2.622,
           2.541,
           2.184,
           2.110,
           2.075,
           2.018,
           1.903,
           1.770,
           1.762,
           1.550 };

   nobs = 10;

   week = seqa(1,1,13);

/*  The Mitcherlitz Equation  */

proc fct(b);
    retp(b[3]+b[2]*exp(-b[1]*week));
endp;

/*  The Gradient */

proc grd0(b);
    local w;
    w = exp(-b[1]*week);
    retp(((-b[2]*week.*w)~w~ones(rows(w),1)));
endp;



/*  procedure to compute sum of squared deviations  */

proc ssq(b);
    local dev;
    dev = wgt - fct(b);
    retp(dev'*dev/nobs);
endp;

proc ssqg(b);
    local dev;
    dev = wgt - fct(b);
    retp(-2*dev'*grd0(b)/nobs);
endp;

_opgdprc = &ssqg;

start = { 1, 1, 0};

{ bh,fmin,g,retcode } = optmum(&ssq,start);


output file = opt4.out reset;

call optprt(bh,fmin,g,retcode);

grad = grd0(bh);
cov = fmin*invpd(grad'*grad);
   print;
   print "standard errors of parameters";
   sd = sqrt(diag(cov));
   print sd';
   print;
   print "Correlation matrix of parameters";
   print cov./sd./sd';
   print;
   print "t-statistics";
   print (bh./sd)';

output off;
