local handtool_category = {
    type = 'ammo-category',
    name = 'hand-tools',
    subgroup = "ammo-category"
}

local get_toolboxed = {
    type = 'gun',
    name = 'hand-tool-box',
    icon = '__handcrafted__/graphics/toolbox.png',
    icon_size = 64,
    subgroup = 'tool',
    order = 'b[repair]-b[hand-tool-box]',
    attack_parameters = {
        type = 'projectile',
        activation_type = 'consume',
        ammo_category = 'hand-tools',
        cooldown = 60,
        movement_slow_down_factor = 0.0,
        shell_particle = nil,
        range = 20,
        ammo_consumption_modifier = 0
    },
    stack_size = 1
}

data:extend({handtool_category, get_toolboxed})