function [ u1 ] = all_po( width )

%计算全场势能

m=1;%障碍增益系数
x=zeros(101,1);
y=zeros(101,1);
p0=2;%影响范围
d=2;

%%
%障碍物2

for i=1:1:101
    y(i,1)=0.25*(i-1);    
end

step=0.105;
for i=1:1:101
    x(i,1)=4-(i-1)*step;    
end

o2=[   -3.271;
    16.4188;];
for i=1:1:101
   for j=1:1:101
       
    a(j,i)=sqrt((x(i,1)-o2(1,1))^2+(y(j,1)-o2(2,1))^2);

    if a(j,i)<=p0
         u2(j,i)= 0.5*m*(1/(a(j,i))-1/(p0))^2;
    else
            u2(j,i)=0;   
    end

    end
end

% p2=mesh(x,y,u2);
% 
% hold on;


%%
%障碍物1

o1=[   -3.375;
    5.415;];
for i=1:1:101
   for j=1:1:101
       
    a(j,i)=sqrt((x(i,1)-o1(1,1))^2+(y(j,1)-o1(2,1))^2);

    if a(j,i)<=p0
         u1(j,i)= 0.5*m*(1/(a(j,i))-1/(p0))^2;
    else
            u1(j,i)=0;   
    end

    end
end
% 
% p1=mesh(x,y,u1);
% hold on;
%%
%障碍物3

o3=[ -1.8;
    16];
for i=1:1:101
   for j=1:1:101
       
    a(j,i)=sqrt((x(i,1)-o3(1,1))^2+(y(j,1)-o3(2,1))^2);

    if a(j,i)<=p0
         u3(j,i)= 0.5*m*(1/(a(j,i))-1/(p0))^2;
    else
            u3(j,i)=0;   
    end

    end
end


%%
% %目标
% 

ka=1;



aim=[-3.3759;
     8.6978  ];

 for i=1:1:101
   for j=1:1:101
       
    a(j,i)=sqrt((x(i,1)-aim(1,1))^2+(y(j,1)-aim(2,1))^2);
    ua(j,i)=0.5*ka*a(j,i)^2;
    
    end
 end


% p3=mesh(x,y,ua);
% hold on;


%%

% %马路
 
kr=0.2;

ur1=zeros(101,101);

for i=1:1:101
    for j=1:1:101
        a(i,j)=1/(-width/2+sqrt((x(j,1)-4)^2));
        ur1(i,j)=0.5*kr*(a(i,j))^2;
    end
end

%p1=mesh(y,x,ur1);

%hold on ;

for i=1:1:101
    for j=1:1:101
        a(i,j)=1/(-width/2+sqrt((x(j,1)-(-6.5))^2));
        ur2(i,j)=0.5*kr*(a(i,j))^2;
    end
end

%p2=mesh(y,x,ur2);
%axis tight;


%%

for i=1:1:101
   for j=1:1:101
       
    
    u(j,i)=u1(j,i)+u2(j,i)+u3(j,i)+ua(j,i)+ur1(j,i)+ur2(j,i);
    
    end
end

%   p4=contour(x,y,u,100);
p4=mesh(x,y,u);

%%

% p=surf(x, y, u, 'LineStyle', 'none', 'FaceColor', 'interp')
% colormap(cool)
% camlight right

axis tight;
axis([-6.5,4,0,25,0,200]);

xlabel('汽车y轴');
ylabel('汽车x轴');
zlabel('势场能');

set(gca,'Xdir','reverse');
% view(0,0);

end

