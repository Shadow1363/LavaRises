# CORE tick


# lobby
## default center, the first player's position
execute if score period internal matches -1 unless score center_set internal matches 1.. as @a[limit=1] at @s run function core:center/set
## show the menu once (and again after a reset)
execute unless score setup internal matches 1.. as @a run function core:setup/menu
execute if score period internal matches -1 run title @a actionbar ["",{"text":"Configure the game using ","color":"yellow"},{"text":"/trigger setup","color":"gold"},{"text":" before the games begin!","color":"yellow"}]
## don't get stuck in blocks
execute if score period internal matches -1 as @a[gamemode=!spectator] at @s unless block ~ ~1 ~ #core:safe run tp @s ~ ~5 ~

# triggers
scoreboard players enable @a setup
scoreboard players enable @a team
execute as @a[scores={setup=1..}] at @s run function core:setup/trigger
execute as @a[scores={team=1..}] at @s run function core:teams/pick

bossbar set core:main players @a

# modules
execute if score cut_clean global matches 1.. run function core:modules/cut_clean/tick
execute if score speed_uhc global matches 1.. run function core:modules/speed_uhc/tick

# clock, transitions, bossbar, per-player state
function core:period/tick

# main period: eliminations, then win checks
execute if score period internal matches 2 as @a[tag=core.alive,scores={player.death=1..}] at @s run function core:elimination/death
scoreboard players reset @a player.death
execute if score period internal matches 2 run function core:win/check


function #core:hooks/tick
