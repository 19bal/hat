function savedb(dbnm, data)
curdir = pwd;
cd(dbnm)
if strfind(dbnm, 'train') 
    save EmgTrnDataBinary data;
else
    save EmgTstDataBinary data
end
cd(curdir);
