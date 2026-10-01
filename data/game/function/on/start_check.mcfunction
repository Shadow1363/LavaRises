# GAME start check
## as the player who clicked Start, after core's checks passed
## to block the start: print why, then set can_start to 0, e.g.
##   execute unless score my_number global matches 1.. run function core:util/error {message:"Cannot start, ..."}
##   execute unless score my_number global matches 1.. run scoreboard players set can_start internal 0
