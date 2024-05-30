using HiGHS
using JuMP
using REopt

ENV["NREL_DEVELOPER_API_KEY"]="0Kz4idK0TQwavTkb4DZQo1SqeIjIcbr1GpRGwwLa"

m1 = Model(optimizer_with_attributes(HiGHS.Optimizer, "output_flag" => false, "log_to_console" => false, "mip_rel_gap" => 0.01))

fp = REoptInputs("C:/Users/bem/.julia/packages/REopt/JtAEH/test/scenarios/chp_sizing.json");


REopt.run_reopt(m1::JuMP.AbstractModel, fp::REoptInputs)

results = reopt_results(m1, fp)

print(m1)