function savedb(dbnm, data)
curdir = pwd;
cd(dbnm)
if strfind(dbnm, 'train') 
    save EmgTrnDataMulti data;
else
    save EmgTstDataMulti data;
end
cd(curdir);
