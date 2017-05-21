x = (0:1:10)';
y = x.^2;

buildGraph([x y], 'x label — t', 'y label — \theta', [0 10, 0 100], 1);