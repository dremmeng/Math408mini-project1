% Define exact value u''(1)
u2ptrue = -4*sin(2); % since u(x) = sin(2*x)
hvals = logspace(-1, -4, 13);
E2u = []; % initialize errors

% Part (b)
% table headings:
disp(' ')
disp('       h              D2u')
for i=1:length(hvals)
   h = hvals(i);
   % approximations to u''(1):
   xpts = [1-2*h,1-h,1,1+h,1+2*h];
   c = fdcoeffF(2,1,xpts);
   D2u = sum(c.*[sin(2*(1-2*h)),sin(2*(1-h)),sin(2),sin(2*(1+h)),sin(2*(1+2*h))]);
   % absolute errors:
   E2u(i) = abs(D2u - u2ptrue);
   % print line of table:
   disp(sprintf('%13.4e   %13.4e',h,E2u(i)))
end

% Part (c)
% loglog plot of errors:
loglog(E2u, hvals,'o-','LineWidth',2)

% "slopes" in loglog plot
slopevec = 4.*log(hvals)
accuracy_order = mean(log(hvals))