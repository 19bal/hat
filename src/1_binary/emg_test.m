% data = emg_dataset();
clc;    close all;  clear all;
dbfnm = 'data\test\EmgTstData.mat';
load(dbfnm);

feature = feature_extraction(data);

load emg_svm;
y = svmclass(feature.X, model);

Etiket = [data.Etiket(data.y'); data.Etiket(y')]'

err = mean(abs(data.y - y).^2)
