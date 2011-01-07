% data = memg_dataset();
clc;    close all;  clear all;

DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbfnm = strcat(DB_ROOT, dos2lin('test\EmgTstDataMulti.mat'));
load(dbfnm);

KANAL_SAYISI = 2;
feature = mfeature_extraction(data, KANAL_SAYISI);

load emg_svm;
y = svmclass(feature.X, model);

Etiket = [data{1}.Etiket(data{1}.y'); data{1}.Etiket(y')]'

% err = mean(abs(data.y - y).^2)
hata=cerror(y,data{1}.y)
