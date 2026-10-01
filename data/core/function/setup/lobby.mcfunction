# CORE setup
## game over -> back to the lobby


function core:reset
function core:util/announce {message:"Back to the lobby! Use /trigger setup to configure the next game."}
execute as @a at @s run playsound block.note_block.pling player @s
