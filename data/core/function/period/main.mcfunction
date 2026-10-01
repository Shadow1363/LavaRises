# CORE period
## grace -> main


scoreboard players set period internal 2
scoreboard players set time internal 0
scoreboard players set time_s internal 0

# everyone playing now is alive
## players who join later spectate (see player/playing)
tag @a[gamemode=!spectator] add core.alive
function core:elimination/count

# announce
title @a subtitle {"nbt":"main_subtitle","storage":"core:config"}
title @a title {"nbt":"title","storage":"core:config","color":"red","bold":true}
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"nbt":"main_subtitle","storage":"core:config","color":"yellow"}]
# sfx
execute as @a at @s run playsound block.note_block.pling player @s ~ ~ ~ 100 0.8
execute as @a at @s run playsound entity.lightning_bolt.impact player @s ~ ~ ~


function #core:hooks/main
