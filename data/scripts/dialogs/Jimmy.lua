function charla_con_Jimmy_esc1(game)
   -- Logica de interaccion   
    if game:get_value("sap_s_Jimmy_esc1") == 0 then
      
         game:start_dialog("_sapphire_south.Jimmy.scena1.1")
         game:set_value("sap_s_Jimmy_esc1", 1)
         
    elseif game:get_value("sap_s_Jimmy_esc1") == 1 then
       
       game:start_dialog("_sapphire_south.Jimmy.scena1.2")
       game:set_value("sap_s_Jimmy_esc1", 0)
       game:set_value("sap_s_Jimmy_esc1_talk_ok", 1)    -- Se registra que conversó con el
    end
      
end