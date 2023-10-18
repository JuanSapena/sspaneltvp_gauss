library optmum;
#include optmum.ext;
optset;

start = { -1, 1 };

proc fct(x);
local y1,y2;
   y1 = x[2] - x[1]*x[1];
   y2 = 1 - x[1];
   retp (1e2*y1*y1 + y2*y2);
endp;
_opstmth = "NEWTON BRENT";
__output = 1;
output file = opt5.out reset;
{ x,fmin,g,retcode } = optprt(optmum(&fct,start));
output off;

