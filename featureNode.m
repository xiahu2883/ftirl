classdef featureNode < handle
   properties
      order
      features % can be one or more features in a feature node
      lowestFeature
      child1
      child2
      child3
      child4
      child5
      child6
   end
   methods
       % feature nodes are inner nodes that stores feature levels
       function node = init_node(node)
           node.features = py.list();
           node.order = [];
       end
       function retNode = findEmptyChildNode(node)
           if isempty(node.child1)
               node.child1 = repNode;
               retNode = node.child1;
           elseif isempty(node.child2)
               node.child2 = repNode;
               retNode = node.child2;
           elseif isempty(node.child3)
               node.child3 = repNode;
               retNode = node.child3;
           elseif isempty(node.child4)
               node.child4 = repNode;
               retNode = node.child4;
           elseif isempty(node.child5)
               node.child5 = repNode;
               retNode = node.child5;
           elseif isempty(node.child6)
               node.child6 = repNode;
               retNode = node.child6;
           end
       end
   end

end
