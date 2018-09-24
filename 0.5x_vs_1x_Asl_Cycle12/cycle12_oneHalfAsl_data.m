length = [420
510
540
450
420
480
390
420
390
480
360
390
480
510
540
330
420
540];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [1637
1363
1578
1686
1667
1461
1043
1257
988.7
1219
968
1062
993.6
1458
966.5
1678
1944
1615];


centre = [126.18
192.72
214.32
148.47
128.73
148.53
100.71
139.53
150.66
127.2
123.75
157.68
117.6
189.36
212.34
80.7
128.61
215.49];

centre_rescale = centre.*xRescaleFactor;

width = [216.57
239.25
254.91
193.44
201.15
311.4
175.26
185.7
194.73
240.9
236.85
227.73
293.1
266.04
264.06
163.02
197.85
250.53];

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
rescalingFactor = 4.957411513619080e-04;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(18).*rescalingFactor,'lineProps','k','patchSaturation',0.05);