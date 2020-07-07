
% load examples
examples = load('example.txt');

% define our params
[f, nf, pa, npa, c, nc, wbc, nwbc, pne] = main8_2learning();

% In order from the file:
% Fever, Palness, Cough, WBCount

nRows = size(examples, 1);

for i=1:nRows
  % grab the row
  r = examples(i,:);
  
  top = 1;
  bottom = 1;

  % fever
  if r(1) == 1
    top = top * f;
    bottom = bottom * nf;
  elseif r(1) == 0
    top = top * (1 - f);
    bottom = bottom * (1 - nf);
  end

  % paleness
  if r(2) == 1
    top = top * pa;
    bottom = bottom * npa;
  elseif r(2) == 0
    top = top * (1 - pa);
    bottom = bottom * (1 - npa);
  end
  
  % cough
  if r(3) == 1
    top = top * c;
    bottom = bottom * nc;
  elseif r(3) == 0
    top = top * (1 - c);
    bottom = bottom * (1 - nc);
  end

  % wbcount
  if r(4) == 1
    top = top * wbc;
    bottom = bottom * nwbc;
  elseif r(4) == 0
    top = top * (1 - wbc);
    bottom = bottom * (1 - nwbc);
  end

  fprintf('Given the paramters %d, %d, %d, %d, the probabilty the patient has pneumonia is: %f\n', r(1), r(2), r(3), r(4), top *pne / (top + bottom));

end



