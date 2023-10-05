img = imread("boccadasse.jpg");

load data.mat;

bwimg = rgb2gray(img);

height = size(bwimg,1);
width = size(bwimg, 2);

warpedimg = zeros(height, width);

for y=1:height
    for x=1:width
        ly = round(y+YD(y,x));
        lx = round(x+XD(y,x));
        if ly > 0 && lx > 0 && ly < height && lx < width
            warpedimg(y,x) = bwimg(ly,lx);
        end
    end
end
figure, imagesc(warpedimg), colormap gray, title("without interpolation")

[X,Y] = meshgrid(1:width,1:height);
figure, imagesc(griddata(X, Y, double(bwimg), X+XD, Y+YD, 'linear')), colormap gray, title("with interpolation")

%figure,imagesc(griddata(X,Y,double(IN),Xn,Yn,'linear')),colormap gray,title('backward warping')
