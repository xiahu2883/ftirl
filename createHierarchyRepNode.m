function node = createHierarchyRepNode(node, seg_list, time_list, level, value_list)

node.init_node();

node.seg_idx.append(seg_list);
node.rep_values.append(value_list);
node.time.append(time_list);
node.rep_levels.append(level);

[pts,mat] = createChangePtsMat(time_list,value_list);
if ~isempty(pts)
    node.change_pts = pts; % it's an array
    node.change_mat = mat; % it's a cell matrix
end
node.times = node.times + 1;

end