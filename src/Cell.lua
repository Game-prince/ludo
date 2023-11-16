Cell = Class {}

function Cell:init(def)
  self.row = def.row
  self.col = def.col

  self.x = BOARD_X + (self.col - 1) * CELL_SIZE
  self.y = BOARD_Y + (self.row - 1) * CELL_SIZE

  self.type = def.type
  self.color = def.color

  self.gotis = {}
end

function Cell:render()
  love.graphics.setColor(COLORS[self.color])
  love.graphics.draw(gTextures['cells'], gQuads['cells'][self.color], self.x, self.y)
end

function Cell:isClicked(x, y)
  if x >= self.x and y >= self.y and x <= self.x + CELL_SIZE and y <= self.y + CELL_SIZE then
    return true
  end

  return false
end
