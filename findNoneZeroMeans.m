function indices = findNoneZeroMeans(data,segs)

means = [];
for i = 1:length(segs)
    means = [means; mean(data(segs{i}{1}:segs{i}{2}))];
end
means = abs(means);
small = min(means);
means = log10(means/small);

indices = find(means > 2);


end
