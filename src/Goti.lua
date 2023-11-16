Goti = Class {}

function Goti:init(color)
  self.color = color

  self.dead = true
  self.home = false

  self.canMove = false
  self.scale = 1
  self.mul = .5
end

function Goti:render()
  local radius = 30
  love.graphics.setColor(0.5, 0.5, 0.5, 1)
  love.graphics.circle("fill", self.x + CELL_SIZE / 2, self.y + GOTI_HEIGHT / 2, radius)

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], self.x, self.y - GOTI_HEIGHT / 2,
    0, self.scale, self.scale)
end

function Goti:update(dt)
  -- blink if can move
  if self.canMove then
    self.scale = self.scale + self.mul * dt

    if (self.scale < 1) then
      self.mul = .5
    elseif self.scale > 1.1 then
      self.mul = -.5
    end
  else
    self.scale = 1
  end
end

function Goti:nextCell(x, y)
  -- agar goti ghar me hai
  if self.color == RED and x < 7 and y < 8 then
    return 2, 7
  elseif self.color == GREEN and x > 9 and y < 8 then
    return 9, 2
  elseif self.color == YELLOW and x > 9 and y > 10 then
    return 9, 14
  elseif self.color == BLUE and x < 7 and y > 10 then
    return 14, 7
  end

  -- where x is increasing
  if (y == 8 and x < 16) or (y == 3 and x < 9) or (self.player == RED and y == 9 and x < 7) then
    x = x + 1

    -- where x is decreasing
  elseif (y == 10 and x > 1) or (y == 16 and x > 7) or (self.player == YELLOW and y == 9 and x > 9) then
    x = x - 1
  end

  -- where y is increasing
  if (x == 9 and y < 16) or (x == 15 and y < 10) or (self.player == GREEN and x == 8 and y < 8) then
    y = y + 1

    -- where y is decreasing
  elseif (x == 7 and y > 2) or (x == 1 and y > 8) or (self.player == BLUE and x == 8 and y > 10) then
    y = y - 1
  end

  return x, y
end

function Goti:canTakeSteps(diceValue)
  local x, y = self.x, self.y
  local nextX, nextY = x, y

  for i = 1, diceValue do
    nextX, nextY = self:nextCell(x, y)

    if nextX == x and nextY == y then
      return false
    end

    x = nextX
    y = nextY
  end

  return true
end
