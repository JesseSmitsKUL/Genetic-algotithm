% Edge crossover for the TSP problem

function NewChrom = edge_crossover(OldAdjChrom, XOVR);
if nargin < 2, XOVR = NaN; end

[NIND,NVAR] = size(OldAdjChrom);

% Conversion from adj to path representation
OldChrom=zeros(NIND,NVAR);
for row=1:NIND
    OldChrom(row,:)=adj2path(OldAdjChrom(row, :));
end

[rows,cols]=size(OldChrom);
   
   maxrows=rows;
   if rem(rows,2)~=0
	   maxrows=maxrows-1;
   end
   
   for row=1:2:maxrows
	
    % crossover of the two chromosomes
   	% results in 2 offsprings
	if rand<XOVR			% recombine with a given probability
        NewChrom(row,:) = edge_offspring([OldChrom(row,:);OldChrom(row+1,:)]);
        NewChrom(row+1,:)=edge_offspring([OldChrom(row+1,:);OldChrom(row,:)]);
        %NewChrom(row,:) =cross_alternate_edges([OldChrom(row,:);OldChrom(row+1,:)]);
	else
		NewChrom(row,:)=OldChrom(row,:);
		NewChrom(row+1,:)=OldChrom(row+1,:);
	end
   end

   if rem(rows,2)~=0
	   NewChrom(rows,:)=OldChrom(rows,:);
   end

   % Conversion from path to adj representation
    for row=1:NIND
        NewChrom(row,:)=path2adj(NewChrom(row, :));
    end
   

% End of function
