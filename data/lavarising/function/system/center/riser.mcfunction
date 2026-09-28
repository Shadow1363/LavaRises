# LAVARISING center
## macro, summon the riser at the center (run with storage lavarising:center)


kill @e[tag=riser]
$execute if score legacy global matches 1.. run summon minecraft:armor_stand $(x) 0 $(z) {Tags:["riser"],Invisible:1b,Marker:1b,Small:1b}
$execute unless score legacy global matches 1.. run summon minecraft:armor_stand $(x) -64 $(z) {Tags:["riser"],Invisible:1b,Marker:1b,Small:1b}
