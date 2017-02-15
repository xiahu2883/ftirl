function segs = cleanSegments(segs)
idx = [];
for i = 1:length(segs)
    if segs{i}{2}-segs{i}{1} <= 3
        idx = [idx, i];
    end
end
for j = length(idx):-1:1
    segs.pop(int16(idx(j)-1));
end
end