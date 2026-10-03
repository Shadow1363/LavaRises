# CORE /reload


scoreboard objectives add global dummy
scoreboard objectives add internal dummy
scoreboard objectives add last_login dummy
scoreboard objectives add player.death deathCount
## cheaper items, which recipe state a player has
scoreboard objectives add core.recipes dummy

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

# module configs
## the game's load hook can override these
function core:modules/throwable_knockback/config
function core:modules/arrow_break/config

# play area center
## chosen in setup, or the first player's position (see tick)
execute unless data storage core:center x run data merge storage core:center {x:0,z:0}


function #core:hooks/load

# settings added after a world's defaults already ran
execute unless score throwable_knockback global matches -2147483648.. run scoreboard players set throwable_knockback global 1
execute unless score arrow_break global matches -2147483648.. run scoreboard players set arrow_break global 1
execute unless score cheaper_items global matches -2147483648.. run scoreboard players set cheaper_items global 1

# load defaults
execute unless score defaults internal matches 1.. run function core:defaults
