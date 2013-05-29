clc;
clear('all');

N    = 500;
Ones = ones(1,N);

% Construct the {x,y} for plotting the bend using polar coordinates and a transformation
rIn    = 1;
rOut   = 2;
rCL    = (rIn + rOut)/2;
theta  = linspace(pi,3*pi/2,N)  ;

[xBendIn  , yBendIn ] = pol2cart(theta , rIn );
[xBendOut , yBendOut] = pol2cart(theta , rOut);
[xBendCL  , yBendCL ] = pol2cart(theta , rCL );

% Begin plotting
figure(1);
clf();
hold('on');

% Plot the inside
plot([-rIn,-rIn,xBendIn,0,1],[1,0,yBendIn,-rIn,-rIn],'Color','k','LineWidth',2);

% Plot the outside
plot([-rOut,-rOut,xBendOut,0,1],[1,0,yBendOut,-rOut,-rOut],'Color','k','LineWidth',2);

% Plot the outside
plot([-rCL,-rCL,xBendCL,0,1],[1,0,yBendCL,-rCL,-rCL],'LineStyle','-.','Color','k','LineWidth',2);

% Axising padding algorithm
LimitsX = get(gca,'XLim');
LimitsY = get(gca,'YLim');
SpanX   = LimitsX(2) - LimitsX(1);
SpanY   = LimitsY(2) - LimitsY(1);
Scale   = 0.2;
ScaleX  = Scale;
ScaleY  = Scale;
LimitsX = LimitsX + [-1,1] * ScaleX * SpanX;
LimitsY = LimitsY + [-1,1] * ScaleY * SpanY;

% Set the axis
axis([LimitsX,LimitsY]);
axis('equal');

% Plot an arrow for dimensioning
quiver(0,0,cos(5*pi/4),sin(5*pi/4),'k','filled');


hold('off');