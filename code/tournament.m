% Tournament Selection


function NewChrIx = tournament(FitnV, Nsel);
NewChrIx = zeros(Nsel, 1);

[popsize, cols] = size(FitnV);

% Binary tournament selection
k = 2;

for i=1:Nsel
    bestSoFar = zeros(1,2);
    for index=1:k
        pidx = randi(popsize);
        bestFitValue = bestSoFar(2);
        fitValue = FitnV(pidx);
        if fitValue > bestFitValue
            bestSoFar = [pidx fitValue];
        end
    end
   
    NewChrIx(i) = bestSoFar(1);
end

% End of function
