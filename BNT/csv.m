
%a=Interface area,b=hbonds,c=fbu,d-LD,e=HI,f=RP

[a,b,c,d,e,f]=textread("/home/siddhu323/Desktop/PPI/BNT/cpi.csv",'%*s %f %d %*s %*s %f %d %f %f','delimiter',',');

[a1,b1,c1,d1,e1,f1]=textread("/home/siddhu323/Desktop/PPI/BNT/homodimers.csv",'%*s %f %d %*d %*d %f %d %f %f','delimiter',',');

N = size(a,1)+ size(a1,1)

g=cell(size(a,1),1);
g(:,1)=1;
g1=cell(size(a1,1),1);
g1(:,1)=2;

  
a=[a;a1];
b=[b;b1];
c=[c;c1];
d=[d;d1]; 
e=[e;e1];
f=[f;f1];
g=[g;g1];
  
data=cell(7,N);

  
data(1,:)=num2cell(a);    %b=1
data(2,:)=num2cell(b);    %hbonds=2
data(3,:)=num2cell(c);    %fraction of buried atoms=3
data(4,:)=num2cell(d);    %LD=4
data(5,:)=num2cell(e);    %HI=5
data(6,:)=num2cell(f);    %RP=6
data(7,:)=g;    %specific ?=7


