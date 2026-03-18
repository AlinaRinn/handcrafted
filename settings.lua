local settings = { 	
   {
		type = "int-setting",
		name = "handcrafting-check-interval",
		setting_type = "runtime-global",
		default_value = 1,
		minimum_value = 1,
		order = "a[mode]",
	},
}

data:extend(settings)