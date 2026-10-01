# CORE teams
## macro {team, name}, @s joins a team (team ids are also their colour)


$team join $(team) @s
$tellraw @a ["",{"text":"[","color":"dark_gray"},{"text":"!","color":"green","bold":true},{"text":"] ","color":"dark_gray"},{"selector":"@s"},{"text":" joined ","color":"yellow"},{"text":"$(name)","color":"$(team)","bold":true}]
playsound entity.arrow.hit_player player @s
