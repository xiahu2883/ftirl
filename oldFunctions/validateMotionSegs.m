function result = validateMotionSegs(level, idx, feature)
% This function only checks the linearity/constancy in r,c (first level)
% coordinates. High frequency representations do not go through this
% process. 

if level == 1 && length(idx) == 1  
    result = []; % we do this temporarily.
    return; 
    % now we check low level that whether it's derivative is zero across
    segments = feature{level,2}; % it is a python list encoding segments
    seg = segments{idx}; 
    temp = feature{level+1,1};
    temp_var = var(temp(seg{1}:seg{2}));
    if temp_var > 0.001 % ARBITRARY
        result = [];
        return 
    end
end
result = idx;
end
