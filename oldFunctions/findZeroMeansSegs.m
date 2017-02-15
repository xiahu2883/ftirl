function segments = findZeroMeansSegs(data,segs)

means = [];
for i = 1:length(segs)
    means = [means; mean(abs(data(segs{i}{1}:segs{i}{2})))];
end

big = max(means);
means = log10(means/big);

indices = find(means < -2);
indices
segments = getValidSegments(segs, indices);
segments = chainSegments(segments);

end
