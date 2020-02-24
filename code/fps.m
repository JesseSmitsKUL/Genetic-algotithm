% Fitness Proportional Selection


function NewChrIx = fps(FitnV, Nsel);

totalFitness = sum(FitnV);

NewChrIx = zeros(Nsel,1);

[popsize, cols] = size(FitnV);

for i=1:Nsel
    r = rand(1);
    
    pidx = 1;
    cumulativeCounter = FitnV(1)/totalFitness;
    
    while cumulativeCounter < r
        pidx = pidx + 1;
        cumulativeCounter = cumulativeCounter + (FitnV(pidx)/totalFitness);
    end
    
    NewChrIx(i) = pidx;
end

% End of function
