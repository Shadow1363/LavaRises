# CORE setup menu
## rendered for @s, re-rendered after every click


# header
tellraw @s ["",{"text":"\n"},{"nbt":"title","storage":"core:config","color":"gold","bold":true}]
tellraw @s {"text":"Check the options and invite everyone before the game begins."}

# teams
function core:setup/ui/section {label:"Teams"}
function core:setup/ui/toggle {label:"Teams",score:"teams",on:2,off:3}
execute if score teams global matches 1.. run function core:setup/ui/number {label:"Team count",score:"teams_count",down:4,up:5}
## join buttons, /trigger team set <n>
execute if score teams global matches 1.. if score teams_count global matches ..2 run tellraw @s ["",{"text":"Join    ","color":"white"},{"text":"[Red]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 1"}},{"text":" "},{"text":"[Blue]","color":"blue","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 2"}},{"text":"    "},{"text":"[Shuffle]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 25"},"hover_event":{"action":"show_text","value":"Put every player on a random team"}}]
execute if score teams global matches 1.. if score teams_count global matches 3 run tellraw @s ["",{"text":"Join    ","color":"white"},{"text":"[Red]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 1"}},{"text":" "},{"text":"[Blue]","color":"blue","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 2"}},{"text":" "},{"text":"[Green]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 3"}},{"text":"    "},{"text":"[Shuffle]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 25"},"hover_event":{"action":"show_text","value":"Put every player on a random team"}}]
execute if score teams global matches 1.. if score teams_count global matches 4.. run tellraw @s ["",{"text":"Join    ","color":"white"},{"text":"[Red]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 1"}},{"text":" "},{"text":"[Blue]","color":"blue","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 2"}},{"text":" "},{"text":"[Green]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 3"}},{"text":" "},{"text":"[Yellow]","color":"yellow","bold":true,"click_event":{"action":"run_command","command":"/trigger team set 4"}},{"text":"    "},{"text":"[Shuffle]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 25"},"hover_event":{"action":"show_text","value":"Put every player on a random team"}}]

# periods
function core:setup/ui/section {label:"Periods (seconds)"}
function core:setup/ui/number {label:"Starter (no PvP)",score:"starter_period",down:6,up:7}
function core:setup/ui/number {label:"Grace (PvP, border shrinks)",score:"grace_period",down:8,up:9}

# world border
function core:setup/ui/section {label:"World border (blocks)"}
function core:setup/ui/number {label:"Start size",score:"border_size",down:10,up:11}
function core:setup/ui/number {label:"Size after grace",score:"border_mid",down:12,up:13}
function core:setup/ui/number {label:"Final size",score:"border_end",down:14,up:15}
tellraw @s ["",{"text":"Center    ","color":"white"},{"score":{"name":"center_x","objective":"global"},"color":"gold"},{"text":", ","color":"white"},{"score":{"name":"center_z","objective":"global"},"color":"gold"},{"text":"  "},{"text":"[Set here]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 21"},"hover_event":{"action":"show_text","value":"Center the play area on your position and bring everyone here"}}]

# modules
function core:setup/ui/section {label:"Extras"}
function core:setup/ui/toggle {label:"Cut Clean (instant smelt)",score:"cut_clean",on:16,off:17}
function core:setup/ui/toggle {label:"Speed UHC",score:"speed_uhc",on:18,off:19}
function core:setup/ui/toggle {label:"Throwable knockback",score:"throwable_knockback",on:26,off:27}
function core:setup/ui/toggle {label:"Arrows break glass & leaves",score:"arrow_break",on:28,off:29}
function core:setup/ui/toggle {label:"Cheaper items",score:"cheaper_items",on:30,off:31}

# the game's own options
function #core:hooks/menu

# testing
function core:setup/ui/section {label:"Testing"}
function core:setup/ui/toggle {label:"Singleplayer",score:"singleplayer",on:23,off:24}

# footer
tellraw @s ["",{"text":"\nOnce you're ready, click "},{"text":"[Start game]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 20"},"hover_event":{"action":"show_text","value":"/trigger setup set 20"}},{"text":" and let the games begin!\n"}]
scoreboard players set setup internal 1
