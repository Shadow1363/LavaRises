# CORE setup trigger
## menu buttons run /trigger setup set <n> instead of /function,
## /trigger needs no op so clicking skips the "run this command?" screen


scoreboard players operation clicked internal = @s setup
scoreboard players reset @s setup

execute if score period internal matches -1 run return run function core:setup/dispatch
## game over, only "back to lobby"
execute if score period internal matches 3 if score clicked internal matches 22 run return run function core:setup/lobby
function core:util/error {message:"The setup menu can only be used before the game has started."}
