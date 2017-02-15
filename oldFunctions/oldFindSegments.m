function result = oldFindSegments(data)
f = repmat(data,1,1); % copy data
% find all the zero segments
base = max(abs(f));
f(abs(f) < base/10) = 0; 
f(f < 0) = -1;
f(f > 0) = 1;
f = medfilt1(f,3);
pos = py.list();
prev = 1;

for i = 1:length(f)
    if f(i) ~= f(prev) 
        if f(prev) ~= 0
            pos.append(py.list([prev, i-1]));
        end
        prev = i;
    end        
end
pos.append(py.list([prev, length(f)]));

end