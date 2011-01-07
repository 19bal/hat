% data = memg_dataset();
clc;    close all;  clear all;

DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbfnm = strcat(DB_ROOT, dos2lin('train\EmgTrnDataMulti.mat'));
load(dbfnm);

KANAL_SAYISI = 2;
feature = mfeature_extraction(data, KANAL_SAYISI);

options.solver = 'imdm'; % 
options.ker = 'rbf'; % use RBF kernel
options.arg = 1; % kernel argument
options.C = 10; % regularization constant

model = bsvm2(feature, options); % training
save emg_svm model;

figure;
ppatterns(feature);
ppatterns(model.sv.X,'ko',12);
pboundary(model);