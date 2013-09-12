

for i=1:6
    for j=i+1:6
    	cor=corr(cell2mat(training_data(i,:)),cell2mat(training_data(j,:)));
	disp([i j cor]);
   end
end
