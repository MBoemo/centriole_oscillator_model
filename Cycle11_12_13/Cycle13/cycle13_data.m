length = [630
540
510
510
630
690
600
750
780
690
540
690
750
750
690
690];

mean_length = mean(length);
xRescaleFactor = mean_length./length;

amp = [887.2
642.4
885.6
852.6
854.6
679.1
891
510.2
622
818.6
1117
651.3
741.7
899.2
768.1
898.6];


centre = [208.92
220.08
203.49
119.16
280.77
236.43
198.42
320.1
324.9
258.39
147.24
323.1
294.36
307.8
248.73
266.52];

centre_rescale = centre.*xRescaleFactor;

width = [354.6
287.91
254.13
277.83
461.1
660
301.5
448.8
489.3
327
309.6
451.2
453.3
401.1
334.2
325.2];

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
rescalingFactor = 9.964005041510448e-04;%computed from cycle 12
figure;
shadedErrorBar(1:row,means.*rescalingFactor, stdv/sqrt(16).*rescalingFactor,'lineProps','b','patchSaturation',0.05);
