%% raw data
unatt = [-0.6360424028268525, 9.38007303694723
15.90106007067137, 14.368466963348467
33.71024734982331, 11.475375903721343
49.61130742049469, 12.45472152815767
65.51236749116609, 21.132811922468477
82.0494699646643, 27.794846016233723
98.58657243816253, 28.09704747401571
114.48763250883391, 25.059656696778394
131.66077738515898, 16.98596921803155
148.19787985865722, 14.945074441503913
164.09893992932862, 11.238227597320993
180.63604240282686, 11.875157088575783];

att = [0, 7.196652719665273
15.90106007067137, 8.343362360838015
32.43816254416961, 8.64556381861999
48.975265017667844, 14.470777828703227
64.87632508833923, 27.332968641424078
81.41342756183744, 34.83182281887134
98.58657243816253, 36.7999763443086
115.75971731448763, 27.220012714934136
131.02473498233212, 16.6589292842675
147.56183745583039, 11.605482206484623
163.46289752650176, 6.727087245146883
181.27208480565372, 7.348640536984199];

x = unatt(:,1);
y = unatt(:,2);
y = y ./ sum(y);
ufit = fitVonMises(x,y,90);

x = att(:,1);
y = att(:,2);
y = y ./ sum(y);
afit = fitVonMises(x,y,90);

%% figure
cmap = colorblindmap/255;
h = figure(1); clf; hold on
% plot(ufit.xSmooth,ufit.yFitSmooth*sum(unatt(:,2)),'-','Color',cmap(1,:));
p1 = plot(unatt(:,1),unatt(:,2),'-o','Color',cmap(1,:),'MarkerFaceColor',cmap(1,:),'MarkerEdgeColor','w','MarkerSize',10);

% plot(ufit.xSmooth,ufit.yFitSmooth*sum(unatt(:,2))*1.35-7,'-','Color',cmap(7,:));
% plot(ufit.xSmooth,ufit.yFitSmooth*sum(att(:,2)),'-','Color',cmap(7,:));
p2 = plot(att(:,1),att(:,2),'-o','Color',cmap(7,:),'MarkerFaceColor',cmap(7,:),'MarkerEdgeColor','w','MarkerSize',10);

axis([0 180 0 40]);

legend([p1 p2],{'Unattended','Attended'});

set(gca,'XTick',0:20:180);
set(gca,'YTick',[0 40]);

xlabel('Orientation');
ylabel('Response (spikes / s)');

drawPublishAxis('figSize=[20,15]','poster=1');

savepdf(h,fullfile('~/proj/dissertate/defense/martinez_fig_unedited.pdf'));