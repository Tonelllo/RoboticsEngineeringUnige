function r = ZeroCrossing(img)
edges = zeros(365,488);
    for y=1:365
        for x=1:487
            if img(y,x) ~= img(y,x+1)
                edges(y,x) = 256;
            end
        end
    end
    for y=1:364
        for x=1:488
            if img(y,x) ~= img(y+1,x)
                edges(y,x) = 256;
            end
        end
    end
    r = edges;
    figure, imagesc(edges), colormap gray;
end