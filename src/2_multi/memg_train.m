% data = memg_dataset();
clc;    close all;  clear all;
k_sayi=2;
dbfnm = 'data\train\EmgTrnData.mat';
load(dbfnm);
tmp=data;
for i=1:k_sayi
    if i==1
        data=tmp.k1;
        feature = mfeature_extraction(data);
        kanal_feature.k1=feature;
    else
        data=tmp.k2;
        feature = mfeature_extraction(data);
        kanal_feature.k2=feature;
    end
end
save emg_feature kanal_feature;
options.solver = 'imdm'; % 
options.ker = 'rbf'; % use RBF kernel
options.arg = 1; % kernel argument
options.C = 10; % regularization constant

model =bsvm2(feature,options); % training
save emg_svm model;

figure;
ppatterns(feature);
ppatterns(model.sv.X,'ko',12);
pboundary(model);