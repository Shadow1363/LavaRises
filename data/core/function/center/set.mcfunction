# CORE center
## set the play area center to @s's position


# store position
execute store result storage core:center x int 1 run data get entity @s Pos[0]
execute store result storage core:center z int 1 run data get entity @s Pos[2]
execute store result score center_x global run data get storage core:center x
execute store result score center_z global run data get storage core:center z
scoreboard players set center_set internal 1

# respawn inside the play area
setworldspawn ~ ~ ~

function core:center/apply with storage core:center
