# CORE periods
## -1 lobby, 0 starter, 1 grace, 2 main, 3 game over


execute if score period internal matches 0..2 run function core:util/clock

# transitions
execute if score period internal matches 0 if score time_s internal >= starter_period global run function core:period/grace
execute if score period internal matches 1 if score time_s internal >= grace_period global run function core:period/main
## final border shrink, border_delay seconds into main
execute if score period internal matches 2 if score time internal matches 0 if score time_s internal = border_delay global run function core:border/final

function core:period/bossbar

# per-player state
## applied once per period, and to players who join mid-game
execute as @a unless score @s last_login = period internal run function core:player/apply
