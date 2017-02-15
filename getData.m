function Data = getData()
N = 100; % the number of trajectories we want
Data = cell(N,1);
for i = 1:N
    Data{i} = infiSim();
end
end