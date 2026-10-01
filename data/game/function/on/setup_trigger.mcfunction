# GAME setup trigger
## as the player who clicked a menu button, `clicked internal` = its number
## every action must end in core:setup/sfx/{on,off} (toggle/step already do), e.g.
##   execute if score clicked internal matches 100 run return run function core:setup/toggle {score:"my_setting",value:1}
##   execute if score clicked internal matches 101 run return run function core:setup/toggle {score:"my_setting",value:0}
##   execute if score clicked internal matches 102 run return run function core:setup/step {score:"my_number",delta:-1,min:1,max:10}
##   execute if score clicked internal matches 103 run return run function core:setup/step {score:"my_number",delta:1,min:1,max:10}
