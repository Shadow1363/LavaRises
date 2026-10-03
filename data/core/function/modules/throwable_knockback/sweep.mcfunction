# THROWABLE KNOCKBACK
## macro {hx, hy, hz, fx, fy, fz, damage}, as/at a projectile
## a 1x1x1 box at its position, half-way and at the end of this tick's path


execute positioned ~-0.5 ~-0.5 ~-0.5 run tag @a[dx=0,dy=0,dz=0,tag=!core.owner,gamemode=!spectator] add core.tkb.hit
$execute positioned ~$(hx) ~$(hy) ~$(hz) positioned ~-0.5 ~-0.5 ~-0.5 run tag @a[dx=0,dy=0,dz=0,tag=!core.owner,gamemode=!spectator] add core.tkb.hit
$execute positioned ~$(fx) ~$(fy) ~$(fz) positioned ~-0.5 ~-0.5 ~-0.5 run tag @a[dx=0,dy=0,dz=0,tag=!core.owner,gamemode=!spectator] add core.tkb.hit
execute unless entity @a[tag=core.tkb.hit] run return 0

# knock back away from the projectile, once per projectile
tag @s add core.tkb.done
tag @s add core.tkb.this
$execute as @a[tag=core.tkb.hit] run damage @s $(damage) minecraft:thrown by @e[tag=core.tkb.this,limit=1]
tag @s remove core.tkb.this
tag @a remove core.tkb.hit
