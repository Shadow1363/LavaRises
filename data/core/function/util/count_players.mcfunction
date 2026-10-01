# CORE count players
## players internal = # of non-spectators


execute store result score players internal if entity @a[gamemode=!spectator]
