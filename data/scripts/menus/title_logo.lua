local title_logo_menu = {}

-- Main surface of the menu.
local surface = sol.surface.create(320,240)

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
    title:draw(surface)
  --end

end

-- Starting the menu.
function title_logo_menu:on_started()

  -- Initialize or reinitialize the animation.
 
 --animation_step = 0
  --timer = nil
  surface:set_opacity(255)
  -- Start the animation.
  title_logo_menu:start_animation()
  -- Update the surface.
  rebuild_surface()
end



function title_logo_menu:start_animation()

  aa=0
end


function title_logo_menu:on_draw(screen)

  -- Get the screen size.
  local width, height = screen:get_size()

  -- Center the surface in the screen.
  surface:draw(screen, 0,0)
  rebuild_surface()
end





return title_logo_menu