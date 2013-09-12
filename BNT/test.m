engine = jtree_inf_engine(bnet2);
ev=cell(1,7);	
count=0;cpi=0;ho=0;ctr=0;
for i=1:size(test_data,2)
    ev=test_data(:,i);
    p=ev{7};
    ev{7}=[];
    [engine2, ll] = enter_evidence(engine, ev);
    marg = marginal_nodes(engine2, 7);
    if  marg.T(p)< 0.9
    	count++;
	if p == 1
	   cpi++;
        else
	   ho++;
	endif
    endif;	
    if marg.T(p) < 0.5
       disp(ev);
       disp(p);
       disp(marg.T);
       ctr++;
    endif
end
disp(count);
