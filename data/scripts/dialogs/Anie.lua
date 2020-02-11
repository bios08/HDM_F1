--- conversaciones -------------------------------------------------------------
function charla_con_anie_1(game, anie)
   -- Logica de interaccion   
    if game:get_value("sap_s_anie1") == 0 then
      -- Antes de iniciar las conversaciones, reviso si trae el libro
      if anie_revisar_mision1()== true then
        game:start_dialog("_sapphire_south.anie.Mision1_2")
        game:set_value("sap_s_anie1", 4)
        game:set_value("sap_s_anie1_libros", 1) --Bandera de libros encontrados
        sol.audio.play_sound("max/secret")
      else      
          game:start_dialog("_sapphire_south.anie.1")
          game:set_value("sap_s_anie1", 1)
      end
     

    -- Logica de interaccion   
    elseif game:get_value("sap_s_anie1") == 1 then
       -- Antes de iniciar las conversaciones, reviso si trae el libro
      if anie_revisar_mision1()== true then
        
        game:start_dialog("_sapphire_south.anie.Mision1_2")
        game:set_value("sap_s_anie1", 4)
        game:set_value("sap_s_anie1_libros", 1) --Bandera de libros encontrados
        sol.audio.play_sound("max/secret")
        --Anie se mueve
        

      else 
        game:start_dialog("_sapphire_south.anie.Mision1_1")      
        game:set_value("sap_s_anie1", 0)
     end
    

    
     elseif game:get_value("sap_s_anie1") ==4 then
        game:start_dialog("_sapphire_south.anie.7_descansar")
        
        game:set_value("sap_s_anie1", 5)
    

     elseif game:get_value("sap_s_anie1") ==5 then       
        game:start_dialog("_sapphire_south.anie.1")
        game:set_value("sap_s_anie1", 4)

    
       
      

    end 
end
