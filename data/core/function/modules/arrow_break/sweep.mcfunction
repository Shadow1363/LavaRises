# ARROW BREAK
## macro {x1..z4, mode}, as/at an arrow


$execute if block ~ ~ ~ #core:arrow_break run setblock ~ ~ ~ air $(mode)
$execute positioned ~$(x1) ~$(y1) ~$(z1) if block ~ ~ ~ #core:arrow_break run setblock ~ ~ ~ air $(mode)
$execute positioned ~$(x2) ~$(y2) ~$(z2) if block ~ ~ ~ #core:arrow_break run setblock ~ ~ ~ air $(mode)
$execute positioned ~$(x3) ~$(y3) ~$(z3) if block ~ ~ ~ #core:arrow_break run setblock ~ ~ ~ air $(mode)
$execute positioned ~$(x4) ~$(y4) ~$(z4) if block ~ ~ ~ #core:arrow_break run setblock ~ ~ ~ air $(mode)
