data:extend{
  {
    type = "recipe",
    name = "hand-tool-box",
    energy_required = 4,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 4}
    },
    results = {{type = "item", name = "hand-tool-box", amount = 1}}
  },
  {
    type = "recipe",
    name = "hand-tools",
	enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "wood", amount = 1},
      {type = "item", name = "iron-plate", amount = 2},
      {type = "item", name = "copper-plate", amount = 2}
    },
    results = {{type = "item", name = "hand-tools", amount = 2}}
  },
  {
    type = "recipe",
    name = "pneumatic-tools",
	enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "hand-tools", amount = 1},
	  {type = "item", name = "iron-gear-wheel", amount = 4},
      {type = "item", name = "barrel", amount = 2},
      {type = "item", name = "pipe", amount = 2}
    },
    results = {{type = "item", name = "pneumatic-tools", amount = 1}}
  },
  {
    type = "recipe",
    name = "cordless-tools",
	enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "hand-tools", amount = 1},
	  {type = "item", name = "iron-gear-wheel", amount = 2},
	  {type = "item", name = "steel-plate", amount = 1},
	  {type = "item", name = "copper-cable", amount = 1},
	  {type = "item", name = "electronic-circuit", amount = 1},
      {type = "item", name = "plastic-bar", amount = 2},
      {type = "item", name = "battery", amount = 2}
    },
    results = {{type = "item", name = "cordless-tools", amount = 1}}
  },
  {
    type = "recipe",
    name = "electric-tools",
	enabled = false,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "hand-tools", amount = 1},
	  {type = "item", name = "iron-gear-wheel", amount = 2},
	  {type = "item", name = "steel-plate", amount = 1},
	  {type = "item", name = "copper-cable", amount = 2},
	  {type = "item", name = "advanced-circuit", amount = 2},
	  {type = "item", name = "plastic-bar", amount = 2}
    },
    results = {{type = "item", name = "electric-tools", amount = 1}}
  },
}