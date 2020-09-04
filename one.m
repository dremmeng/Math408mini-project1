% Define vector of x-values used for plotting
xvec = linspace(0,12,200);

% Part (b)
% Define true function
u = @(x) exp(x/2);
uvec = u(xvec);
% Define Taylor polynomial approximation
% Complete the code below
T4 = @(x) exp(5/2)+ (exp(5/2)*(x-5)/2)+(exp(5/2)*((x-5).^2)/8)+(exp(5/2)*((x-5).^3)/48)+exp(5/2)*((x-5).^4)/(48*4*2);
TaylorApprox = T4(xvec);
% Plot true function u along with the two approximations
figure
hold on
plot(xvec,uvec,'g')
plot(xvec,TaylorApprox,'b')
% Define Lagrange polynomial interpolant
P4 =@(x) u(1).*(x-3).*(x-5).*(x-7).*(x-9)./((1-3)*(1-5)*(1-7)*(1-9))+ u(3).*(x-1).*(x-5).*(x-7).*(x-9)./((3-1)*(3-5)*(3-7)*(3-9))+ u(5).*(x-1).*(x-3).*(x-7).*(x-9)./((5-1)*(5-3)*(5-7)*(5-9))+ u(7).*(x-1).*(x-3).*(x-5).*(x-9)/((7-1)*(7-3)*(7-5)*(7-9))+ u(9).*(x-1).*(x-3).*(x-5).*(x-7)./((9-1)*(9-3)*(9-5)*(9-7)); 
LagrangeApprox = P4(xvec);
plot(xvec,LagrangeApprox,'r')
hold off

% Part (d)
% Define Taylor approximation error estimate
ET4 = @(x) abs(exp(12/2).*((x-5).^5)./(48*4*2*2*5)); 
TaylorErrorEstimate = ET4(xvec);
% Define Lagrange interpolation error estimate
EP4 = @(x) abs((exp(12/2)./((2^5)*5*4*3*2)).*(x-1).*(x-3).*(x-5).*(x-7).*(x-9));
LagrangeErrorEstimate = EP4(xvec);
% Plot logs of error estimates
figure
hold on
plot(xvec,log(TaylorErrorEstimate),'b-.')
plot(xvec,log(LagrangeErrorEstimate),'r-.')
hold off

% Part (e)
% Plot logs of error estimates (again) and logs of actual errors
TaylorErrorActual = abs(uvec-TaylorApprox);
LagrangeErrorActual = abs(uvec-LagrangeApprox);
figure
hold on
plot(xvec,log(TaylorErrorEstimate),'b-.')
plot(xvec,log(LagrangeErrorEstimate),'r-.')
plot(xvec,log(TaylorErrorActual),'b')
plot(xvec,log(LagrangeErrorActual),'r')
hold off
% Compute error ratios
TaylorRatio = max(TaylorErrorEstimate./TaylorErrorActual)
LagrangeRatio = max(LagrangeErrorEstimate./LagrangeErrorActual)