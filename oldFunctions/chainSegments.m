function result = chainSegments(segs)
result = py.list();
if ~length(segs)
    return
end

i = 1;
cur = segs{1};
while i < length(segs)
    adjacent = segs{i+1}{1} - cur{2} <= 2;
    
    if adjacent
        cur = py.list([cur{1},segs{i+1}{2}]);
    else
        result.append(cur);
        cur = segs{i+1};
    end
    i = i + 1;
end
result.append(cur);
end
