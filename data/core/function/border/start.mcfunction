# CORE border
## starter: open up to border_size over 5s


execute store result storage core:border size int 1 run scoreboard players get border_size global
data modify storage core:border time set value 5
function core:border/set with storage core:border
