function pts = zeroPoints(data)

data(data>0) = 1;
data(data<0) = -1;
pts = find(diff(data) ~= 0) + 1;
end
