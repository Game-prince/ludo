Cell = Class {}

function Cell:init(def)
  self.x = def.x
  self.y = def.y
  self.color = def.color
  self.type = def.type

  -- currently present gotis
  self.gotis = {}
end

function Cell:render()
  local x = BOARD_X + (self.x - 1) * CELL_SIZE
  local y = BOARD_Y + (self.y - 1) * CELL_SIZE

  love.graphics.setColor(COLORS[self.color])
  love.graphics.draw(gTextures['cells'], gQuads['cells'][self.color], x, y)

  if self.type == START or self.type == SITTING then
    love.graphics.draw(gTextures['stars'], gQuads['stars'][5], x, y)
  end
end

function Cell:update(dt)
end

function Cell:moveGoti(color, value, callback)
  local movableGotis = {}

  for _, goti in ipairs(self.gotis) do
    if goti.color == color and goti.canMove then
      table.insert(movableGotis, goti)
    end
  end

  if #movableGotis == 0 then
    return self.x, self.y
  else
    local newX, newY = movableGotis[1]:move(value, callback)
    if movableGotis[1].x == GotiWinPosition[color].x and movableGotis[1].y == GotiWinPosition[color].y then
      movableGotis[1].hasWon = true
    end
    return newX, newY
  end
end

function Cell:handleGotiKilling(color)
  for _, goti in ipairs(self.gotis) do
    if goti.color ~= color then
      goti:kill()
    end
  end
end
