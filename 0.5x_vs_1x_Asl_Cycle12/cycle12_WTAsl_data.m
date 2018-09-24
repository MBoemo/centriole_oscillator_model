length = [420
390
450
600
390
420
420
480
420
450
360
450
450
480
510
450
570
420];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [3703
2516
2873
1910
2002
2158
3020
2356
1438
1782
883.6
1373
1373
1990
2125
1360
1833
2085];


centre = [144.09
165.24
163.08
246.51
145.5
163.95
147.36
214.47
130.17
140.07
192.18
196.89
196.89
161.13
147.33
177.36
181.92
111.21];

centre_rescale = centre.*xRescaleFactor;

width = [195.33
204.66
200.07
315
195.84
228.48
193.29
225.9
206.61
197.58
215.82
226.74
226.74
205.11
230.79
246.21
234.03
205.53];

width_rescale = width.*xRescaleFactor;

all = [];
for i = 1:18
   y = [];
   centreValue = lorentz(centre_rescale(i), centre_rescale(i),width_rescale(i),1);

   for t = 0:mean_length
       y = [y; lorentz(t, centre_rescale(i),width_rescale(i),amp(i)/centreValue)];
   end
   all = [all, y];
end

means = [];
stdv = [];
[row, col] = size(all);
for r = 1:row
    stdv(r) = std(all(r,:));
    means(r) = mean(all(r,:));
end

x = 1:row;

%rescale the y-axis so the cycle 12 maximum is at 1.0
rescalingFactor = 1/max(means);
figure; hold on;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(18).*rescalingFactor,'lineProps','g','patchSaturation',0.05);