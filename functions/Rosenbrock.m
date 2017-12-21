classdef Rosenbrock < FunctionND
  methods
    function self = Rosenbrock()
      arity = 2;
      self@FunctionND(int32(arity)) ;
    end
    
    function f = eval(self,x)
      % evaluate Rosenbrock (2D) function.
      % if x is a 2 by m matrix return m values in a row vector.
      % if x is a 2 by m x n matrix return m x n values in a matrix vector.
      X = squeeze(x(1,:,:)) ;
      Y = squeeze(x(2,:,:)) ;
      f = 100*(Y-X.^2).^2 + (1-X).^2;
    end
  end
end