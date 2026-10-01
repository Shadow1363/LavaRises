# CUT CLEAN
## instant smelt: ores drop ingots, animals drop cooked food
## each item entity is checked once (tag core.cc)


execute as @e[type=item,tag=!core.cc] at @s run function core:modules/cut_clean/item
