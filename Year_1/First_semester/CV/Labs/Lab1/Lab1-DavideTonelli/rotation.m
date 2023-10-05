img = imread("boccadasse.jpg");

%figure,imagesc(img), colormap gray

bwimg = rgb2gray(img);

height = size(bwimg,1);
width = size(bwimg, 2);
teta = 0.7;
rotatedImage = zeros(height, width);
%b(x',y') = b(x cos - y sin, x sin + y cos)

xRemap = zeros(height, width);
yRemap = zeros(height, width);

for y=1:height
    for x=1:width
        oldx = round((x - width/2) * cos(teta) + (y - height/2) * sin(teta) + width/2); % - width/2, - height/2 per portarlo al centro e + weidth/2 per riportarlo nell'angolo
        oldy = round((x - width/2) * -sin(teta) + (y - height/2) * cos(teta) + height/2);

        xRemap(y,x) = oldx;% forse qua devi dare il calcolo di prima senza il round
        yRemap(y,x) = oldy;
        if oldx > 0 && oldy > 0 && oldx <= width && oldy <= height
            rotatedImage(y,x) = bwimg(oldy, oldx);
        end
    end
end

%without using interpolation
figure, imagesc(rotatedImage), colormap gray, title("without interpolation")

%using interpolation
[X,Y] = meshgrid(1:width, 1:height);
figure, imagesc(griddata(X, Y, double(bwimg), xRemap, yRemap, 'linear')), colormap gray, title("with interpolation")