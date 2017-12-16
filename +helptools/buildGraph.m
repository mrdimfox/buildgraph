function [out_figure] = buildGraph(figTitle, x, y, varargin)
%%  buildGraph  simple plot. 
%
%   It can be used for a simple plotting good looking plots. Returns
%   a resulting figure.
%
%   REQUARED ARGS:
%    figTitle                                       title of figure
%    x, y                                           x and y data columns
%   
%   OPTIONAL ARGS:
%    xLabel ['x']                                   x label
%    yLabel ['y']                                   y label
%    xyLim [auto system]                            x and y limints
%    lineStyle [auto detection]                     '-.' or '--' or '-' or ':'
%    marker [auto detection]                        '*' or 'x' or 'o' or '.' ...
%    isColor [false] NOT IMPLEMENTED YET            -
%    color [auto detection] NOT IMPLEMENTED YET     -
%    interpreter ['latex']                          tex, latex or none
%    isNewFig [false]                               use old figure or new one
%    showFig                                        should figure be shown
%
%   [] - default value
%   [auto system] - use embedded matlab defaults
%   [auto detection] - use local alghoritm
%
%   EXAMPLE OF USE:
%    % One plot
%    helptools.buildGraph("helptools.buildGraph1", x, y(:,1));
% 
%    % Two plots
%    helptools.buildGraph("helptools.buildGraph2", x, y(:,2));
%    helptools.buildGraph("", x, y(:,3),...
%                        "isNewFig", false);
%
%    % Hidden two plots
%    helptools.buildGraph("helptools.buildGraph2", x, y(:,2),...
%                         "showPlot", false);
%    helptools.buildGraph("", x, y(:,3),...
%                         "isNewFig", false);
%
optionalArgsProc = {...
    @(p)addRequired(p,    'figTitle');
    @(p)addRequired(p,    'x');
    @(p)addRequired(p,    'y');
    @(p)addParameter(p,   'xyLimits',       []);
    @(p)addParameter(p,   'xLabel',         "x",      @(s)ischar(s));
    @(p)addParameter(p,   'yLabel',         "",       @(s)ischar(s));
    @(p)addParameter(p,   'lineStyle',      "",       @(s)ischar(s));
    @(p)addParameter(p,   'marker',         "",       @(s)ischar(s));
    @(p)addParameter(p,   'interpreter',    'latex',  @(s)ischar(s));
    @(p)addParameter(p,   'isNewFig',       true);
    @(p)addParameter(p,   'showPlot',       true);
};
argsToParse = {};
argsToParse(end+1) = {figTitle};
argsToParse(end+1) = {x};
argsToParse(end+1) = {y};
argsToParse = [argsToParse, varargin];

args = helptools.parseArgs(argsToParse, optionalArgsProc);
    
X = args.x;
Y = args.y;

% Find limits
isXLim = false;
isYLim = false;
xyLim = args.xyLimits;
if isempty(xyLim)
    limSize = size(xyLim);
    if limSize(1) == 2
        isXLim = true;
        isYLim = true;
    elseif limSize(1) == 1
        isXLim = true;
    end
end

global legendList__;
global lineStyleList__;
global markerStyleList__;
global plotNum__;

% Create new figure
if args.isNewFig
    plotNum__ = 0;
    legendList__ = {};
    lineStyleList__ = {'-', '--', ':', '-.'};
    markerStyleList__ = {'o', '+', '*', '.', 'x', 's', 'd',...
                         '^', 'v', '>', '<', 'p', 'h'};

    plotVisible = 'off';
    if args.showPlot
        plotVisible = 'on';
    end
    % Create figure (with magic awsome sizes)
    out_figure = figure('PaperSize',[10 30],...
        'Name', '',...
        'Color', [1 1 1],...
        'Position',[1 1 900 571],...
        'Resize', 'off',...
        'Visible', plotVisible);
    % Create axes (with magic awsome position)
    axes1 = axes('Parent',out_figure,'YGrid','on','XGrid','on',...
        'Position',[0.1 0.15 0.855 0.770],...
        'FontSize',12);
    
    if isXLim
        xlim(axes1,[xyLim(1, 1) xyLim(1, 2)]);
    end
    
    if isYLim
        ylim(axes1,[xyLim(2, 1) xyLim(2, 2)]);
    end
    
    box(axes1,'on');
    hold(axes1,'all');
    title(args.figTitle);
end

if args.lineStyle == "" && args.marker == ""
    lineStyle = '-';
    markerStyle = 'none';
    if ~isempty(lineStyleList__)
        lineStyle = cell2mat(lineStyleList__(1));
        lineStyleList__ = lineStyleList__(2:end);
    else
        markerStyle = cell2mat(markerStyleList__(1));
        markerStyleList__ = markerStyleList__(2:end);
    end

    plot(X, Y,...
         lineStyle,...
         'LineWidth', 1,...
         'Color',     [0 0 0],...
         'Marker',    markerStyle);
        
elseif args.lineStyle ~= "" && args.marker ~= ""
    plot(X, Y,...
         args.lineStyle,...
         'LineWidth', 1,... 
         'Color',     [0 0 0],... 
         'Marker',    args.marker);
        
elseif args.lineStyle ~= ""
    plot(X, Y,...
         args.lineStyle,...
         'LineWidth', 1,...
         'Color',     [0 0 0]);
        
elseif args.marker ~= ""
    plot(X, Y,...
         '-',...
         'LineWidth', 1,...
         'Color',     [0 0 0],...
         'Marker',    args.marker);
end

% Create xlabel
xlabel(args.xLabel, 'FontSize', 14,...
                    'Interpreter', args.interpreter);

% Create ylabel and legend
legendYLabel = args.yLabel;
if args.yLabel == ""
    legendYLabel = sprintf("%s%d", 'y', plotNum__);
    if plotNum__ ~= 0
        args.yLabel = sprintf("%s%d", 'y', plotNum__);
    else
        args.yLabel = 'y';
    end
    plotNum__ = plotNum__ + 1;
end

legendList__(length(legendList__)+1) = {legendYLabel};

if length(legendList__) > 1
    args.yLabel = ' ';
    leg = legend(legendList__{:}, 'Location','Best');
    set(leg, 'interpreter', args.interpreter)
end

ylabel(args.yLabel, 'FontSize', 14,...
                    'Interpreter', args.interpreter);

end