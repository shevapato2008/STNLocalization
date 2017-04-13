function [ output_args ] = saveFigure(handle, fileName)
% saveFigure 
%   Saves figure specified by `handle` as `fileName` in fullscreen
%   as to get around the stupid behavior.
%   source: https://gist.github.com/corydolphin/5027957

    screen_size = get(0, 'ScreenSize');
    
    % grab original on screen size
    origSize = get(handle, 'Position');
    
    % set to screen size
    set(handle, 'Position', [0 0 screen_size(3) screen_size(4)]);
    
    % set paper position for printing
    set(handle,'PaperPositionMode','auto')
    
    % save figure
    saveas(handle, fileName)
    
    % set back to original dimensions
    set(handle, 'Position', origSize)

end