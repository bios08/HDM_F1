local item = ...

-- Agregado por marlon
function item:on_started()
  item:set_savegame_variable("possession_gem")
  item:set_amount_savegame_variable("amount_gem")
end
------------------------------------------------------------
function item:on_created()

  self:set_shadow("small")
  self:set_can_disappear(true)
  self:set_brandish_when_picked(false)
  self:set_sound_when_picked("picked_money")
  --self:set_amount(5)
end

function item:on_obtaining(variant, savegame_variable)

  local amounts = { 1, 5, 20, 50, 100, 300 }
  local amount = amounts[variant]
  
  item:get_game():add_money(amount)

  -- Agregado por marlon
  self:add_amount(1)

end
