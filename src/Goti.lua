Goti = Class {}

function Goti:init(def)
  self.color = def.color
  self.x = def.x
  self.y = def.y

  self.startX = self.x
  self.startY = self.y

  self.alive = false
  self.hasWon = false

  self.canMove = false
  self.mul = 0.2
  self.scale = 1

  self.actualX = BOARD_X + (self.x - 1) * CELL_SIZE
  self.actualY = BOARD_Y + (self.y - 1) * CELL_SIZE

  self.animationTime = 0.2

  self.trailDots = {}
end

function Goti:update(dt)
  -- trail dots
  local trailDotsToRemove = {}
  for i = #self.trailDots, 1, -1 do
    if self.trailDots[i].radius >= CELL_SIZE / 2 then
      table.insert(trailDotsToRemove, i)
    end
  end

  for _, i in ipairs(trailDotsToRemove) do
    table.remove(self.trailDots, i)
  end

  -- animating gotis
  if self.canMove then
    self.scale = self.scale + dt * self.mul

    if self.scale > 1.1 then
      self.mul = -0.2
    elseif self.scale < 0.9 then
      self.mul = 0.2
    end
  else
    self.mul = 1
  end
end

function Goti:render()
  -- goti trail
  for _, dot in ipairs(self.trailDots) do
    dot:render()
  end

  -- goti sprite
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], self.actualX, self.actualY - GOTI_HEIGHT / 2, 0,
    self.scale, self.scale)

  -- goti shadow
  -- love.graphics.setColor(0, 0, 0, 1)
  -- love.graphics.draw(gTextures['gotis'], gQuads['gotis'][self.color], x + GOTI_WIDTH / 4, y + GOTI_HEIGHT / 2, 0, 0.5,
  --   0.5, 0, 0, -1, 0)
end

function Goti:nextCell(x, y)
  -- increasing x
  if (self:isBetween(x, 1, 5) and y == 7) or (self:isBetween(x, 10, 14) and y == 7) or ((not self.color == GREEN) and self:isBetween(x, 7, 8) and y == 1) or (self.color == RED and self:isBetween(x, 1, 6) and y == 8) then
    return x + 1, y
  end

  -- decreasing x
  if (self:isBetween(x, 2, 6) and y == 9) or (self:isBetween(x, 11, 15) and y == 9) or ((not self.color == BLUE) and self:isBetween(x, 8, 9) and y == 15) or (self.color == YELLOW and self:isBetween(x, 10, 15) and y == 8) then
    return x - 1, y
  end

  -- increasing y
  if (self:isBetween(y, 1, 5) and x == 9) or (self:isBetween(y, 10, 14) and x == 9) or ((not self.color == YELLOW) and self:isBetween(y, 7, 8) and x == 15) or (self.color == GREEN and self:isBetween(y, 1, 6) and x == 8) then
    return x, y + 1
  end

  -- decreasing y
  if (self:isBetween(y, 2, 6) and x == 7) or (self:isBetween(y, 11, 15) and x == 7) or ((not self.color == RED) and self:isBetween(y, 8, 9) and x == 1) or (self.color == BLUE and self:isBetween(y, 10, 15) and x == 8) then
    return x, y - 1
  end

  -- corner cases
  if x == 6 and y == 7 then
    return x + 1, y - 1
  elseif x == 7 and y == 10 then
    return x - 1, y - 1
  elseif x == 9 and y == 6 then
    return x + 1, y + 1
  elseif x == 10 and y == 9 then
    return x - 1, y + 1
  end
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

function Goti:move(steps, callback)
  if steps == 0 then
    if callback then
      callback()
    end
    return self.x, self.y
  end

  -- if the goti is not alive and step is 6
  if not self.alive and steps == 6 then
    self.alive = true
    self.x, self.y = GotiBirthHomeData[self.color].x, GotiBirthHomeData[self.color].y
    Timer.tween(self.animationTime, {
      [self] = { actualX = BOARD_X + (self.x - 1) * CELL_SIZE, actualY = BOARD_Y + (self.y - 1) * CELL_SIZE }
    }):finish(function()
      if callback then
        callback()
      end
    end)
    return self.x, self.y
  end


  self.x, self.y = self:nextCell(self.x, self.y)
  Timer.tween(self.animationTime, {
    [self] = { actualX = BOARD_X + (self.x - 1) * CELL_SIZE, actualY = BOARD_Y + (self.y - 1) * CELL_SIZE }
  }):finish(function()
    local trailDot = TrailDot {
      x = self.x, y = self.y, color = COLORS[self.color], animationTime = 0.5
    }
    self.trailDots[#self.trailDots + 1] = trailDot
    self:move(steps - 1, callback)
  end)

  local finalX, finalY = self.x, self.y
  for i = 1, steps - 1 do
    finalX, finalY = self:nextCell(finalX, finalY)
  end

  return finalX, finalY
end

function Goti:isBetween(a, x, y)
  if a >= x and a <= y then
    return true
  end

  return false
end

function Goti:kill()
  self.alive = false
  self.x, self.y = self.startX, self.startY
  self.actualX = BOARD_X + (self.x - 1) * CELL_SIZE
  self.actualY = BOARD_Y + (self.y - 1) * CELL_SIZE
end
