# CORE player state
## runs as a player once per period, and when they join mid-game


scoreboard players operation @s last_login = period internal

execute if score period internal matches -1 run return run function core:player/lobby
execute if score period internal matches 0 run return run function core:player/starter
execute if score period internal matches 1..2 run return run function core:player/playing
execute if score period internal matches 3 run return run function core:player/over
