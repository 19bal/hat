% 
clear all;  close all;  clc;

dbg = true;
dbnm_mat = pathos('_db/mat/');      	% bir onceki asamadaki veriyi kopyala
fnm_segmen = pathos('_db/segmen.mat');

DIR = dir(strcat(dbnm_mat, '*.mat'));

sz = length(DIR);

for i=1:sz
    if dbg, fprintf('%d. veri isleniyor...\n', i);   end
    dnm = DIR(i).name;
    dfnm = strcat(dbnm_mat, dnm);
    load(dfnm);

    % @husta: sira sende
    %
    % j. segmenin t ve X degerleri
    %   segmen(j).X
    %   segmen(j).t

    if dbg,
        figure(1),  
        subplot(211),   plot(     data.t, data.X);
        % subplot(212),   plot(segmen(j).t, segmen(j).X);
    end
    
    % save(fnm_segmen, 'segmen');
end
