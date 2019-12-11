--Para crear un personaje nuevo y el controlador de dialogo
--
-- 1) Crear este archivo, con el nombre del personaje, y modificar todos los nombres
-- 2) Importar este archivo en el script del mapa.
-- 3) Iniciar la variable global en el script del mapa
-- 4) Crear el dialogo con el nombre del mapa.nombre_personaje_n_scena.numero_dialogo
-- 5) Crear el dialogo.

function charla_con_Doris_esc1(game)
   -- Logica de interaccion   
    if game:get_value("sap_s_Doris_esc1") == 0 then
      
         game:start_dialog("_sapphire_south.Doris.scena1.1")
         game:set_value("sap_s_Doris_esc1", 1)
         
     
    elseif game:get_value("sap_s_Doris_esc1") == 1 then
       
       game:start_dialog("_sapphire_south.Doris.scena1.2")
       game:set_value("sap_s_Doris_esc1", 0)
       game:set_value("sap_s_Doris_esc1_talk_ok", 1)    -- Se registra que conversó con el
    end
      
end