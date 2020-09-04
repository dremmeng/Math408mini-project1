% Solution for 
clear
uptrue = cos(1);
hvals = [1e-1 5e-2 1e-2 5e-3 1e-3];
Epu = [];  Emu = [];  E0u = [];  E2u = [];

% table headings:
disp(' ')
disp('       h              Dpu            Dmu             D0u             D2u')

for i=1:length(hvals)
   h = hvals(i);
   % approximations to u'(1):
   Dpu = (sin(1+h) - sin(1))/h;
   Dmu = (sin(1) - sin(1-h))/h;
   D0u = (sin(1+h) - sin(1-h))/(2*h);
   % one-sided three-point stencil - second-order
   xpts = 1 + h*(-2:0)';
   D2u = fdcoeffF(1,1,xpts) * sin(xpts) ;
   % absolute errors:
   Epu(i) = abs(Dpu - uptrue);
   Emu(i) = abs(Dmu - uptrue);
   E0u(i) = abs(D0u - uptrue);
   E2u(i) = abs(D2u - uptrue);

   % print line of table:
   fprintf('%13.4e   %13.4e   %13.4e   %13.4e  %13.4e\n',...
                 h,Epu(i),Emu(i),E0u(i),E2u(i))
end

% plot absolute errors:
figure1 = figure;
axes1 = axes('Parent',figure1);
loglog(hvals,Epu,'o-','LineWidth',2)
axis([5e-4 .2 1e-12 1])
hold on
loglog(hvals,Emu,'o-','LineWidth',2)
loglog(hvals,E0u,'o-','LineWidth',2)
loglog(hvals,E2u,'o-','LineWidth',2)
hold off
legend('E_+','E_-','E_0','E_2','Location','southeast')
set(axes1,'FontSize',14)

% "slopes" in loglog plots
accuracy_order_Dpu = mean(diff(log(Epu))./diff(log(hvals)))
accuracy_order_Dmu = mean(diff(log(Emu))./diff(log(hvals)))
accuracy_order_D0u = mean(diff(log(E0u))./diff(log(hvals)))
accuracy_order_D2u = mean(diff(log(E2u))./diff(log(hvals)))


