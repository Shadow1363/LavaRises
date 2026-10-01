# CORE win
## main period, every tick
## contenders = players alive (solos) or teams with someone alive


execute unless score teams global matches 1.. run scoreboard players operation contenders internal = alive internal
execute if score teams global matches 1.. run scoreboard players set contenders internal 0
execute if score teams global matches 1.. if score alive_red internal matches 1.. run scoreboard players add contenders internal 1
execute if score teams global matches 1.. if score alive_blue internal matches 1.. run scoreboard players add contenders internal 1
execute if score teams global matches 1.. if score alive_green internal matches 1.. run scoreboard players add contenders internal 1
execute if score teams global matches 1.. if score alive_yellow internal matches 1.. run scoreboard players add contenders internal 1
## singleplayer (testing): a phantom opponent keeps the game going
execute if score singleplayer global matches 1.. run scoreboard players add contenders internal 1

execute if score contenders internal matches 2.. run return 0

# one (or none) left
execute unless score teams global matches 1.. run return run function core:win/solo
execute if score alive_red internal matches 1.. run return run function core:win/team {team:"red",name:"Red",colors:16711680,fade:15937120}
execute if score alive_blue internal matches 1.. run return run function core:win/team {team:"blue",name:"Blue",colors:2961919,fade:1734140}
execute if score alive_green internal matches 1.. run return run function core:win/team {team:"green",name:"Green",colors:845653,fade:8845339}
execute if score alive_yellow internal matches 1.. run return run function core:win/team {team:"yellow",name:"Yellow",colors:16776960,fade:16766720}
function core:win/draw
