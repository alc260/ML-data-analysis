%CS1675 Homework 2
%Due 1/31/19
%Ava Chong

clear;

coin_data = load('coin.txt');
ms_data = load('mean_study_data.txt');
rs_data = load('resampling_data.txt');

%problem 1
ms_mean = mean(ms_data(:,:)); 
ms_std = std(ms_data(:,:));

for i=1:1000
    [newdata] = subsample(ms_data, 25);
    submean = mean(newdata(:,:));
    newmean(i) = submean;
end 
avgmean = mean(newmean(:,:));
avgstd = std(newmean(:,:));
figure(1);
hist(newmean, 20);  

for i=1:1000
    [newdata] = subsample(ms_data, 40);
    submean = mean(newdata(:,:));
    newmean2(i) = submean;
end 
avgmean2 = mean(newmean2(:,:));
avgstd2 = std(newmean2(:,:));
figure(2);
hist(newmean2, 20);  
 
for i=1:25
    msrev(i) = ms_data(i);
end 

meanrev = mean(msrev(:,:));

h = ttest(meanrev,15,'Alpha',0.5); 

%problem 2
for i=1:10 
[train, test] = kfold_crossvalidation(rs_data, 10, i);
meanprob2(i) = mean(test(:,:));
stdprob2(i) = std(test(:,:)); 
end 

%problem4
ones = find(coin_data(:,:));


function [newdata] = subsample(data, k)
    % Generate a list of random integers between 1 and length(data)
    % the list is k elements long
    rand_indicies = randperm(length(data), k);
    newdata = zeros(k, 1);
    for i=1:k
        newdata(i) = data(rand_indicies(i));
    end
end

function [train, test] = kfold_crossvalidation(data, k, m)
    % First we take the length%k to find # of groups
    % that will have to be 1 greater than
    % the calculated in group value
    goup_oneplus = mod(length(data), k);
    in_group = floor(length(data)/k);
    size = zeros(k,1);
    for i=1:k
        if goup_oneplus > 0
            size(i) = in_group + 1;
            goup_oneplus = goup_oneplus - 1;
        else
            size(i) = in_group;
        end
    end

    train = [];
    test = [];
    start_index = 1;

    for j=1:k
        if j == m
            test = [test, data(start_index: start_index + size(j) - 1)];
        else
            train = [train, data(start_index: start_index + size(j) - 1)];
        end
        start_index = start_index + size(j);
    end
    
end