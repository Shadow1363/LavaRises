# CORE menu row
## macro {label, score, on, off}, an on/off toggle for a global setting
## on/off are the /trigger setup values of the buttons


$execute if score $(score) global matches 1.. run tellraw @s ["",{"text":"$(label)    ","color":"white"},{"text":"[","color":"white"},{"text":"✔","color":"green","bold":true},{"text":"]","color":"white"},{"text":"  ","color":"dark_gray"},{"text":"X","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set $(off)"}},{"text":" ","color":"dark_gray"}]
$execute unless score $(score) global matches 1.. run tellraw @s ["",{"text":"$(label)    ","color":"white"},{"text":" ","color":"dark_gray"},{"text":"✔","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set $(on)"}},{"text":" ","color":"dark_gray"},{"text":" [","color":"white"},{"text":"X","color":"red","bold":true},{"text":"]","color":"white"}]
