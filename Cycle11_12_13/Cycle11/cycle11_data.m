length = [420
420
390
420
390
420
420
420
390
420
420
450
420
390
390
390
420];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [1083
1095
1153
1995
1337
901.6
844.8
908.7
849.4
980.3
1250
1345
1420
1493
1275
1168
1080];


centre = [61.29
141.33
163.26
156.36
149.82
192.54
124.98
163.59
142.17
155.31
178.83
181.32
134.58
150.69
126.66
171.81
164.07];

centre_rescale = centre.*xRescaleFactor;

width = [204.72
180.39
170.73
175.92
177.63
213.69
208.29
186.15
153.81
168.3
157.89
179.07
185.01
158.43
184.59
216.36
188.76];

width_rescale = width.*xRescaleFactor;

all = [];
for i = 1:17
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

x = 1:row;%for fitting

%rescale the y-axis so the cycle 12 maximum is at 1.0
rescalingFactor = 9.964005041510448e-04;%computed from cycle 12
figure;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(17).*rescalingFactor,'lineProps','r','patchSaturation',0.05);
