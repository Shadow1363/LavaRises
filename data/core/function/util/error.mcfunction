# CORE error
## macro {message}, tells @s and fails


$tellraw @s ["",{"text":"[","color":"dark_gray"},{"text":"X","color":"red","bold":true},{"text":"] ","color":"dark_gray"},{"text":"$(message)","color":"red"}]
execute at @s run playsound minecraft:block.note_block.bass player @s
return fail
