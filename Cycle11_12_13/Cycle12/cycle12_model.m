%b is Asl-bound Plk4, and Au is unphosphorylated Asl

%2x Plk4
syms b_1(x) b_2(x) b_3(x) b_4(x) b_5(x) b_6(x) b_7(x) b_8(x) b_9(x) b_10(x) Au(x);

alpha = 0.003644;
k = 0.03443;
gamma = 0.06906;
init = 940;

%initial conditions
cond1 = b_1(0) == 637;
cond2 = b_2(0) == 0;
cond3 = b_3(0) == 0;
cond4 = b_4(0) == 0;
cond5 = b_5(0) == 0;
cond6 = b_6(0) == 0;
cond7 = b_7(0) == 0;
cond8 = b_8(0) == 0;
cond9 = b_9(0) == 0;
cond10 = b_10(0) == 0;
cond11 = Au(0) == init;

conds = [cond1;cond2;cond3;cond4;cond5;cond6;cond7;cond8;cond9;cond10;cond11];

ode1 = diff(b_1) == alpha*Au - k*b_1;
ode2 = diff(b_2) == k*b_1 - k*b_2;
ode3 = diff(b_3) == k*b_2 - k*b_3;
ode4 = diff(b_4) == k*b_3 - k*b_4;
ode5 = diff(b_5) == k*b_4 - k*b_5;
ode6 = diff(b_6) == k*b_5 - k*b_6;
ode7 = diff(b_7) == k*b_6 - k*b_7;
ode8 = diff(b_8) == k*b_7 - k*b_8;
ode9 = diff(b_9) == k*b_8 - k*b_9;
ode10 = diff(b_10) == k*b_9 - gamma*b_10;
ode11 = diff(Au) == -alpha*Au;
odes = [ode1; ode2; ode3; ode4; ode5; ode6; ode7; ode8; ode9; ode10; ode11];

[AuSol(x), b_10Sol(x), b_9Sol(x), b_8Sol(x), b_7Sol(x), b_6Sol(x), b_5Sol(x), b_4Sol(x), b_3Sol(x), b_2Sol(x), b_1Sol(x)] = dsolve(odes,conds);

rescalingFactor = 9.964005041510448e-04;%computed from cycle 12
fplot(rescalingFactor*(b_10Sol(x) + b_9Sol(x) + b_8Sol(x) + b_7Sol(x) + b_6Sol(x) + b_5Sol(x) + b_4Sol(x) + b_3Sol(x) + b_2Sol(x) + b_1Sol(x)),[0,4.575000000000000e+02]);