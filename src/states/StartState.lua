--[[
  StartState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
StartState = Class { __includes = BaseState }


function StartState:init()
  self.panel = Panel(50, 50, 100, 100, {
    backgroundColor = { r = 0.1, g = 0, 2, b = 0.3 },
    borderColor = { r = 0.3, g = 0.2, b = 0.1 },
    backgroundOpacity = 0.5,
    borderOpacity = 0.5,
    borderWidth = 8
  })
end

function StartState:render()
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf("Family Ludo", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")

  self.panel:render()
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
