local item = ...

-- Agregado por marlon
function item:on_started()
 item:set_amount_savegame_variable("amount_sword")
end



function item:on_created()

  self:set_savegame_variable("possession_sword")
  
  self:set_sound_when_picked(nil)
  self:set_sound_when_brandished(nil)
end

function item:on_variant_changed(variant)
  -- The possession state of the sword determines the built-in ability "sword".
  self:get_game():set_ability("sword", variant)

end


function item:on_obtaining(variant, savegame_variable)
  local amounts = { 1, 5, 20, 50, 100, 300 }
  local amount = amounts[variant]
  -- Agregado por marlon
  self:add_amount(1)
end
