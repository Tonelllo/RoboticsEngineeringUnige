function ret = Laplacian(sd)
    span = ceil(-sd*3):1:ceil(sd*3);
    [x,y] = meshgrid(span);
    result = (1/(2*pi*sd^2))*((x.^2+y.^2-2*sd^2)/sd^4).*exp(-(x.^2+y.^2)/(2*sd^2));
    ret = result;
    figure, surf(x,y,result);

end