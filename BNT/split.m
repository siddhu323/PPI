
function [train,test] = split(array)
	 siz=size(array,1);
	 pivot=int32((4/5)*siz);
	 train= array(1:pivot);
	 test=array(pivot+1:siz);
end