-- Title screen of the game.

local title_screen = {}
local game_manager = require("scripts/game_manager")
-- Importo cursor
local black_fill = sol.surface.create()
local cursor_index
local MAX_CURSOR_INDEX = 1
-- Almaceno en que número de la presentación estoy (1:presentacion bitLife, 2:menu Titulo, etc.)
local n_presentacion = 0

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function title_screen:on_started()
  --print("...............###### title_screen:on_started()")
  -- inicializo cursor index
  cursor_index = 0 
  black_fill:fill_color({0,0,0, 255})
  black_fill:fade_out(40)

  -- black screen during 0.3 seconds
  self.phase = "black"

  self.surface = sol.surface.create(400, 240)
  sol.timer.start(self, 300, function()
    self:phase_zs_presents()  -- <<<<=======1===========
  end)

  -- use these 0.3 seconds to preload all sound effects
  sol.audio.preload_sounds()
end


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

function title_screen:phase_zs_presents()  -- <<<<=======1===========
  -- print("...............###### title_screen:phase_zs_presents()")
  -- "Zelda Solarus presents" displayed for two seconds
  self.phase = "zs_presents"

  self.zs_presents_img =
      sol.surface.create("title_screen_initialization.png", true) -- Obtiene una imagen de lenguaje/es/images

  local width, height = self.zs_presents_img:get_size()
  self.zs_presents_pos = { 200 - width / 2, 120 - height / 2 } -- Tiene que estar adaptado al tamaño del proyecto
  sol.audio.play_sound("intro")  -- Lo saca directo de sounds

  sol.timer.start(self, 2000, function()   -- Tiempo transicion del Presenta
    self.surface:fade_out(10)
    sol.timer.start(self, 700, function()  -- Lo que se demora en aparecer el titulo (no es el tiempo de transicion del titulo)
      self:phase_title()         --<<======== 2 =============
    end)
  end)
end

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--------------------------------------
function title_screen:phase_title()   --<<======== 2 =============
  --   print("...............###### title_screen:phase_title()") 
 -- actual title screen
  self.phase = "title"
   -- start music
  --sol.audio.play_music("title_screen")
  --sol.audio.play_music("Matthew/soliloquy") 
  sol.audio.play_music("Marlon_llanos/Arbol_de_la_vida")
  -- show a background that depends on the hour of the day
  local hours = tonumber(os.date("%H"))
  local time_of_day
  if hours >= 8 and hours < 18 then
    time_of_day = "daylight"
  elseif hours >= 18 and hours < 20 then
    time_of_day = "sunset"
  else
    time_of_day = "night"
  end

   -- create all images
  
  -- Imagen grande de titulo (árbol de la vida)
  self.logo_img = sol.surface.create("menus/title_logo.png")
  -- Un marco blanco, sobre un fondo negro
  self.borders_img = sol.surface.create("menus/title_borders.png")

  --local dialog_font, dialog_font_size = sol.language.get_dialog_font()
  --local menu_font, menu_font_size = sol.language.get_menu_font()

   self.cursor_sprite = sol.sprite.create("menus/cursor")

   self.website_img = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {240, 200, 56},
    text_key = "title_screen.website",
    horizontal_alignment = "center"
  }

  self.press_space_img = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.press_space",
    horizontal_alignment = "center"
  }

  self.press_continue = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.continue",
    horizontal_alignment = "center"
  }
  
   self.press_new = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.new_game",
    horizontal_alignment = "center"
  }

    self.dialog_confirm_title = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.dialog_confirm_title",
    horizontal_alignment = "center"
  }
    
   self.press_yes = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.press_yes",
    horizontal_alignment = "center"
  }

   self.press_no = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {255, 255, 255},
    text_key = "title_screen.press_no",
    horizontal_alignment = "center"
  }


  -- Frame para confirmacion
  self.frame_answer = sol.sprite.create("hud/dialog_box_frame")

 -- Banderas
  self.show_press_space = false --     Este es para presionar espacio
  self.show_press_space_opciones = false  -- Este es para presionar las opciones,
  self.show_press_new_game = false -- Este es para indicar que se presionó Nueva Partida
  
--  ESTA FUNCION QUEDA EN UN CICLO SIN FIN,
--  ACTIVANDO Y DESACTIVANDO EL BOTON DE 'PRESIONAR ESPACIO'
-- PERO SI YA SE PRESIONÓ "PRESIONAR ESPACIO", ENTONCES SE APAGA ESTE
 function switch_press_space()
   if self.show_press_space_opciones == false then
      self.show_press_space = not self.show_press_space
      sol.timer.start(self, 500, switch_press_space)
   else
      self.show_press_space = false
   end
 end -- function
  sol.timer.start(self, 6500, switch_press_space)




  -- make the clouds move
  self.clouds_xy = {x = 400, y = 240}
 

  -- show an opening transition
  self.surface:fade_in(200) -- Tiempo de transición de entrada del Titulo. (Este sí es)

  self.allow_skip = false
  sol.timer.start(self, 2000, function()
    self.allow_skip = true
  end)


end
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

-----------------------------------------
--MIENTRAS SE DIBUJA
-- SE PUEDE EJECUTAR CADA VEZ QUE PRESIONO UNA TECLA
-- AHI APROVECHO DE MOVER EL CURSOR
function title_screen:on_draw(dst_surface)
 -- print("...............###### title_screen:on_draw()") 

   if self.phase == "title" then
    n_presentacion = 2  -- Indico que entró a menu de titulo
    self:draw_phase_title(dst_surface)   --<<======== 4 =============
  elseif self.phase == "zs_presents" then
    n_presentacion = 1  -- Indico que entró a presentacion bitLife
    self:draw_phase_present()          --<<======== 3 =============
  end

  -- final blit (dst_surface may be larger)
  -- Es muy importante, ya que la resta debe ser la mitad de los pixeles del proyecto en mi caso 400 x 240
  -- Para una resulucion 320 x 240  debe ser 160 x 120
  local width, height = dst_surface:get_size()
  self.surface:draw(dst_surface, width / 2 - 200, height / 2 - 120) 

  

 

end
---------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

-- Sin este metodo, el png "Presenta" se ve oscuro (no se ve)
function title_screen:draw_phase_present()   --<<======== 3 =============
  --   print("...............###### title_screen:draw_phase_present()") 
   self.zs_presents_img:draw(self.surface, self.zs_presents_pos[1], self.zs_presents_pos[2])
  
end
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


----------------------------------------------------------------------
-- Sin este metodo, el titulo animado se ve oscuro (no se ve)
function title_screen:draw_phase_title()    --<<======== 4 =============
--print("...............###### title_screen:draw_phase_title()") 
  
  -- Imagen de fondo de titulo (arbol de la vida)
  self.logo_img:draw(self.surface, 0, 0)


  -- Para imprimir mensaje de Presionar Espacio
  -- Se activa despues de que hace el fadein, y queda intermitente
  if self.show_press_space then
   
      self.press_space_img:draw(self.surface, 200, 200)
     
    
  end
  
  -- ###### PONGO AQUÍ LOS TEXTOS Y SPRITES QUE SE MOSTRARAN EN EL TITUO
  -- ###### IMPORTANTE PONER SIEMPRE AQUI PARA QUE INICIEN LENTAMENTE JUNTO CON TODO EL TITULO

  -- Para imprimir 1 menu (continuar, nueva partida y cursor)
  if self.show_press_space_opciones then
      --Imprimo el boton continuar y nuevo ingreso
     self.press_continue:draw(self.surface, 200, 200)
     self.press_new:draw(self.surface, 216, 213)
     
     -- Para imprimir cursor
    -- Se activa despues de que hace el fadein
  if self.show_press_space_opciones and self.show_press_new_game == false then
   --coloco el sprite cursor, y muevo 
      self.cursor_sprite:draw(self.surface,150,198 + cursor_index *13)
  
  end
  
    -- Para imprimir el cuadro de dialogo, para confirmar nueva partida
  if  self.show_press_new_game  then
     self.frame_answer:draw(self.surface, 100, 100)--Marco
     self.dialog_confirm_title:draw(self.surface, 152, 98) -- El titulo del dialogo de confirmacion
     self.press_no:draw(self.surface, 150, 125) -- Si
     self.press_yes:draw(self.surface, 225, 125) -- No
     self.cursor_sprite:draw(self.surface,130  + cursor_index *75 , 122)-- Cursos horizontal
  end



  end
end


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------
function title_screen:on_key_pressed(key)
--print("...............###### title_screen:on_key_pressed()") 
  local handled = false

  if key == "escape" then
    -- stop the program
    sol.main.exit()
    handled = true

  --- PARA QUE SUBA O PARA QUE BAJE
  elseif key == "down" and self.show_press_new_game == false then
    sol.audio.play_sound("cursor")
    cursor_index = cursor_index + 1
    if cursor_index > MAX_CURSOR_INDEX then cursor_index = 0 end
    
  elseif key == "up" and self.show_press_new_game == false then
    sol.audio.play_sound("cursor")
    cursor_index = cursor_index - 1
    if cursor_index <0 then cursor_index = MAX_CURSOR_INDEX end
  
------  PARA QUE VAYA HACIA AL LADO O HACIA EL OTRO LADO -----------

  elseif key == "left" and self.show_press_new_game == true then
    sol.audio.play_sound("cursor")
    cursor_index = cursor_index + 1
    if cursor_index > MAX_CURSOR_INDEX then cursor_index = 0 end
    
  elseif key == "right" and self.show_press_new_game == true then
    sol.audio.play_sound("cursor")
    cursor_index = cursor_index - 1
    if cursor_index <0 then cursor_index = MAX_CURSOR_INDEX end
---------------------------------------------------------------------


  elseif key == "space" or key == "return" then
  print("SE CONTINUA...cur: " .. tostring(cursor_index) .. " space: " ..tostring(show_press_space_opciones) .. " new: " .. tostring(show_press_new_game))
    -- Si se continua
    if cursor_index == 0 and self.show_press_space_opciones == true and self.show_press_new_game == false  then
      print("SE CONTINUA...cursor_index: " .. tostring(cursor_index))
      --handled = self:try_finish_title()
      local game = game_manager:create("save1.dat")
      sol.main:start_savegame(game)
    -- Si se presiona nueva partida
    end
    if cursor_index == 1 and self.show_press_space_opciones == true and self.show_press_new_game == false   then
       print("NUEVA PARTIDA...cursor_index: " .. tostring(cursor_index))
      self.show_press_new_game = true  -- Activo la bandera 
      cursor_index = 0 --Pongo el cursos en 0
    end
    -- Si se confirma la nueva partida
    if cursor_index == 1 and self.show_press_space_opciones == true and self.show_press_new_game  then
      print("CONFIRMA NUEVA...cursor_index: " .. tostring(cursor_index))
      local game = game_manager:create("save1.dat", true)
      sol.main:start_savegame(game)
      --handled = self:try_finish_title()
      cursor_index = 0 --Pongo el cursos en 0
    end

    sol.audio.play_sound("heart")
    -- la primera ves que presiono space indico que hay que quitar el mensaje de press space
    self.show_press_space_opciones = true
    
--  Debug.
  elseif sol.main.is_debug_enabled() then
    if key == "left shift" or key == "right shift" then
      self:finish_title()
      handled = true
    end
  end

end -- function

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
---------------------------------------------------------------
function title_screen:on_joypad_button_pressed(button)
--print("...............###### title_screen:on_joypad_button_pressed()") 
  return self:try_finish_title()
end

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------
-- Ends the title screen (if possible)
-- and starts the savegame selection screen
-- Sin este metodo, no se termina el logo del titulo de forma suave.
-- De hecho, ni siquiera se termina
function title_screen:try_finish_title()
--print("...............###### title_screen:try_finish_title()") 
  local handled = false

  if self.phase == "title"
      and self.allow_skip
      and not self.finished then
    self.finished = true

    self.surface:fade_out(30)
    sol.timer.start(self, 700, function()
      self:finish_title()
    end)

    handled = true
  end

 

  return handled
end


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
----------------------------------------------------
function title_screen:finish_title()
--print("...............###### title_screen:finish_title()") 
  sol.audio.stop_music()
  sol.menu.stop(self)
end

return title_screen

