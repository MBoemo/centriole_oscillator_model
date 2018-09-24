# centriole_oscillator_model
MATLAB code supporting the mathematical modelling component of Aydogan2018
Some plotting uses the shadedErrorBar function from https://github.com/raacampbell/shadedErrorBar.git which is linked to this repository as a git submodule.

Each directory has a file with suffix "_data.m" which shows how the data was normalised and scaled, and a file with suffix "_model.m" which gives the appropriate differential equation model.

Instructions:
- Navigate to the appropriate directory, 
- download shadedErrorBar.m and move it to the directory,
- run the "_model.m" script and compute b_10Sol(x) + b_9Sol(x) + b_8Sol(x) + b_7Sol(x) + b_6Sol(x) + b_5Sol(x) + b_4Sol(x) + b_3Sol(x) + b_2Sol(x) + b_1Sol(x),
- run the "_data.m" script, which will generate some plots as well as "x" and "means" variables (the "x" variable is the x-axis data to fit against, and the "means" variable is the y-axis data to fit against),
- fit the result of b_10Sol(x) + b_9Sol(x) + b_8Sol(x) + b_7Sol(x) + b_6Sol(x) + b_5Sol(x) + b_4Sol(x) + b_3Sol(x) + b_2Sol(x) + b_1Sol(x) to the data using the "x" and "means" variables from above.
