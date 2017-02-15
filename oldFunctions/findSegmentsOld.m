function segments = findSegmentsOld(data)

% Create segments and calculate variances for each representations of a 
% feature. Use the zeropoints of a lower level rep for the segmentations
% of a higher level. (e.g: v -> s)

format long;
m = size(data,1);
segments = cell(m,3);

segments{m,1} = data(m,:);
for i = m:-1:2
    pts = zeroPoints(data(i,:));
    segs = pts2segs(pts,size(data,2));
    segments{i-1,1} = data(i-1,:); % copy data
    segments{i-1,2} = segs; % create segments from lower level data
    segments{i-1,3} = getVariances(data(i-1,:),segs); % get variances for 
                                                      % each segments
end

end
