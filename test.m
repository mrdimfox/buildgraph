x = (0:1:10)';
y1 = x.^2;
y2 = x.^3;
y3 = x.^4;

buildGraph([x y1], 'x label — t', 'y label — \theta', [0 10, 0 100], 1);
buildGraph([x y2], 'x label — t', 'y label — \alpha', [0 10, 0 100], 0);
buildGraph([x y3], 'x label — t', 'y label — \gamma', [0 10, 0 100], 0);