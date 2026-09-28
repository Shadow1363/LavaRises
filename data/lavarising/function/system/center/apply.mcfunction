# LAVARISING center
## macro, run with storage lavarising:center {x, z}


# remove the old riser while its chunks are still loaded
## a new one is summoned at the center when the main period starts
kill @e[tag=riser]

# world border
$worldborder center $(x) $(z)

# keep play area loaded
## spawn chunks are no longer always loaded (1.21.9+),
## the riser and lava fills need these chunks
forceload remove all
$execute positioned $(x) 0 $(z) run forceload add ~-80 ~-80 ~80 ~80
