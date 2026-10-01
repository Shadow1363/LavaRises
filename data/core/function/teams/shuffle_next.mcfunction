# CORE teams
## round-robin, shuffle internal = players placed so far


scoreboard players operation team_index internal = shuffle internal
scoreboard players operation team_index internal %= teams_count global
execute if score team_index internal matches 0 run team join red @s
execute if score team_index internal matches 1 run team join blue @s
execute if score team_index internal matches 2 run team join green @s
execute if score team_index internal matches 3 run team join yellow @s
scoreboard players add shuffle internal 1
