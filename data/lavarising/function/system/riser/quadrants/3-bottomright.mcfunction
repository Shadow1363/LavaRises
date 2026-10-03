## fills with the selected hazard (hazard global), void clears the layer to air
execute if score hazard global matches 0 at @e[tag=riser,limit=1] run fill ~80 ~ ~80 ~ ~ ~ lava
execute if score hazard global matches 1 at @e[tag=riser,limit=1] run fill ~80 ~ ~80 ~ ~ ~ water
execute if score hazard global matches 2 at @e[tag=riser,limit=1] run fill ~80 ~ ~80 ~ ~ ~ powder_snow
execute if score hazard global matches 3 at @e[tag=riser,limit=1] run fill ~80 ~ ~80 ~ ~ ~ air
