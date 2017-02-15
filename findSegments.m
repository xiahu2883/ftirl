function segments = findSegments(data)

% Create segments and calculate variances for each representations of a 
% feature. Use the zeropoints of a lower level rep for the segmentations
% of a higher level. (e.g: v -> s)

format long;
m = size(data,1);
segments = cell(m,3);

for i = 1:m
    segments{i,1} = data(i,:);
    segments{i,2} = detectConstancy(data(i,:),i);
end

end
