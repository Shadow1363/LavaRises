# LAVARISING setup
## dynamically generated


# tellraw
## header
tellraw @s ["",{"text":"\nLAVA RISING\n","color":"red","bold":true}]
## intro
tellraw @s ["",{"text":"Before the game begins, check your options and invite everyone to the game.\n"}]
## options
tellraw @s ["",{"text":"Options:","color":"yellow"}]

# teams
## enabled
execute if score teams global matches 1.. run tellraw @s ["",{"text":"Teams    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/teams/off"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score teams global matches 1.. run tellraw @s ["",{"text":"Teams    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/teams/on"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# rise height limit
tellraw @s ["",{"text": "Rise height limit    ",    "color": "white"  },  { "text": " ", "color": "white" },  {    "text": "-",    "color": "red",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/function lavarising:setup/rise_height_limit/down"    }  },  { "text": "  ", "color": "white" },  { "score": { "name": "rise_height_limit", "objective": "global" } },  { "text": "  ", "color": "dark_gray" },  {    "text": "+",    "color": "green",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/function lavarising:setup/rise_height_limit/up"    }  },  { "text": " ", "color": "dark_gray" }]

# rise ticks
tellraw @s [  "",  {    "text": "Rise ticks    ",    "color": "white"  },  { "text": " ", "color": "white" },  {    "text": "-",    "color": "red",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/function lavarising:setup/rise_ticks/down"    }  },  { "text": "  ", "color": "white" },  { "score": { "name": "rise_ticks", "objective": "global" } },  { "text": "  ", "color": "dark_gray" },  {    "text": "+",    "color": "green",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/function lavarising:setup/rise_ticks/up"    }  },  { "text": " ", "color": "dark_gray" }]
# starter period
tellraw @s ["",{"text":"Starter period    ","color":"white"},{"text":" ","color":"white"},{"text":"-","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/starter_period/down"}},{"text":"  ","color":"white"},{"score":{"name":"starter_period","objective":"global"}},{"text":"  ","color":"dark_gray"},{"text":"+","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/starter_period/up"}},{"text":" ","color":"dark_gray"}]
# grace period
tellraw @s ["",{"text":"Grace period    ","color":"white"},{"text":" ","color":"white"},{"text":"-","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/grace_period/down"}},{"text":"  ","color":"white"},{"score":{"name":"grace_period","objective":"global"}},{"text":"  ","color":"dark_gray"},{"text":"+","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/grace_period/up"}},{"text":" ","color":"dark_gray"}]
# cut clean
## enabled
execute if score cut_clean global matches 1.. run tellraw @s ["",{"text":"Cut Clean    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/cut_clean/off"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score cut_clean global matches 1.. run tellraw @s ["",{"text":"Cut Clean    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/cut_clean/on"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# speed uhc
## enabled
execute if score speed_uhc global matches 1.. run tellraw @s ["",{"text":"Speed UHC    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/speed_uhc/off"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score speed_uhc global matches 1.. run tellraw @s ["",{"text":"Speed UHC    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/speed_uhc/on"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# legacy mode
## enabled
execute if score legacy global matches 1.. run tellraw @s ["",{"text":"Legacy mode (pre-1.18)    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/legacy/off"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score legacy global matches 1.. run tellraw @s ["",{"text":"Legacy mode (pre-1.18)    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function lavarising:setup/legacy/on"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
## footer
tellraw @s ["",{"text":"\nOnce you're ready, run "},{"text":"/function lavarising:start","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function lavarising:start"}},{"text":" and let the games begin!\n"}]
scoreboard players set setup internal 1