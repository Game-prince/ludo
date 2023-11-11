--[[
  StartState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
StartState = Class { __includes = BaseState }


function StartState:init()

end

function StartState:render()
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf("Family Ludo", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
end

function StartState:update(dt)
  if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
    gStateStack:pop()
    gStateStack:push(PlayState())
  end
end
