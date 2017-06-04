function [A,x] = radon_full(img,theta,p_start)
% img 输入图片
% theta 角度（个数）
% p_start 起始点(x0,y0)
[length,width] = size(img);
A = zeros(theta,length,width);
x = zeros(theta,1);


if 0<p_start(2)&& p_start(2)<width &&  0<p_start(1) && p_start(1)<length
    error('初始点在图像内部');
end

if theta<=0
    error('角度个数非法');
end
x0 = p_start(1);
y0 = p_start(2);
[p_end1,p_end2] = get_end_line(x0,y0,length,width);
p_end_total = [linspace(p_end1(1),p_end2(1),theta);linspace(p_end1(2),p_end2(2),theta)];
for i = 1:size(p_end_total,2)
    [A(i,:,:),x(i)]=radon_single(img,p_start,p_end_total(:,i));
end

end

function [p_end1,p_end2] = get_end_line(x0,y0,length,width) %获得终点对应的直线的端点
p_end1 = zeros(2,1);
p_end2 = zeros(2,1);
if (x0<0 && y0<0) || (x0>length && y0>width)
    p_end1 = [-x0,2*width-y0];
    p_end2 = [2*length-x0,-y0];
end

if (x0>length && y0<0) || (x0<0 && y0>width)
    p_end1 = [-x0,-y0];
    p_end2 = [2*length-x0,2*width-y0-y0];
end 

if 0<x0 && x0<length && y<0
    h = -y0;
    s = x0;
    p_end1 = [-(s/h)*width,width];
    s = length-x0;
    p_end2 = [length+(s/h)*width,width];
end

if 0<y0 && y0<width && x0>length
    h = x0-length;
    s = y0;
    p_end1 = [0,-(s/h)*length];
    s = width-y0;
    p_end2 = [0,width+(s/h)*length];
end

if 0<x0 && x0<length && y0>width
    h = y0-width;
    s = x0;
    p_end1 = [-(s/h)*width,0];
    s = length-x0;
    p_end2 = [length+(s/h)*width,0];
end

if 0<y0 && y0<width && x0<0
    h = -x0;
    s = y0;
    p_end1 = [length,-(s/h)*length];
    s = width-y0;
    p_end2 = [length,width+(s/h)*length];
end
end