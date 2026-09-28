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
execute if score teams global matches 1.. run tellraw @s ["",{"text":"Teams    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 3"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score teams global matches 1.. run tellraw @s ["",{"text":"Teams    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 2"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# rise height limit
tellraw @s ["",{"text": "Rise height limit    ",    "color": "white"  },  { "text": " ", "color": "white" },  {    "text": "-",    "color": "red",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/trigger setup set 4"    }  },  { "text": "  ", "color": "white" },  { "score": { "name": "rise_height_limit", "objective": "global" } },  { "text": "  ", "color": "dark_gray" },  {    "text": "+",    "color": "green",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/trigger setup set 5"    }  },  { "text": " ", "color": "dark_gray" }]

# rise ticks
tellraw @s [  "",  {    "text": "Rise ticks    ",    "color": "white"  },  { "text": " ", "color": "white" },  {    "text": "-",    "color": "red",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/trigger setup set 6"    }  },  { "text": "  ", "color": "white" },  { "score": { "name": "rise_ticks", "objective": "global" } },  { "text": "  ", "color": "dark_gray" },  {    "text": "+",    "color": "green",    "bold": true,    "click_event": {      "action": "run_command",      "command": "/trigger setup set 7"    }  },  { "text": " ", "color": "dark_gray" }]
# starter period
tellraw @s ["",{"text":"Starter period    ","color":"white"},{"text":" ","color":"white"},{"text":"-","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 8"}},{"text":"  ","color":"white"},{"score":{"name":"starter_period","objective":"global"}},{"text":"  ","color":"dark_gray"},{"text":"+","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 9"}},{"text":" ","color":"dark_gray"}]
# grace period
tellraw @s ["",{"text":"Grace period    ","color":"white"},{"text":" ","color":"white"},{"text":"-","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 10"}},{"text":"  ","color":"white"},{"score":{"name":"grace_period","objective":"global"}},{"text":"  ","color":"dark_gray"},{"text":"+","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 11"}},{"text":" ","color":"dark_gray"}]
# cut clean
## enabled
execute if score cut_clean global matches 1.. run tellraw @s ["",{"text":"Cut Clean    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 13"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score cut_clean global matches 1.. run tellraw @s ["",{"text":"Cut Clean    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 12"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# speed uhc
## enabled
execute if score speed_uhc global matches 1.. run tellraw @s ["",{"text":"Speed UHC    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 15"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score speed_uhc global matches 1.. run tellraw @s ["",{"text":"Speed UHC    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 14"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# legacy mode
## enabled
execute if score legacy global matches 1.. run tellraw @s ["",{"text":"Legacy mode (pre-1.18)    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 17"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score legacy global matches 1.. run tellraw @s ["",{"text":"Legacy mode (pre-1.18)    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 16"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
# play area center
tellraw @s ["",{"text":"Center    ","color":"white"},{"score":{"name":"center_x","objective":"global"},"color":"gold"},{"text":", ","color":"white"},{"score":{"name":"center_z","objective":"global"},"color":"gold"},{"text":"  "},{"text":"[Set here]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 21"},"hover_event":{"action":"show_text","value":"Center the play area on your position and bring everyone here"}}]
# singleplayer (testing)
## enabled
execute if score singleplayer global matches 1.. run tellraw @s ["",{"text":"Singleplayer (testing)    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 19"}},{"text":" ","color":"dark_gray"}]
## disabled
execute unless score singleplayer global matches 1.. run tellraw @s ["",{"text":"Singleplayer (testing)    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 18"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
## footer
tellraw @s ["",{"text":"\nOnce you're ready, click "},{"text":"[Start game]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 20"},"hover_event":{"action":"show_text","value":"/trigger setup set 20"}},{"text":" and let the games begin!\n"}]
scoreboard players set setup internal 1