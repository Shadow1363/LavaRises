# LAVARISING setup trigger
## menu buttons use /trigger setup set <n> instead of /function,
## /trigger needs no op so clicking skips the "run command?" prompt


execute if score @s setup matches 1 run return run function lavarising:setup/go
# teams
execute if score @s setup matches 2 run return run function lavarising:setup/teams/on
execute if score @s setup matches 3 run return run function lavarising:setup/teams/off
# rise height limit
execute if score @s setup matches 4 run return run function lavarising:setup/rise_height_limit/down
execute if score @s setup matches 5 run return run function lavarising:setup/rise_height_limit/up
# rise ticks
execute if score @s setup matches 6 run return run function lavarising:setup/rise_ticks/down
execute if score @s setup matches 7 run return run function lavarising:setup/rise_ticks/up
# center
execute if score @s setup matches 21 run return run function lavarising:setup/center/here
# starter period
execute if score @s setup matches 8 run return run function lavarising:setup/starter_period/down
execute if score @s setup matches 9 run return run function lavarising:setup/starter_period/up
# grace period
execute if score @s setup matches 10 run return run function lavarising:setup/grace_period/down
execute if score @s setup matches 11 run return run function lavarising:setup/grace_period/up
# cut clean
execute if score @s setup matches 12 run return run function lavarising:setup/cut_clean/on
execute if score @s setup matches 13 run return run function lavarising:setup/cut_clean/off
# speed uhc
execute if score @s setup matches 14 run return run function lavarising:setup/speed_uhc/on
execute if score @s setup matches 15 run return run function lavarising:setup/speed_uhc/off
# legacy mode
execute if score @s setup matches 16 run return run function lavarising:setup/legacy/on
execute if score @s setup matches 17 run return run function lavarising:setup/legacy/off
# singleplayer
execute if score @s setup matches 18 run return run function lavarising:setup/singleplayer/on
execute if score @s setup matches 19 run return run function lavarising:setup/singleplayer/off
# start
execute if score @s setup matches 20 run return run function lavarising:start
