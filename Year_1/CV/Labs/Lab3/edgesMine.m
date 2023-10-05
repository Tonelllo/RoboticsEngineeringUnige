function rete = edgesMine(im)
rete = im > 0.9;
        figure, imagesc(rete), colormap gray
end