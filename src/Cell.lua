Cell = Class {}

function Cell:init(def)
  self.row = def.row
  self.col = def.col
  self.suit = def.suit

  self.x = BOARD_X + (self.col - 1) * CELL_SIZE
  self.y = BOARD_Y + (self.row - 1) * CELL_SIZE

  self.offsetX = BOARD_X + (self.suit.startX - 1) * CELL_SIZE - self.x
  self.offsetY = BOARD_Y + (self.suit.startY - 1) * CELL_SIZE - self.y

  self.type = def.type
  self.color = def.color

  self.gotis = {}
end

function Cell:render()
  -- render cell
  love.graphics.setColor(1, 1, 1, 1)
  if self.type == CELL_TYPES['normal'] then
    love.graphics.draw(gTextures['cells'], gQuads['cells'][5], self.x + self.offsetX, self.y + self.offsetY,
      self.suit.rotation, 1, 1, self.offsetX, self.offsetY)
  elseif self.type == CELL_TYPES['home'] then
    love.graphics.draw(gTextures['cells'], gQuads['cells'][self.color], self.x + self.offsetX,
      self.y + self.offsetY,
      self.suit.rotation, 1, 1, self.offsetX, self.offsetY)
  elseif self.type == CELL_TYPES["sitting"] then
    if self.suit.spawnCell[1] == self.col and self.suit.spawnCell[2] == self.row then
      love.graphics.setColor(COLORS[self.color])
    end

    love.graphics.draw(gTextures['stars'],
      gQuads['stars'][(self.x == self.suit.spawnCell[1] and self.y == self.suit.spawnCell[2]) and self.color or 5],
      self.x + self.offsetX, self.y + self.offsetY,
      self.suit.rotation, 1, 1, self.offsetX, self.offsetY)
  end

  -- render goti
  for _, goti in ipairs(self.gotis) do
    goti:render()
  end
end

function Cell:isClicked(x, y)
  if x >= self.x and y >= self.y and x <= self.x + CELL_SIZE and y <= self.y + CELL_SIZE then
    return true
  end

  return false
end

function Cell:getPosition()
  local x = self.x + self.offsetX
  local y = self.y + self.offsetY

  return x, y
end
