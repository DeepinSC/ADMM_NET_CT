function Gen_traindata_CT( )
config;
ND = nnconfig.DataNmber;
%% Load samping pattern 
%load('./mask/mask_20.mat')
%save(strcat('./EDmask' , '.mat'), 'mask');
for i = 1:1:ND 
dir = 'data/ChestTrain/im-';
load (strcat(dir , saveName(i,floor(log10(ND)))));
theta = 900;
p_start = [-100,-100];
%kspace_full = fft2(im_ori); 
%y = (double(kspace_full)) .* (ifftshift(mask));
[A,x] = radon_full(im_ori,theta,p_start);
res_A = reshape(A,theta,[]);
res_A = sum(res_A);
%res_img = reshape(im_ori,[],1);
y = reshape(res_A,[],256);

data.train = y;
data.label = im_ori;
save(strcat('data/ChestTrain_sampling_CT/', saveName(i, 2), '.mat'), 'data');
end