function savedb(dbnm, data)
% curdir = pwd;
% cd(dbnm)
if strfind(dbnm, 'train') 
    save EmgTrnData data;
else
    save EmgTstData data;
end
% cd(curdir);
