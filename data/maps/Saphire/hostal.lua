-- Lua script of map Saphire/hostal.
-- This script is executed every time the hero enters this map.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation:
-- http://www.solarus-games.org/doc/latest

local map = ...
local game = map:get_game()

-- Event called at initialization time, as soon as this map is loaded.
function map:on_started()

  -- You can initialize the movement and sprites of various
  -- map entities here.
end

-- Event called after the opening transition effect of the map,
-- that is, when the player takes control of the hero.
function map:on_opening_transition_finished()

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

              

           end)
        end
     


elseif game:get_value("sap_s_hostal_anie_1") == 2 then
     local Anie1_p = sol.movement.create("path")
      Anie1_p:set_path{7,7,7,7,7,7,7,7}
      Anie1_p:set_speed(25) 
      Anie1_p:set_ignore_obstacles(true)
      Anie1_p:start(Anie1)      
      game:set_value("sap_s_hostal_anie_1",3) 

     
elseif game:get_value("sap_s_hostal_anie_1") == 3 then
 game:start_dialog("_sapphire_south.hostal1.anie.2")   
     game:set_value("sap_s_hostal_anie_1",4)



elseif game:get_value("sap_s_hostal_anie_1") == 4 then
   
    local Anie1_p = sol.movement.create("path")
    Anie1_p:set_path{4}
    Anie1_p:set_speed(15) 
    Anie1_p:set_ignore_obstacles(true)
    Anie1_p:start(Anie1)      
    
    local Niko_p = sol.movement.create("path")
    Niko_p:set_path{0,0,0,0,0,0,0,0,0}
    Niko_p:set_speed(25)
    Niko_p:set_ignore_obstacles(true)
    Niko_p:start(Niko)    

    local Jimmy_p = sol.movement.create("path")
    Jimmy_p:set_path{0,0,0,0,0,0,0}
    Jimmy_p:set_speed(25) 
    Jimmy_p:set_ignore_obstacles(true)
    Jimmy_p:start(Jimmy)

     sol.timer.start(5000, function()
      game:start_dialog("_sapphire_south.hostal1.anie.6")
     end)

    game:set_value("sap_s_hostal_anie_1",5)


elseif game:get_value("sap_s_hostal_anie_1") == 5 then
    
    
    game:set_starting_location("0_intro", nil)
    game:set_value("sap_s_hostal_anie_1",6)
    
    

end
   
 



end --function

function Niko:on_interaction()
  game:start_dialog("_sapphire_south.hostal1.Principal.5")
  game:set_value("sap_s_hostal_niko_1", 1)
end

function Jimmy:on_interaction()
  game:start_dialog("_sapphire_south.hostal1.Principal.4")
  game:set_value("sap_s_hostal_jimmy_1", 1)
end


