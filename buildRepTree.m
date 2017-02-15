function tree = buildRepTree(tree, featureNode, data)
if isempty(tree.rootNode.child1)
    tree.rootNode.features = featureNode; % [1 2]
    tree.rootNode.lowestFeature = 1;
    %unorderedrep_idxs = py.list();
    
    unfinished = 1;
    left = 1;
    while unfinished
        % Find the rep segments for each feature
        [seg_list, level_list, time_list, value_list, pt] = ...
            findReps(left, data);
        if appendRepNode(tree.rootNode, seg_list, level_list,...
                    time_list, value_list);

        else
            % Create the rep node. 
            childNode = tree.rootNode.findEmptyChildNode();
            childNode.init_node();
            createHierarchyRepNode(childNode, seg_list, time_list, ...
                level_list, value_list);
        end
        
        left = pt + 1;
        unfinished = checkUnfinished(left,data{1});
    end
    
        
end

end