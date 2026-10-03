# CHEAPER ITEMS
## as a player, know every recipe except the cheaper ones


recipe give @s *
function core:modules/cheaper_items/recipes {action:"take"}
scoreboard players set @s core.recipes 0
