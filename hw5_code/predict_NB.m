
function guess = predict_NB(X, p0, p1, c0, c1)
  exp_inputs  = [1 5 7 8];
  norm_inputs = [2 3 4 6];
  sumn = 0;
  for i=1:length(exp_inputs)
    cc = (1.0/c0(exp_inputs(i), 1)) * exp(-X(exp_inputs(i))/c0(exp_inputs(i),1));
    sumn = sumn + log(cc);
  end
  for i=1:length(norm_inputs)
    cc = (1/(c0(norm_inputs(i), 2) * sqrt(2*pi))) * exp(-(X(norm_inputs(i)) - c0(norm_inputs(i), 1))^2/(2*(c0(norm_inputs(i), 2))^2));
    sumn = sumn + log(cc);
  end

  g0 = sumn + log(p0);

  sumn = 0;
  for i=1:length(exp_inputs)
    cc = (1.0/c1(exp_inputs(i), 1)) * exp(-X(exp_inputs(i))/c1(exp_inputs(i),1));
    sumn = sumn + log(cc);
  end
  for i=1:length(norm_inputs)
    cc = (1/(c1(norm_inputs(i), 2) * sqrt(2*pi))) * exp(-(X(norm_inputs(i)) - c1(norm_inputs(i), 1))^2/(2*(c1(norm_inputs(i), 2))^2));
    sumn = sumn + log(cc);
  end

  g1 = sumn + log(p1);

  if g1 > g0
    guess = 1;
  else
    guess = 0;
  end
