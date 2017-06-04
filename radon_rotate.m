function [A,x] = radon_rotate(img,theta,p_start,ro_theta)
% img输入图像
% theta 源射线变化角度个数
% p_start 起始位置
% ro_theta 源旋转角度个数

[length,width] = size(img);
center = [length/2,width/2];
