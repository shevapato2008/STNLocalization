function [ output_args ] = addPatch(x1, x2, y1, y2)
% function addPatch adds a rectangular grey shaded patch on original graph.

v = [x1 y1; x2 y1; x2 y2; x1 y2];
f = [1 2 3 4];
patch('faces', f, 'Vertices', v, ...
    'FaceColor', 'black', 'FaceAlpha', 0.1, ...
    'EdgeColor', 'black', 'EdgeAlpha', 0.1)

end

