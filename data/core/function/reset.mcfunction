# CORE reset
## back to the lobby, keeps settings
## the world itself is not restored


scoreboard players set period internal -1
scoreboard players set time internal 0
scoreboard players set time_s internal 0
tag @a remove win
tag @a remove core.alive

# world
worldborder set 10
function core:center/gather with storage core:center

# show the menu again
scoreboard players reset setup internal


function #core:hooks/reset
