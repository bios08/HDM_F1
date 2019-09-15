-- Lua script of map first_map.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

      -- Establezco sprites del heroe por defecto
    hero:set_tunic_sprite_id("hero/oh_hero/tunic1a")
    
    --Reviso que carlos ya se haya marchado, y activo portal
    if game:get_value("puerto_azul_carlos_se_fue") == "b1" then
      local walker_movement = sol.movement.create("path")
      walker_movement:set_path{0,0,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
      walker_movement:set_speed(30)
      walker_movement:set_loop(false)
      walker_movement:set_ignore_obstacles(true)
      walker_movement:start(carlos)

     tele1:set_enabled(true)

    end


  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end



--- INTERACCION CON NPC


--- Por Marlon Llanos

--[[
function carlos:on_interaction()
  game:start_dialog("_puerto_azul.npcs.carlos.1", function(answer)
    if answer == 1 then 
      
        game:start_dialog("_puerto_azul.npcs.carlos.2")
     
    end
    if answer == 2 then 
     
        game:start_dialog("_puerto_azul.npcs.carlos.3")
    end
  end
  ) 
end
--]]



--Comienza la música del ambiente
sol.audio.play_music("Himnario/116Ceaml")

--Velocidad del caminar del heroe
hero = game:get_hero()
hero:set_walking_speed(70)




--Al comenzar el juego, comienza a decir unas frases. Cada una se demora un tiempo.

 if game:get_value("save_sapphire_south_conoce") ~= "true" then

      sol.timer.start(500, function()
           game:start_dialog("_puerto_azul.intro1")

          sol.timer.start(1000, function()
           game:start_dialog("_puerto_azul.intro2")

           sol.timer.start(1000, function()
           game:start_dialog("_puerto_azul.intro3")

            sol.timer.start(1000, function()
           
       end)

      end)  
    end)    
   end)     

end -- if
   

  
function Cofre1:on_interaction()

     sol.audio.play_sound("bow")
     sol.timer.start(1000, function()
         game:start_dialog("_puerto_azul.senales.cofre1")
     end)    

     --[[
     local walker_movement = sol.movement.create("path")
     walker_movement:set_path{0}
     walker_movement:set_speed(30)
     walker_movement:set_loop(false)
     walker_movement:set_ignore_obstacles(true)
     walker_movement:start(Visita)
     --]]
end


function carta1:on_interaction()
    --print("antes_de_leer_la_nota:", first_map_carta1)
   
 if  game:get_value("puerto_azul_carta1") == "b0" then    
       game:start_dialog("_puerto_azul.senales.carta1.1")
   end
   
 ----------------------------------------------------------- init
   
 if game:get_value("puerto_azul_carta1") == "b1" then
       game:start_dialog("_puerto_azul.senales.carta1.2")

       sol.timer.start(1000, function()
         hero:set_direction(3)
         game:start_dialog("_puerto_azul.senales.carta1.3")
       end)
    game:set_value("puerto_azul_carta1", "b2")
end
   if game:get_value("puerto_azul_carta1") == "b2" then
       game:start_dialog("_puerto_azul.senales.carta1.2")

       sol.timer.start(1000, function()
         hero:set_direction(3)
         game:start_dialog("_puerto_azul.senales.carta1.3")
       end)
   ------------------------------------------------------------ end



   end --if
    
end -- function

-- INTERACCION PRINCIPAL CON CARLOS

function carlos:on_interaction()
   
---------------------------------------------------------- init
  if game:get_value("puerto_azul_carta1") == "b0"  then
      game:start_dialog("_puerto_azul.npcs.carlos.0")  
      game:set_value("puerto_azul_carta1", "b1")  -- Ahora se puede ver la cita de la carta1 
  end
  if game:get_value("puerto_azul_carta1") == "b1"  then
      game:start_dialog("_puerto_azul.npcs.carlos.0") 
  end
------------------------------------------------------------ end


 ----------------------------------------------------------------Iinit 
  if game:get_value("puerto_azul_carta1") == "b2" then
      game:start_dialog("_puerto_azul.npcs.carlos.5")
      
    sol.timer.start(200, function()
         hero:set_direction(3)
         
         sol.timer.start(1000, function()         
         game:start_dialog("_puerto_azul.npcs.carlos.10")
       end)         
    end)
  

 ---------------------------------------------------------------end    
    --Cuando termina el dialogo, carlos camina a la salida
       -- Movimiento de carlos

     local walker_movement = sol.movement.create("path")
      walker_movement:set_path{0,0,0,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}-- 0:derecha  7:derecha-abajo
      walker_movement:set_speed(30)
      walker_movement:set_loop(false)
      walker_movement:set_ignore_obstacles(true)
      walker_movement:start(carlos)

     -- Guardo la ida de Carlos,
     game:set_value("puerto_azul_carlos_se_fue", "b1") 
     -- Activo el portal para ir al siguiente mapa
     tele1:set_enabled(true)

  end

    --print("despues_de_carlos:", first_map_carta1)
    
end --function

function save_book:on_interaction()
    game:save()
    sol.audio.play_sound("heart")
    game:start_dialog("_general.saved_game.1")
    
end --function


