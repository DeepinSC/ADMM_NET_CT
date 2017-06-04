function [A_res,y_res] = radon_rotate(img,theta,p_start,ro_theta)
% img输入图像
% theta 源射线变化角度个数
% p_start 起始位置
% ro_theta 源旋转角度个数(包含初始点）

point = zeros(ro_theta,2);
y_res = zeros(theta,ro_theta);
A_res = zeros(ro_theta,theta,size(reshape(img,[],1),1));
[length,width] = size(img);
center = [length/2,width/2]; %图像的中心
R = norm(p_start-center);
gamma = 2*pi/ro_theta; %每次旋转角度
theta0 = atan((center(2)-p_start(2))/(center(1)-p_start(1)));

for i = 1:ro_theta
    point(i,1) = center(1)-R*sin(theta0+gamma*(i-1));
    point(i,2) = center(2)-R*cos(theta0+gamma*(i-1));
end
for i = 1:ro_theta
   [A,y] = radon_full(img,theta,point(i,:)); 
   res_A = reshape(A,theta,[]);
   A_res(i,:,:) = res_A;
   y_res(:,i) = y;
end
end