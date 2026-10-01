# CUT CLEAN
## as/at a new item entity


tag @s add core.cc

# ores
execute if items entity @s contents minecraft:raw_iron run return run function core:modules/cut_clean/smelt {id:"minecraft:iron_ingot"}
execute if items entity @s contents minecraft:raw_gold run return run function core:modules/cut_clean/smelt {id:"minecraft:gold_ingot"}
execute if items entity @s contents minecraft:raw_copper run return run function core:modules/cut_clean/smelt {id:"minecraft:copper_ingot"}
## silk touch
execute if items entity @s contents #core:cut_clean/iron_ores run return run function core:modules/cut_clean/smelt {id:"minecraft:iron_ingot"}
execute if items entity @s contents #core:cut_clean/gold_ores run return run function core:modules/cut_clean/smelt {id:"minecraft:gold_ingot"}
execute if items entity @s contents #core:cut_clean/copper_ores run return run function core:modules/cut_clean/smelt {id:"minecraft:copper_ingot"}

# food
execute if items entity @s contents minecraft:porkchop run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_porkchop"}
execute if items entity @s contents minecraft:mutton run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_mutton"}
execute if items entity @s contents minecraft:beef run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_beef"}
execute if items entity @s contents minecraft:chicken run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_chicken"}
execute if items entity @s contents minecraft:rabbit run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_rabbit"}
execute if items entity @s contents minecraft:cod run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_cod"}
execute if items entity @s contents minecraft:salmon run return run function core:modules/cut_clean/smelt {id:"minecraft:cooked_salmon"}
