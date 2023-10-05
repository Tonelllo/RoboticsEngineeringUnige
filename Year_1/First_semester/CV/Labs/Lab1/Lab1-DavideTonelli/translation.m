img = imread("boccadasse.jpg");

%figure,imagesc(img), colormap gray

bwimg = rgb2gray(img);

height = size(bwimg,1);
width = size(bwimg, 2);
dtrans = [round(height/2), round(width/2)];

%trans = zeros(height, width);

for y=1:height 
    for x=1:width
        if x-dtrans(2) > 0 && y-dtrans(1) > 0 && x-dtrans(2) <= width && y-dtrans(1) <= height  
            trans(y, x) = img(y-dtrans(1), x - dtrans(2));
        end
    end
end

figure, imagesc(trans), colormap gray