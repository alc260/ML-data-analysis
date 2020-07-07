study_data = load('housing.txt');

attrs = ["CRIM", "ZN", "INDUS", "CHAS", "NOX", "RM", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B", "LSTAT", "MEDV"];

for i=1:13
  figure(i);
  disp(attrs(i));
  scatter_plot(study_data(:,i), study_data(:,14));
  w = waitforbuttonpress;
end

function scatter_plot(attribute1, attribute2)
    scatter(attribute1, attribute2, 'filled')
end

