[prior0, prior1, class0_conditional, class1_conditional] = main2_2();
training = load('pima_train.txt');
testing  = load('pima_test.txt');

train_attrs = training(:,1:8);
train_class_attrs = training(:,9);

test_attrs = testing(:,1:8);
test_class_attrs = testing(:,9);

train_guess = zeros(length(train_attrs),1);
test_guess = zeros(length(test_attrs),1);
% [g0, g1] =  predict_NB(attrs(1,:), prior0, prior1, class0_conditional, class1_conditional);

for i=1:length(train_attrs)
  train_guess(i) = predict_NB(train_attrs(i,:), prior0, prior1, class0_conditional, class1_conditional);
end


for i=1:length(test_attrs)
  test_guess(i) = predict_NB(test_attrs(i,:), prior0, prior1, class0_conditional, class1_conditional);
end

disp(mean_misclass_error(train_guess, train_class_attrs));
disp(mean_misclass_error(test_guess, test_class_attrs));

train_confusion = zeros(2);
for i=1:length(train_guess)
    train_confusion(train_guess(i) + 1, train_class_attrs(i) + 1) = train_confusion(train_guess(i) + 1, train_class_attrs(i) + 1) + 1;
end

disp(train_confusion)

test_confusion = zeros(2);
for i=1:length(test_guess)
    test_confusion(test_guess(i) + 1, test_class_attrs(i) + 1) = test_confusion(test_guess(i) + 1, test_class_attrs(i) + 1) + 1;
end

disp(test_confusion)

disp(test_confusion(1,1)/(test_confusion(1,1) + test_confusion(2,1)))
disp(test_confusion(2,2)/(test_confusion(2,2) + test_confusion(1,2)))