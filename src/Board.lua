Board = Class {}

function Board:init(def)
  self.players = def.players

  -- actual board
  self.board2 = {}
  for _, player in ipairs(self.players) do
    table.insert(self.board2, player.suit)
  end

  self.diceAreas = {
    [RED] = { BOARD_X + CELL_SIZE, BOARD_Y - CELL_SIZE },
    [GREEN] = { BOARD_X + BOARD_WIDTH - 3 * CELL_SIZE, BOARD_Y - CELL_SIZE },
    [YELLOW] = { BOARD_X + BOARD_WIDTH - 3 * CELL_SIZE, BOARD_Y + BOARD_HEIGHT - CELL_SIZE },
    [BLUE] = { BOARD_X + CELL_SIZE, BOARD_Y + BOARD_HEIGHT - CELL_SIZE }
  }

  self.showAreas = {
    [RED] = { BOARD_X, BOARD_Y + CELL_SIZE },
    [GREEN] = { BOARD_X + BOARD_WIDTH - 6 * CELL_SIZE, BOARD_Y + CELL_SIZE },
    [BLUE] = { BOARD_X + BOARD_WIDTH - 6 * CELL_SIZE, BOARD_Y + BOARD_HEIGHT - 7 * CELL_SIZE },
    [YELLOW] = { BOARD_X, BOARD_Y + BOARD_HEIGHT - 7 * CELL_SIZE }
  }
end

function Board:render()
  for _, suit in ipairs(self.board2) do
    suit:render()
  end

  -- rendering center peiece
  local x = BOARD_X + 6 * CELL_SIZE
  local y = BOARD_Y + 6 * CELL_SIZE
  love.graphics.draw(gTextures['winArea'], x, y)
end

function Board:getNextCell(suit, x, y)
  -- x decreasing
end
