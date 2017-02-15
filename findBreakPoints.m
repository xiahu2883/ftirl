function pts =  findBreakPoints(data, rep_idx) % rep_idx = pylist(4 2 3) (3 features)

pts = [];

for i = 1:size(data,1) % num of features
    feature = data{i};
    small = feature{rep_idx{i}}{2}{1};
    seg = findEarliestSegment(small, feature);
    
    seg_next = findEarliestSegment(feature{seg}{2}{2}+1, feature);
    while seg_next
        if feature{seg}{1} ~= feature{seg_next}{1} % same level of rep
            pts = [pts, feature{seg}{2}{2}];
            break;
        else 
            seg = seg_next;
            seg_next = findEarliestSegment(feature{seg}{2}{2}+1, data{i});
        end
    end
    
    if length(pts) < i % it's the end of the trajectory
        pts = [pts, feature{seg}{2}{2}];
    end

end