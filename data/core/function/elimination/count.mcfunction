# CORE elimination
## count players tagged core.alive, overall and per team


execute store result score alive internal if entity @a[tag=core.alive]
execute store result score alive_red internal if entity @a[tag=core.alive,team=red]
execute store result score alive_blue internal if entity @a[tag=core.alive,team=blue]
execute store result score alive_green internal if entity @a[tag=core.alive,team=green]
execute store result score alive_yellow internal if entity @a[tag=core.alive,team=yellow]
