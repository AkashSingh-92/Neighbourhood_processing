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

f=imnoise(f1,'salt & pepper');  %adding Salt & papper noise to original image

[row,col]=size(f);

g=f; %making the extreme pixels same as original image

for x=2:1:row-1
    for y=2:1:col-1
       temp=[ f(x-1,y-1) f(x-1,y) f(x-1,y+1) f(x,y-1) f(x,y) f(x,y+1) f(x+1,y-1) f(x+1,y) f(x+1,y+1)];  %collecting 9 values
       temp1=sort(temp);    %sorting 9 values
       g(x,y)=temp1(5);      %taking median value
    end
end

%g

figure(1),imshow(f1),title('Original image')
figure(2),imshow(f),title('Image with Salt & papper noise')
figure(3),imshow(g),title('median Filtered Image')