# CORE period
## lobby -> starter


scoreboard players set period internal 0
scoreboard players set time internal 0
scoreboard players set time_s internal 0
tag @a remove win
tag @a remove core.alive
effect clear @a

# announce
title @a subtitle {"nbt":"start_subtitle","storage":"core:config"}
title @a title {"nbt":"title","storage":"core:config","color":"gold","bold":true}
function core:util/announce {message:"The game has started!"}
# sfx
execute as @a at @s run playsound entity.generic.explode player @s ~ ~ ~
execute as @a at @s run playsound block.note_block.pling player @s ~ ~ ~

# world
gamemode survival @a[gamemode=!spectator]
function core:border/start


function #core:hooks/start
