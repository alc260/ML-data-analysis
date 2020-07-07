training = load('housing_train.txt');
testing = load('housing_test.txt');

X = training(:, 1:13);
y = training(:, 14);

weights = LR_solve(X, y);

disp(weights);

Xt = testing(:, 1:13);
yt = testing(:, 14);

trainingPredict = LR_predict(X, weights);
testingPredict = LR_predict(Xt, weights);

mnsqrtraining = mean_sqr_error(y, trainingPredict);
mnsqrtesting = mean_sqr_error(yt, testingPredict);

disp(mnsqrtraining);
disp(mnsqrtesting);


function mse = mean_sqr_error(given, prediction)
  mse = (1/length(given)) * sumsqr(given - prediction);
end