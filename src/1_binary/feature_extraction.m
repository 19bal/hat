function [feature] = feature_extraction(data)
% function [rms, med] = feature_extraction(data)
sz = size(data.X, 2);
for i=1:sz
    ff = preprocessing(data.X(:, i));
    
    rms = compute_rms(ff);
    med = compute_med(ff);
    
    feature.X(:, i) = [rms med]';
    feature.y(i)    = data.y(i);
end
feature.Etiket = {'RMS', 'MED'};

function ff = preprocessing(y)
% % y --> X
%----------------------------------------------------------------------
%3. ad�m:EMG sinyali do�rultulur.

    rec_y = abs(y); 
% rec_y = rec_y / max(rec_y);

% NS
rec_y = rec_y - mean(rec_y);

%4. ad�m: Kesim Frekansi 10 Hz olan al�ak ge�iren bir fitreye gerek
%duyulmaktad�r. Bu �rnek i�in �rnekleme Frekans� 1000 Hz. vefiltrenin
%derecesi 5. dereceden se�ilmi�tir.

[b, a] = butter(5, [5 300]/(0.5*length(y))); 

%5. ad�m: Sinyalin zarf�n� ��karmak i�in sinyal filtrelenecektir.
%Sinyalin herhangi faz kaymas� filtrelenecektir.

filter_y = filtfilt(b, a, rec_y); 

ff = abs((fft(rec_y))).^2;
ff = ff(1: round(length(ff)/2));
ff(1:10) = 0;

function rms = compute_rms(ff)
rms = sqrt(mean(ff));

function med = compute_med(ff)
med = median(ff);

