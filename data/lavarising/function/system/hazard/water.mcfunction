# LAVARISING hazard
## water, run as a survival player in period 2
## water alone isn't lethal, so swimming in the risen water hurts like lava


execute store result score @s player.y run data get entity @s Pos[1]
## treading water at the surface puts your feet at riser_height,
## standing on a block above the water keeps you safe
execute if score @s player.y <= riser_height internal if block ~ ~ ~ #lavarising:water_hazard run damage @s 2 minecraft:drown
