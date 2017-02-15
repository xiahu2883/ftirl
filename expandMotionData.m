function result = expandMotionData(data)
% Here we create a three layer expansion.
l = 3;
n = size(data,1); % number of features 
result = cell(n,1);

for i = 1:n
    temp = cell(l+1,1);
    temp{1,1} = data(i,:);
    % append all the representations of a single feature
    for j = 1:l
        temp{j+1,1} = Smooth(diff(temp{j,1}));
    end
    
    % set all the reps to the same length and create the feature matrix
    mat = [];
    for k = 1:l
        rep = Smooth(temp{k,1}); % should I smooth here again?
        rep([1:l+1-k]) = [];
        mat = [mat; rep];
    end
    mat = [mat; temp{l+1,1}];
    result{i,1} = mat;
end

end
