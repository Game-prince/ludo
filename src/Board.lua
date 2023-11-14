Board = Class {}

function Board:init()
  self.width = COL_COUNT * CELL_SIZE
  self.height = ROW_COUNT * CELL_SIZE
  self.x = (VIRTUAL_WIDTH - self.width) / 2
  self.y = (VIRTUAL_HEIGHT - self.height) / 2


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

  self.diceAreas = {
    [RED] = { self.x + CELL_SIZE, self.y - CELL_SIZE },
    [GREEN] = { self.x + self.width - 3 * CELL_SIZE, self.y - CELL_SIZE },
    [YELLOW] = { self.x + self.width - 3 * CELL_SIZE, self.y + self.height - CELL_SIZE },
    [BLUE] = { self.x + CELL_SIZE, self.y + self.height - CELL_SIZE }
  }

  self.showAreas = {
    [RED] = { self.x, self.y + CELL_SIZE },
    [GREEN] = { self.x + self.width - 6 * CELL_SIZE, self.y + CELL_SIZE },
    [YELLOW] = { self.x + self.width - 6 * CELL_SIZE, self.y + self.height - 7 * CELL_SIZE },
    [BLUE] = { self.x, self.y + self.height - 7 * CELL_SIZE }
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
  love.graphics.draw(gTextures['winArea'], self.x + 6 * CELL_SIZE, self.y + 7 * CELL_SIZE)

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
  love.graphics.draw(gTextures['cells'], gQuads['cells'][properties[1]], self.x + (x - 1) * CELL_SIZE,
    self.y + (y - 1) * CELL_SIZE)

  -- Drawing dice area a little bigger than the rest
  if isDiceArea then
    local xPos = x == 2 and self.x + (x - 1) * CELL_SIZE or self.x + (x - 2) * CELL_SIZE
    local yPos = y == 1 and self.y - CELL_SIZE or self.y + (y - 1) * CELL_SIZE

    love.graphics.setColor(COLORS[properties[1]])
    love.graphics.rectangle("fill", xPos, yPos, 2 * CELL_SIZE, 2 * CELL_SIZE)
  end

  -- draw sitting
  if isSitting then
    love.graphics.draw(gTextures['stars'], gQuads['stars'][5], self.x + (x - 1) * CELL_SIZE,
      self.y + (y - 1) * CELL_SIZE)
  end
end
