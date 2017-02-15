function bestReps = finalizeRepresentations(initRange,bestReps,feature,m)
feature = feature{m,1};
for i = 1:length(initRange)
    seg = py.list();  
    temp1 = feature(initRange{i}{1}:initRange{i}{2});
    if isempty(zeroPoints(temp1))
        seg.append(m); % append level
        seg.append(initRange{i}); % append segment range
        seg.append(mean(temp1)) % append segment mean   
        bestReps.append(seg);
    else
        pts = zeroPoints(temp1) + initRange{i}{1} - 1;
        tempSegs = pts2segs(pts, initRange{i}{1},initRange{i}{2});
        for j = 1:length(tempSegs)
            seg.append(m); % append level
            seg.append(tempSegs{j}); % append segment range
            temp1 = feature(tempSegs{j}{1}:tempSegs{j}{2});
            seg.append(mean(temp1)) % append segment mean   
            bestReps.append(seg);
            seg = py.list();
        end
        
    end
end

end