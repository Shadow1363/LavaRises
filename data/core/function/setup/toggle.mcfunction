# CORE setup toggle
## macro {score, value}, sets a global setting and re-renders the menu


$scoreboard players set $(score) global $(value)
$execute if score $(score) global matches 1.. run return run function core:setup/sfx/on
function core:setup/sfx/off
