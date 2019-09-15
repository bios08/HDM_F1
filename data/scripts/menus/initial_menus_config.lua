-- Defines the menus displayed when executing the quest,
-- before starting a game.

-- You can edit this file to add, remove or move some pre-game menus.
-- Each element must be the name of a menu script.
-- The last menu is supposed to start a game.
-- EDITAR  EL ORDEN DE LOS MENU. ES EL ORDEN DE LOS SCRIPT QUE SE EJECUTAN CON LAS DIFERETES PANTALLAS

local initial_menus = {
  --"scripts/menus/solarus_logo",
  "scripts/menus/title",
  --"scripts/menus/title_logo",
  "scripts/menus/start_game",
}

return initial_menus
