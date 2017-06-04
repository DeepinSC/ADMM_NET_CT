function [A_res,y_res] = radon_rotate(img,theta,p_start,ro_theta)
% img����ͼ��
% theta Դ���߱仯�Ƕȸ���
% p_start ��ʼλ��
% ro_theta Դ��ת�Ƕȸ���(������ʼ�㣩

point = zeros(ro_theta,2);
y_res = zeros(theta,ro_theta);
A_res = zeros(ro_theta,theta,size(reshape(img,[],1),1));
[length,width] = size(img);
center = [length/2,width/2]; %ͼ�������
R = norm(p_start-center);
gamma = 2*pi/ro_theta; %ÿ����ת�Ƕ�
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