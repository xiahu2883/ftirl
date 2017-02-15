function childNode = findEarliestNode(node) % this is a feature node
if isempty(node.child1)
    childNode = node.child1;
elseif isempty(node.child2)
    childNode = node.child2;
elseif isempty(node.child3)
    childNode = node.child3;
end

end