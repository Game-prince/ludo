TrailDot = Class {}

function TrailDot:init(def)
  self.x = def.x
  self.y = def.y

  self.color = def.color
  self.animationTime = def.animationTime or 0.5
  self.radius = 0

  self.actualX = BOARD_X + (self.x - 1) * CELL_SIZE + CELL_SIZE / 2
  self.actualY = BOARD_Y + (self.y - 1) * CELL_SIZE + CELL_SIZE / 2

  Timer.tween(self.animationTime, {
    [self] = { radius = CELL_SIZE / 2 }
  })
end

function TrailDot:render()
  love.graphics.setColor(self.color)
  love.graphics.circle('fill', self.actualX, self.actualY, self.radius)
end
