function [class_zero, class_one] = main2_1()
  study_data = load('pima.txt');

  mat_size = size(study_data);
  czc = 1;
  coc = 1;
  % The description tells us these
  % values of 500 and 268
  class_zero = zeros(500,9);
  class_one = zeros(268,9);

  for i=1:mat_size(1)
    if study_data(i,9) == 0
      % add to class zero
      for j=1:mat_size(2)
        class_zero(czc,j) = study_data(i,j);
      end
      czc = czc + 1;
    else
      for j=1:mat_size(2)
        class_one(coc,j) = study_data(i,j);
      end
      coc = coc + 1;
    end
  end
   %{
  for i=1:8
  %figure(i)
  subplot(2,8,i) 
  histogram_analysis(class_zero(:,i))
  end
  %}
for i=9:16
  subplot(2,8,i) 
  histogram_analysis(class_one(:,i-8))
end


end


   