local include, nodecore
    = include, nodecore

local modname = minetest.get_current_modname()



include("misc")


-- Stones

include("stones/granite")
include("stones/verdstone")


-- Gems

include("gems/lackish")
include("gems/loathish")


-- Progression

include("progression/wood")

-- include("algae/node")
-- include("algae/gen")