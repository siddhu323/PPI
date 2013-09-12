%a=Interface area,b=hbonds,c=fbu,d-LD,e=HI,f=RP
[a,b,c,d,e,f]=textread("/home/siddhu323/Desktop/PPI/BNT/cpi.csv",'%*s %f %d %*s %*s %f %d %f %f','delimiter',',');

[a1,b1,c1,d1,e1,f1]=textread("/home/siddhu323/Desktop/PPI/BNT/homodimers.csv",'%*s %f %d %*d %*d %f %d %f %f','delimiter',',');




cpi=cell(6);
cpi{1}=a;cpi{2}=b;cpi{3}=c;cpi{4}=d;cpi{5}=e;cpi{6}=f;

homodimers=cell(6);
homodimers{1}=a1;homodimers{2}=b1;homodimers{3}=c1;homodimers{4}=d1;homodimers{5}=e1;homodimers{6}=f1;

cpi_tr=cell(7);
cpi_te=cell(7);

for i=1:6
    [cpi_tr{i},cpi_te{i}]=split(cpi{i});
end

homodimers_tr=cell(7);
homodimers_te=cell(7);

for i=1:6
    [homodimers_tr{i},homodimers_te{i}]=split(homodimers{i});
end

cpi_tr{7}=cell(size(cpi_tr{1},1),1);
cpi_tr{7}(:,1)=1;
homodimers_tr{7}=cell(size(homodimers_tr{1},1),1);
homodimers_tr{7}(:,1)=2;

cpi_te{7}=cell(size(cpi_te{1},1),1);
cpi_te{7}(:,1)=1;
homodimers_te{7}=cell(size(homodimers_te{1},1),1);
homodimers_te{7}(:,1)=2;


N = size(cpi_tr{1},1)+size(homodimers_tr{1},1);
training_data=cell(7,N);

for i=1:7
    w=[cpi_tr{i};homodimers_tr{i}];
    for j=1:size(w,1)
        training_data(i,j)=w(j,1);
    end
end


Ne = size(cpi_te{1},1)+size(homodimers_te{1},1);
test_data=cell(7,Ne);

for i=1:7
    w=[cpi_te{i};homodimers_te{i}];
    for j=1:size(w,1)
        test_data(i,j)=w(j,1);
    end
end

