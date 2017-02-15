function [pts,mat] = createChangePtsMat(time_list,value_list)
pts = [];
n = 0;
a = cell(1);
mat = cell(1);

for i = 1:length(time_list) % for each feature
    count = 1;
    if length(time_list{i}{1}) > 1 % if a feature has more than one 
                                   % segments in the rep node.
        for j = 2:length(time_list{i})
            bpt = time_list{i}{j}{1};
            idx = find(abs(pts - bpt) <= 3);
            val_change = value_list{i}{j}/value_list{i}{j-1};
            
            if ~isempty(idx) % similar break point recorded before
                time_list{i}{j} = py.list([pts(idx(1)),time_list{i}{j}{2}]);
                a{i,count} = py.list([pts(idx(1)),val_change]);
            else
                n = n + 1; % total number of different break points.
                a{i,count} = py.list([bpt, val_change]);
                pts = [pts, bpt];
            end
            count = count + 1;
        end
    end
end

pts = sort(pts);
if ~isempty(pts)
    for i = 1:size(a,1)
        for j = 1:size(a,2)
            if ~isempty(a{i,j})
                bp = a{i,j}{1};
                idx = find(pts == bp);
                mat{i,idx} = a{i,j}{2}; % assign value
            end    
        end
        for j = 1:n
            if isempty(mat{i,j})
                mat{i,j} = 1;
            end
        end
    end
end


end