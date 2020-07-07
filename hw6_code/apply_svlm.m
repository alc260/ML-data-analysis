function class = apply_svlm(x,w,b)
  class = 0;
  
  for i=1:length(x)
    class = class + w(i) * x(i);
  end
  
  if(class + b >= 0)
    class = 1;
  else
    class = 0;
  end

end
