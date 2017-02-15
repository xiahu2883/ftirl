function representations = representFeaturesOld(segments)
N = length(segments);
representations = cell(N,1);



for i = 1:N 
    feature = segments{i};
    m = size(feature, 1);
    % Initialize the uncovered range list and the representation list.
    uncoveredRange = py.list();
    uncoveredRange.append(py.list([1,length(segments{1}{1,1})])); % e.g: [1,117]
    bestReps = py.list();
    
    for j = 1:(m-1)
        % Check if the segments have already been taken care of by previous
        % higher representations. Returns indices of valid segments.
        validSegs = checkValidSegs(feature{j,2},uncoveredRange);
        % the return is in py.list() format
        %usableSegments = findZeroMeansSegs(feature{j+1,1},feature{j+1,2});
        if length(usableSegments) == 0
            if j <= 2
                % We check whether segments have low variances. 
                % The return is in array format
                usableSegments = findLowVariances(feature{j,3},validSegs);
                % We validate the segments if we are in motion planning task.
                if j == 1
                    usableSegments = validateMotionSegs(j, usableSegments, feature);
                end
            else
                % We choose segments with non-zero means.
                % constancy doesn't matter as much. 
                usableSegments = findNoneZeroMeans(feature{j,1},feature{j,2});
            end
            [uncoveredRange, bestReps] = updateSegmentsCoverage1(...
                        uncoveredRange,usableSegments,bestReps,feature,j);
        else
            [uncoveredRange, bestReps] = updateSegmentsCoverage2(...
                        uncoveredRange,usableSegments,bestReps,feature,j);
        end
    end
    
    % We use the m level value to represent the remaining segments which 
    % cannot be explained by the previous lower levels
    if length(uncoveredRange) > 0
        bestReps = finalizeRepresentations(uncoveredRange,bestReps,feature,m);
    end
    representations{i} = bestReps;
    
end


end
