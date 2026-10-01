# CORE teams
## spread every non-spectator evenly over the playing teams


scoreboard players set teams global 1
team leave @a[gamemode=!spectator]
scoreboard players set shuffle internal 0
execute as @a[gamemode=!spectator,sort=random] run function core:teams/shuffle_next

function core:util/announce {message:"Teams have been shuffled!"}
function core:setup/sfx/on
