% function creating an edge table from two parents

function table=create_edge_table(Parents);
	cols=size(Parents,2);
    
    % Edge table
    table = zeros(cols, 4);
    
    parent1 = Parents(1, :);
    parent2 = Parents(2, :);
    
    %disp(parent1);
    %disp(parent2);
    
    for i=0:cols-1
       elemOfP1 = parent1(i+1);
       elemOfP2 = parent2(i+1);
       
       nextElemIndex = mod(i + 1, cols);
       prevElemIndex = mod(i - 1, cols);
       
       %disp(nextElemIndex);
       %disp(prevElemIndex);
       
       nextElemOfP1 = parent1(nextElemIndex+1);
       nextElemOfP2 = parent2(nextElemIndex+1);
       
       prevElemOfP1 = parent1(prevElemIndex+1);
       prevElemOfP2 = parent2(prevElemIndex+1);
       
       table(elemOfP1, 1:2) = [prevElemOfP1 nextElemOfP1];
       table(elemOfP2, 3:4) = [prevElemOfP2 nextElemOfP2]; 
    end
    
    %disp(table);
    
    % duplicate check
    
% end function
