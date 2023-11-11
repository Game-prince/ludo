--[[
  FadeInState
]]

FadeInState = Class { __includes = BaseState }

function FadeInState:init(r, g, b, duration, callback)
  self.r = r
  self.g = g
  self.b = b

  -- gradually change the background color
  Timer.tween(duration, {
    [self] = { r = 0, g = 0, b = 0 }
  }):finish(function()
    gStateStack:pop()
    callback()
  end)
end

function FadeInState:render()
  love.graphics.setColor(self.r, self.g, self.b)
  love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end
