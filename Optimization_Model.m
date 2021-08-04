function [fitresult, gof] = createFits(Inb, Ub)

% Optimization Code Generate to Matlab (Curve Fitting)

fitresult = cell( 4, 1 );
gof = struct( 'sse', cell( 4, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: '(Tamiya,H,. 1953)'.
[xData, yData] = prepareCurveData( Inb, Ub );

% Set up fittype and options.
ft = fittype( '(Umax.*x)./(ki+x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.254282178971531 0.814284826068816];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', '(Tamiya,H,. 1953)' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{1}, xData, yData );
legend( h, 'Ub vs. Inb', '(Tamiya,H,. 1953)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{1}, xData, yData, 'residuals' );
legend( h, '(Tamiya,H,. 1953) - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

%% Fit: 'Proposed Model'.
[xData, yData] = prepareCurveData( Inb, Ub );

% Set up fittype and options.
ft = fittype( '(Umax.*x)./(3.2 + x + x*0.05)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.473288848902729;

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Proposed Model' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{2}, xData, yData );
legend( h, 'Ub vs. Inb', 'Proposed Model', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{2}, xData, yData, 'residuals' );
legend( h, 'Proposed Model - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

%% Fit: '(Molina Grima, E,. 1993)'.
[xData, yData] = prepareCurveData( Inb, Ub );

% Set up fittype and options.
ft = fittype( '(Umax*((x).^1.05))./((ki+x).^1)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.285839018820374 0.757200229110721];

% Fit model to data.
[fitresult{3}, gof(3)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', '(Molina Grima, E,. 1993)' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{3}, xData, yData );
legend( h, 'Ub vs. Inb', '(Molina Grima, E,. 1993)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{3}, xData, yData, 'residuals' );
legend( h, '(Molina Grima, E,. 1993) - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

%% Fit: '(Van Oorchot,J,. 1955)'.
[xData, yData] = prepareCurveData( Inb, Ub );

% Set up fittype and options.
ft = fittype( '((Umax*(1-exp(-x./6))))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.0539501186666071;

% Fit model to data.
[fitresult{4}, gof(4)] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', '(Van Oorchot,J,. 1955)' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult{4}, xData, yData );
legend( h, 'Ub vs. Inb', '(Van Oorchot,J,. 1955)', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult{4}, xData, yData, 'residuals' );
legend( h, '(Van Oorchot,J,. 1955) - residuals', 'Zero Line', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inb', 'Interpreter', 'none' );
ylabel( 'Ub', 'Interpreter', 'none' );
grid on