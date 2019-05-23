local title_logo_menu = {}

-- Main surface of the menu.
local surface = sol.surface.create(400,240)

-- Solarus title sprite.
local title = sol.sprite.create("menus/title_logo")
   title:set_animation("title")


-- Step of the animation.
--local animation_step = 0


-- Time handling.
local timer = nil



-- Rebuilds the whole surface of the menu.
local function rebuild_surface()

  surface:clear()


-- Draw the title (after step 1).
 -- if animation_step >= 1 then

    --Imprimo imagen de titulo
    title:draw(surface)
    



---------------------------------------------------- ME QUEDÉ AQUI, PROBANDO TEXTO DE PRESIONAR ESPACIO

    
  -- press_space_img:draw(surface, 160, 200)



    --[[

   local show_press_space = true
  
   function switch_press_space()
      show_press_space = not show_press_space
        sol.timer.start(3000, function()
            if show_press_space == false then

                --Imprimo texto de presionar espacio
                
           end
           if show_press_space == true then

               
           end 
            
     end)
     
   end
   ]]--
   
   --switch_press_space()


   --local dialog_font, dialog_font_size = sol.language.get_dialog_font()
   --local menu_font, menu_font_size = sol.language.get_menu_font()
   
   local press_space_img = sol.text_surface.create{
    font = "8_bit",
    font_size = 8,
    color = {100, 100, 255},
    text_key = "title_screen.press_space",
    horizontal_alignment = "center"
    }        
    press_space_img:draw(surface, 200, 200)

--[[
    for i=0, 20, 1
    do
        sol.timer.start(5000, function()
           print(i)
        end)
    end
]]--

--[[
local show_press_space = true
local function switch_press_space()
  show_press_space = not show_press_space

  
    sol.timer.start(3000, function()
        if show_press_space == false then

            print("hola")
            
       end
       if show_press_space == true then
            print("chao")
           
       end 
        
 end)

 
end
switch_press_space()
--print("casi")

]]--
------------------------------------------------------------------------------------------------------

end

-- Starting the menu.
function title_logo_menu:on_started()

  -- Initialize or reinitialize the animation.
 
 --animation_step = 0
  --timer = nil
  surface:set_opacity(255)
  -- Start the animation.
 ----- title_logo_menu:start_animation()
  -- Update the surface.
  self:phase_title()

  rebuild_surface()

  
  
end

------------------------------------------------------------------------------------------------------

function title_logo_menu:start_animation()

  aa=0
end
------------------------------------------------------------------------------------------------------

function title_logo_menu:on_draw(screen)

  -- Get the screen size.
  local width, height = screen:get_size()

  -- Center the surface in the screen.
  surface:draw(screen, 0,0)
  rebuild_surface()
end
------------------------------------------------------------------------------------------------------

function title_logo_menu:on_key_pressed(key)
   if key == "space" then
    -- Escape: quit Solarus.
     -- sol.main.exit()
       self:finish_title()
   end

end
------------------------------------------------------------------------------------------------------
--Salgo del menu
function title_logo_menu:finish_title()

  sol.menu.stop(self)
end

------------------------------------------------------------------------------------------------------
function title_logo_menu:phase_title()

    

end

------------------------------------------------------------------------------------------------------

return title_logo_menu