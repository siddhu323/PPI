%a=Interface area,b=hbonds,c=fbu,d-LD,e=HI,f=RP
[a,b,c,d,e,f]=textread("/home/siddhu323/Desktop/PPI/BNT/cpi.csv",'%*s %f %d %*s %*s %f %d %f %f','delimiter',',');

[a1,b1,c1,d1,e1,f1]=textread("/home/siddhu323/Desktop/PPI/BNT/homodimers.csv",'%*s %f %d %*d %*d %f %d %f %f','delimiter',',');

num=size(a,1)+size(a1,1);
data=cell(num,1);
size_a=size(a,1);
size_a1=size(a1,1);

for i=1:size_a
    instance=[];
    instance(1)=a(i);instance(2)=b(i);instance(3)=c(i);instance(4)=d(i);instance(5)=e(i);instance(6)=f(i);instance(7)=1;
    data(i)=instance;
end
for i=1:size_a1
    instance=[];
    instance(1)=a1(i);instance(2)=b1(i);instance(3)=c1(i);instance(4)=d1(i);instance(5)=e1(i);instance(6)=f1(i);instance(7)=2;
    data(i+size_a)=instance;
end



