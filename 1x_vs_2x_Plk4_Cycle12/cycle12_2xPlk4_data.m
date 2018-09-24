length = [450
570
450
600
600
450
480
420
420
420
450
450];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [4543
4375
5348
6658
4775
4379
6725
6075
5896
4564
5342
5460];


centre = [177.15
145.65
134.49
219.6
159.99
199.02
178.95
161.31
156.54
165.69
204.75
176.22];

centre_rescale = centre.*xRescaleFactor;

width = [195.06
189.48
198.57
243.12
209.13
227.49
226.44
192.54
182.31
203.49
204.99
213.15];

width_rescale = width.*xRescaleFactor;

x = 0:0.1:mean_length;

%figure;
%hold on;
all = [];
for i = 1:12
   y = [];
   centreValue = lorentz(centre_rescale(i), centre_rescale(i),width_rescale(i),1);

   for t = 0:mean_length
       y = [y; lorentz(t, centre_rescale(i),width_rescale(i),amp(i)/centreValue)];
   end
%   plot(0:mean_length,y);
   all = [all, y];
end
%hold off;

%compute means and standard deviations at each time point
means = [];
stdv = [];
[row, col] = size(all);
for r = 1:row
    stdv(r) = std(all(r,:));
    means(r) = mean(all(r,:));
end

figure; hold on;
shadedErrorBar(1:row,means, stdv/sqrt(12),'lineProps','r','patchSaturation',0.05);
x = 1:row;

%rescale the y-axis so the cycle 12 maximum is at 1.0
rescalingFactor = 1/max(means);
figure; hold on;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(12).*rescalingFactor,'lineProps','g','patchSaturation',0.05);