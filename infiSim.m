
function data = infiSim()
% Randomly initialize two points for infinition sign
y = rand();
a = rand();
b = rand();
x1 = min(a,b);
x2 = max(a,b);

dis = abs(x1-x2);
scatter([x1,x2], [y,y])

% Randomly initialize the circle radius 
r = rand()*dis/2;
halfcirc1 = [];
halfcirc2 = [];

circdotnum = 30;
linedotnum = 30;

num = r * circdotnum; % Arbitrarily decided
sigmacirc = 0.3 * r/circdotnum; % noise
sigmaline = 0.3 * r/linedotnum; % noise

for i = 1:circdotnum
    x_temp1 = x1 + r*cos(pi/2 + pi/circdotnum*i);
    y_temp1 = y + r*sin(pi/2 + pi/circdotnum*i);
    x_sim1 = normrnd(x_temp1, sigmacirc);
    y_sim1 = normrnd(y_temp1, sigmacirc);
    halfcirc1 = [halfcirc1; x_sim1, y_sim1];
    
    x_temp2 = x2 + r*cos(pi/2 - pi/circdotnum*i);
    y_temp2 = y + r*sin(pi/2 - pi/circdotnum*i);
    x_sim2 = normrnd(x_temp2, sigmacirc);
    y_sim2 = normrnd(y_temp2, sigmacirc);
    halfcirc2 = [halfcirc2; x_sim2, y_sim2];
    
end


line1 = [];
line2 = [];

for i = 1:linedotnum
    x_temp1 = x1 + dis/linedotnum*i;
    y_temp1 = y + r - i*r/(linedotnum/2);
    x_sim1 = normrnd(x_temp1, sigmaline);
    y_sim1 = normrnd(y_temp1, sigmaline);
    line1 = [line1; x_sim1, y_sim1];
    
    x_temp2 = x1 + dis/linedotnum*i;
    y_temp2 = y - r + i*r/(linedotnum/2);
    x_sim2 = normrnd(x_temp2, sigmaline);
    y_sim2 = normrnd(y_temp2, sigmaline);
    line2 = [line2; x_sim2, y_sim2];
end

axis equal;
hold on;

merge1 = [halfcirc1(:,1); line2(:,1); halfcirc2(:,1); flip(line1(:,1))];
merge2 = [halfcirc1(:,2); line2(:,2); halfcirc2(:,2); flip(line1(:,2))];
%data = [medfilt1(merge1,5), medfilt1(merge2,5)];
data = [smooth(merge1),smooth(merge2)];
scatter(merge1, merge2);
data = transpose(data);
end





