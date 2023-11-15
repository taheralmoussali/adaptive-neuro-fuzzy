% Load the first FIS model
path_anfis = 'F:\Freelance\2- Handover\matlab-3\file2\anfis_file2.fis';
anfis1 = readfis(path_anfis);

% Load the second FIS model
path_fis = 'F:\Freelance\2- Handover\matlab-3\file2\file2.fis';
fis1 = readfis(path_fis);

% congestion
% ------------------------------------------------------
congestion = linspace(0, 100, 15);
delay = 4;
BW = 3.5;
SST = -65;

% Create an input data matrix with SNR values varying
input_data = [congestion', repmat([delay, BW, SST], numel(congestion), 1)];

out_anfis = evalfis(anfis1, input_data);
out_fis = evalfis(fis1, input_data);

plotComparison(congestion,out_fis,out_anfis,'Congestion','Avability','Congestion_file2.png')

% delay
% ------------------------------------------------------
congestion = 45;
delay = linspace(0, 10, 15);
BW = 3.5;
SST = -65;

% Preallocate the input_data matrix
input_data = zeros(numel(delay), 4); % Assuming 5 input variables

% Loop through the mobile_velocity values
for i = 1:numel(delay)
    % Update the input_data matrix with varying mobile_velocity values
    input_data(i, :) = [congestion, delay(i), BW, SST];
end
disp(input_data)
out_anfis = evalfis(anfis1, input_data);
disp(out_anfis)
out_fis = evalfis(fis1, input_data);

plotComparison(delay,out_fis,out_anfis,'delay','Avability','delay_file2.png')

% BW
% ------------------------------------------------------
congestion = 45;
delay = 4;
BW = linspace(0, 10, 15);
SST = -65;

% Preallocate the input_data matrix
input_data = zeros(numel(BW), 4); % Assuming 5 input variables

% Loop through the mobile_velocity values
for i = 1:numel(BW)
    % Update the input_data matrix with varying mobile_velocity values
    input_data(i, :) = [congestion, delay, BW(i), SST];
end
disp(input_data)
out_anfis = evalfis(anfis1, input_data);
disp(out_anfis)
out_fis = evalfis(fis1, input_data);

plotComparison(BW,out_fis,out_anfis,'BW','Avability','BW_file2.png')

% SST
% ------------------------------------------------------
congestion = 45;
delay = 4;
BW = 3.5;
SST = linspace(-90, -30, 15);

% Preallocate the input_data matrix
input_data = zeros(numel(SST), 4); % Assuming 5 input variables

% Loop through the mobile_velocity values
for i = 1:numel(SST)
    % Update the input_data matrix with varying mobile_velocity values
    input_data(i, :) = [congestion, delay, BW, SST(i)];
end
disp(input_data)
out_anfis = evalfis(anfis1, input_data);
disp(out_anfis)
out_fis = evalfis(fis1, input_data);

plotComparison(SST,out_fis,out_anfis,'SST','Avability','SST_file2.png')
