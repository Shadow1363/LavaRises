# THROWABLE KNOCKBACK
## snowballs and eggs knock players back
## vanilla Java ignores 0-damage hits on players, so hits are predicted here
## (functions run before entities move) and a tiny hit is dealt by the projectile


execute as @e[type=#core:throwable_knockback,tag=!core.tkb.done] at @s run function core:modules/throwable_knockback/projectile
