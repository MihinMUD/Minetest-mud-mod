minetest.register_node("mud:mud", {
    description = "Mud",
    drawtype = "liquid",
	waving = 3,
    tiles = {"mud.png"},
    groups = {water = 3, liquid = 3, cools_lava = 1,crumbly = 3, soil = 1},
    sounds = {
        footstep = {name = "mud"},
        dug = {name = "mud"}   
},
})

minetest.register_craft({
    output = "mud:mud",
    recipe = {{"default:dirt" , "default:dirt" }}
})
