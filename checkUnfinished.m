function unfinished = checkUnfinished(small,feature)
ma = 0;
for i = 1:length(feature)
    if feature{i}{2}{2} > ma
        ma = feature{i}{2}{2};
    end
end

if small > ma || abs(small - ma) <= 5
    unfinished = 0;
else
    unfinished = 1;
end

end