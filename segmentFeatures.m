function result = segmentFeatures(data)
format long;
% We actually start from the lower features to higher features. If lower
% features are constanly zero (relative sense), then we move one level
% higher to find the constancy at the higher level features. 
N = length(data);
result = cell(N, 1); 
for i = 1:N
    f = data{i,1};
    M = size(data{i},1);
    feature = findSegments(data{i}); % [data] [segs]
                                     % No segs and variances for the lowest
                                     % level representation. 
    result{i} = feature;
end

end

