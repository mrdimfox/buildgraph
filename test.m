x = (0:0.3:10)';
y = [x.^2 x.^3 x.^4];
xLabel = 'x label — t';
yLabel = ['y label — \theta'
          'y label — \alpha'
          'y label — \gamma'];

%% *****************************
%% buildGraphA test
% One graph
buildGraphA([x y(:,1)], xLabel, yLabel(1,:), [0 10, 0 100], 1);

% A number of graphs
buildGraphA([x y(:,1)], xLabel, yLabel(1,:), [0 10, 0 100], 1);
buildGraphA([x y(:,2)], xLabel, yLabel(2,:), [0 10, 0 100], 0);
buildGraphA([x y(:,3)], xLabel, yLabel(3,:), [0 10, 0 100], 0);

%% *****************************
%% buildGraph test
% One graph
config = struct();
config.xy = [x y(:,1)];
config.xLabel = xLabel;
config.yLabel = yLabel(1,:);
config.xyLim = [0 10; 
                0 100];

buildGraph('Graph1', config, true);

% A number of graphs
buildGraph('Graph2', config, true);

config.xy = [x y(:,2)];
config.yLabel = yLabel(2,:);
buildGraph('', config);

config.xy = [x y(:,3)];
config.yLabel = yLabel(3,:);
buildGraph('', config);