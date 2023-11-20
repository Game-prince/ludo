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
