function [feature] = mfeature_extraction(data, KANAL_SAYISI)

fk = feature_extraction(data{1});
feature.X = fk.X;
feature.y = fk.y;

for k=2:KANAL_SAYISI,
    fk = feature_extraction(data{2});
    feature.X = [feature.X; fk.X];
end

function [feature] = feature_extraction(data)

sz = size(data.X, 2);
for i=1:sz
    ff = preprocessing(data.X(:, i));
    
    rms = feature_rms(ff);
    med = feature_med(ff);
    
    feature.X(:, i) = [rms med]';
    feature.y(i)    = data.y(i);
end

function ff = preprocessing(X)

%EMG verisindeki DC Offsetin kald?r?lmas?

rec_X = abs(X); 
rec_X = rec_X - mean(rec_X);

%sinyalin zarf?n? ??karmak i?in sinyal filtrelenecektir.

[b, a] = butter(5, [5 300]/(0.5*length(X)));
filter_X = filtfilt(b, a, rec_X); 

ff = abs((fft(rec_X))).^2;
ff = ff(1: round(length(ff)/2));
ff(1:10) = 0;

function rms = feature_rms(ff)
rms = sqrt(mean(ff));

function med = feature_med(ff)
med = median(ff);

