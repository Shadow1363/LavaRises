# CUT CLEAN
## macro {id}, swap the item in place (keeps the stack count)


$data modify entity @s Item.id set value "$(id)"
particle minecraft:smoke ~ ~ ~ 0 0 0 0.01 30
