# CORE setup
## center the play area on @s and bring everyone here


function core:center/set
tp @a[distance=0.1..] @s
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"The play area is now centered on ","color":"yellow"},{"selector":"@s"},{"text":" (","color":"yellow"},{"score":{"name":"center_x","objective":"global"},"color":"gold"},{"text":", ","color":"yellow"},{"score":{"name":"center_z","objective":"global"},"color":"gold"},{"text":").","color":"yellow"}]
function core:setup/sfx/on
