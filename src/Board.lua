Board = Class {}

function Board:init()
  -- actual board
  self.board = {
    -- ROW 0
    { { RED,  SHOWAREA }, { RED, DICEAREA }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL },
      { NO_CELL },

      { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { GREEN, DICEAREA }, { GREEN, SHOWAREA } },
    -- ROW 1
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY }, { EMPTY }, { EMPTY }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 2
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY }, { GREEN, HOME }, { GREEN, SITTING, START }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 3
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY, SITTING }, { GREEN, HOME }, { EMPTY }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 4
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY }, { GREEN, HOME }, { EMPTY }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 5
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY }, { GREEN, HOME }, { EMPTY }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 6
    { { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA }, { RED, SHOWAREA },
      { EMPTY }, { GREEN, HOME }, { EMPTY }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA },
      { GREEN, SHOWAREA }, { GREEN, SHOWAREA }, { GREEN, SHOWAREA } },

    -- ROW 7
    { { EMPTY }, { RED, HOME, SITTING }, { EMPTY }, { EMPTY }, { EMPTY }, { EMPTY },
      { EMPTY }, { GREEN, HOME }, { EMPTY },
      { EMPTY }, { EMPTY }, { EMPTY }, { EMPTY, SITTING }, { EMPTY }, { EMPTY } },

    -- ROW 8
    { { EMPTY }, { RED, HOME }, { RED, HOME }, { RED, HOME }, { RED, HOME }, { RED, HOME },
      { RED,  HOME }, { EMPTY }, { BLUE, HOME },
      { YELLOW, HOME }, { YELLOW, HOME }, { YELLOW, HOME }, { YELLOW, HOME }, { YELLOW, HOME }, { EMPTY } },

    -- ROW 9
    { { EMPTY }, { EMPTY }, { EMPTY, SITTING }, { EMPTY }, { EMPTY }, { EMPTY },
      { EMPTY }, { YELLOW, HOME }, { EMPTY },
      { EMPTY }, { EMPTY }, { EMPTY }, { EMPTY }, { YELLOW, HOME, SITTING }, { EMPTY } },

    -- ROW 10
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { EMPTY }, { BLUE, HOME }, { EMPTY },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 11
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { EMPTY }, { BLUE, HOME }, { EMPTY },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 12
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { EMPTY }, { BLUE, HOME }, { EMPTY },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 13
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { EMPTY }, { BLUE, HOME }, { EMPTY, SITTING },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 14
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { BLUE, START,   SITTING }, { BLUE, HOME }, { EMPTY },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 15
    {
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA },
      { EMPTY }, { EMPTY }, { EMPTY },
      { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
    },

    -- ROW 16
    { { BLUE, SHOWAREA }, { BLUE, DICEAREA }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL },
      { NO_CELL },
      { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { YELLOW, DICEAREA }, { YELLOW, SHOWAREA } },
  }

  -- actual board
  self.board2 = {}

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
  -- creating cells
  for y = 1, ROW_COUNT do
    for x = 1, COL_COUNT do
      self:renderCell(x, y, self.board[y][x])
    end
  end

  -- redering win areas
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['winArea'], BOARD_X + 6 * CELL_SIZE, BOARD_Y + 7 * CELL_SIZE)

  -- rendering show areas
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][RED], self.showAreas[RED][1], self.showAreas[RED][2])
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][GREEN], self.showAreas[GREEN][1],
    self.showAreas[GREEN][2])
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][BLUE], self.showAreas[YELLOW][1],
    self.showAreas[YELLOW][2])
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][YELLOW], self.showAreas[BLUE][1],
    self.showAreas[BLUE][2])
end

function Board:renderCell(x, y, properties)
  local isSitting = false
  local isDiceArea = false

  for i = 1, #properties do
    -- no cell
    if properties[i] == NO_CELL or properties[i] == SHOWAREA then
      return
    end

    -- setting sitting
    if properties[i] == SITTING then
      isSitting = true
    elseif properties[i] == DICEAREA then
      isDiceArea = true
    end
  end
  -- draw a cell
  love.graphics.setColor(COLORS[properties[1]])
  love.graphics.draw(gTextures['cells'], gQuads['cells'][properties[1]], BOARD_X + (x - 1) * CELL_SIZE,
    BOARD_Y + (y - 1) * CELL_SIZE)

  -- Drawing dice area a little bigger than the rest
  if isDiceArea then
    local xPos = x == 2 and BOARD_X + (x - 1) * CELL_SIZE or BOARD_X + (x - 2) * CELL_SIZE
    local yPos = y == 1 and BOARD_Y - CELL_SIZE or BOARD_Y + (y - 1) * CELL_SIZE

    love.graphics.setColor(COLORS[properties[1]])
    love.graphics.rectangle("fill", xPos, yPos, 2 * CELL_SIZE, 2 * CELL_SIZE)
  end

  -- draw sitting
  if isSitting then
    love.graphics.draw(gTextures['stars'], gQuads['stars'][5], BOARD_X + (x - 1) * CELL_SIZE,
      BOARD_Y + (y - 1) * CELL_SIZE)
  end
end

function Board:createBoard()
  local rows = 15
  local cols = 15

  for y = 1, rows do
    self.board[y] = {}
    for x = 1, cols do
      self.board[y][x] = {}
    end
  end

  -- creating show areas
  for color, corner in pairs(CORNERS) do
    for i = 0, 5 do
      for j = 0, 5 do
        self.board[corner[1] + i][corner[2] + j] = Cell({
          row = corner[1] + i, col = corner[2] + j, color = color, type = SHOWAREA
        })
      end
    end
  end
end
