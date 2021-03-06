% data = emg_dataset();
% clc;    close all;  clear all;
dbfnm = strrep('data\test\EmgTstDataBinary.mat', '\', filesep);
load(dbfnm);

feature = feature_extraction(data);

load emg_svm;
y = svmclass(feature.X, model);

% Etiket = [data.Etiket(data.y'); data.Etiket(y')]'
% err = mean(abs(data.y - y).^2)

sz = length(data.X(1,:));

for i = 1:sz
    fid = fopen('C:\Users\Shouldbe\Desktop\deneme1\19bal-svm-f65ed48\src\1_binary\test.txt', 'a');
    X = data.X(:, i);
    plot(X);    title(data.Etiket(y(i)));
    xlabel('Time'); ylabel('Amplitude');
    axis([0 length(data.X(:, 1)) -2 +2]);
    tmp = y(i);
    fprintf(fid, '%d\n', tmp);
    fclose(fid);
    pause(3)
end
