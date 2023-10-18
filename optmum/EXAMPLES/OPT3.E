/*
**   OPT3.E  -  Woods Function
**
*/

library optmum;
#include optmum.ext;
optset;

    h0 = zeros(4,4);
    h0[4,2] = 19.8;
    h0[4,4] = 200.2;
    h0[2,4] = 19.8;
    h0[2,2] = 220.2;

proc lpr(x);
    retp(100*(x[2]-x[1]^2)^2 + (1-x[1])^2 + 90*(x[4]-x[3]^2)^2 +
    (1-x[3])^2 + 10.1*((x[2]-1)^2 + (x[4]-1)^2) + 19.8*(x[2]-1)*(x[4]-1));
endp;

proc grd0(x);
    local a,b,g;
    a = x[2] - x[1]^2;
    b = x[4] - x[3]^2;
    g = zeros(1,4);
    g[1] = -2*(200*x[1]*a + 1 - x[1]);
    g[2] = 2*(100*a + 10.1*(x[2]-1) + 9.9*(x[4]-1));
    g[3] = -2*(180*x[3]*b + 1 - x[3]);
    g[4] = 2*(90*b + 10.1*(x[4]-1) + 9.9*(x[2]-1));
    retp(g);
endp;

proc hss0(x);
    local h;
    h = h0;
    h[1,1] = -2*(200*(x[2]-x[1]^2) - 400*x[1]^2 - 1);
    h[1,2] = -400*x[1];
    h[2,1] = h[1,2];
    h[3,3] = -2*(180*(x[4]-x[3]^2) - 360*x[3]^2 - 1);
    h[4,3] = -360*x[3];
    h[3,4] = h[4,3];
    retp(h);
endp;


let x0 = -3 -1 -3 -1;

output file = opt3.out reset;

_opgdprc = &grd0;
_ophsprc = &hss0;

_opmdmth = "newton brent";
_opditer = 10;

__title = "Wood's Problem";

 call optprt(optmum(&lpr,x0));

output off;
