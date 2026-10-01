# CORE start
## validates, then begins the game
## errors go to @s (whoever clicked Start)


execute unless score period internal matches -1 run return run function core:util/error {message:"Cannot start, a game is already in progress."}

# players
function core:util/count_players
execute unless score singleplayer global matches 1.. unless score players internal matches 2.. run return run function core:util/error {message:"Cannot start, at least 2 players are required. Enable Singleplayer in /trigger setup to play alone."}

# teams
execute if score teams global matches 1.. unless score singleplayer global matches 1.. unless function core:teams/ready run return run function core:util/error {message:"Cannot start, every team needs a player and every player needs a team. Use Join or Shuffle in /trigger setup."}

# the game's own checks
## a hook sets can_start internal to 0 (and prints why) to block the start
scoreboard players set can_start internal 1
function #core:hooks/start_check
execute unless score can_start internal matches 1.. run return run execute at @s run playsound minecraft:block.note_block.bass player @s

# keep the border sizes in order
execute if score border_mid global > border_size global run scoreboard players operation border_mid global = border_size global
execute if score border_end global > border_mid global run scoreboard players operation border_end global = border_mid global


function core:period/starter
