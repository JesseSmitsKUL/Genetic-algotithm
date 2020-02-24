
function duplicates=check_duplicates(list);
    edges = min(list) : max(list);
    [counts, values] = histc(list, edges);
    duplicates = edges(counts >= 2);
    duplicates = duplicates(duplicates > 0); 
    
% end function
