% 
clear all;  close all;  clc;

dbg = true;
dbnm     = pathos('_db/orj/');      % emg sinyalini bu klasore koy
dbnm_mat = pathos('_db/mat/');      mkdir(dbnm_mat);

DIR = dir(strcat(dbnm, '*.csv'));

sz = length(DIR);

for i=1:sz
    if dbg, fprintf('%d. veri isleniyor...\n', i);   end
    dnm = DIR(i).name;
    dfnm = strcat(dbnm, dnm);
    
    data = csvread(dfnm)';
    
    if dbg,
        figure(1),  plot(data(:,1), data(:,2));
    end
    
    [t, nm] = fileparts(dnm);
    save(strcat(dbnm_mat, nm, '.mat'), 'data');
end