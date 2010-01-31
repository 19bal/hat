function veri = emg_dataset();
% EMG veri setini uret
% 
% Aciklama:
% 
% 1. binary siniflandirma 
% 2. veri setinde dort (4) hareket var (HAREKET_SAYISI = 4)
% 3. veri setinden sadece "kapali (2)" ve "serbest (3)" durumlar alinacak
%    `DB_ROOT/readme` dosyasina bakin
HAREKET_SAYISI = 4;

DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbtrnm  = strcat(DB_ROOT, dos2lin('train\'));
dbtstnm = strcat(DB_ROOT, dos2lin('test\'));

dbg = false;
emg_dataset2(dbtrnm,  HAREKET_SAYISI, dbg);
emg_dataset2(dbtstnm, HAREKET_SAYISI, dbg);

function emg_dataset2(dbnm, HAREKET_SAYISI, dbg)

if dbg, clc;    close all; end

data.Etiket = {'KAPALI', 'SERBEST'};
KAPALI  = 1;
SERBEST = 2;

% dosya paterni ('m*.mat') icin `DB_ROOT/readme` bakin
DIR = dir(strcat(dbnm, 'm*.mat'));
fsz = length(DIR);
j = 0;

for i=1:fsz
    fnm = strcat(dbnm, DIR(i).name);
    tmp = load(fnm);
    
    % kapali ve serbest durumlarin koordinatlarini al
    % dosyanin girisindeki aciklamayi oku
    dsz = size(tmp.data, 1);
    W = floor(dsz/HAREKET_SAYISI);
    T_KAPALI  = 2 * W + 1;
    T_SERBEST = 3 * W + 1;

    
    data_kapali  = tmp.data(T_KAPALI:(T_SERBEST-1), 2);
    data_serbest = tmp.data((T_SERBEST) :(T_SERBEST+length(data_kapali) - 1), 2);
    
    j = j + 1;  data.X(:, j) = data_kapali';    data.y(j) = KAPALI;
    j = j + 1;  data.X(:, j) = data_serbest';   data.y(j) = SERBEST;
 
    if dbg
        subplot(211),   plot(tmp.data(:,1));    axis([0 dsz -2 2]);  grid on;
        subplot(212),   plot(tmp.data(:,2));    axis([0 dsz -2 2]);  grid on;
        %subplot(211),   plot(data_kapali);  title('KAPALI');    axis([0 2.5e4 -2 2]);
        %subplot(212),   plot(data_serbest); title('SERBEST');   axis([0 2.5e4 -2 2]);
        pause(.3)
    end
end
savedb(dbnm, data);
