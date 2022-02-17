clc;
clear all;

% f=[10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200]
f=double(imread('cameraman.tif'));


w=[-1 -1 -1;-1 8.5 -1;-1 -1 -1];    % high pass filtering mask

[row,col]=size(f);

g=f; %making the extreme pixels same as original image

for x=2:1:row-1
    for y=2:1:col-1
        g(x,y)=f(x-1,y-1)*w(1,1)+f(x-1,y)*w(1,2)+f(x-1,y+1)*w(1,3)+...
            f(x,y-1)*w(2,1)+f(x,y)*w(2,2)+f(x,y+1)*w(2,3)+...
            f(x+1,y-1)*w(3,1)+f(x+1,y)*w(3,2)+f(x+1,y+1)*w(3,3);
    end
end

%g

figure(1),imshow(uint8(f)),title('Original image')
figure(2),imshow(uint8(g)),title('High pass Filtered Image')