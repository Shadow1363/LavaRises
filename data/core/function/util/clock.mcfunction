# CORE clock
## time (ticks, 0-19) -> time_s (seconds)


scoreboard players add time internal 1

execute if score time internal matches 20.. run scoreboard players add time_s internal 1
execute if score time internal matches 20.. run scoreboard players set time internal 0
