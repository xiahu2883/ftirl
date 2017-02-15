function circ = circsSim()

bnum = 30; % number of dots on the big half circle
repeatition = 7;
bigr = rand()*10; % big circle's diameter
smallr = bigr/2.5;

snum = floor(30*smallr/bigr); % number of dots on the small 
                                          % half circle.

% Starting point coordinate
x = rand()*10
y = rand()*10;

x_s = x+bigr-smallr;


circ = [];

for i = 1:repeatition
    circb = [];
    x_big = [];
    y_big = [];
    for j = 1:bnum
        x_big = [x_big, x + bigr*cos(pi+ pi/bnum*j)];
        y_big = [y_big, y + bigr*sin(pi+ pi/bnum*j)];
    end
    circb = [x_big; y_big];
    
    if i == repeatition
        circs = [];
    else
        circs = [];
        x_small = [];
        y_small = [];
        for k = 1:snum
            x_small = [x_small, x_s + smallr*cos(pi/snum*k)];
            y_small = [y_small, y + smallr*sin(pi/snum*k)];
        end
        circs = [x_small; y_small];
    end
    
    x = x + 2*bigr - 2*smallr;
    x_s = x + bigr - smallr;
    circ = [circ, circb, circs];
end

figure;
scatter(circ(1,:),circ(2,:));
axis equal;
end
