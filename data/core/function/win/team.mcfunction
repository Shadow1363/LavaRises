# CORE win
## macro {team, name, colors, fade}, the last team alive
## colors/fade are firework colours (decimal RGB)


$tag @a[tag=core.alive,team=$(team)] add win

# announce
$title @a subtitle ["",{"text":"$(name)","color":"$(team)","bold":true},{"text":" has won!","color":"yellow"}]
$title @a title {"text":"GAME OVER!","color":"$(team)","bold":true}
$tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"$(name)","color":"$(team)"},{"text":" has won!","color":"yellow"}]
# fireworks
$execute as @a[tag=win] at @s run summon firework_rocket ~ ~1 ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;$(colors)],fade_colors:[I;$(fade)]}]}}}}


function core:win/finish
