# CORE elimination
## as/at a player who died in the main period
## counters are decremented (not recounted) so offline players stay in the game


tag @s remove core.alive
gamemode spectator @s
scoreboard players remove alive internal 1
execute if entity @s[team=red] run scoreboard players remove alive_red internal 1
execute if entity @s[team=blue] run scoreboard players remove alive_blue internal 1
execute if entity @s[team=green] run scoreboard players remove alive_green internal 1
execute if entity @s[team=yellow] run scoreboard players remove alive_yellow internal 1

# announce
## the selector shows the team colour
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"☠","color":"red"},{"text":"] ","color":"dark_gray"},{"selector":"@s","bold":true},{"text":" has been eliminated!","color":"dark_red"}]
# sfx
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder player @s


function #core:hooks/death
