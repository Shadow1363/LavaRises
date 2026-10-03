# ARROW BREAK config
## arrows: tags/entity_type/arrow_break.json
## breakable blocks: tags/block/arrow_break.json
## mode: "destroy" drops the block's items, "replace" removes it without drops


data modify storage core:config modules.arrow_break set value {mode:"destroy"}
