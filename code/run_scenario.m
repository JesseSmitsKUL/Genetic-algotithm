function run_scenario(scenario)

% load the data sets
datasetslist = dir('datasets/');datasetslist = dir('datasets/');
datasets=cell( size(datasetslist,1)-2,1);datasets=cell( size(datasetslist,1)-2 ,1);
for i=1:size(datasets,1);
    datasets{i} = datasetslist(i+2).name;
end

index = 2;

[path, name, ext] = fileparts(datasets{index});

log_name = name + "_" + scenario.NAME + ".csv";

% start with dataset given by index
data = load(['datasets/' datasets{index}]);
x=data(:,1);%/max([data(:,1);data(:,2)]);
y=data(:,2);%/max([data(:,1);data(:,2)]);
scenario.NVAR=size(data,1);

fprintf("Running scenario[name=%s]\n", scenario.NAME);
 
console_run_ga(x, y, scenario.NIND, scenario.MAXGEN, scenario.NVAR, scenario.ELITIST, scenario.STOP_PERCENTAGE, scenario.PR_CROSS, scenario.PR_MUT, scenario.CROSSOVER, scenario.LOCALLOOP, scenario.P_SEL, log_name);

end