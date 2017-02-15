function result = findLowVariances(vars, valid)

mgDiff = diff(log10(vars)); % the difference between the 
                            % magnitudes of the variances
                            
lowVarSegs = find(abs(mgDiff) >= 2); % [ARBITRARY]
if ~isempty(lowVarSegs)
    first = lowVarSegs(1); % index of first big magnitude difference.
    if mgDiff(first) > 0 % 'first' has the lower variance
    	base = vars(first);
    else % 'first' has the higher variance
    	base = vars(first+1);
    end
    % Returns all the segments current in uncoveredRange and 
    % has the lowest magnitude of variances. e.g: [2 4 7]
    mg = log10(vars/base); % get the magnitude differences between vars

    if sum(mg < -1) > 1 % the number of segments have variances even smaller should we use WHILE??
                          % than the base is larger than 1
        idx = find(mg < -1);
        if ~isempty(intersect(valid,idx))
            base = vars(idx(1));
            mg = log10(vars/base);
        end
    end

    result = find(floor(abs(mg)) == 0);
    % return all the valid segments with the lowest magnitude of variances 
    % -> locally constant. (e.g. [2 5 6])

    % Usually, the invalid ones won't necessarily have lower magnitude in
    % variances. But still need to check on it if I have time.
    result = intersect(result, valid);  
    
end

end
