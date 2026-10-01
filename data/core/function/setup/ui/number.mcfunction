# CORE menu row
## macro {label, score, down, up}, a -/+ stepper for a global setting
## down/up are the /trigger setup values of the buttons


$tellraw @s ["",{"text":"$(label)    ","color":"white"},{"text":"-","color":"red","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set $(down)"}},{"text":"  ","color":"white"},{"score":{"name":"$(score)","objective":"global"},"color":"gold"},{"text":"  ","color":"dark_gray"},{"text":"+","color":"green","bold":true,"click_event":{"action":"run_command","command":"/trigger setup set $(up)"}}]
