function result = pts2segs(pts,i,n)
result = py.list();
prev = i;
if n - pts(end) < 5
    pts(end) = n;
end
if pts(1) - i < 5
    pts(1) = i;
end

for l = 1:length(pts)
    if pts(l) - prev > 10
        result.append(py.list([prev, pts(l)-1]));
        prev = pts(l);
    end
    
end

if pts(end) ~= n
    result.append(py.list([prev,n]));
end

end