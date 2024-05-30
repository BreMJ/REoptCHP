using REopt, JuMP, Cbc

ENV["NREL_DEVELOPER_API_KEY"]="0Kz4idK0TQwavTkb4DZQo1SqeIjIcbr1GpRGwwLa"

m = Model(Cbc.Optimizer)
results = run_reopt(m, "C:/Users/bem/.julia/packages/REopt/JtAEH/test/scenarios/pv_storage.json")