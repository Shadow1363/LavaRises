# ARROW BREAK
## flying arrows break #core:arrow_break blocks in their path before they reach them,
## so the arrow flies on through at full speed


execute as @e[type=#core:arrow_break,nbt=!{inGround:1b}] at @s run function core:modules/arrow_break/arrow
