function tree = buildFFTree(rawData)
rawData = infiSim();
% Here we assume raw data without dependency.
% 1. Creating several layers of data by differentiation for hierarchical
% construction

data = expandMotionData(rawData); % length(rawData) cells of matrix


% 2. We have all the feature values we need, next step is to segment every
% feature representations for the whole trajectory into pieces.
% Each piece has different variance for futher detecting locally linear
% segments.

featureSections = segmentFeatures(data); 


% 3. Find locally linear representation of each individual feature. Choose
% the right representative segments (favors the upper level constancy) and
% use them to cover the whole trajectory.

representations = representFeatures(featureSections)


% 4. Creating a feature frequency tree. 

tree = createTreeFromSegments(representations);


end
