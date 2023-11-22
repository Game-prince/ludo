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
  -- finding the goti which is not the same color as the last one
  if self.type == SITTING or self.type == START then
    return
  end
  local lastGoti = self.gotis[#self.gotis]
  for _, goti in ipairs(self.gotis) do
    if not (goti.color == lastGoti.color) then
      goti.alive = false
      goti.x = goti.startY
      goti.y = goti.startY
    end
  end
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
    return newX, newY
  end
end
