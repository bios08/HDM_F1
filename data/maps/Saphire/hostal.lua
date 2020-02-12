-- Lua script of map Saphire/hostal.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

--Agregado para la animacion
local hero = game:get_hero()
local sprite = hero:get_sprite()
sol.audio.play_music("Marlon_llanos/Hostal_del_llamado", true)
--
sol.audio.play_sound("max/fire_burning", true)-- con loop

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()
   
  -- You can initialize the movement and sprites of various
  -- map entities here.
-- Establezco sprites del heroe por defecto
   hero:set_tunic_sprite_id("hero/oh_hero/tunic1a")
   hero = game:get_hero()
   hero:set_walking_speed(speed_hero)

end



-- INICIALIZO LAS VARIABLES DEL SAVE, SI ES QUE AUN NO SE INICIALIZA: ----------------------------------------------------
 
-- Sirve para registrar que la Biblia de leyo
if  game:get_value("sap_s_hostal_grupo_1") == nil then
      game:set_value("sap_s_hostal_grupo_1", 0)
  else
      game:set_value("sap_s_hostal_grupo_1",  game:get_value("sap_s_hostal_grupo_1"))
end-- if

-- Sirve para registrar que se conversó con los tres integrantes (despues de leer la biblia)
if  game:get_value("sap_s_hostal_grupo_2") == nil then
      game:set_value("sap_s_hostal_grupo_2", 0)
  else
      game:set_value("sap_s_hostal_grupo_2",  game:get_value("sap_s_hostal_grupo_2"))
end-- if

-- Conversa con Anie
if  game:get_value("sap_s_hostal_anie_1") == nil then
      game:set_value("sap_s_hostal_anie_1", 0)
  else
      game:set_value("sap_s_hostal_anie_1",  game:get_value("sap_s_hostal_anie_1"))
end-- if

-- Conversa con Niko
if  game:get_value("sap_s_hostal_niko_1") == nil then
      game:set_value("sap_s_hostal_niko_1", 0)
  else
      game:set_value("sap_s_hostal_niko_1",  game:get_value("sap_s_hostal_niko_1"))
end-- if

-- Conversa con Niko
if  game:get_value("sap_s_hostal_jimmy_1") == nil then
      game:set_value("sap_s_hostal_jimmy_1", 0)
  else
      game:set_value("sap_s_hostal_jimmy_1",  game:get_value("sap_s_hostal_jimmy_1"))
end-- if

-- Banera para detectar si estoy despertando despues de la charla n° 1 con el grupo

if  game:get_value("waking_up_beginning_of_game_cutscene") == nil then
      game:set_value("waking_up_beginning_of_game_cutscene", true)
  else
      game:set_value("waking_up_beginning_of_game_cutscene",  game:get_value("waking_up_beginning_of_game_cutscene"))
end-- if


-- INTERACCION CON BIBLIA

function Bible1:on_interaction()
   

  -- LOGICA: El protagonista lee la Biblia,
  -- Una vez que lee, se preguntará "vencer? qué debo vencer...?"
  -- Y despues deberán entrar Anie y Niko por la puerta.
  game:start_dialog("_sapphire_south.hostal1.Biblia1")

if game:get_value("sap_s_hostal_grupo_1") == 0 then



  sol.timer.start(200, function()
         --hero:set_direction(3)
         sol.audio.play_sound("door_open")         
         sol.timer.start(200, function()    
             -- Hago que Anie entre y camine lentamente
             Anie1:set_position(80,128)
            
              local Anie1_p = sol.movement.create("path")
              Anie1_p:set_path{0,0,0,1,1,0,0}
              Anie1_p:set_speed(15)
      
              Anie1_p:set_ignore_obstacles(true)
              Anie1_p:start(Anie1)
              end) 

              sol.timer.start(1000, function() 
                        -- Hago que Niko entre y camine lentamente
                         Niko:set_position(80,128)
                        
                          local Niko_p = sol.movement.create("path")
                          Niko_p:set_path{0,0,0,0,0}
                          Niko_p:set_speed(15)
                  
                          Niko_p:set_ignore_obstacles(true)
                          Niko_p:start(Niko)
              end) 
 
              sol.timer.start(1000, function() 
                        -- Hago que Jimmy  entre y camine lentamente
                          
                          Jimmy:set_position(80,128)
                        
                          local Jimmy_p = sol.movement.create("path")
                          Jimmy_p:set_path{7,7,7,0,0,0,0}
                          Jimmy_p:set_speed(15)
                  
                          Jimmy_p:set_ignore_obstacles(true)
                          Jimmy_p:start(Jimmy)
              end) 

              sol.timer.start(5000, function() 
                        -- Hago que Jimmy  entre y camine lentamente
                         -- Hero:set_position(80,128)
                        
                          --local Hero_p = sol.movement.create("path")
                         ---- Hero_p:set_path{7,7,7,0,0,0,0}
                         -- Hero_p:set_speed(15)
                  
                         -- Hero_p:set_ignore_obstacles(true)
                         -- Hero_p:start(Hero)

                          local see_dad_movement = sol.movement.create("target")
                          hero:freeze()
                          see_dad_movement:set_target(208, 128)
                          hero:set_direction(2)
                          hero:set_animation("walking")
                          see_dad_movement:start(hero, function()
                            game:start_dialog("_sapphire_south.hostal1.Principal.0", function()
                             
                              hero:unfreeze()  
                              end)
                          end)

              end) 

    end)
   game:set_value("sap_s_hostal_grupo_1", 1)
  end --if


--SI ES QUE SE LEE LA BIBLIA, PERO YA SE CONVERSO Y SE SOÑÓ


if game:get_value("sap_s_hostal_anie_1") == 9 then
    game:start_dialog("_sapphire_south.hostal1.Biblia1")    
end


end --function



----INTERACCION CON EL GRUPO



function Anie1:on_interaction()

  print ("Anie: " .. game:get_value("sap_s_hostal_anie_1") )
  print ("Niko: " .. game:get_value("sap_s_hostal_niko_1") )
  print ("Jimmy: " .. game:get_value("sap_s_hostal_jimmy_1") )
  print ("Grupo: " .. game:get_value("sap_s_hostal_grupo_2") )
    

if game:get_value("sap_s_hostal_anie_1") < 2 then

        --print ("" .. game:get_value("sap_s_hostal_grupo_2") )
        -- Si ya se conversó con los tres personajes, activo bandera
        if game:get_value("sap_s_hostal_anie_1") == 1 and 
             game:get_value("sap_s_hostal_niko_1") == 1 and 
               game:get_value("sap_s_hostal_jimmy_1") == 1 then
           game:set_value("sap_s_hostal_grupo_2", 1)
        end

       -- Si la bandera grupo2 no está activada, hago la conversación normal
        if game:get_value("sap_s_hostal_grupo_2") == 0 then
           game:start_dialog("_sapphire_south.hostal1.Principal.1")
           game:set_value("sap_s_hostal_anie_1", 1)
        elseif game:get_value("sap_s_hostal_grupo_2") == 1 then
       -- Si está activada grupo2 entonces hago caminar un poco a Anie, y activo dialogos interactivos    
           local Anie1_p = sol.movement.create("path")
           Anie1_p:set_path{1,1,0,0,0,2}
           Anie1_p:set_speed(15) 
           Anie1_p:set_ignore_obstacles(true)
           Anie1_p:start(Anie1)
           
           -- Le hablo acerca de Jesús.
           hero:freeze()
           game:start_dialog("_sapphire_south.hostal1.anie.0")
           sol.timer.start(5000, function() 
             -- Hay algo importante que debo mencionarle.
             -- Algo sin el cual, esta historia no se podría contar
             -- Debo hablarle del Principe del Universo, su amigo.
             -- Sin él, usted no entenderá nada, no podrá subir
             -- a las alturas de la tierra.
             -- (Moviendose) El que escribe las palabras de esa Carta
             -- es este gran Principe, Jesús, nuestro Dios.
             -- Para seguír esta aventura, debe poder conversar con el.
             -- Y entregarle su vida. Necesita saber orar.
            game:start_dialog("_sapphire_south.hostal1.anie.1")
                  
            game:set_value("sap_s_hostal_anie_1", 2)
 
              --game:start_dialog("_sapphire_south.Erika.scena1.4", function(answer)
            hero:unfreeze()
           end)
           
        end
     

-- Anie camina ahora hacia la biblia
elseif game:get_value("sap_s_hostal_anie_1") == 2 then
     hero:freeze()
     local Anie1_p = sol.movement.create("path")
      Anie1_p:set_path{7,7,7,7,7,7,7,7}
      Anie1_p:set_speed(25) 
      Anie1_p:set_ignore_obstacles(true)
      Anie1_p:start(Anie1)      
      game:set_value("sap_s_hostal_anie_1",3) 
      sol.timer.start(5000, function() 
      hero:unfreeze()

   end)
      
     
elseif game:get_value("sap_s_hostal_anie_1") == 3 then
 game:start_dialog("_sapphire_south.hostal1.anie.2")   
     game:set_value("sap_s_hostal_anie_1",4)



elseif game:get_value("sap_s_hostal_anie_1") == 4 then
   
    -- LOS AMIGOS SE ACERCAN PARA ORAR
    hero:freeze()
    local Anie1_p = sol.movement.create("path")
    Anie1_p:set_path{4,4,4,4,4}
    Anie1_p:set_speed(15) 
    Anie1_p:set_ignore_obstacles(true)
    Anie1_p:start(Anie1)      
    
    local Niko_p = sol.movement.create("path")
    Niko_p:set_path{0,0,0,0,0,0}
    Niko_p:set_speed(25)
    Niko_p:set_ignore_obstacles(true)
    Niko_p:start(Niko)    

    local Jimmy_p = sol.movement.create("path")
    Jimmy_p:set_path{0,0,0}
    Jimmy_p:set_speed(25) 
    Jimmy_p:set_ignore_obstacles(true)
    Jimmy_p:start(Jimmy)
    sol.timer.start(5000, function()
      
    
    
     -- SE PROCEDE A ORAR
   
      game:start_dialog("_sapphire_south.hostal1.anie.6", function()
         game:set_value("waking_up_beginning_of_game_cutscene", false)
         game:set_value("sap_s_hostal_anie_1",5)
         --map:get_hero():teleport("Saphire/hostal", "bed_destination")
         --map:get_hero():teleport("0_intro", "destination")
        



     -- map:get_hero():teleport("Saphire/Dream1", "destination_dream1")
         
      -- Anie1:set_position(-16,-24)
        
        hero:unfreeze()
      end) -- Fin de start_dialog (la oración final)
end)
     
   
elseif game:get_value("sap_s_hostal_anie_1") == 5 then    
      
    -- LOS AMIGOS SE RETIRAN
      hero:freeze()
      local Niko_p2 = sol.movement.create("path")
      Niko_p2:set_path{4,4,4,4,4,4,4,4,4,4,4}
      Niko_p2:set_speed(25)
      Niko_p2:set_ignore_obstacles(true)
      Niko_p2:start(Niko)    

      local Jimmy_p2 = sol.movement.create("path")
      Jimmy_p2:set_path{3,3,3,4,4,4,4,4,4,4}
      Jimmy_p2:set_speed(25) 
      Jimmy_p2:set_ignore_obstacles(true)
      Jimmy_p2:start(Jimmy)
       
      -- Salen por la puerta
      -- Este delay es para que haya un momento de espera, para la caminata.
      -- Si no ponemos esto, se desaparecen inmediatamente.
      sol.timer.start(4400, function()
        Niko:set_position(-16,0)
        Jimmy:set_position(-16,-32) 
        hero:unfreeze() 
        
      end)

      game:set_value("sap_s_hostal_anie_1",6)

elseif game:get_value("sap_s_hostal_anie_1") == 6 then
      
      -- Ultima conversación con Anie, donde lo invita a descanzar
--- ****
      game:start_dialog("_sapphire_south.hostal1.anie.8")
     -- hero:freeze()
      local Anie_p2 = sol.movement.create("path")
      Anie_p2:set_path{3,3,4,4,4,4,4,4,4,4,4,4,4,4,4}
      Anie_p2:set_speed(25)
      Anie_p2:set_ignore_obstacles(true)
      Anie_p2:start(Anie1) 
      -- Pongo el delay de espera para ver como camina
      sol.timer.start(5000, function()
        Anie1:set_position(-16,0)
        --hero:unfreeze()
      end)
      game:set_value("sap_s_hostal_anie_1",7)

end
   
 
end -- funcion


-- CONVERSACIONES

function Niko:on_interaction()
  game:start_dialog("_sapphire_south.hostal1.Principal.5")
  game:set_value("sap_s_hostal_niko_1", 1)
 
 
end

function Jimmy:on_interaction()
  game:start_dialog("_sapphire_south.hostal1.Principal.4")
  game:set_value("sap_s_hostal_jimmy_1", 1)
end



function map:on_started()

  -- Si entramos al hostal, pero ya el grupo tuvo la conversación 1


end

-- CUANDO TERMINA EL SUEÑO
-- ESCENA EN QUE SE LEVANTA
function map:on_opening_transition_finished()
   -- Siempre y cuando hayan terminado la charla 1, despues de la oracioón
   if game:get_value("sap_s_hostal_anie_1") == 8 then
   

       if not game:get_value("waking_up_beginning_of_game_cutscene") then
        hero:freeze()
        sprite:set_animation("asleep")
        sol.timer.start(map, 500, function()
          sprite:set_animation("waking_up", function()
            sprite:set_animation("stopped")
            hero:start_jumping(4, 24, true)
            sol.timer.start(map, 500, function() hero:unfreeze() end)
          end)
        end)

        game:set_value("waking_up_beginning_of_game_cutscene", true)
        -- Con esto activo la pantalla de final de piloto 
        game:set_value("sap_s_hostal_anie_1", 9)

       end -- if sap_s_hostal_anie_1
  end


end


--
-- CUANDO SE VA A LA CAMA
function Dream1_a:on_activated()
-- Salto al sueño
 if game:get_value("sap_s_hostal_anie_1") == 7 then
     map:get_hero():teleport("Saphire/Dream1", "destination_dream1")
     game:set_value("sap_s_hostal_anie_1", 8)
end
end

-- CUANDO SE VA A LA CAMA
function Dream1_a:on_activated()
-- Salto al sueño
 if game:get_value("sap_s_hostal_anie_1") == 7 then
     map:get_hero():teleport("Saphire/Dream1", "destination_dream1")
     game:set_value("sap_s_hostal_anie_1", 8)
end
end



-- ULTIMA PARTE DEL PILOTO
-- se activará cuando ya se haya soñado,
-- se irá a una pantalla especial.
function End_pilot:on_activated()
-- Salto al fin de piloto, solo si ya tuvo el primer sueño de invitación
 if game:get_value("sap_s_hostal_anie_1") == 9 then
    map:get_hero():teleport("Saphire/end_pilot", "destination_end_pilot") 
end
end



