data:extend{
      {
        type = "ammo", --hate it
        name = "hand-tools",
        icon = "__handcrafted__/graphics/hand-tools.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-c[hand-tools]",
        stack_size = 100,
        magazine_size = 1000,
        reload_time = 75, -- 0 to 100, how much crafting time gets skipped by using these
        ammo_category = "hand-tools",
        ammo_type = {}
      },
      {
        type = "ammo", --still hate it
        name = "pneumatic-tools",
        icon = "__handcrafted__/graphics/pneumatic-tools.png",
        icon_size = 256, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-d[pneumatic-tools]",
        stack_size = 30,
        magazine_size = 800,
        reload_time = 90,
        ammo_category = "hand-tools",
        ammo_type = {}
      },
	  {
        type = "ammo", --how another dev, i hate it too
        name = "cordless-tools",
        icon = "__handcrafted__/graphics/cordless-tools.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-e[cordless-tools]",
        stack_size = 30,
        magazine_size = 400,
        reload_time = 95,
        ammo_category = "hand-tools",
        ammo_type = {}
      },
	  {
	    type = "ammo", --still hate it
        name = "electric-tools",
        icon = "__handcrafted__/graphics/electric-tools.png",
        icon_size = 256, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-f[electric-tools]",
        stack_size = 30,
        magazine_size = 800,
        reload_time = 100,
        ammo_category = "hand-tools",
        ammo_type = {}
      },
}