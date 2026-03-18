local settings = { 	
   {
		type = "int-setting",
		name = "handcrafting-check-interval",
		setting_type = "runtime-global",
		default_value = 4,
		minimum_value = 1,
		order = "a[mode]",
	},
}

data:extend(settings)