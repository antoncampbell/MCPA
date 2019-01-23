clear all
y.p=0;
y.v=0;
y.a=0;
x.p=0;
x.v=0;
x.a=1;
pauset=0.02;

MFP=10;


for t=1:100
  
  y.p=y.p+y.v;
  y.v=y.v+y.a;
  
  x.p=x.p+x.v;
  x.v=x.v+x.a;
  
 
 p=1-exp(-MFP/(x.v+0.001))
  
  if(rand()>(1-exp(-MFP/(x.v+0.001))))
      angle=rand()*2*pi;
      newv=x.v*rand();
      x.v=cos(angle)*newv;
      y.v=sin(angle)*newv;
      
  end
  
  xpos(t)=x.p;
  figure(1)
  plot(xpos)
  pause(pauset)
  title('1d position')
  
  all_pos(t,1)=x.p;
  all_pos(t,2)=y.p;
  figure(3)
  plot3(all_pos(:,1),all_pos(:,2),1:t)
  zlim([0 100])
  %xlim([0 100])
  title('2d position')
  zlabel('time')
  ylabel('y position')
  xlabel('x position')
  grid on;
  
  
  xvol(t)=x.v;
  figure(2)
  averagevol=trapz(xvol)/length(xvol);
  plot(1:length(xvol),xvol,[1 length(xvol)],[averagevol averagevol])
  title(strcat('drift velocity is : ',num2str(averagevol)))
  pause(pauset)
  
  
    
end