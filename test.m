x = (0:0.3:10)';
y = [x.^2 x.^3 x.^4];
xLabel = 'x label — t';
yLabel = ['y label — \theta'
          'y label — \alpha'
          'y label — \gamma'];

%% One graph
buildGraph([x y(:,1)], xLabel, yLabel(1,:), [0 10, 0 100], 1);

%% A number of graphs
buildGraph([x y(:,1)], xLabel, yLabel(1,:), [0 10, 0 100], 1);
buildGraph([x y(:,2)], xLabel, yLabel(2,:), [0 10, 0 100], 0);
buildGraph([x y(:,3)], xLabel, yLabel(3,:), [0 10, 0 100], 0);