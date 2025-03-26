function t_areaPlot
% Generate an area plot using the default plotlab recipe.
%
% Syntax:
%   t_areaPlot
%
% Description:
%    Demonstrates how to generate an area plot using the default plotlab
%    recipe only overriding the ccolorOrder and figure size).
%
% Inputs:
%    None.
%
% Outputs:
%    None.
%
% Optional key/value pairs:
%    None.
%

% History:
%    03/21/20  NPC  Wrote it

% Get the demo data to plot
% [R, G, B, lambda] = getData();
thisDisplay = displayCreate;
displayGet(thisDisplay,'spd');
RGB = displayGet(thisDisplay,'spd');
wave = displayGet(thisDisplay,'wave');
R = RGB(:,1); G = RGB(:,2); B = RGB(:,3);

% Colors for the L-, M-, and S-cone nomograms
LMSconeColors = [...
    1.0 0.2 0.4; ...
    0.1 1.0 0.4; ...
    0.5 0.1 0.8];

% Instantiate a plotlab object
plotlabOBJ = plotlab();

% Apply the default plotlab recipe overriding
% the color order and the figure size
plotlabOBJ.applyRecipe(...
    'colorOrder', LMSconeColors, ...
    'figureWidthInches', 8, ...
    'figureHeightInches', 8);

% New figure
ieFigure; clf; hold on;

% Area plots filled with the LMSconeColors
% The first area plot is filled with the first LMSconeColor,
% the second plot with the second etc.
% minAbsorbance = 0.01;
% lambda = 0.5;
area(wave, R); hold on;
area(wave, G); hold on;
area(wave, B); hold on;

% Axes limits and ticks
set(gca, 'XLim', [400 780], 'XTick', 350:50:850);

% Labels
xlabel('\it Wavelength (nm)'); ylabel('\it Radiance (watts/sr/nm/m^2');

% Legend
legend({'R', 'G', 'B'},'location','northeast');

% Reposition the legend
% plotlabOBJ.repositionLegend(lHandle, [0.78 0.77]);

% Title
% title(sprintf('Stockman-Sharpe cone nomograms'));

% Export the figure to the gallery directory in PNG format
% plotlabOBJ.exportFig(hFig, 'png', 'displayRGB', 'gallery');
end

