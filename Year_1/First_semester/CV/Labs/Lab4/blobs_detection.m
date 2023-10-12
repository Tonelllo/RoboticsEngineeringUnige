%Lindeberg (1998): extrema in the Laplacian of Gaussians (LoG).
function blobs_detection(imgname, sigma, scales)
img=imread(imgname);
[h,w]=size(img);

%sigma=2;%standard deviation of LoG
n=scales;%5;%number of scales
scale_space = zeros(h,w,n);

for ii=1:n
    filt_size =  2*ceil(3*sigma)+1; % filter size
    LoG       =  sigma^2 * fspecial('log', filt_size, sigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate');
    scale_space(:,:,ii)=abs(imFiltered);
    
    radii(ii)=sigma;
    sigma=2*sigma;
end

%non-maxima suppression in scale-space
v=2;
vv=-v:v;
scale_space_nomax  = zeros(h,w,n);
for ii=1:n
    TMP=scale_space(:,:,ii);
    for hh=(1+v):1*v:(h-v)
        for ww=(1+v):1*v:(w-v) %non-maxima suppression in 2D spatial slice @fixed scale
            tmp=TMP(hh+vv,ww+vv);
            [m,i]=max(tmp(:));
            a=zeros(length(vv));
            if m>55, a(i)=m;end
            TMP(hh+vv,ww+vv)=a;
            scale_space_nomax(hh+vv,ww+vv,ii)=a;
        end
    end
    v=2*v;
    vv=-v:v;
end

blobs=zeros(h,w); 
for ii=1:h
    for jj=1:w
        tmp=scale_space_nomax(ii,jj,:); %non-maxima suppression in scale 
        [m,i]=max(tmp);
        if m>55, blobs(ii,jj)=radii(i);end
    end
end

[row,col,val] = find(blobs);

figure
show_all_circles(img, col, row, 1.41*val, 'r', 1);
end
