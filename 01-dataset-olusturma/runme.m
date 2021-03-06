% 
clear all;  close all;  clc;

dbg = true;
dbnm     = pathos('_db/orj/');      
dbnm_mat = pathos('_db/mat/');      mkdir(dbnm_mat);

DIR = dir(strcat(dbnm, '*.csv'));
sz = length(DIR);

if sz == 0,
    error(sprintf('"%s" icerigi bos. README.md yi oku.\n', dbnm));
end

for i=1:sz
    if dbg, fprintf('%d. veri isleniyor...\n', i);   end
    dnm = DIR(i).name;
    dfnm = strcat(dbnm, dnm);
    
    ham = csvread(dfnm)';
    data.t = ham(:, 1);
    data.X = ham(:, 2);
    
    if dbg,
        figure(1),  plot(data.t, data.X);
    end
    
    [t, nm] = fileparts(dnm);
    save(strcat(dbnm_mat, nm, '.mat'), 'data');
end