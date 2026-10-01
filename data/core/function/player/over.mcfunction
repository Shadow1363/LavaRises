# CORE player state
## game over (3): winners glow, everyone else spectates


gamemode spectator @s[tag=!win]
effect clear @s
effect give @s resistance infinite 255 true
effect give @s[tag=win] glowing infinite 0 true
