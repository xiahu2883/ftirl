function ma = findMaxLastPt(feature)
ma = 0;
for i = 1:length(feature)
    if feature{i}{2}{2} > ma
        ma = feature{i}{2}{2};
    end
end
end