# CORE setup dispatch
## clicked internal = the button's number
## core uses 1-99, the game uses 100+ (see game:on/setup_trigger)


execute if score clicked internal matches 1 run return run function core:setup/menu

# teams
execute if score clicked internal matches 2 run return run function core:setup/toggle {score:"teams",value:1}
execute if score clicked internal matches 3 run return run function core:setup/toggle {score:"teams",value:0}
execute if score clicked internal matches 4 run return run function core:setup/step {score:"teams_count",delta:-1,min:2,max:4}
execute if score clicked internal matches 5 run return run function core:setup/step {score:"teams_count",delta:1,min:2,max:4}
execute if score clicked internal matches 25 run return run function core:teams/shuffle

# periods
execute if score clicked internal matches 6 run return run function core:setup/step {score:"starter_period",delta:-10,min:10,max:600}
execute if score clicked internal matches 7 run return run function core:setup/step {score:"starter_period",delta:10,min:10,max:600}
execute if score clicked internal matches 8 run return run function core:setup/step {score:"grace_period",delta:-60,min:60,max:7200}
execute if score clicked internal matches 9 run return run function core:setup/step {score:"grace_period",delta:60,min:60,max:7200}

# world border
execute if score clicked internal matches 10 run return run function core:setup/step {score:"border_size",delta:-100,min:100,max:20000}
execute if score clicked internal matches 11 run return run function core:setup/step {score:"border_size",delta:100,min:100,max:20000}
execute if score clicked internal matches 12 run return run function core:setup/step {score:"border_mid",delta:-10,min:10,max:20000}
execute if score clicked internal matches 13 run return run function core:setup/step {score:"border_mid",delta:10,min:10,max:20000}
execute if score clicked internal matches 14 run return run function core:setup/step {score:"border_end",delta:-5,min:5,max:20000}
execute if score clicked internal matches 15 run return run function core:setup/step {score:"border_end",delta:5,min:5,max:20000}
execute if score clicked internal matches 21 run return run function core:setup/center_here

# modules
execute if score clicked internal matches 16 run return run function core:setup/toggle {score:"cut_clean",value:1}
execute if score clicked internal matches 17 run return run function core:setup/toggle {score:"cut_clean",value:0}
execute if score clicked internal matches 18 run return run function core:setup/toggle {score:"speed_uhc",value:1}
execute if score clicked internal matches 19 run return run function core:setup/toggle {score:"speed_uhc",value:0}
execute if score clicked internal matches 26 run return run function core:setup/toggle {score:"throwable_knockback",value:1}
execute if score clicked internal matches 27 run return run function core:setup/toggle {score:"throwable_knockback",value:0}
execute if score clicked internal matches 28 run return run function core:setup/toggle {score:"arrow_break",value:1}
execute if score clicked internal matches 29 run return run function core:setup/toggle {score:"arrow_break",value:0}
execute if score clicked internal matches 30 run return run function core:setup/toggle {score:"cheaper_items",value:1}
execute if score clicked internal matches 31 run return run function core:setup/toggle {score:"cheaper_items",value:0}

# testing
execute if score clicked internal matches 23 run return run function core:setup/toggle {score:"singleplayer",value:1}
execute if score clicked internal matches 24 run return run function core:setup/toggle {score:"singleplayer",value:0}

# start
execute if score clicked internal matches 20 run return run function core:start


# the game's own buttons
function #core:hooks/setup_trigger
