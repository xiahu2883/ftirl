classdef subtaskTree < handle
   properties
      level
      rootNode
      childList
   end
   methods
       function tree = init_tree(tree)
           node = Node;
           node.level = 0;
           tree.rootNode = node.init_node();
           tree.childList = py.list();
       end
   end

end