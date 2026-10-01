# CORE border
## main: shrink to border_end over border_end_time


execute store result storage core:border size int 1 run scoreboard players get border_end global
execute store result storage core:border time int 1 run scoreboard players get border_end_time global
function core:border/set with storage core:border
