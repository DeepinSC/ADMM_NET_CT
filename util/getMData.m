function data = getMData (n)
config;
size = nnconfig.ImageSize;
ND = nnconfig.DataNmber;
data.train = single(zeros(size));
data.label = single (zeros(size));
dir = '.\data\ChestTrain_sampling_CT\';
load (strcat(dir , saveName(n,floor(log10(ND)))));
