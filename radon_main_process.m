clear;
img = double(imread('rec_image.png'));
theta = 900;
p_start = [-100,-100];
[A,x] = radon_full(img,theta,p_start);
res_A = reshape(A,theta,[]);
res_img = reshape(img,[],1);
y_pro = res_A'*x;
image(reshape(y_pro,[],256));
