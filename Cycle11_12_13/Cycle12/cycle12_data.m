length = [420
540
570
390
540
450
450
510
390
450
420
420
450
360
480
480];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [1274
985.5
1272
681.6
927.2
817
737.2
801.7
958.8
835.6
1369
821.4
1376
1192
1276
1011];


centre = [168.18
221.58
164.04
168.99
234.81
138.18
196.11
164.01
112.56
169.23
145.89
141.57
186.48
114.51
120.36
188.82];

centre_rescale = centre.*xRescaleFactor;

width = [188.43
216.42
291.15
190.47
263.79
215.55
252.27
232.68
173.4
237.27
204.15
202.92
199.17
158.52
182.58
175.47];

width_rescale = width.*xRescaleFactor;

all = [];
for i = 1:16
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
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(16).*rescalingFactor,'lineProps','g','patchSaturation',0.05);