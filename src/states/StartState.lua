--[[
  StartState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
StartState = Class { __includes = BaseState }


function StartState:init()
  self.rotation = 0
end

function StartState:render()
  love.graphics.setFont(gFonts['huge'])
  love.graphics.printf("Family Ludo", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
end

function StartState:update(dt)
  if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
    gStateStack:push(FadeInState(1, 1, 1, 0.4, function()
      gStateStack:pop()
      gStateStack:push(FadeOutState(0, 0, 0, 0.4, function()
        gStateStack:push(PlayState())
      end))
    end))
  end
end
