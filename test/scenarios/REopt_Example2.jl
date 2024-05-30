using Cbc
using JuMP
using REopt

ENV["NREL_DEVELOPER_API_KEY"]="0Kz4idK0TQwavTkb4DZQo1SqeIjIcbr1GpRGwwLa"

m = JuMP.Model(Cbc.Optimizer)

p = REoptInputs("C:/Users/bem/.julia/packages/REopt/JtAEH/test/scenarios/pv_storage.json");

build_reopt!(m, p)

#= 
replace the original objective, which is to Min the Costs,
with the Costs + 100 * (total curtailed PV power)
=#  
JuMP.@objective(m, Min, m[:Costs] + 100 * sum(m[:dvCurtail]["PV", ts] for ts in p.time_steps));

JuMP.optimize!(m)  # normally this command is called in run_reopt

results = reopt_results(m, p)