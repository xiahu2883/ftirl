function [seg_list, level_list, time_list, value_list, pt] = ...
    findReps(left, data)

seg_list = py.list();
level_list = py.list();
time_list = py.list();
value_list = py.list();


rep_idx = py.list();
for i = 1:size(data,1)
    seg = findEarliestSegment(left, data{i});
    rep_idx.append(seg);
end

pt = min(findBreakPoints(data, rep_idx));

for i = 1:size(data,1)
    rep_segs = py.list();
    level = py.list();
    time = py.list();
    value = py.list();
    
    idx = rep_idx{i};
    small = left;
    feature = data{i};
    level.append(feature{idx}{1});
    
    while feature{idx}{2}{2} < pt && ...
            abs(feature{idx}{2}{2} - pt) >= 5 
        rep_segs.append(idx);
        time.append(py.list([small, feature{idx}{2}{2}]));
        value.append(feature{idx}{3});
        
        small = feature{idx}{2}{2}+1;
        idx = findEarliestSegment(small, data{i});
    end
    
    if idx % still not the end of the trajectory.
        if feature{idx}{2}{2} > pt || abs(feature{idx}{2}{2} - pt) < 5
            rep_segs.append(idx);
            time.append(py.list([small, pt]));
            value.append(feature{idx}{3});
        end
    else % last segment is the end of the trajectory. 
        time{end} = py.list([small, pt]); 
    end
    % append feature's information to the list
    seg_list.append(rep_segs);
    level_list.append(level);
    time_list.append(time);
    value_list.append(value);
end


end
