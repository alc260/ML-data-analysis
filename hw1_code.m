%CS1675 Homework 1
%Due 1/24/19
%Ava Chong

clear;

data = load('prima.dat');
num = 8;

%finding max, min, range, mean and vars of each attribute
for i = 1:num
    maxnum(i) = max(data(:,i));
    minnum(i) = min(data(:,i));
    meannum(i) = mean(data(:,i));
    varnum(i) = var(data(:,i));
    range = maxnum - minnum;
end

%split data by finding all 1s
k = find(data(:,9));  
for j = 1:length(k)
    ones(j,:) = data(k(j),:);
    %k(j) indicates which row + all cols needed
end 

%split data by finding all 0s
h = find(~data(:,9));
for j = 1:length(h)
    zeros(j,:) = data(h(j),:);
end

%finding mean and vars of each attribute in each subset
for i = 1:num
    data1mean(i) = mean(ones(:,i));
    data1std(i) = std(ones(:, i));
    
    data0mean(i) = mean(zeros(:,i));
    data0std(i) = std(zeros(:, i));
end 

figure(1)
histogram_analysis(ones(:,1))
figure(2)
histogram_analysis(ones(:,2))

figure(9)
scatter_plot(data(:,6), data(:,4))
figure(10)
scatter_plot(data(:,7), data(:,5))

v = normalize(data(:,3));

output = discretize_attribute(data(:,3), 10);

ptrain = .75;
[training, testing] = divideset(data, ptrain); 

%export subset data
save ZerosOutput.dat zeros -ascii 
save OnesOutput.dat ones -ascii 

%functions
function histogram_analysis(attribute_data)
    hist(attribute_data, 20);  
end 

function scatter_plot(attribute1, attribute2)
    scatter(attribute1, attribute2, 'filled')
end

function v = normalize(input_vect)
    v = [];
    vmean = mean(input_vect);
    vstd = std(input_vect);
    
    for i = 1:length(input_vect)
        v(i) = (input_vect(i) - vmean) / vstd;
    end
end

function output = discretize_attribute(input_vect, kbins)
    amax = max(input_vect);
    amin = min(input_vect);
    binsize = (amax - amin) / kbins;
    output = [];

    for i = 1:length(input_vect)
        tv = find_bin(input_vect(i), binsize, amin, kbins);
        output(i) = tv;
    end
end

function tbin = find_bin(value, sze, tmin, nBins)
    for x = 1:nBins
        if value <= tmin+(x*sze)
            tbin = x;
            return;
        end
    end
    
end

function [training, testing] = divideset(data, ptrain)
    a = randperm((length(data)));
    point1 = round(length(data)*ptrain);
    point2 = length(data);
    index = 1;
    for i = 1:point1
        training(i) = data(a(i)); 
    end
    
    for x = point1:point2
        testing(index) = data(a(x));
        index = index + 1; 
    end 
end

    





 
