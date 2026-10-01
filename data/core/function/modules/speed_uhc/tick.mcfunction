# SPEED UHC
## held mining tools without efficiency get efficiency II


execute as @a[gamemode=survival] if items entity @s weapon.mainhand #minecraft:enchantable/mining unless items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:efficiency"}]] run enchant @s minecraft:efficiency 2

execute if score patch_grindstone_exploit global matches 1.. run function core:modules/speed_uhc/grindstone
