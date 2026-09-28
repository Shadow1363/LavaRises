# LAVARISING center
## set the play area center to @s's position


# store position
execute store result storage lavarising:center x int 1 run data get entity @s Pos[0]
execute store result storage lavarising:center z int 1 run data get entity @s Pos[2]
execute store result score center_x global run data get storage lavarising:center x
execute store result score center_z global run data get storage lavarising:center z
scoreboard players set center_set internal 1

# respawn inside the play area
setworldspawn ~ ~ ~

function lavarising:system/center/apply with storage lavarising:center
