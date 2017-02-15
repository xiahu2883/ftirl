function result = learnMotion(Data)
tree = buildFFTree(Data);
traj = subtasksChaining(tree);
end


