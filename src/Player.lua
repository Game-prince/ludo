Player = Class {}

function Player:init(color)
  self.color = color
  self.isTurn = false

  self.corner = CORNERS[self.color]
  self.cornerX = BOARD_X + (self.corner[1] - 1) * CELL_SIZE
  self.cornerY = BOARD_Y + (self.corner[2] - 1) * CELL_SIZE

  self.gotis = {
    Goti(self.cornerX + CELL_SIZE, self.cornerY + CELL_SIZE, self.color),
    Goti(self.cornerX + 4 * CELL_SIZE, self.cornerY + CELL_SIZE, self.color),
    Goti(self.cornerX + 4 * CELL_SIZE, self.cornerY + 4 * CELL_SIZE, self.color),
    Goti(self.cornerX + CELL_SIZE, self.cornerY + 4 * CELL_SIZE, self.color)
  }
end

function Player:render()
  for _, goti in pairs(self.gotis) do
    goti:render()
  end
end

function Player:makeTurn()

end
