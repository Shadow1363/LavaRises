# CORE setup step
## macro {score, delta, min, max}, adds delta to a global setting,
## clamps it to min..max and re-renders the menu


$scoreboard players set delta internal $(delta)
$scoreboard players operation $(score) global += delta internal
$execute if score $(score) global matches ..$(min) run scoreboard players set $(score) global $(min)
$execute if score $(score) global matches $(max).. run scoreboard players set $(score) global $(max)
execute if score delta internal matches 1.. run return run function core:setup/sfx/on
function core:setup/sfx/off
