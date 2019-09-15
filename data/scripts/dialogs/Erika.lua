function charla_con_Erika_esc1(game)
   -- Logica de interaccion   
    if game:get_value("sap_s_Erika_esc1") == 0 then
      
         game:start_dialog("_sapphire_south.Erika.scena1.1")
         game:set_value("sap_s_Erika_esc1", 1)
         
    end 
    if game:get_value("sap_s_Erika_esc1") == 1 then
       
       game:start_dialog("_sapphire_south.Erika.scena1.1")
       game:set_value("sap_s_Erika_esc1", 0)
    end
      
end