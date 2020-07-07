training = load('pima_train_norm.txt');
testing  = load('pima_test_norm.txt');

train_attrs = training(:,1:8);
train_class_attrs = training(:,9);

test_attrs = testing(:,1:8);
test_class_attrs = testing(:,9);

%training_weights = Log_regression(train_attrs, train_class_attrs, 2000, test_attrs, test_class_attrs);
training_weights = Log_regression(train_attrs, train_class_attrs, 2000);
disp(training_weights)