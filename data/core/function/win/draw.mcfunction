# CORE win
## nobody left (e.g. the last players died on the same tick)


title @a subtitle {"text":"Nobody survived.","color":"yellow"}
title @a title {"text":"GAME OVER!","color":"gray","bold":true}
tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"text":"It's a draw, nobody survived.","color":"yellow"}]


function core:win/finish
