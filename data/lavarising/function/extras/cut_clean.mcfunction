# CUT CLEAN
## auto-smelts ores & food


# 1.17+ ores
## iron
execute as @e[type=item,name="Raw Iron"] at @s run summon item ~ ~ ~ {Item:{id:"iron_ingot",count:2},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Iron"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Iron"] at @s run kill @s
## gold
execute as @e[type=item,name="Raw Gold"] at @s run summon item ~ ~ ~ {Item:{id:"gold_ingot",count:2},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Gold"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Gold"] at @s run kill @s
## copper
execute as @e[type=item,name="Raw Copper"] at @s run summon item ~ ~ ~ {Item:{id:"copper_ingot",count:2},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Copper"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Copper"] at @s run kill @s

# 1.16- ores
## iron
execute as @e[type=item,name="Iron Ore"] at @s run summon item ~ ~ ~ {Item:{id:"iron_ingot",count:2},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Iron Ore"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Iron Ore"] at @s run kill @s
## gold
execute as @e[type=item,name="Gold Ore"] at @s run summon item ~ ~ ~ {Item:{id:"gold_ingot",count:2},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Gold Ore"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Gold Ore"] at @s run kill @s

# food
## porkchop
execute as @e[type=item,name="Raw Porkchop"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_porkchop",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Porkchop"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Porkchop"] at @s run kill @s
## mutton
execute as @e[type=item,name="Raw Mutton"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_mutton",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Mutton"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Mutton"] at @s run kill @s
## steak
execute as @e[type=item,name="Raw Beef"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_beef",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Beef"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Beef"] at @s run kill @s
## chicken
execute as @e[type=item,name="Raw Chicken"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_chicken",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Chicken"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Chicken"] at @s run kill @s
## rabbit
execute as @e[type=item,name="Raw Rabbit"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_rabbit",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Rabbit"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Rabbit"] at @s run kill @s
## cod
execute as @e[type=item,name="Raw Cod"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_cod",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Cod"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Cod"] at @s run kill @s
## salmon
execute as @e[type=item,name="Raw Salmon"] at @s run summon item ~ ~ ~ {Item:{id:"cooked_salmon",count:1},Motion:[0.0,0.05,0.0],PickupDelay:8s}
execute as @e[type=item,name="Raw Salmon"] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
execute as @e[type=item,name="Raw Salmon"] at @s run kill @s