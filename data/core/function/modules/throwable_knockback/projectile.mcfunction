# THROWABLE KNOCKBACK
## as/at a flying projectile


# half and full motion, where it will be this tick
execute store result storage core:tmp tkb.hx double 0.0005 run data get entity @s Motion[0] 1000
execute store result storage core:tmp tkb.hy double 0.0005 run data get entity @s Motion[1] 1000
execute store result storage core:tmp tkb.hz double 0.0005 run data get entity @s Motion[2] 1000
execute store result storage core:tmp tkb.fx double 0.001 run data get entity @s Motion[0] 1000
execute store result storage core:tmp tkb.fy double 0.001 run data get entity @s Motion[1] 1000
execute store result storage core:tmp tkb.fz double 0.001 run data get entity @s Motion[2] 1000
data modify storage core:tmp tkb.damage set from storage core:config modules.throwable_knockback.damage

# the thrower can't hit themselves
execute on origin run tag @s add core.owner
function core:modules/throwable_knockback/sweep with storage core:tmp tkb
execute on origin run tag @s remove core.owner
