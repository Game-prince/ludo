Goti = Class {}

function Goti:init(x, y, color)
  self.defaultX = x
  self.defaultY = y
  self.x = x
  self.y = y
  self.color = color
end

function Goti:render()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], self.x, self.y - GOTI_HEIGHT / 2)
end
