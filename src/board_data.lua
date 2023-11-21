--[[
  Params
    {color, type}
]]
BoardData = {
  -- row 1
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row 2
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = NORMAL }, { color = GREEN, type = HOME }, { color = GREEN, type = START },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row 3
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = SITTING }, { color = GREEN, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row4
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = NORMAL }, { color = GREEN, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row 5
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = NORMAL }, { color = GREEN, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row 6
  {
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA }, { color = RED, type = SHOWAREA },
    { color = EMPTY, type = NORMAL }, { color = GREEN, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
    { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA }, { color = GREEN, type = SHOWAREA },
  },

  -- row 7
  {
    { color = EMPTY, type = NORMAL }, { color = RED, type = START }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = HOME }, { color = EMPTY, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = SITTING }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
  },

  -- row 8
  {
    { color = EMPTY, type = NORMAL }, { color = RED, type = HOME }, { color = RED, type = HOME },
    { color = RED,   type = HOME }, { color = RED, type = HOME }, { color = RED, type = HOME },
    { color = EMPTY,  type = HOME }, { color = EMPTY, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = HOME }, { color = YELLOW, type = HOME }, { color = YELLOW, type = HOME },
    { color = YELLOW, type = HOME }, { color = YELLOW, type = HOME }, { color = EMPTY, type = NORMAL },
  },

  -- row 9
  {
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = SITTING },
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = HOME }, { color = EMPTY, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = EMPTY, type = NORMAL }, { color = YELLOW, type = START }, { color = EMPTY, type = NORMAL },
  },

  -- row 10
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = EMPTY,  type = NORMAL }, { color = BLUE, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  },

  -- row 11
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = EMPTY,  type = NORMAL }, { color = BLUE, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  },

  -- row 12
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = EMPTY,  type = NORMAL }, { color = BLUE, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  },

  -- row 13
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = EMPTY,  type = NORMAL }, { color = BLUE, type = HOME }, { color = EMPTY, type = SITTING },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  },

  -- row 14
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE,   type = START }, { color = BLUE, type = HOME }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  },

  -- row 15
  {
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA }, { color = BLUE, type = SHOWAREA },
    { color = EMPTY,  type = NORMAL }, { color = EMPTY, type = NORMAL }, { color = EMPTY, type = NORMAL },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
    { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA }, { color = YELLOW, type = SHOWAREA },
  }

}

DiceData = {
  { color = RED,    x = BOARD_X + 3 * CELL_SIZE,  y = BOARD_Y - 2 * CELL_SIZE },
  { color = GREEN,  x = BOARD_X + 10 * CELL_SIZE, y = BOARD_Y - 2 * CELL_SIZE },
  { color = YELLOW, x = BOARD_X + 10 * CELL_SIZE, y = BOARD_Y + 15 * CELL_SIZE },
  { color = BLUE,   x = BOARD_X + 3 * CELL_SIZE,  y = BOARD_Y + 15 * CELL_SIZE }
}

GotiStartData = {
  [RED] = {
    { x = 2, y = 2 }, { x = 5, y = 2 }, { x = 5, y = 5 }, { x = 2, y = 5 }
  },
  [GREEN] = {
    { x = 11, y = 2 }, { x = 14, y = 2 }, { x = 14, y = 5 }, { x = 11, y = 5 }
  },
  [YELLOW] = {
    { x = 11, y = 11 }, { x = 14, y = 11 }, { x = 14, y = 14 }, { x = 11, y = 14 }
  },
  [BLUE] = {
    { x = 2, y = 11 }, { x = 5, y = 11 }, { x = 5, y = 14 }, { x = 2, y = 14 }
  }
}

GotiBirthHomeData = {
  [RED] = { x = 2, y = 7 },
  [GREEN] = { x = 9, y = 2 },
  [YELLOW] = { x = 14, y = 9 },
  [BLUE] = { x = 7, y = 14 }
}
