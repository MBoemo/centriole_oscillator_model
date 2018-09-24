length = [420
630
600
420
510
600
480
570
630
510
600];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [4143
2588
3118
3924
3066
5014
3750
4455
3521
4018
3756];

centre = [200.16
182.34
227.49
161.04
235.41
271.35
249.09
204.6
276.39
146.25
279.36];

centre_rescale = centre.*xRescaleFactor;

width = [161.25
331.5
249.42
204.39
354.3
430.8
355.2
310.8
417.6
216.18
299.58];

width_rescale = width.*xRescaleFactor;

x = 0:0.1:mean_length;

all = [];
for i = 1:11
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

figure;
shadedErrorBar(1:row,means, stdv/sqrt(11),'lineProps','k','patchSaturation',0.05);
x = 1:row;

%rescale the y-axis so the cycle 12 maximum is at 1.0
rescalingFactor = 1.908103490192525e-04;
figure;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(11).*rescalingFactor,'lineProps','k','patchSaturation',0.05);