function custom_main() 
scenarios = [];

scenario_execute_count = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTIMAL
for i = 1:scenario_execute_count
    sc.MAXGEN = 2000;
    sc.CROSSOVER = "edge_crossover";
    %sc.CROSSOVER = "xalt_edges";
    sc.NIND = 1000;
    sc.PR_CROSS = 0.95;
    sc.PR_MUT = 0.35;
    sc.ELITIST = 0.05;
    sc.LOCALLOOP = 1;
    sc.P_SEL = 'fps';
    sc.NAME = "Optimal_solution_fps";
    scenarios = [scenarios expand_scenario(sc)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf("Running %d scenarios...", size(scenarios));
for scenario = scenarios
   run_scenario(scenario) 
end


end
        