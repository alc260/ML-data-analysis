
% load data and normalize
training = load('housing_train.txt');
testing = load('housing_test.txt');
trainingNorm = zeros(size(training));
testingNorm = zeros(size(testing));

for i = 1:13
  [mntr, stdtr] = compute_norm_parameters(training(:,i));
  [mnte, stdte] = compute_norm_parameters(testing(:,i));
  normtr = normalize(training(:,i), mntr, stdtr);
  normte = normalize(testing(:,i), mnte, stdte);
  for j = 1:length(normtr)
    trainingNorm(j,i) = normtr(j);
  end
  for j = 1:length(normte)
    testingNorm(j,i) = normte(j);
  end
end

% Finally append the last column unchanged to both
for i = 1:length(training(:,14))
  trainingNorm(i,14) = training(i,14);
end

for i = 1:length(testing(:,14))
  testingNorm(i,14) = testing(i,14);
end

[trainingWeights, testingWeights] = online_descent(trainingNorm, testingNorm);

trPredict = LR_predict(trainingNorm(:,1:13), trainingWeights);
tePredict = LR_predict(testingNorm(:, 1:13), testingWeights);

mnsqrtr = (1/length(trainingNorm(:,14)) * sumsqr(trainingNorm(:,14) - trPredict));
mnsqrte = (1/length(testingNorm(:,14)) * sumsqr(testingNorm(:,14) - tePredict));

disp(mnsqrtr);
disp(mnsqrte);

function [trweights, teweights] = online_descent(training, testing)
  n = length(training);
  ne = length(testing);

  trweights = zeros(13,1);
  teweights = zeros(13,1);
  
  foo = init_progress_graph();

  for update=1:1000

    bar = mod(update,50);
    if bar == 0
      
      trpr = LR_predict(training(:,1:13), trweights);
      trmn = mean_sqr_error(training(:,14), trpr);
      tepr = LR_predict(testing(:,1:13), teweights);
      temn = mean_sqr_error(testing(:,14), tepr);
      %add_to_progress_graph(foo, update, trmn, temn);

    end

    % lets go ahead and get a sample from the training set
    v = mod(update, n);
    if v == 0
      v = v + 1;
    end

    row = training(v,:);
    sums = 0;
    for j=1:13
      sums = sums + (trweights(j) * row(j));
    end
    learn = (.00001) * (row(14) - sums);

    % finally update our weights for the training set
    for i=1:13
      trweights(i) = trweights(i) + (learn * row(i));
    end

  % Now lets do the same things for the testing set
  % lets go ahead and get a sample from the training set
    v = mod(update, ne);
    if v == 0
      v = v + 1;
    end

    row = testing(v,:);
    sums = 0;
    for j=1:13
      sums = sums + (teweights(j) * row(j));
    end
    learn = (.00001) * (row(14) - sums);

    % update our weights for the training set
    for i=1:13
      teweights(i) = teweights(i) + (learn * row(i));
    end
  end
  
end