Goti = Class {}

function Goti:init(def)
  self.color = def.color
  self.x = def.x
  self.y = def.y

  self.alive = false

  self.canMove = false
  self.mul = 0.5
  self.scale = 1
end

function Goti:update(dt)
  if self.canMove then
    self.scale = self.scale + dt * self.mul

    if self.scale > 1.1 then
      self.mul = -0.5
    elseif self.scale < 0.9 then
      self.mul = 0.5
    end
  else
    self.mul = 1
  end
end

function Goti:render()
  local x = BOARD_X + (self.x - 1) * CELL_SIZE
  local y = BOARD_Y + (self.y - 1) * CELL_SIZE

  -- goti sprite
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], x, y - GOTI_HEIGHT / 2, 0, self.scale, self.scale)

  -- goti shadow
  -- love.graphics.setColor(0, 0, 0, 1)
  -- love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], x + GOTI_WIDTH / 4, y + GOTI_HEIGHT / 2, 0, 0.5,
  --   0.5, 0, 0, -1, 0)
end

function Goti:nextCell(x, y)
  -- where x is decreasing
  if (self.y == 9 and self.x > 1) or (self.y == 15 and self.x > 7) or (self.color == YELLOW and self.y == 8 and self.x < 15 and self.x > 9) then
    x = x - 1

    -- where x is increasing
  elseif (self.y == 7 and self.x < 15) or (self.y == 1 and self.x < 9) or (self.color == RED and self.y == 8 and self.x > 1 and self.x < 7) then
    x = x + 1
  end

  -- where y is decreasing
  if (self.x == 1 and self.y > 7) or (self.x == 7 and self.y > 1) or (self.color == BLUE and self.x == 8 and self.y < 15 and self.y > 9) then
    y = y - 1

    -- where y is increasing
  elseif (self.x == 15 and self.y < 9) or (self.x == 9 and self.y < 15) or (self.color == GREEN and self.x == 8 and self.y > 1 and self.y < 7) then
    y = y + 1
  end

  return x, y
end

function Goti:canMoveUpto(steps)
  local x, y = self.x, self.y
  local nextX, nextY = nil, nil

  for i = 1, steps do
    nextX, nextY = self:nextCell(x, y)
    if nextX == x and nextY == y then
      return false
    end
  end

  return { nextX, nextY }
end
