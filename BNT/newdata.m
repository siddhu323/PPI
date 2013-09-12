%Shuffle data to create new set of training and test data
ordering = randperm(num);
tempd = data(ordering);

[rt,yu]=split(tempd);

N = size(rt,1);
training_data=cell(7,N);

for i=1:7
    for j=1:size(rt,1)
        training_data(i,j)=rt{j}(i);
    end
end


Ne = size(yu,1);
test_data=cell(7,Ne);

for i=1:7
    for j=1:size(yu,1)
        test_data(i,j)=yu{j}(i);
    end
end