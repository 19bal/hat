function veri = emg_dataset();
% EMG veri setini uret
DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbtrnm  = strcat(DB_ROOT, dos2lin('data\train\'));
dbtstnm = strcat(DB_ROOT, dos2lin('data\test\'));

emg_dataset2(dbtrnm);
emg_dataset2(dbtstnm);

function emg_dataset2(dbnm) 
T_KAPALI = 50000;
T_ACIK   = 75000;
dbg = false;

if dbg, clc;    close all; end

% El kapali bilgisi: 5000-7500  ornek arasinda 
% El acik bilgisi:   7500-10000 ornek arasinda 

DIR = dir(dbnm);
sz = length(DIR);
j = 0;

for i=1:sz
    if strcmp(DIR(i).name, '.') | strcmp(DIR(i).name, '..') | ...
       strcmp(DIR(i).name, 'veriler.txt') | ...
       strcmp(DIR(i).name, 'EmgTstData.mat') | ...
       strcmp(DIR(i).name, 'EmgTrnData.mat'), 
       continue;  end        
    
    fnm = strcat(dbnm, DIR(i).name);
    tmp = load(fnm);
    
    data_kapali = tmp.data(T_KAPALI:T_ACIK, 2);
    data_acik = tmp.data((T_ACIK) :(T_ACIK+length(data_kapali)-1), 2);
    
    j = j + 1;  data.X(:, j) = data_acik';       data.y(j) = 1;
    j = j + 1;  data.X(:, j) = data_kapali';     data.y(j) = 2;  
 
    if dbg
        subplot(211),   plot(tmp.data(:,1));    axis([0 100000 -2 2]);  grid on;
        subplot(212),   plot(tmp.data(:,2));    axis([0 100000 -2 2]);  grid on;
        %subplot(211),   plot(data_acik);    title('ACIK');      axis([0 2.5e4 -2 2]);
        %subplot(212),   plot(data_kapali);  title('KAPALI');    axis([0 2.5e4 -2 2]);
        pause(.3)
    end
end
data.Etiket = {'ACIK', 'KAPALI'};
savedb(dbnm, data);
