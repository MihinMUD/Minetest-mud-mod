minetest.register_node("mud:mud", {
    description = "Mud",
    tiles = {"mud.png"},
    groups = {water = 3, liquid = 3, cools_lava = 1,crumbly = 3, soil = 1},
    post_effect_color = {a = 412, r = 81, g = 42, b = 8},
    sounds = {
        footstep = {name = "mud"},
        dug = {name = "mud"}   
},
    paramtype = "light",
    walkable = false,
    pointable = true,
    diggable = true,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "source",
    liquid_alternative_flowing = "mud:mud_flowing",
    liquid_alternative_source = "mud:mud",
    liquid_viscosity = 1,
})

minetest.register_node("mud:mud_flowing", {
    description = "Mud flowing",
    tiles = {"mud.png"},
    groups = {water = 3, liquid = 3, cools_lava = 1,crumbly = 3, soil = 1},
    post_effect_color = {a = 412, r = 81, g = 42, b = 8},
    sounds = {
        footstep = {name = "mud"},
        dug = {name = "mud"}   
},
    paramtype = "light",
    walkable = false,
    pointable = true,
    diggable = true,
    buildable_to = true,
    is_ground_content = false,
    drop = "",
    drowning = 1,
    liquidtype = "flowing",
    liquid_alternative_flowing = "mud:mud_flowing",
    liquid_alternative_source = "mud:mud",
    liquid_viscosity = 1,
})

minetest.register_craft({
    output = "mud:mud",
    recipe = {{"default:dirt" , "default:dirt" }}
})
