% segmentasyon
% j. segmenin t ve X degerleri
%   segmen(j).X
%   segmen(j).t

clear all;  close all;  clc;

Fs = 10000;         % Hz
ws_muap = 6e-3;     % sn
WS = Fs * ws_muap;   WS2 = round(WS/2);

dbg = true;
dbnm_mat = pathos('_db/mat/');      	% bir onceki asamadaki veriyi kopyala

fnm_segmen = pathos('_db/segmen.mat');

DIR = dir(strcat(dbnm_mat, '*.mat'));

sz = length(DIR);

for di=1:sz
    if dbg, fprintf('%d. veri isleniyor...\n', i);   end
    
    dnm = DIR(di).name;
    dfnm = strcat(dbnm_mat, dnm);
    load(dfnm);
    
    % 1) Esik hesapla
    mav = mean(abs(data.X));                 % MAV: Mean - Absolute Value
    mxv = max(data.X);                       % MXV: MaX Value
    
    if mxv > (30 * mav)
        T = 5 * mav;
    else
        T = mxv / 5;
    end
    
    % 2) Esigi asan tum tepeleri bul
    idx = find(data.X > T);
    xx = data.X(idx);

    % 3) lmax uzerinden aday framelerin orta noktalarinin indisi
    [lmv, indd] = lmax(xx, 0);
    
    idx_fort = idx(indd);
    
    if dbg,
        figure(10), 
        plot(data.t, data.X);
        hold on
        plot(data.t(idx_fort), lmv, 'r*')
        hold off
    end
    
    % 4) frame'yi yerlestir
    fs = length(idx_fort);
    for i=1:fs
        fort = idx_fort(i);
        
        sp = fort - WS2;        % FIXME: < 0
        ep = fort + WS2 - 1;    % FIXME: > length()
        
        frm = data.X(sp:ep);
        t   = data.t(sp:ep);
        
        [mx, ii] = max(frm);
        if mx > data.X(sp + ii - 1)
            % KAYDIR
            error('FIXME: ');
        end
        
        segmen(i).X = frm;
        segmen(i).t = t;
        
        if dbg
            figure(11),
            plot(t, frm);       
            %pause
        end
    end
    
    % 5) frame icine daha buyuk genlikli tepe varsa frame o tepe kaydir   
  
    if dbg,
        figure(1),  
        plot(data.t, data.X, 'b');
        hold on
        fs = length(idx_fort);        
        for j=1:fs
            plot(segmen(j).t, segmen(j).X, 'r');
        end
        hold off
    end

     save(fnm_segmen, 'segmen');
end
