function expanded = expand_scenario(scenario)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NIND=50;		% Number of individuals
MAXGEN=100;		% Maximum no. of generations
NVAR=26;		% No. of variables
PRECI=1;		% Precision of variables
ELITIST=0.05;    % percentage of the elite population
GGAP=1-ELITIST;		% Generation gap
STOP_PERCENTAGE=.95;    % percentage of equal fitness individuals for stopping
PR_CROSS=.95;     % probability of crossover
PR_MUT=.05;       % probability of mutation
LOCALLOOP=0;      % local loop removal
P_SEL='sus';
CROSSOVER = 'xalt_edges';  % default crossover operator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ~isfield(scenario,'NIND')
    scenario.NIND = NIND;
end

if ~isfield(scenario,'MAXGEN')
    scenario.MAXGEN = MAXGEN;
end

if ~isfield(scenario,'NVAR')
    scenario.NVAR = NVAR;
end

if ~isfield(scenario,'PRECI')
    scenario.PRECI = PRECI;
end

if ~isfield(scenario,'ELITIST')
    scenario.ELITIST = ELITIST;
end

if ~isfield(scenario,'GGAP')
    scenario.GGAP = GGAP;
end

if ~isfield(scenario,'STOP_PERCENTAGE')
    scenario.STOP_PERCENTAGE = STOP_PERCENTAGE;
end

if ~isfield(scenario,'PR_CROSS')
    scenario.PR_CROSS = PR_CROSS;
end

if ~isfield(scenario,'PR_MUT')
    scenario.PR_MUT = PR_MUT;
end

if ~isfield(scenario,'LOCALLOOP')
    scenario.LOCALLOOP = LOCALLOOP;
end

if ~isfield(scenario,'P_SEL')
    scenario.P_SEL = P_SEL;
end

if ~isfield(scenario,'CROSSOVER')
    scenario.CROSSOVER = CROSSOVER;
    fprintf("Using DEFAULT %s as crossover operator\n", scenario.CROSSOVER);
else
    fprintf("Using %s as crossover operator\n", scenario.CROSSOVER);
end

expanded = scenario;
end