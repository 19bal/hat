% data = emg_dataset();
clc;    close all;  clear all;

DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbfnm = strcat(DB_ROOT, dos2lin('test\EmgTstData.mat'));
load(dbfnm);

feature = feature_extraction(data);

load emg_svm;
y = svmclass(feature.X, model);

Etiket = [data.Etiket(data.y'); data.Etiket(y')]'

err = mean(abs(data.y - y).^2)
