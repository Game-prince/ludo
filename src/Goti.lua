Goti = Class {}

function Goti:init(x, y, color)
  self.x = x
  self.y = y
  self.color = color
end

function Goti:render()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures)
end
