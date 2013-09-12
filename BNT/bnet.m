%1=Interface area,2=hbonds,3=fbu,4-LD,5=HI,6=RP,7=specific
  
dag=zeros(7,7);
%dag(7,[1 2 3 4 5 6])=1; % all the parameters depend upon specificity

dag(7,[1 2 3 4 6])=1;
dag(1,[2 5 6])=1;



discrete_nodes= [7]
node_sizes=[1 1 1 1 1 1 2]
bnet = mk_bnet(dag, node_sizes, 'discrete', discrete_nodes);
bnet.CPD{7} = tabular_CPD(bnet, 7);

for i =1:6
   bnet.CPD{i} = gaussian_CPD(bnet, i);
end

bnet2=learn_params(bnet,training_data);
		