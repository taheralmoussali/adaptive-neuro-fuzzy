function randomData = random(minValue, maxValue, numValues)
    % Generate random data between 0 and 1
    randomData = rand(1, numValues);
    
    % Scale and shift the data to the desired range
    randomData = (maxValue - minValue) * randomData + minValue;
end
