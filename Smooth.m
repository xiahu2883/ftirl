function data = Smooth(D)
m = size(D,1);
n = size(D,2);
data = [];

for i=1:m
    temp = medfilt1(D(i,:),3);
    data = [data;transpose(smooth(temp,5))];
end
if size(data) ~= [m,n]
    data = transpose(data);
end


end
