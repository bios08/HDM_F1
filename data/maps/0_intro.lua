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


-- Esta función muestra los frescos.
-- Es recursiva a si que se llamará a si misma
-- según la cantidad dada con f_index < 2
local function next_f()   -- <<========= (1)
  if f_index < 4 then
    f_index = f_index + 1
    game:start_dialog("intro" .. f_index,  function()
      fresco_scene1_sprite:fade_out()
      sol.timer.start(600, next_f)
    end)
    fresco_scene1_sprite:set_animation(f_index)
    fresco_scene1_sprite:fade_in()
  else
    --game:set_dialog_style("box")
    hero:teleport("first_map", "from_intro")
  end

end


-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
  hero:freeze()
  game:set_hud_enabled(false)
  game:set_pause_allowed(false)
  --game:set_dialog_style("empty")

  
  fresco_scene1_sprite = fresco:get_sprite()
  
  fresco_scene1_sprite:set_ignore_suspend(true)
  -- A continuación, comienzo el dialogo intro0, comienza a mostrarse el primer dibujo,
  -- pero la música se escuchará hasta que termine el dialogo intro0, e inmediatamente se muestra
  -- la siguiente imagen del fresco


   sol.audio.play_music("Matthew/Tropic_Strike")

   sol.timer.start(5000, function()  -- Tiempo de espera antes de que comience el dialogo de la historia.

   game:start_dialog("intro0", function()
    --Entro aquí solo hasta que termine intro0
    --sol.audio.play_music("legend")

     next_f()   -- <<========= (1)
  end)

end)--timer



  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end
