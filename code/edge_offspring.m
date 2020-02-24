% Computes the offspring of the edge crossover operator given two parents

function offspring=edge_offspring(Parents);
    table = create_edge_table(Parents);
    [rows, cols] = size(table);
    
    offspring = zeros(1, rows);
    current_gene = 1;
    choices = [1:rows];
    
    elem = randi(rows);
    currentList = table(elem, :);
    choices = choices(choices ~= elem);
    
	% remove elem refereces
    while length(choices) > 1
        % put it in the offspring
        offspring(current_gene) = elem;
        
        current_gene = current_gene + 1;
        
        % Remove all references to current element from the table
        table(table == elem) = 0;

        
        if length(currentList(currentList > 0)) == 0
             % In the case of reaching an empty list, a new element is chosen at random
            tmpChoices = choices(choices ~= elem);
            elindex = randi(length(tmpChoices));
            elem = tmpChoices(elindex);
        else
            duplicates = check_duplicates(currentList);
            %If there is a common edge, pick that to be the next element
            if length(duplicates) > 0
                index = randi(length(duplicates));
                elem = duplicates(index);
            else
                %Otherwise pick the entry in the list which itself has the shortest list
                elem = elems_shortest_list(table, currentList(currentList>0));
            end
        end 
        
        currentList = table(elem, :);
        choices = choices(choices ~= elem);
    end
    
    offspring(current_gene) = elem;
    offspring(current_gene+1) = choices(1);
    
    
% end function
