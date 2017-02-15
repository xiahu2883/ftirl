function ret = checkSameNode(node, seg_list, level_list)
ret = 1;

if length(node.seg_idx{1}) ~= length(seg_list)
    ret = 0;
    return;
end

if node.rep_levels{1} ~= level_list
    ret = 0;
    return;
end


end