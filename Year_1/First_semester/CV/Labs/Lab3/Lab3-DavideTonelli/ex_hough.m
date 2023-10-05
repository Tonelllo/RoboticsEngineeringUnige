%%%Standard Hough Transform (SHT) 
function myHough(img, peaks, check)
im=img;
%im=imread('left_#290gray.bmp');
%im=im';
figure,imshow(im)
I=double(im);
[rr,cc]=size(I);

%%%Edge detection
BW = edge(I,'sobel');
figure,imshow(BW)

%%%Hough transform
[H,T,R] = hough(BW);%H:   the Hough transform matrix;
                    %T,R: the values over which the Hough transform matrix
                    %was generated
figure,imagesc(H),colormap pink

%%%Identify peaks in Hough transform
if check 
P  = houghpeaks(H,peaks);%5 is  the maximum number of peaks to identify
                     %P  row and column coordinates of the peaks
else
P = houghpeaks(H,peaks,"NHoodSize",[21,21]);
end
%H
figure,imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
colormap pink
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%peaks
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','yellow');

%%%Compute straight lines and plot them
figure, imshow(BW), hold on
for k=1:length(P)
    if T(P(k,2))>-45 && T(P(k,2))<45
        x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
        x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
        plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
    else
        y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
        y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
        plot([1,rr],[y1 y2],'LineWidth',2,'Color','red');
    end
end

%%%Find line segments and plot them
lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30);
figure, imshow(im), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
end