function [A,x] = radon_rotate(img,theta,p_start,ro_theta)
% img����ͼ��
% theta Դ���߱仯�Ƕȸ���
% p_start ��ʼλ��
% ro_theta Դ��ת�Ƕȸ���

[length,width] = size(img);
center = [length/2,width/2];
