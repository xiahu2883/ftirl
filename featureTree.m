classdef featureTree < handle
   properties
      level
      rootNode
      data
   end
   methods
       function tree = init_tree(tree)
           tree.rootNode = featureNode;
           tree.level = 0;
           tree.rootNode.init_node();
       end
       
   end

end