classdef repNode < handle
   properties
      feature
      seg_idx % [feature, rep] 
      rep_levels
      rep_values
      time
      change_pts
      change_mat
      counter
      times
      
   end
   methods
       % rep nodes are inner nodes that stores representations 
       function node = init_node(node)
           node.feature = py.list();
           node.seg_idx = py.list();
           node.rep_levels = py.list();
           node.rep_values = py.list();
           node.time = py.list();
           node.counter = 1;
           node.times = 0;
       end
       %function childNode = findEmptyChildNode(node)
        %   if isempty(node.child1)
         %      node.child1 = repNode;
          %     childNode = node.child1;
           %end
       %end
           

       
   end

end
