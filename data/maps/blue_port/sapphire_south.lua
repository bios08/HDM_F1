-- Lua script of map blue_port/sapphire_south.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

-- Por hacer
-- Hacer llanten, salvia, romero, melisa, yerba san juan
-- Hacer Cedros del Libano, Olivares, viñas, pamelmeras de los tropicos, trigo, cebada, arroyos.
--
--
--

local map = ...
local game = map:get_game()
local cor = nil
local speed_hero =140 -- 70--70 --140
local vin_1 = 0 -- Bandera para ver torre de la montaña

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
require("scripts/dialogs/Niko")
require("scripts/dialogs/Lois")
require("scripts/dialogs/Caston")-- 
require("scripts/dialogs/Camila")-- Medicina natural (Reforma Salud)
require("scripts/dialogs/Doris")-- Experta en historia antigua


-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
   -- prueba de item
    --corazon = heart:get_sprite()

   -- Establezco sprites del heroe por defecto
    hero:set_tunic_sprite_id("hero/oh_hero/tunic1a")

  -- You can initialize the movement and sprites of various
  -- map entities here.
  -- Musica
  sol.audio.play_music("Marlon_llanos/Amor_y_obediencia_a_Dios_d")
  --Velocidad del caminar del heroe
  hero = game:get_hero()
  hero:set_walking_speed(speed_hero)


 -- Inicializo algunas variables globales
  game:set_value("save_sapphire_south_anie_mission1", "0") -- Mision anie1


-- INICIALIZO LAS VARIABLES DEL SAVE, SI ES QUE AUN NO SE INICIALIZA: ----------------------------------------------------
 
  if  game:get_value("sap_s_anie1") == nil then
      game:set_value("sap_s_anie1", 0)
  else
      game:set_value("sap_s_anie1",  game:get_value("sap_s_anie1"))
end-- if
--DEBUG--print("CARGO: ".. game:get_value("sap_s_anie1"))


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

 if  game:get_value("sap_s_Niko_esc1") == nil then
      game:set_value("sap_s_Niko_esc1", 0)
  else
      game:set_value("sap_s_Niko_esc1",  game:get_value("sap_s_Niko_esc1"))
end-- if

if  game:get_value("sap_s_Lois_esc1") == nil then
      game:set_value("sap_s_Lois_esc1", 0)
  else
      game:set_value("sap_s_Lois_esc1",  game:get_value("sap_s_Lois_esc1"))
end-- if

if  game:get_value("sap_s_Caston_esc1") == nil then
      game:set_value("sap_s_Caston_esc1", 0)
  else
      game:set_value("sap_s_Caston_esc1",  game:get_value("sap_s_Caston_esc1"))
end-- if
if  game:get_value("sap_s_Camila_esc1") == nil then
      game:set_value("sap_s_Camila_esc1", 0)
  else
      game:set_value("sap_s_Camila_esc1",  game:get_value("sap_s_Camila_esc1"))
end-- if
if  game:get_value("sap_s_Doris_esc1") == nil then
      game:set_value("sap_s_Doris_esc1", 0)
  else
      game:set_value("sap_s_Doris_esc1",  game:get_value("sap_s_Camila_esc1"))
end-- if

-- INICIALIZO VARIABLES QUE INDICARÁN QUE SE CONVERSÓ CON TODOS LOS PERSONAJES DEL PUEBLO.
 if  game:get_value("sap_s_anie1_talk_ok") == nil then
      game:set_value("sap_s_anie1_talk_ok", 0)
  else
      game:set_value("sap_s_anie1_talk_ok",  game:get_value("sap_s_anie1_talk_ok"))
end-- if
if  game:get_value("sap_s_Jimmy_esc1_talk_ok") == nil then
      game:set_value("sap_s_Jimmy_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Jimmy_esc1_talk_ok",  game:get_value("sap_s_Jimmy_esc1_talk_ok"))
end-- if

 if  game:get_value("sap_s_Erika_esc1_talk_ok") == nil then
      game:set_value("sap_s_Erika_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Erika_esc1_talk_ok",  game:get_value("sap_s_Erika_esc1_talk_ok"))
end-- if

 if  game:get_value("sap_s_Niko_esc1_talk_ok") == nil then
      game:set_value("sap_s_Niko_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Niko_esc1_talk_ok",  game:get_value("sap_s_Niko_esc1_talk_ok"))
end-- if

if  game:get_value("sap_s_Lois_esc1_talk_ok") == nil then
      game:set_value("sap_s_Lois_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Lois_esc1_talk_ok",  game:get_value("sap_s_Lois_esc1_talk_ok"))
end-- if

if  game:get_value("sap_s_Caston_esc1_talk_ok") == nil then
      game:set_value("sap_s_Caston_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Caston_esc1_talk_ok",  game:get_value("sap_s_Caston_esc1_talk_ok"))
end-- if
if  game:get_value("sap_s_Camila_esc1_talk_ok") == nil then
      game:set_value("sap_s_Camila_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Camila_esc1_talk_ok",  game:get_value("sap_s_Camila_esc1_talk_ok"))
end-- if
if  game:get_value("sap_s_Doris_esc1_talk_ok") == nil then
      game:set_value("sap_s_Doris_esc1_talk_ok", 0)
  else
      game:set_value("sap_s_Doris_esc1_talk_ok",  game:get_value("sap_s_Doris_esc1_talk_ok"))
end-- if
if  game:get_value("sap_s_Erika_esc1_rechaza_test") == nil then
      game:set_value("sap_s_Erika_esc1_rechaza_test", 0)
  else
      game:set_value("sap_s_Erika_esc1_rechaza_test",  game:get_value("sap_s_Erika_esc1_rechaza_test"))
end-- if
if  game:get_value("sap_s_Erika_esc1_test_ok") == nil then
      game:set_value("sap_s_Erika_esc1_test_ok", 0)
  else
      game:set_value("sap_s_Erika_esc1_test_ok",  game:get_value("sap_s_Erika_esc1_test_ok"))
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
   
--debug-- print("CARGO: " .. game:get_value("sap_s_anie1_libros") )   

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


-- Preparo la escena que se verá cuando se mire por el vinocular 1
--fresco_scene1_sprite = fresco:get_sprite()  
--fresco_scene1_sprite:set_ignore_suspend(true)

   -- HAGO MOVIMIENTOS DE ANIMALES
  local l0_m = sol.movement.create("path")
  l0_m:set_path{4,4,6,6,2,2,0,0}
  l0_m:set_speed(5)
  l0_m:set_loop(true)
  l0_m:set_ignore_obstacles(true)
  l0_m:start(l0)

  -- HAGO MOVIMIENTOS DE ANIMALES
  local l1_m = sol.movement.create("path")
  l1_m:set_path{2,2,0,0,2,2,2,2,6,6,6,6,4,4,6,6}
  l1_m:set_speed(5)
  l1_m:set_loop(true)
  l1_m:set_ignore_obstacles(true)
  l1_m:start(l1)

   local l3_m = sol.movement.create("path")
  l3_m:set_path{4,4,4,0,0,0}
  l3_m:set_speed(5)
  l3_m:set_loop(true)
  l3_m:set_ignore_obstacles(true)
  l3_m:start(l3)

  local l2_m = sol.movement.create("path")
  l2_m:set_path{0,0,2,4,4,6}
  l2_m:set_speed(5)
  l2_m:set_loop(true)
  l2_m:set_ignore_obstacles(true)
  l2_m:start(l2)
 



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


---------- LETREROS --------------
function Cartel_1:on_interaction()
    game:start_dialog("_sapphire_south.carteles.1")

end

-- INTERACCION PRINCIPAL CON ANIE
-----------------------=0=0=-------------------------
function Anie:on_interaction()
   
   -- CHARLA 1: En esta charla Anie se presenta por primera vez. Y le ofrece la 1 misión
     charla_con_anie_1(game, Anie)
   --Si despues de la charla, se encontro el libro, entonces deja pasar
    if game:get_value("sap_s_anie1_libros") == 1 then
        Anie_deja_pasar() 
    end 

    -- Si el jugador acepta la pregunta si desea ser evaluado, puede ser aconsejado por anie
    -- Aqui  aconseja si protagonista no quiere ser evaluado
      if game:get_value("sap_s_anie1") == 6 then       
        game:start_dialog("_sapphire_south.anie.consejo.1")
      end
    
end --function

-----------------------=0=0=-------------------------

function Jimmy:on_interaction()
   
   -- CHARLA 1: Jimmy comenta de lo bello del poblado, e invita a investigar el secreto de su paz y belleza.
   charla_con_Jimmy_esc1(game)
   
end
-----------------------=0=0=-------------------------
function Erika:on_interaction()
    charla_con_Erika_esc1(game)
   --  local value = "mensaje.."
   --  local value2 = "mens2.."
   --  game:start_dialog("_game.test_dialog", value,value2, function(answer)     
   --   print(answer)
   -- end)
 -- Si la primera serie de preguntas fueron respondidas
 -- hago que Erika se mueva y deje pasar
 if game:get_value("sap_s_Erika_esc1_test_ok") == 3 then
      -- Hago que Erika camine lentamente
  local w_m_Erika = sol.movement.create("path")
  w_m_Erika:set_path{2,2,2,2,2}
  w_m_Erika:set_speed(30)
  w_m_Erika:set_loop(false)
  w_m_Erika:set_ignore_obstacles(true)
  w_m_Erika:start(Erika)
 end

  


  print("Jimmy: "..game:get_value("sap_s_Jimmy_esc1_talk_ok"))
  print("Niko: "..game:get_value("sap_s_Niko_esc1_talk_ok"))
  print("Lois: "..game:get_value("sap_s_Lois_esc1_talk_ok"))
  print("Caston: "..game:get_value("sap_s_Caston_esc1_talk_ok") )
  print("Camila: "..game:get_value("sap_s_Camila_esc1_talk_ok") )
  print("Doris: "..game:get_value("sap_s_Doris_esc1_talk_ok") )
  print("Erika: "..game:get_value("sap_s_Erika_esc1_talk_ok") )

end
-----------------------=0=0=-------------------------

function Niko:on_interaction()
    charla_con_Niko_esc1(game)
end
-----------------------=0=0=-------------------------
function Lois:on_interaction()
    charla_con_Lois_esc1(game)
end
-----------------------=0=0=-------------------------
function Caston:on_interaction()
    charla_con_Caston_esc1(game)
end
-----------------------=0=0=-------------------------
function Camila:on_interaction()
    charla_con_Camila_esc1(game)
end
-----------------------=0=0=-------------------------
function Doris:on_interaction()
    charla_con_Doris_esc1(game)
end
-----------------------=0=0=-------------------------

--INTERACCION CON OBJETOS
-- VINOCULARES

function Vin_1:on_interaction()
     
  require("scripts/gallery/tower_mountain")
  tower_mountain:update_game(game)

 if vin_1 == 0 then
    sol.menu.start(game, tower_mountain)
    vin_1 = 1
    --hero:freeze()
   hero:set_walking_speed(0)
  else
    sol.menu.stop(tower_mountain)
    vin_1 = 0
    --hero:unfreeze()
    hero:set_walking_speed(speed_hero)
  end
 --pause_img:draw(map:get_camera():get_surface())

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
   --walker_movement2_anie:set_path{6,6}
walker_movement2_anie:set_path{6,6,6,6,6,6,6,6,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2}
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
---------------------------------------------------------
function Anie_da_consejo()
  
  local walker_movement3_anie = sol.movement.create("path")
  walker_movement3_anie:set_path{0,0,0,0,0,0}
 
  walker_movement3_anie:set_speed(15)
  walker_movement3_anie:set_loop(false)
  walker_movement3_anie:set_ignore_obstacles(true)
  walker_movement3_anie:start(Anie)

end