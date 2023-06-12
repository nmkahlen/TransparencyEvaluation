function [] = printScaled(width, height, name, format)
% PRINTSCALED prints the last figure with specified scaling
% ideally choose the dimensions equal to the ones in the final paper
% (or typically a bit larger)
% input: width ... in centimeters
%        height ... in centimeters
%        name ... a string witht the name of the figure, no fileformat
%        formet ... format, either 'png' or 'eps'
% nmk19          

set(gcf, 'paperunits', 'centimeters', 'papersize', [width height],...
    'paperposition', [0 0 width height]);

if strcmp(format, 'png')
    print([name, '.png'], '-dpng')
elseif strcmp(format, 'eps')
    print([name, '.eps'], '-depsc')
    elseif strcmp(format, 'pdf')
    print([name, '.pdf'], '-dpdf')
end

end

