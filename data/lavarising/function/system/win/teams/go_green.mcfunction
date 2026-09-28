# LAVARISING win
## teams green


scoreboard players set period internal 3

# announce
title @a title {"text":"GAME OVER!","color":"blue","bold":true}
title @a subtitle ["",{"text":"Green","color":"green","bold":true},{"text":" has won!","color":"yellow"}]
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Green","color":"green"},{"text":" has won!","color":"yellow"}]
# sfx
execute as @a at @s run playsound ui.toast.challenge_complete player @s ~ ~ ~

# fireworks
effect give @a resistance 9999 255 true
execute as @a[tag=win] at @s run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;845653],fade_colors:[I;8845339]}]}}}}

# effects
effect give @a[tag=win] glowing 9999 255 true