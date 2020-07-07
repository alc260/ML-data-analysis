
function [f, nf, pa, npa, c, nc, wbc, nwbc, pne] = main8_2learning()
  % Load data 
  study_data = load('pneumonia.tex');
  numRows = 500; %given

  % load each parameter 
  fever = study_data(:,1);
  paleness = study_data(:,2);
  cough = study_data(:,3);
  highwbcount = study_data(:,4);
  pneumonia = study_data(:,5);

  totalpn = 0;
  totalf = 0;
  totalp = 0;
  totalc = 0;
  totalw = 0;
  
  ntotalpn = 0;
  ntotalf = 0;
  ntotalp = 0;
  ntotalc = 0;
  ntotalw = 0;

  fc = 0;
  pc = 0;
  cc = 0;
  wc = 0;
  
  % Calculate ML estimates
  for i = 1:numRows
    if pneumonia(i) == 1
      totalpn = totalpn + 1;
      if fever(i) == 1
        totalf = totalf + 1;
      end
      if paleness(i) == 1
        totalp = totalp + 1;
      end
      if cough(i) == 1
        totalc = totalc + 1;
      end
      if highwbcount(i) == 1
        totalw = totalw + 1;
      end
    else
      ntotalpn = ntotalpn + 1;
      if fever(i) == 1
        ntotalf = ntotalf + 1;
      end
      if paleness(i) == 1
        ntotalp = ntotalp + 1;
      end
      if cough(i) == 1
        ntotalc = ntotalc + 1;
      end
      if highwbcount(i) == 1
        ntotalw = ntotalw + 1;
      end
    end

    if fever(i) == 1
      fc = fc +1;
    end
    if paleness(i) == 1
      pc = pc + 1;
    end
    if cough(i) == 1
      cc = cc + 1;
    end
    if highwbcount(i) == 1
      wc = wc + 1;
    end
  end

  f = totalf/totalpn;
  nf = ntotalf/ntotalpn;

  pa = totalp/totalpn;
  npa = ntotalp/ntotalpn;

  c = totalc/totalpn;
  nc = ntotalc/ntotalpn;

  wbc = totalw/totalpn;
  nwbc = ntotalw/ntotalpn;

  pne = totalpn/numRows;
end