# LAVARISING hazard
## void, run as a survival player in period 2
## everything below the cleared layer belongs to the void,
## so hiding on blocks placed below it doesn't work


execute store result score @s player.y run data get entity @s Pos[1]
execute if score @s player.y <= riser_height internal run damage @s 1000 minecraft:out_of_world
