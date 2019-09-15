-- Lua script of map blue_port/sapphire_south.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()
local cor = nil


--- Mis funciones  --------------------------------------------------------------
-- Retorna true: tiene el item de la mision
function anie_revisar_mision1()
  
if game:get_value("amount_libro_inv") == nil then
  return false
else 
   local t_libros = game:get_value("amount_libro_inv")
    if t_libros > 0 then
      return true
    end
end
    return false
end -- function



require("scripts/dialogs/Anie")
require("scripts/dialogs/Jimmy")
require("scripts/dialogs/Erika")



-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
   -- prueba de item
    --corazon = heart:get_sprite()

   -- Establezco sprites del heroe por defecto
    hero:set_tunic_sprite_id("hero/oh_hero/tunic1a")

  -- You can initialize the movement and sprites of various
  -- map entities here.
  -- Musica
  sol.audio.play_music("Marlon_llanos/Amor_obediencia_Dios_ambiente")
  --Velocidad del caminar del heroe
  hero = game:get_hero()
  hero:set_walking_speed(140)


 -- Inicializo algunas variables globales
  game:set_value("save_sapphire_south_anie_mission1", "0") -- Mision anie1


-- INICIALIZO LAS VARIABLES DEL SAVE, SI ES QUE AUN NO SE INICIALIZA: ----------------------------------------------------
 
  if  game:get_value("sap_s_anie1") == nil then
      game:set_value("sap_s_anie1", 0)
  else
      game:set_value("sap_s_anie1",  game:get_value("sap_s_anie1"))
end-- if

 if  game:get_value("sap_s_Jimmy_esc1") == nil then
      game:set_value("sap_s_Jimmy_esc1", 0)
  else
      game:set_value("sap_s_Jimmy_esc1",  game:get_value("sap_s_Jimmy_esc1"))
end-- if

 if  game:get_value("sap_s_Erika_esc1") == nil then
      game:set_value("sap_s_Erika_esc1", 0)
  else
      game:set_value("sap_s_Erika_esc1",  game:get_value("sap_s_Erika_esc1"))
end-- if

-- Banderas de objetos encontrados.
if  game:get_value("sap_s_anie1_libros") == nil then
      game:set_value("sap_s_anie1_libros", 0)
  else
      game:set_value("sap_s_anie1_libros",  game:get_value("sap_s_anie1_libros"))
end-- if
-- Si es que ya se encontró el libro, pongo la segunda animation de Annie
if game:get_value("sap_s_anie1_libros") == 0 then  Anie_primera_animacion()
 elseif game:get_value("sap_s_anie1_libros") > 0 then  Anie_deja_pasar()end 
   
    

-------------------------------------------------------------------------------------------------------

  -- Hago que Anie se mueva levemente
--[[
  local walker_movement = sol.movement.create("path")
  walker_movement:set_path{6,6,2,2}
  walker_movement:set_speed(5)
  walker_movement:set_loop(true)
  walker_movement:set_ignore_obstacles(true)
  walker_movement:start(Anie)
--]]
  


  -- Hago que Jmmy camine lentamente
  local w_m_jimmy = sol.movement.create("path")
  w_m_jimmy:set_path{4,4,6,6,2,2,0,0}
  w_m_jimmy:set_speed(5)
  w_m_jimmy:set_loop(true)
  w_m_jimmy:set_ignore_obstacles(true)
  w_m_jimmy:start(Jimmy)


end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

end


-- Al activar el libro save
function save_book:on_interaction()

    -- Esta variable es para indicar que se ha descubierto por primera vez esta zona. Es el primer guardado.
    game:set_value("save_sapphire_south_conoce", "true")
    -- Guardado
    game:save()
    sol.audio.play_sound("heart")
    game:start_dialog("_general.saved_game.1")
    
    
end --function


-- INTERACCION PRINCIPAL CON ANIE

function Anie:on_interaction()
   
   -- CHARLA 1: En esta charla Anie se presenta por primera vez. Y le ofrece la 1 misión
     charla_con_anie_1(game, Anie)
   --Si despues de la charla, se encontro el libro, entonces deja pasar
    if game:get_value("sap_s_anie1_libros") == 1 then
        Anie_deja_pasar()

 end 
    


end --function


function Jimmy:on_interaction()
   
   -- CHARLA 1: Jimmy comenta de lo bello del poblado, e invita a investigar el secreto de su paz y belleza.
   charla_con_Jimmy_esc1(game)
   
end

function Erika:on_interaction()
    charla_con_Erika_esc1(game)
end


---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- MOVIMIENTOS DESPUES DE CIERTOS EVENTO

-- Cuando se encuentra los libros de Anie
function Anie_deja_pasar()
 --print("...............###### ENTRO A: ANIE DEJA PASAR") 
       -- Hago que Anie se mueva levemente
  local walker_movement2_anie = sol.movement.create("path")
  walker_movement2_anie:set_path{6,6,6,6,6,6,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2}
  walker_movement2_anie:set_speed(15)
  walker_movement2_anie:set_loop(true)
  walker_movement2_anie:set_ignore_obstacles(true)
  walker_movement2_anie:start(Anie)
  game:set_value("sap_s_anie1_libros", 2) -- Esto es para que no se repita nuevamente la animacion de anie, de dejar pasar
end
--------------------------------------------------------
function Anie_primera_animacion()
 local walker_movement = sol.movement.create("path")
  walker_movement:set_path{6,6,2,2}
  walker_movement:set_speed(5)
  walker_movement:set_loop(true)
  walker_movement:set_ignore_obstacles(true)
  walker_movement:start(Anie)
end