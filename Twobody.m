function yprime = Twobody(t,y)
% t (time) is a scalar and y is a 4-vector whose components satisfy
%
%            y(1) = u(t)      y(2) = (d/dt)u(t)
%            y(3) = v(t)      y(4) = (d/dt)v(t)
%
% where (u(t),v(t)) are the equations of motion in the 2-body problem.
%
% yprime is a 4-vector that is the derivative of y at time t.

yprime = [y(2);-y(1)/(((y(1)^2)+(y(3)^2))^(3/2));y(4);-y(3)/(((y(1)^2)+(y(3)^2))^(3/2))];

end