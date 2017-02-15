function node = appendToNode(node, seg_list, level_list, time_list, ...
            value_list)
node.seg_idx.append(seg_list);
node.rep_levels.append(level_list);
node.rep_values.append(value_list);
node.time.append(time_list);

[pts,mat] = createChangePtsMat(time_list,value_list);
if ~isempty(pts)
    node.change_pts = [node.change_pts, pts]; % it's an array
    node.change_mat = cat(2,node.change_mat,mat); % it's a cell matrix
end
node.times = node.times + 1;

end