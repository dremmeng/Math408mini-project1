% This script illustrates the solution of a system of second-order IVPs:
% Kepler's equations for the two-body problem

% Part (c)
[t,y] = ode23(@Twobody, [0 2*pi], [1;0;0;1]);
% Part (d)
% Plot solution in uv-plane
figure
plot(y(:,1),y(:,3))
% Plot components of y vs. t
figure
subplot(2, 2, 1), plot(t, y(:, 1))
subplot(2, 2, 2), plot(t, y(:, 2))
subplot(2, 2, 3), plot(t, y(:, 3))
subplot(2, 2, 4), plot(t, y(:, 4))