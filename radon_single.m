function [A,x] = radon_single(img,p_start,p_end)
% img 输入图片
% p_start 起始点(x0,y0)
% p_end 终止点(x1,y1)
% 

[length,width] = size(img);
A = zeros(length,width);
x = 0;

x1 = p_start(1);
y1 = p_start(2);
x2 = p_end(1);
y2 = p_end(2);

if x1==x2
    if x1<0 || x1>length
        A = A;
        x = x;
    else 
        A(:,ceil(x1)) = double(img(:,ceil(x1)));
        x = sum(double(img(:,ceil(x1))));
    end
end
% y = kx+b
% x = (y-b)/k
k = (y2-y1)/(x2-x1);
b = (y1*x2-y2*x1)/(x2-x1);
% x交点
x_axis = 0:length;
y_axis = zeros(1,length+1);
pt = [];
for i = 1:size(x_axis,2)
    if 0<(k*x_axis(i)+b) && length>=(k*x_axis(i)+b)
        y_axis(i) = (k*x_axis(i)+b);
        pt = [pt,[x_axis(i);y_axis(i)]];
    end
end
% y交点
y_axis = 0:width;
x_axis = zeros(1,width+1);
for i = 1:size(y_axis,2)
    if 0<(y_axis(i)-b)/k && width>=(y_axis(i)-b)/k
        x_axis(i) = (y_axis(i)-b)/k;
        pt = [pt,[x_axis(i);y_axis(i)]];
    end
end
% pt代表和坐标轴的交点
pt = sort(pt,2);

% 算每格的线段的长度
for i = 1:size(pt,2)-1
    pt_s = pt(:,i);
    pt_e = pt(:,i+1);
    A(ceil(pt_e(1)),ceil(pt_e(2))) = norm(pt_e-pt_s);
end
A = A.*double(img);
x = sum(sum(A));
end