function output = predict(X, W)
  output = zeros(size(X,1), 1);
  for i=1:size(X,1)
    tsum = 0;
    for j=1:size(X, 2)
      tsum = tsum + X(i,j) * W(j);
    end
    output(i) = tsum;
  end

  for i=1:length(output)
    if output(i) > .5
      output(i) = 1;
    else
      output(i) = 0;
    end
  end
end