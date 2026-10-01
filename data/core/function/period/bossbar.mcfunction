# CORE bossbar
## the game's bossbar hook runs after this and can override it


# time left in timed periods
execute if score period internal matches 0 run scoreboard players operation time_left internal = starter_period global
execute if score period internal matches 1 run scoreboard players operation time_left internal = grace_period global
execute if score period internal matches 0..1 run scoreboard players operation time_left internal -= time_s internal

## lobby (-1)
execute if score period internal matches -1 run bossbar set core:main name "The games will begin shortly!"
execute if score period internal matches -1 run bossbar set core:main color white
## starter (0)
execute if score period internal matches 0 run bossbar set core:main name ["",{"text":"Starter period    ","color":"yellow"},{"score":{"name":"time_left","objective":"internal"},"color":"yellow","bold":true},{"text":" seconds left","color":"white"}]
execute if score period internal matches 0 run bossbar set core:main color yellow
execute if score period internal matches 0 store result bossbar core:main max run scoreboard players get starter_period global
execute if score period internal matches 0 store result bossbar core:main value run scoreboard players get time_s internal
## grace (1)
execute if score period internal matches 1 run bossbar set core:main name ["",{"text":"Grace period    ","color":"gold"},{"score":{"name":"time_left","objective":"internal"},"color":"gold","bold":true},{"text":" seconds left","color":"white"}]
execute if score period internal matches 1 run bossbar set core:main color yellow
execute if score period internal matches 1 store result bossbar core:main max run scoreboard players get grace_period global
execute if score period internal matches 1 store result bossbar core:main value run scoreboard players get time_s internal
## main (2)
execute if score period internal matches 2 run bossbar set core:main name ["",{"nbt":"title","storage":"core:config","color":"red","bold":true},{"text":"    "},{"score":{"name":"alive","objective":"internal"},"color":"red","bold":true},{"text":" players alive","color":"white"}]
execute if score period internal matches 2 run bossbar set core:main color red
## lobby, main, game over: full bar
execute if score period internal matches 2.. run bossbar set core:main max 1
execute if score period internal matches 2.. run bossbar set core:main value 1
execute if score period internal matches -1 run bossbar set core:main max 1
execute if score period internal matches -1 run bossbar set core:main value 1
## game over (3)
execute if score period internal matches 3 run bossbar set core:main name "Game over!"
execute if score period internal matches 3 run bossbar set core:main color white


function #core:hooks/bossbar
