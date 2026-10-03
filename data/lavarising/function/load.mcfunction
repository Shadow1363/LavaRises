# LAVARISING /reload


scoreboard objectives add global dummy
scoreboard objectives add internal dummy
scoreboard objectives add last_login dummy

# open setup
scoreboard objectives add setup trigger

# numbers
scoreboard players set 1 internal 1

# kill nearby falling blocks
scoreboard objectives add falling_blocks dummy

# bossbar
bossbar add lavarising:main ""
bossbar set lavarising:main color red
bossbar set lavarising:main players @a

# hazard contact checks (water, void)
scoreboard objectives add player.y dummy

# track player deaths
scoreboard objectives add player.death deathCount

# track player leave
scoreboard objectives add player.leave minecraft.custom:minecraft.leave_game

# play area center
## chosen in setup, or the first player's position (see main)
## the riser is summoned there when the main period starts
execute unless data storage lavarising:center x run data merge storage lavarising:center {x:0,z:0}

# teams
## red
team add red
team modify red color red
## blue
team add blue
team modify blue color blue
## green
team add green
team modify green color green


# load defaults
execute unless score defaults internal matches 1.. run function lavarising:defaults