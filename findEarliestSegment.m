function seg = findEarliestSegment(small, feature)
% Tolerance value here is 5. If the segment's right bound is only larger
% than small for <= 5 unit, we consider the next segment. 

last = inf;
seg = 0;
for i = 1:length(feature)
    % check the starting point of the feature
    if feature{i}{2}{2} > small && abs(feature{i}{2}{2}-small) >= 5 ...
            && feature{i}{2}{2} < last
        seg = i;
        last = feature{i}{2}{2};
    end
end

end