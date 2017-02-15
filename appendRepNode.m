function ret = appendRepNode(rootNode, seg_list, level_list,...
        time_list, value_list)

ret = 0;
if ~isempty(rootNode.child1)
    ret = checkSameNode(rootNode.child1, seg_list, level_list);
    if ret
        appendToNode(rootNode.child1, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
end

if ~isempty(rootNode.child2)
    ret = checkSameNode(rootNode.child2, seg_list, level_list);
    if ret
        appendToNode(rootNode.child2, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
    
end
if ~isempty(rootNode.child3)
    ret = checkSameNode(rootNode.child3, seg_list, level_list);
    if ret
        appendToNode(rootNode.child3, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
end
if ~isempty(rootNode.child4)
    ret = checkSameNode(rootNode.child4, seg_list, level_list);
    if ret
        appendToNode(rootNode.child4, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
end
if ~isempty(rootNode.child5)
    ret = checkSameNode(rootNode.child5, seg_list, level_list);
    if ret
        appendToNode(rootNode.child5, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
end
if ~isempty(rootNode.child6)
    ret = checkSameNode(rootNode.child6, seg_list, level_list);
    if ret
        appendToNode(rootNode.child6, seg_list, level_list, time_list, ...
            value_list);
        return;
    end
end

end