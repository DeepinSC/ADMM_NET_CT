clear;
img = double(imread('rec_image.png'));
theta = 256;
p_start = [-100,-100];
[A,y] = radon_full(img,theta,p_start);
res_A = reshape(A,theta,[]);
res_img = reshape(img,[],1);
x = res_A*res_img;