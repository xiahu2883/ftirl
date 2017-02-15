function segs = detectConstancy(data,level)
len = floor(length(data)/10);
perc1 = 0.1*(level-1); % acceptable difference between first and last
perc2 = 0.02*(level-1); % acceptable difference between two adjacent ones
dif = max(abs(data))-min(abs(data));
prev = 1;
temp = py.list();
for i = 2:length(data)
    if abs(data(i)-data(prev)) > perc1*dif || abs(data(i)-data(i-1))> perc2*dif
        if i - prev > len
            temp.append(py.list([prev, i]));
        end
        prev = i;
    end
end
if i - prev > len
    temp.append(py.list([prev,i]));
end


segs = py.list();
% chaining the segments if close
if length(temp) > 1
    j = 1;
    while j < length(temp)
        cur = temp{j};
        while abs(temp{j+1}{1} - cur{2}) < 3
            cur = py.list([cur{1},temp{j+1}{2}]);
            j = j + 1;
        end
        segs.append(cur);
        j = j + 1;
        if j == length(temp)
            segs.append(temp{j});
        end
    end
else
    segs = temp;
end



end
