function res = convLOG(img, filter)
    res = conv2(filter, img, 'same');
    figure, imagesc(res), colormap gray;
end