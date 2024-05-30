using Cbc
using JuMP
using REopt

ENV["NREL_DEVELOPER_API_KEY"]="0Kz4idK0TQwavTkb4DZQo1SqeIjIcbr1GpRGwwLa"

m = JuMP.Model(Cbc.Optimizer)

p = REoptInputs("C:/Users/bem/.julia/packages/REopt/JtAEH/test/scenarios/UCI_Scenario0.json");

build_reopt!(m, p)

#= 
replace the original objective, which is to Min the Costs,
with the Costs + 100 * (total curtailed PV power)
=#  
#JuMP.@objective(m, Min, m[:REopt.calc_yr1_emissions_from_onsite_fuel]);

JuMP.optimize!(m)  # normally this command is called in run_reopt

results = reopt_results(m, p)