# CORE /reload


scoreboard objectives add global dummy
scoreboard objectives add internal dummy
scoreboard objectives add last_login dummy
scoreboard objectives add player.death deathCount

# menu buttons and team picking
scoreboard objectives add setup trigger
scoreboard objectives add team trigger

# bossbar
bossbar add core:main ""
bossbar set core:main players @a

# teams
## team ids double as their colour, 2-4 are used (teams_count)
team add red
team modify red color red
team add blue
team modify blue color blue
team add green
team modify green color green
team add yellow
team modify yellow color yellow

# config
## text shown in the menu, titles and bossbar
## the game's load hook overrides these
data merge storage core:config {title:"MINIGAME",start_subtitle:"The game has begun!",main_subtitle:"Eliminations are on! The last one standing wins."}

# play area center
## chosen in setup, or the first player's position (see tick)
execute unless data storage core:center x run data merge storage core:center {x:0,z:0}


function #core:hooks/load

# load defaults
execute unless score defaults internal matches 1.. run function core:defaults
