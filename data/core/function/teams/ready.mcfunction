# CORE teams
## returns 1 if every playing team has a player
## and no player (non-spectator) is outside the playing teams


execute unless entity @a[team=red,gamemode=!spectator] run return 0
execute unless entity @a[team=blue,gamemode=!spectator] run return 0
execute if score teams_count global matches 3.. unless entity @a[team=green,gamemode=!spectator] run return 0
execute if score teams_count global matches 4.. unless entity @a[team=yellow,gamemode=!spectator] run return 0

execute if score teams_count global matches ..2 if entity @a[gamemode=!spectator,team=!red,team=!blue] run return 0
execute if score teams_count global matches 3 if entity @a[gamemode=!spectator,team=!red,team=!blue,team=!green] run return 0
execute if score teams_count global matches 4.. if entity @a[gamemode=!spectator,team=!red,team=!blue,team=!green,team=!yellow] run return 0
return 1
