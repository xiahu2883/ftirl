function vars = getVariances(data, segs)
vars = [];
n = length(segs);
for i = 1:n
    ind = segs{i};
    seg = data(ind{1}:ind{2});
    vars = [vars, var(seg)];%/abs(mean(seg))]; % Should I normalize variance 
                                             % or should I just use the
                                             % face value?
end

end
