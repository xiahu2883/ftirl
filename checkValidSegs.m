function segments = checkValidSegs(segs,total)
segments = py.list();
for i = 1:length(segs)
    for j = 1:length(total)
        if segs{i}{1} >= total{j}{1} || abs(segs{i}{1}-total{j}{1}) <= 3
            if segs{i}{2} <= total{j}{2} || abs(segs{i}{2}-total{j}{2}) <= 3
                segments.append(segs{i});
            end
        end
    end
end
end