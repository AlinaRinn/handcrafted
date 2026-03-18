data:extend{
      {
        type = "ammo", --hate it
        name = "basic-hand-tools",
        icon = "__handcrafted__/graphics/basic-hand-tools.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-f[basic-hand-tools]",
        stack_size = 20,
        magazine_size = 160,
        reload_time = 60, -- 0 to 100, how much crafting time gets skipped by using these
        ammo_category = "hand-tools",
        ammo_type = {}
      },
      {
        type = "ammo", --still hate it
        name = "power-hand-tools",
        icon = "__handcrafted__/graphics/power-hand-tools.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "tool",
        order = "b[repair]-f[power-hand-tools]",
        stack_size = 20,
        magazine_size = 240,
        reload_time = 90, -- 0 to 100, how much crafting time gets skipped by using these
        ammo_category = "hand-tools",
        ammo_type = {}
      },
}