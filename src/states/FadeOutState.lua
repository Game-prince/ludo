--[[
  FadeOutState
]]

FadeOutState = Class { __includes = BaseState }

function FadeOutState:init(r, g, b, duration, callback)
  self.r = r
  self.g = g
  self.b = b

  Timer.tween(duration, {
    [self] = { r = 1, g = 1, b = 1 }
  }):finish(function()
    gStateStack:pop()
    callback()
  end)
end

function FadeOutState:render()
  love.graphics.setColor(self.r, self.g, self.b)
  love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end
