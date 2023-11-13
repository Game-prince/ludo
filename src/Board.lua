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
  local corners = { { 6, 7, RED, GREEN }, { 8, 7, GREEN, BLUE }, { 8, 9, YELLOW, BLUE }, { 6, 9, RED, YELLOW } }

  for i, corner in ipairs(corners) do
    local x, y = corner[1], corner[2]

    -- first half
    love.graphics.setColor(COLORS[corner[3]])
    love.graphics.polygon("fill", self.x + x * CELL_SIZE, self.y + y * CELL_SIZE, self.x + (x + 1) * CELL_SIZE,
      self.y + (y + 1) * CELL_SIZE, self.x + x * CELL_SIZE, self.y + (y + 1) * CELL_SIZE)

    -- second half
    love.graphics.setColor(COLORS[corner[4]])
    love.graphics.polygon("fill", self.x + x * CELL_SIZE, self.y + y * CELL_SIZE, self.x + (x + 1) * CELL_SIZE,
      self.y + y * CELL_SIZE, self.x + (x + 1) * CELL_SIZE, self.y + (y + 1) * CELL_SIZE)
  end
end

function Board:renderCell(x, y, properties)
  local r, g, b = 1, 1, 1
  local isSitting = false

  for i = 1, #properties do
    -- no cell
    if properties[i] == NO_CELL then
      return
    end

    -- setting cell color
    if properties[i] == EMPTY then
      r, g, b = 1, 1, 1
    elseif properties[i] == RED then
      r, g, b = 1, 0, 0
    elseif properties[i] == GREEN then
      r, g, b = 0, 1, 0
    elseif properties[i] == BLUE then
      r, g, b = 0, 0, 1
    elseif properties[i] == YELLOW then
      r, g, b = 1, 1, 0
    end

    -- setting sitting
    if properties[i] == SITTING then
      isSitting = true
    end
  end
  -- draw a cell
  love.graphics.setColor(r, g, b, 1)
  love.graphics.rectangle("fill", self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, CELL_SIZE, CELL_SIZE)
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.rectangle("line", self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, CELL_SIZE, CELL_SIZE)

  -- draw sitting
  if isSitting then
    love.graphics.line(self.x + (x - 1) * CELL_SIZE, self.y + (y - 1) * CELL_SIZE, self.x + x * CELL_SIZE,
      self.y + y * CELL_SIZE)
    love.graphics.line(self.x + (x - 1) * CELL_SIZE, self.y + y * CELL_SIZE, self.x + x * CELL_SIZE,
      self.y + (y - 1) * CELL_SIZE)
  end
end
