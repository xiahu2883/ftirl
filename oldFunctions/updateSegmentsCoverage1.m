function [initRange, bestReps] = updateSegmentsCoverage(initRange, ...
    usables,bestReps,feature,level)

temp = feature{level,2}; % get segments for the level
segs = getValidSegments(temp,usables); % get valid segments
segs = chainSegments(segs); % chain adjacent segments together.
segs = cleanSegments(segs); % delete segments that are way too small
% Check one segment at a time to see whether it can contribute to covering
% the whole trajectory. 
level
for j = 1:length(segs)
    i = 1;
    while i <= length(initRange)
        if (segs{j}{1} >= initRange{i}{1} - 3) && ...
                (segs{j}{2} <= initRange{i}{2} + 3) % More arbitrariness for
                                                    % flexibility.
            
            lower = segs{j}{1};
            upper = segs{j}{2};
            orig_lower = initRange{i}{1};
            orig_upper = initRange{i}{2};
            
            
            % Check if the bound of the new segment is close enough to the
            % bound of the uncovered segments. If so, consider them to be
            % the same.
            if abs(lower-orig_lower) <= 3 % ARBITRARY
                lower = orig_lower;
            end
            if abs(orig_upper - upper) <= 3
                upper = orig_upper;
            end
            
            % Delete the original segment. 
            initRange.pop(int16(i-1));
            
            if lower > orig_lower % update left part if there is space
                initRange.append(py.list([orig_lower, lower-1]))
            end
            if upper < orig_upper % update right part if there is space
                initRange.append(py.list([upper+1, orig_upper]))
            end
            
            temp = py.tuple([lower,upper]); % create segment info
            tempList = py.list(); % create segment info bundle
            tempList.append(level); % append level information
            tempList.append(temp); % append segment range
            % append the mean of the segment
            tempList.append(mean(feature{level,1}(lower:upper)));
            
            bestReps.append(tempList);
        end
        i = i + 1;
    end
    
end
end
