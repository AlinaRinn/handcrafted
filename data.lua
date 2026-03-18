require("__handcrafted__/prototypes/toolbox")
require("__handcrafted__/prototypes/item")
require("__handcrafted__/prototypes/recipe")

table.insert(data.raw["technology"]["repair-pack"].effects, {type = "unlock-recipe", recipe = "hand-tools"})
table.insert(data.raw["technology"]["fluid-handling"].effects, {type = "unlock-recipe", recipe = "pneumatic-tools"})
table.insert(data.raw["technology"]["battery"].effects, {type = "unlock-recipe", recipe = "cordless-tools"})
table.insert(data.raw["technology"]["electric-engine"].effects, {type = "unlock-recipe", recipe = "electric-tools"})