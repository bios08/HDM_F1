function charla_con_Erika_esc1(game)
   -- Logica de interaccion   
   -- Si ya a conversado con todos, entonces comienzo las preguntas
     local all_talk_ok = 0
        
    -- Averiguo que se haya conversado con todas las personas
      if game:get_value("sap_s_Erika_esc1_talk_ok") == 1 
         and game:get_value("sap_s_Jimmy_esc1_talk_ok") == 1 
        and game:get_value("sap_s_Niko_esc1_talk_ok") == 1 
         and game:get_value("sap_s_Lois_esc1_talk_ok") == 1 
         and game:get_value("sap_s_Caston_esc1_talk_ok") == 1 
          and game:get_value("sap_s_Camila_esc1_talk_ok") == 1 
          and game:get_value("sap_s_Doris_esc1_talk_ok") == 1
           then
             all_talk_ok = 1
             

      end 


   if game:get_value("sap_s_Erika_esc1") == 0 and all_talk_ok == 0 then
      
         game:start_dialog("_sapphire_south.Erika.scena1.1")
         game:set_value("sap_s_Erika_esc1", 1)
         
     
    elseif game:get_value("sap_s_Erika_esc1") == 1 and all_talk_ok == 0 then
       
       game:start_dialog("_sapphire_south.Erika.scena1.2")
       game:set_value("sap_s_Erika_esc1", 0)
       game:set_value("sap_s_Erika_esc1_talk_ok", 1)    -- Se registra que conversó con el

     
    elseif all_talk_ok == 1 then
       -- Se conversó con todas las personas así que comienzo dialogo de preguntas.
       -- Primero pregunto si desea ser evaluado------------------------------------------
       ----------------------------------------------------------------------------------
       
      
       
       --  Si el personaje ya aceptó, (2) entonces no hago las pregunta si desea ser evaluado.
       --  Pero si no, hago la pregunta si desea ser evaluado
          if game:get_value("sap_s_Erika_esc1_rechaza_test") == 0 or game:get_value("sap_s_Erika_esc1_rechaza_test") == 1 then

        game:start_dialog("_sapphire_south.Erika.scena1.4", function(answer)
          print(answer)
          
              if answer == 1 then game:start_dialog("_sapphire_south.Erika.scena1.6")
                             -- Si rechaza, activo dialogo de Anie de consejo (activo la bandera)
                             game:set_value("sap_s_anie1", 6)-- 
                             game:set_value("sap_s_Erika_esc1_rechaza_test", 1)
                             
              elseif answer == 2 then game:start_dialog("_sapphire_south.Erika.scena1.7")
                          game:set_value("sap_s_Erika_esc1_rechaza_test", 2) --Acepta ser preguntado
                      

              end
         end)
          end-- if acepta preguntas
         
         -----------------------------------Pregunta 1 de 1----------------------------------------
         ----------------------------------------------------------------------------------
        


         if game:get_value("sap_s_Erika_esc1_rechaza_test") == 2 then --** Si aceptó ser preguntado
             
          if game:get_value("sap_s_Erika_esc1_test_ok")== 0 then  --Entro aqui si todavía no ha respondido la 1
                 game:start_dialog("_sapphire_south.Erika.scena1.questions.1", function(answer)            
                  if answer == 3 then game:start_dialog("_sapphire_south.Erika.scena1.questions.1_r")
                     game:set_value("sap_s_Erika_esc1_test_ok", 1)
                     else  game:start_dialog("_sapphire_south.Erika.scena1.questions.1_n")
                  end --respuesta correcta                   
                 end)--fin_funcion_dialog_preguntas
          elseif  game:get_value("sap_s_Erika_esc1_test_ok") == 1 then -- Si 1 buena entro aqui a la 2
                 game:start_dialog("_sapphire_south.Erika.scena1.questions.2", function(answer)            
                  if answer == 2 then game:start_dialog("_sapphire_south.Erika.scena1.questions.2_r")
                     game:set_value("sap_s_Erika_esc1_test_ok", 2)
                     else  game:start_dialog("_sapphire_south.Erika.scena1.questions.1_n")
                  end --respuesta correcta                   
                 end)--fin_funcion_dialog_preguntas  
           elseif  game:get_value("sap_s_Erika_esc1_test_ok") == 2 then -- Si 2 buena entro aqui a la 3
                 game:start_dialog("_sapphire_south.Erika.scena1.questions.3", function(answer)            
                  if answer == 4 then  game:start_dialog("_sapphire_south.Erika.scena1.questions.3_r")
                     game:set_value("sap_s_Erika_esc1_test_ok", 3)
                     else  game:start_dialog("_sapphire_south.Erika.scena1.questions.1_n")
                  end --respuesta correcta                   
                 end)--fin_funcion_dialog_preguntas
            elseif  game:get_value("sap_s_Erika_esc1_test_ok") == 3 then -- Si 3 buena, señalo que pasó
                 game:start_dialog("_sapphire_south.Erika.scena1.questions.4")            
                 
                     
                     
                                   
                 
            end

                    
          end --** fin si acepto ser preguntado

           --print ("PRUEBAAAA: "..game:get_value("sap_s_Erika_esc1_test_ok"))

      
 
    end
    
     
        
    


end