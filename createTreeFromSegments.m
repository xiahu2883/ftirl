function tree = createTreeFromSegments(data)
% Compare the frequencies of each feature representations' segments. 
% Figure out the relative frequencies and decide whether different 
% features are on the same or different levels.

% Find features that should be in the same inner nodes.
[level_list, common_nodes, hier_list] = detectFeatureLevel(data);

% Initialize the tree
tree = featureTree;
tree.init_tree();
tree.data = data;

for i = 1:length(level_list)
    for j = 1:length(hier_list)
        if level_list{i} == hier_list{j}
            hier_list.pop(int16(j-1));
        end
    end
end

% Create subtask hierarchy of the tree. It is the same with breaking a
% a complex task into temporal subtasks. In smaller examples, every feature
% occurs at the same time, so the result will be a single node for this
% tree. 


    % Create feature hierarchy of a subtask. Within a single subtask,
    % different features occur at different frequencies. Those features
    % with higher frequencies are at the lower level of the tree. 
    for i = 1:length(hier_list)
    end


% Create representation hierarchy of the each feature node (which can 
% contain multiple features). 
for i = 1:length(level_list)
    tree = buildRepTree(tree, level_list{i}, data);
end




end
