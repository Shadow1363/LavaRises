# CORE defaults
## runs once, re-run with
## /scoreboard players reset defaults internal then /reload


# periods (seconds)
## starter: no pvp (resistance), border opens up
scoreboard players set starter_period global 60
## grace: pvp on, border shrinks to border_mid
scoreboard players set grace_period global 1800

# world border (blocks)
## size when the game starts
scoreboard players set border_size global 2000
## size reached when grace ends
scoreboard players set border_mid global 160
## border_delay seconds into main, shrink to border_end over border_end_time seconds
scoreboard players set border_end global 20
scoreboard players set border_delay global 130
scoreboard players set border_end_time global 1250

# teams
scoreboard players set teams global 0
## 2 = red/blue, 3 = +green, 4 = +yellow
scoreboard players set teams_count global 2

# modules
## cut clean: ores drop ingots, animals drop cooked food
scoreboard players set cut_clean global 1
## speed uhc: held mining tools get efficiency II
scoreboard players set speed_uhc global 1
scoreboard players set patch_grindstone_exploit global 1
## throwable knockback: snowballs and eggs knock players back
scoreboard players set throwable_knockback global 1
## arrow break: arrows fly through leaves and glass, breaking them
scoreboard players set arrow_break global 1
## cheaper items: cheaper recipes (e.g. tnt with 1 gunpowder)
scoreboard players set cheaper_items global 1

# singleplayer (testing)
## lets one player start, adds a phantom opponent so it doesn't end instantly
scoreboard players set singleplayer global 0

# play area center
## unset, tick picks the first player's position
scoreboard players reset center_set internal


function #core:hooks/defaults

function core:reset
scoreboard players set defaults internal 1
