function [prior0, prior1, class0_conditional, class1_conditional] = main2_2()
  [class_0, class_1] = main2_1();

  class0_conditional = zeros(8,2);
  class1_conditional = zeros(8,2);

  prior0 = length(class_0)/(length(class_0) + length(class_1));
  prior1 = length(class_1)/(length(class_0) + length(class_1));

  exp_inputs  = [1 5 7 8];
  norm_inputs = [2 3 4 6];

  % example: application of expfit and normfit functions
  % class_0 : all inputs (x) with label class 0
  % class_1 : all inputs (x) with label class 1
  %


  for i=1:length(exp_inputs)
    [muhat, muci] = expfit(class_0(:,exp_inputs(i)));
    
    class0_conditional(exp_inputs(i), 1) = muhat;

    [muhat, muci] = expfit(class_1(:,exp_inputs(i)));
    
    class1_conditional(exp_inputs(i), 1) = muhat;

  end

  for i=1:length(norm_inputs)
    [muhat, muci] = expfit(class_0(:,norm_inputs(i)));
    
    class0_conditional(norm_inputs(i), 1) = muhat;
    class0_conditional(norm_inputs(i), 2) = std(class_0(:,norm_inputs(i)));

    [muhat, muci] = expfit(class_1(:,norm_inputs(i)));
    
    class1_conditional(norm_inputs(i), 1) = muhat;
    class1_conditional(norm_inputs(i), 2) = std(class_1(:,norm_inputs(i)));

  end
  %%% fit the exponential class-conditional for input attribute 1 and class 0
  %%% p(x_1|y=0, \mu_0_1)
  % [exp_0_1_muhat, exp_0_1_muci] = expfit(class_0(:,1));
  %%% fit the exponential class-conditional for input attribute 1 and class 1
  %%% p(x_1|y=1, \mu_1_1)
  % [exp_1_1_muhat, exp_1_1_muci] = expfit(class_1(:,1));
  %%%% fitting of the class-conditional of the second attribute
  %%%% with normal distribution
  %%% class-condtional for class 0
  %% p(x_2|y=0,mu_0_2,sigma_0_2)
  %[norm_0_2_mu,norm_0_2_sigma,muci_0_2,sci_0_2] = normfit(class_0(:,2));
  %%% etc.
end