Board = Class {}

function Board:init()
  self.width = VIRTUAL_WIDTH
  self.height = ROW_COUNT * CELL_SIZE
  self.x = 0
  self.y = VIRTUAL_HEIGHT / 2 - self.height / 2


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
      { BLUE, HOME }, { BLUE, HOME }, { BLUE, HOME }, { BLUE, HOME }, { BLUE, HOME }, { EMPTY } },

    -- ROW 9
    { { EMPTY }, { EMPTY }, { EMPTY, SITTING }, { EMPTY }, { EMPTY }, { EMPTY },
      { EMPTY }, { YELLOW, HOME }, { EMPTY },
      { EMPTY }, { EMPTY }, { EMPTY }, { EMPTY }, { BLUE, HOME, SITTING }, { EMPTY } },

    -- ROW 10
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { EMPTY }, { YELLOW, HOME }, { EMPTY },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 11
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { EMPTY }, { YELLOW, HOME }, { EMPTY },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 12
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { EMPTY }, { YELLOW, HOME }, { EMPTY },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 13
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { EMPTY }, { YELLOW, HOME }, { EMPTY, SITTING },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 14
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { YELLOW, START,   SITTING }, { YELLOW, HOME }, { EMPTY },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 15
    { { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA }, { YELLOW, SHOWAREA },
      { YELLOW, SHOWAREA },
      { EMPTY }, { EMPTY }, { EMPTY },
      { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA }, { BLUE, SHOWAREA },
      { BLUE, SHOWAREA } },

    -- ROW 16
    { { YELLOW, SHOWAREA }, { YELLOW, DICEAREA }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL },
      { NO_CELL },
      { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { NO_CELL }, { BLUE, DICEAREA }, { BLUE, SHOWAREA } },
  }

  self.diceAreas = {
    [RED] = { self.x + CELL_SIZE, self.y - CELL_SIZE },
    [GREEN] = { self.x + self.width - 3 * CELL_SIZE, self.y - CELL_SIZE },
    [BLUE] = { self.x + self.width - 3 * CELL_SIZE, self.y + self.height },
    [YELLOW] = { self.x + CELL_SIZE, self.y + self.height }
  }
end

function Board:render()
  -- -- create the rectangle
  -- love.graphics.setColor(1, 1, 1, 1)
  -- love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

  -- creating cells
  for y = 1, ROW_COUNT do
    for x = 1, COL_COUNT do
      self:renderCell(x, y, self.board[y][x])
    end
  end

  -- rendering half coloured cells
  local corners = { { 6, 7, 6, 10, RED }, { 6, 7, 9, 7, GREEN }, { 9, 7, 9, 10, BLUE }, { 9, 10, 6, 10, YELLOW } }

  for i, corner in ipairs(corners) do
    local x1, y1, x2, y2 = corner[1], corner[2], corner[3], corner[4]

    love.graphics.setColor(COLORS[corner[5]])
    love.graphics.polygon("fill", self.x + x1 * CELL_SIZE, self.y + y1 * CELL_SIZE, self.x + x2 * CELL_SIZE,
      self.y + y2 * CELL_SIZE, self.x + 7.5 * CELL_SIZE, self.y + 8.5 * CELL_SIZE)
  end
end

function Board:renderCell(x, y, properties)
  local isSitting = false
  local isDiceArea = false

  for i = 1, #properties do
    -- no cell
    if properties[i] == NO_CELL then
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
  love.graphics.rectangle("fill", self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, CELL_SIZE, CELL_SIZE)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.rectangle("line", self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, CELL_SIZE, CELL_SIZE)

  -- Drawing dice area a little bigger than the rest
  if isDiceArea then
    local xPos = x == 2 and self.x + (x - 1) * CELL_SIZE or self.x + (x - 2) * CELL_SIZE
    local yPos = y == 1 and self.y - CELL_SIZE or self.y + (y - 1) * CELL_SIZE

    love.graphics.setColor(COLORS[properties[1]])
    love.graphics.rectangle("fill", xPos, yPos, 2 * CELL_SIZE, 2 * CELL_SIZE)
  end

  -- draw sitting
  if isSitting then
    love.graphics.line(self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, self.x + x * CELL_SIZE,
      self.y + y * CELL_SIZE)
    love.graphics.line(self.x + (x - 1) * CELL_SIZE, self.y + y * CELL_SIZE, self.x + x * CELL_SIZE,
      self.y + (y - 1) * CELL_SIZE)
  end
end
