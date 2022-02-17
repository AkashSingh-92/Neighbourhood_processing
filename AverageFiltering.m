clc;
clear all;

% f1=[10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    10 10 10 10 10 10 10 10;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200;...
%    200 200 200 200 200 200 200 200];

f1=imread('cameraman.tif');

f=imnoise(f1,'gaussian');  %adding Gaussian noise to original image

w=[1 1 1;1 1 1;1 1 1]/9;    % Average filtering mask

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

figure(1),imshow(f1),title('Original image')
figure(2),imshow(f),title('Image With Gaussian noise')
figure(3),imshow(g),title('Average Filtered Image')