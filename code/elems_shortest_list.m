
function elemWithShortestList=elems_shortest_list(table, elems);
    currentShortestSize = intmax;
    elemsWithShortestList = [];
    
    for i=1:length(elems);
        el = elems(i);
        list = table(el, :);
        list = list(list > 0);
        if length(list) < currentShortestSize
            currentShortestSize = length(list);
            elemsWithShortestList = [el];
        elseif length(list) == currentShortestSize
            currentShortestSize = length(list);
            elemsWithShortestList = [elemsWithShortestList el];
        end
    end
    
    % Pick element at random
    index = randi(length(elemsWithShortestList));
    elemWithShortestList = elemsWithShortestList(index);

    
% end function
