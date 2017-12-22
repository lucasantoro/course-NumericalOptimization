clear all;
close all;
clc;

addpath('../lib');
addpath('../functions');

%r = Rosenbrock();
r = Rastrigin();

disp(r.arity());

r.contour([-1,1],[-1,1],@(z) log(1+z), 80)
axis equal ;

%5search_method   = GoldenSearch();
%search_method.setMaxIteration( int32(100) ) ;
%search_method.setTolerance(1e-10);

search_method = LinesearchArmijo();
search_method.debug_on();
gradient_method = MinimizationGradientMethod(r,search_method);
gradient_method.setMaxIteration( int32(10000) );
gradient_method.setTolerance(1e-6);
gradient_method.debug_on();

[xs,converged] = gradient_method.minimize( [0.5;0.8] ) ;
gradient_method.plotiter();

xs

