# CORE player state
## lobby (-1): adventure, can't hurt or be hurt
## switching to spectator afterwards (admins) sticks


tag @s remove core.alive
tag @s remove win
gamemode adventure @s
effect clear @s
effect give @s weakness infinite 255 true
effect give @s resistance infinite 255 true
effect give @s regeneration infinite 255 true
effect give @s saturation infinite 255 true
