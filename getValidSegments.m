function segs = getValidSegments(temp,indices)
segs = py.list();
for i = 1:length(indices)
    segs.append(temp{int16(indices(i))});
end

end
