Goti = Class {}

function Goti:init(def)
  self.color = def.color
  self.x = def.x
  self.y = def.y

  self.alive = false

  self.canMove = false
  self.mul = 0.2
  self.scale = 1

  self.actualX = BOARD_X + (self.x - 1) * CELL_SIZE
  self.actualY = BOARD_Y + (self.y - 1) * CELL_SIZE
end

function Goti:update(dt)
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
  -- where x is decreasing
  if (y == 9 and ((x > 1 and x <= 7) or (x > 9 and x <= 15))) or (y == 15 and x > 7) or (self.color == YELLOW and y == 8 and x < 15 and x > 9) then
    x = x - 1

    -- where y is decreasing
    if (x == 1 and y > 7) or (x == 7 and ((y > 1 and y <= 7) or (y > 9 and y <= 15))) or (self.color == BLUE and x == 8 and y < 15 and y > 9) then
      y = y - 1

      -- where y is increasing
    elseif (x == 15 and y < 9) or (x == 9 and ((y >= 1 and y < 7) or (y >= 9 and y < 15))) or (self.color == GREEN and x == 8 and y > 1 and y < 7) then
      y = y + 1
    end

    -- where x is increasing
  elseif (y == 7 and ((x >= 1 and x < 7) or (x >= 9 and x < 15))) or (y == 1 and x < 9) or (self.color == RED and y == 8 and x > 1 and x < 7) then
    x = x + 1

    -- where y is decreasing
    if (x == 1 and y > 7) or (x == 7 and ((y > 1 and y <= 7) or (y > 9 and y <= 15))) or (self.color == BLUE and x == 8 and y < 15 and y > 9) then
      y = y - 1

      -- where y is increasing
    elseif (x == 15 and y < 9) or (x == 9 and ((y >= 1 and y < 7) or (y >= 9 and y < 15))) or (self.color == GREEN and x == 8 and y > 1 and y < 7) then
      y = y + 1
    end
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

function Goti:move(steps, callback)
  -- if the goti is not alive and step is 6
  if not self.alive and steps == 6 then
    self.alive = true
    self.x, self.y = GotiBirthHomeData[self.color].x, GotiBirthHomeData[self.color].y
    Timer.tween(0.5, {
      [self] = { actualX = BOARD_X + (self.x - 1) * CELL_SIZE, actualY = BOARD_Y + (self.y - 1) * CELL_SIZE }
    }):finish(function()
      if callback then
        callback()
      end
    end)
    return true
  end

  -- if the goti is already alive
  local x, y = self.x, self.y
  local nextX, nextY = nil, nil

  for i = 1, steps do
    nextX, nextY = self:nextCell(x, y)
    if nextX == x and nextY == y then
      return false
    end
    x = nextX
    y = nextY
  end

  self.x = x
  self.y = y
  Timer.tween(0.5, {
    [self] = { actualX = BOARD_X + (self.x - 1) * CELL_SIZE, actualY = BOARD_Y + (self.y - 1) * CELL_SIZE }
  }):finish(function()
    if callback then
      callback()
    end
  end)

  return true
end
