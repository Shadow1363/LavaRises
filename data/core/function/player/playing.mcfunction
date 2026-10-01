# CORE player state
## grace (1) and main (2): survival, no effects


effect clear @s
## main: only players alive when it started keep playing
execute if score period internal matches 2 run return run gamemode spectator @s[tag=!core.alive]
gamemode survival @s[gamemode=!spectator]
