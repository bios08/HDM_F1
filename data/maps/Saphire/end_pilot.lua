-- Lua script of map 0_intro.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()



local f_index = 0
local fresco_scene1_sprite = nil



-- DIAPOSITIVA DE FINAL DE PILOTO
local function next_f_endpilot()
 
    f_index = 5
    fresco_scene1_sprite:fade_out()
    --sol.timer.start(300, next_f_endpilot)
    fresco_scene1_sprite:set_animation(f_index)
    fresco_scene1_sprite:fade_in()
  
end



-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
  hero:freeze()
  game:set_hud_enabled(false)
  game:set_pause_allowed(false)
  --game:set_dialog_style("empty")

  
  fresco_scene1_sprite = fresco_dream1:get_sprite()
  
  fresco_scene1_sprite:set_ignore_suspend(true)
  -- A continuación, comienzo el dialogo intro0, comienza a mostrarse el primer dibujo,
  -- pero la música se escuchará hasta que termine el dialogo intro0, e inmediatamente se muestra
  -- la siguiente imagen del fresco

 
-- AHORA SE VA A MOSTRAR LA DIAPOSITIVAS, PERO PREGUNTO SI ESTOY EN EL FINAL 
-- DEL PILOTO O NO. SI ES ASÍ ES UNA SOLA DIAPOSITIVA, LA DE FINALIZACION

       

       sol.audio.play_music("Marlon_llanos/Una_invitacion")
       next_f_endpilot()
       
       

  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end

