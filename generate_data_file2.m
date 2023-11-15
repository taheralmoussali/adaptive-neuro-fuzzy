% Load the FIS model 
path = 'F:\Freelance\2- Handover\matlab-3\file2\file2.fis';
fis = readfis(path);

size_chunk = 15;

% Define values for each of the 4 inputs
values_congestion = [linspace(0,35,size_chunk)',linspace(20,70,size_chunk)',linspace(55,100,size_chunk)'];
values_delay = [linspace(0,3,size_chunk)',linspace(1,6,size_chunk)',linspace(5,10,size_chunk)'];
values_BW = [linspace(0,2,size_chunk)',linspace(1,6,size_chunk)',linspace(4,10,size_chunk)'];
values_SST = [linspace(-90,-70,size_chunk)',linspace(-80,-50,size_chunk)',linspace(-60,-30,size_chunk)'];

all_data = zeros(81*size_chunk, 4);
counter = 1;

for i_c=1:3
    for i_d=1:3
        for i_bw=1:3
            for i_s=1:3
                all_data(counter:counter+14,:)=[values_congestion(:,i_c),values_delay(:,i_d),values_BW(:,i_bw),values_SST(:,i_s)];
                counter = counter + 15;
            end
        end
    end
end

output = evalfis(fis, all_data);

% Save the training data to a CSV file
train_data = [all_data, output];

writematrix(train_data, 'train_data_file2.csv');
%{
input_data = [input1_congestion', input2_delay', input3_BW', input4_SST'];

% Additional input data
congestion = linspace(0, 100, 15);
delay = 4;
BW = 3.5;
SST = -65;

% Preallocate the new_input_data matrix
new_input_data1 = zeros(numel(congestion), 4);

% Loop through the delay values and update new_input_data
for i = 1:numel(congestion)
    new_input_data1(i, :) = [congestion(i), delay, BW, SST];
end

% Additional input data
congestion = 45;
delay = linspace(0, 10, 15);
BW = 3.5;
SST = -65;

% Preallocate the new_input_data matrix
new_input_data2 = zeros(numel(delay), 4);

% Loop through the delay values and update new_input_data
for i = 1:numel(delay)
    new_input_data2(i, :) = [congestion, delay(i), BW, SST];
end

% Additional input data
congestion = 45;
delay = 4;
BW = linspace(0, 10, 15);
SST = -65;

% Preallocate the new_input_data matrix
new_input_data3 = zeros(numel(BW), 4);

% Loop through the delay values and update new_input_data
for i = 1:numel(BW)
    new_input_data3(i, :) = [congestion, delay, BW(i), SST];
end

% Additional input data
congestion = 45;
delay = 4;
BW = 3.5;
SST = linspace(-90, -30, 15);

% Preallocate the new_input_data matrix
new_input_data4 = zeros(numel(SST), 4);

% Loop through the delay values and update new_input_data
for i = 1:numel(SST)
    new_input_data4(i, :) = [congestion, delay, BW, SST(i)];
end
% Concatenate the new input data with the existing input data

all_data = [input_data; new_input_data1;new_input_data2;new_input_data3;new_input_data4];


% Use the FIS to evaluate the output for each input combination
%output = evalfis(fis, all_data);

% Save the training data to a CSV file
%train_data = [all_data, output];

output = evalfis(fis, all_data);


% Save the training data to a CSV file
train_data = [all_data, output];

writematrix(train_data, 'train_data_file2.csv');
%}

