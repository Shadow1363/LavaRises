# ARROW BREAK
## as/at a flying arrow
## sample its path this tick in quarters (a full-power arrow moves ~3 blocks/tick)


execute store result storage core:tmp arrow.x1 double 0.00025 run data get entity @s Motion[0] 1000
execute store result storage core:tmp arrow.y1 double 0.00025 run data get entity @s Motion[1] 1000
execute store result storage core:tmp arrow.z1 double 0.00025 run data get entity @s Motion[2] 1000
execute store result storage core:tmp arrow.x2 double 0.0005 run data get entity @s Motion[0] 1000
execute store result storage core:tmp arrow.y2 double 0.0005 run data get entity @s Motion[1] 1000
execute store result storage core:tmp arrow.z2 double 0.0005 run data get entity @s Motion[2] 1000
execute store result storage core:tmp arrow.x3 double 0.00075 run data get entity @s Motion[0] 1000
execute store result storage core:tmp arrow.y3 double 0.00075 run data get entity @s Motion[1] 1000
execute store result storage core:tmp arrow.z3 double 0.00075 run data get entity @s Motion[2] 1000
execute store result storage core:tmp arrow.x4 double 0.001 run data get entity @s Motion[0] 1000
execute store result storage core:tmp arrow.y4 double 0.001 run data get entity @s Motion[1] 1000
execute store result storage core:tmp arrow.z4 double 0.001 run data get entity @s Motion[2] 1000
data modify storage core:tmp arrow.mode set from storage core:config modules.arrow_break.mode

function core:modules/arrow_break/sweep with storage core:tmp arrow
