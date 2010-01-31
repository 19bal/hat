function veri = memg_dataset();
% EMG veri setini uret
% 
% Aciklama:
% 
% 1. binary siniflandirma 
% 2. veri setinde dort (4) hareket var (HAREKET_SAYISI = 4)
% 3. veri setindeki TUM durumlar alinacak
%    `DB_ROOT/readme` dosyasina bakin
HAREKET_SAYISI = 4;
KANAL_SAYISI   = 2;

DB_ROOT = '/home/nurettins/proje/db/emg/4hareket/islenmis/';
dbtrnm  = strcat(DB_ROOT, dos2lin('train\'));
dbtstnm = strcat(DB_ROOT, dos2lin('test\'));

dbg = false;
emg_dataset2(dbtrnm,  HAREKET_SAYISI, KANAL_SAYISI, dbg);
emg_dataset2(dbtstnm, HAREKET_SAYISI, KANAL_SAYISI, dbg);

function emg_dataset2(dbnm, HAREKET_SAYISI, KANAL_SAYISI, dbg)

if dbg, clc;    close all; end

data.Etiket = {'YUKARI','ASAGI','KAPALI','SERBEST'};
YUKARI  = 1;
ASAGI   = 2;
KAPALI  = 3;
SERBEST = 4;

% dosya paterni ('m*.mat') icin `DB_ROOT/readme` bakin
DIR = dir(strcat(dbnm, 'm*.mat'));
fsz = length(DIR);
j = 0;

for k=1:KANAL_SAYISI,
 for i=1:fsz,
    fnm = strcat(dbnm, DIR(i).name);
    tmp = load(fnm);
    
    % TUM durumlarin koordinatlarini al
    % bu dosyanin girisindeki aciklamayi oku
    dsz = size(tmp.data, 1);
    W = floor(dsz/HAREKET_SAYISI);
    T_YUKARI  = 0 * W + 1;
    T_ASAGI   = 1 * W + 1;
    T_KAPALI  = 2 * W + 1;
    T_SERBEST = 3 * W + 1;
    
    data_yukari  = tmp.data(T_YUKARI  : (T_ASAGI-1), k); 
    data_asagi   = tmp.data(T_ASAGI   : (T_ASAGI   + length(data_yukari) - 1), k);
    data_kapali  = tmp.data(T_KAPALI  : (T_KAPALI  + length(data_yukari) - 1), k);
    data_serbest = tmp.data(T_SERBEST : (T_SERBEST + length(data_yukari) - 1), k);

    j = j + 1;  data.X(:, j) = data_yukari';      data.y(j) = YUKARI;
    j = j + 1;  data.X(:, j) = data_asagi';       data.y(j) = ASAGI;  
    j = j + 1;  data.X(:, j) = data_kapali';      data.y(j) = KAPALI;
    j = j + 1;  data.X(:, j) = data_serbest';     data.y(j) = SERBEST; 
 end
    if k==1
        kanal.k1=data;
      j = 0;
    else
        kanal.k2=data;
    end
     
    if dbg
        subplot(511),   plot(tmp.data(:,2));                    grid on;    axis([0 dsz -2 2]);  
        subplot(512),   plot(data_BILEK_Y);   title('YUKARI');  grid on;    axis([0 2.5e4 -2 2]);
        subplot(513),   plot(data_BILEK_A);   title('ASAGI');   grid on;    axis([0 2.5e4 -2 2]);
        subplot(514),   plot( data_EL_K );    title('KAPALI');  grid on;    axis([0 2.5e4 -2 2]);
        subplot(515),   plot( data_EL_A);     title('SERBEST'); grid on;    axis([0 2.5e4 -2 2]);
        pause(.3)
     end
 end

savedb(dbnm, kanal);
