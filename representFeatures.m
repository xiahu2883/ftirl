function representations = representFeatures(segments)
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
        % higher representations. Returns py.list of valid segments.
        usableSegments = checkValidSegs(feature{j,2},uncoveredRange);
        
        % We stop sooner if the current level already has no constancy.
        if length(usableSegments) == 0 && j ~= 1
            bestReps = finalizeRepresentations(uncoveredRange,bestReps,feature,j);
            uncoveredRange = py.list();
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
