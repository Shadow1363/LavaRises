# CORE teams
## /trigger team set <n>, anyone can use it in the lobby
## 1 red, 2 blue, 3 green, 4 yellow


scoreboard players operation picked internal = @s team
scoreboard players reset @s team

execute unless score period internal matches -1 run return run function core:util/error {message:"Teams can only be changed before the game has started."}
execute unless score teams global matches 1.. run return run function core:util/error {message:"Teams are disabled, enable them in /trigger setup."}
execute if score picked internal > teams_count global run return run function core:util/error {message:"That team isn't playing this game."}

execute if score picked internal matches 1 run function core:teams/join {team:"red",name:"Red"}
execute if score picked internal matches 2 run function core:teams/join {team:"blue",name:"Blue"}
execute if score picked internal matches 3 run function core:teams/join {team:"green",name:"Green"}
execute if score picked internal matches 4 run function core:teams/join {team:"yellow",name:"Yellow"}
