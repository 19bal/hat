% data = emg_dataset();
clc;    close all;  clear all;

dbfnm = strrep('..\..\..\data\train\EmgTrnDataBinary.mat', '\', filesep);
load(dbfnm);

feature = feature_extraction(data);
save emg_feature feature;

options.solver = 'imdm';
model = bsvm2(feature, options);
save emg_svm model;

figure; xlabel(char(feature.Etiket(1)));  ylabel(char(feature.Etiket(2)));  title('Feature Space'); 
ppatterns(feature);
ppatterns(model.sv.X,'ko',12);
pboundary(model);
legend(char(data.Etiket(1)), char(data.Etiket(2)));
