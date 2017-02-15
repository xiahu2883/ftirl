
function [level_list, common_nodes, hier_list] = detectFeatureLevel(data)
f = size(data,1);
level_list = py.list();
common_nodes = py.list();
hier_list = py.list();
g = 5;
for i = 1:f
    l1 = data{i};
    for j = i+1:f
        l2 = data{j};
        temp_common = py.list();
        temp_hier = py.list();
        % check each element of the list (need to improve the efficiency)
        for k = 1:length(l1)
            for h = 1:length(l2)
                if abs(l1{k}{2}{1} - l2{h}{2}{1}) < g &&...
                        abs(l1{k}{2}{2} - l2{h}{2}{2}) < g
                    temp_common.append(py.list([k,h]));
                end
                if abs(l1{k}{2}{1} - l2{h}{2}{1}) < g ||...
                        abs(l1{k}{2}{2} - l2{h}{2}{2}) < g
                    temp_hier.append(py.list([i,j]));
                end
            end
        end
 
        ma = max(length(l1),length(l2));
        mi = min(length(l1),length(l2));
        % Determine whether two features are in the same inner node.
        if length(temp_common) > 1
            if ma < 2*mi
                level_list.append(py.list([i,j]));
                common_nodes.append(temp_common);      
            end
        end
        if length(temp_hier) > min(length(l1),length(l2))
            if length(l1) > length(l2)
                hier_list.append(py.list([j,i]));
            else 
                hier_list.append(py.list([i,j]));
            end
        end
        temp_common = py.list();
        temp_hier = py.list();
    end
    
end

% Merge level_list
if length(level_list) > 1
    i = 1;
    while i <= length(level_list)
        cur = level_list{i};
        temp_level_list = [];
        temp_node_list = [];
        temp_node_list = [common_nodes{i}{1},common_nodes{i}{2}];
        temp_level_list = [cur{1},cur{2}];
        
        j = i + 1;
        while j <= length(level_list)
            if (cur{1} == level_list{j}{1} || cur{2}==...
                    level_list{j}{1}) && isempty(find(temp_level_list==...
                    level_list{j}{2}))
                
                temp_level_list = [temp_level_list, level_list{j}{2}];
                temp_node_list = [temp_node_list, common_nodes{j}{2}];
            end
            level_list{i} = py.list(temp_level_list);
            common_nodes{i} = py.list(temp_node_list);
            j = j + 1;
        end        
        i = i + 1;
    end
end

end
