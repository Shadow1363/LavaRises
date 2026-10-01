# CORE win
## shared end of game, after win/solo, win/team or win/draw
## player/over handles gamemodes and effects


scoreboard players set period internal 3

# sfx
execute as @a at @s run playsound ui.toast.challenge_complete player @s ~ ~ ~

# next game
tellraw @a ["",{"text":"\n"},{"text":"[Back to lobby]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set 22"},"hover_event":{"action":"show_text","value":"Reset to the lobby for another game (the world is not restored)"}},{"text":"\n"}]


function #core:hooks/win
