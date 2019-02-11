global m mp l
% inputs
l=input('enter length of pendulum ');
m=input('enter Mass of cart ');
mp=input('enter mass of pendulum ');
tend=input('enter max time :');
x0=input('give displacement of cart : ');
v0=input('give initai  velocity of cart  : ');
th0=input('give initai angle of  pendulum theta(radian) means *(pi/180): ');
w0=input('give initai anglular velocity of pendulum : ');
y0=[x0;v0;th0;w0];
t=[0,tend];
%solving using ode45
[tsol,ysol]=ode45(@(t,y) Functionfile(t,y), t,y0);
thdeg=(180/pi)*ysol(:,3);
x=ysol(:,1);
v=ysol(:,2);
th=ysol(:,3);
w=ysol(:,4);
%figure for two plots and simulation
f1=figure('Position',[10 80 550 580]);
f2=figure('Position',[600 70 800 580]);
    % plots for displacement and velocity
    figure(f1)
    subplot(211);
    plot(tsol,x,tsol,th);
    ylabel('Displacement');
    legend('for cart','for pendulum');
    subplot(212);
    axis([0 tend -10 10]);
    plot(tsol,v,tsol,w);
    ylabel('Velocity');
    legend('for cart', 'for pendulum');
    %simulation
for i=1:length(tsol)
    x2(i)=l*sind(thdeg(i));
    y2(i)=-l*cosd(thdeg(i));
    x12(i)=x(i)+x2(i);
    x1(i)=x(i);
    figure(f2)
    a12=rectangle('Position',[x1(i)-1,-1,2,2]);
    b12=line([x(i) x12(i)],[0 y2(i)],'LineWidth',4);
    c12=viscircles([x(i) 0],0.1);
    grid on
    axis([x(i)-1.2*l x(i)+1.2*l  -1.2*l 1.2*l]);
    pause(0.0001);
    hold on;
    drawnow;
    delete(a12);
    delete(b12);
    delete(c12);
end