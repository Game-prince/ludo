--[[
  mobile screen ratio = 9 : 16
]]
WINDOW_WIDTH = 450
WINDOW_HEIGHT = 800

VIRTUAL_WIDTH = 450
VIRTUAL_HEIGHT = 800


EMPTY = 0
RED = 1
GREEN = 2
BLUE = 3
YELLOW = 4
SITTING = 5
HOME = 6
START = 7
SHOWAREA = 8
DICEAREA = 9
NO_CELL = 10

ROW_COUNT = 17
COL_COUNT = 15
CELL_SIZE = math.floor(VIRTUAL_WIDTH / COL_COUNT)

COLORS = {
  [RED] = { 1, 0, 0, 1 },
  [GREEN] = { 0, 1, 0, 1 },
  [BLUE] = { 0, 0, 1, 1 },
  [YELLOW] = { 1, 1, 0, 1 },
  [EMPTY] = { 1, 1, 1, 1 },
  [NO_CELL] = { 0, 0, 0, 0 }
}

DICE_SIZE = 51
