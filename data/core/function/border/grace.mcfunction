# CORE border
## grace: shrink to border_mid by the end of the grace period


execute store result storage core:border size int 1 run scoreboard players get border_mid global
execute store result storage core:border time int 1 run scoreboard players get grace_period global
function core:border/set with storage core:border
