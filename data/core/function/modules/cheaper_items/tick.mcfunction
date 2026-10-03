# CHEAPER ITEMS
## the cheaper recipes (recipe/cheaper_items/*.json) always exist
## off: the limited_crafting game rule is on, players know every recipe except the cheaper ones
## on: limited_crafting is off, players are given the cheaper recipes (for the recipe book)
## runs every tick, on or off, to apply changes and handle new players


execute if score cheaper_items global matches 1.. unless score cheaper_items_state internal matches 1 run function core:modules/cheaper_items/enable
execute unless score cheaper_items global matches 1.. unless score cheaper_items_state internal matches 0 run function core:modules/cheaper_items/disable

execute if score cheaper_items global matches 1.. as @a unless score @s core.recipes matches 1 run function core:modules/cheaper_items/player_on
execute unless score cheaper_items global matches 1.. as @a unless score @s core.recipes matches 0 run function core:modules/cheaper_items/player_off
