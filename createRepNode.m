function node = createRepNode(node, seg_list, time_list, level, value_list)

node.init_node();
for i = 1:length(seg_list)
    node.seg_idx.append(seg_list{i});
    node.rep_values.append(value_list{i});
    node.time.append(time_list);   
end
node.rep_levels.append(level);


node.times = node.times + 1;

end