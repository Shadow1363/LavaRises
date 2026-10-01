# CORE win
## solos, the last player alive


execute unless entity @a[tag=core.alive] run return run function core:win/draw
tag @a[tag=core.alive] add win

# announce
title @a subtitle ["",{"selector":"@a[tag=win]","color":"yellow","bold":true},{"text":" has won!","color":"yellow"}]
title @a title {"text":"GAME OVER!","color":"gold","bold":true}
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"selector":"@a[tag=win]","color":"gold"},{"text":" has won!","color":"yellow"}]
# fireworks
execute as @a[tag=win] at @s run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;16257811],fade_colors:[I;16082451]}]}}}}


function core:win/finish
