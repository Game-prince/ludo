--[[
  mobile screen ratio = 9 : 16
]]
WINDOW_WIDTH = 450
WINDOW_HEIGHT = 800

VIRTUAL_WIDTH = 9 * 170
VIRTUAL_HEIGHT = 16 * 170

CELL_TYPES = {
  ["normal"] = 1,
  ["sitting"] = 2,
  ["home"] = 3,
  ["showArea"] = 4
}

SUIT_TYPES = {
  ["red"] = 1,
  ["green"] = 2,
  ["yellow"] = 3,
  ["blue"] = 4
}

SITTING = 0
RED = 1
GREEN = 2
YELLOW = 3
BLUE = 4
EMPTY = 5
HOME = 6
START = 7
SHOWAREA = 8
DICEAREA = 9
NO_CELL = 10

ROW_COUNT = 17
COL_COUNT = 15
CELL_SIZE = 100

BOARD_WIDTH = COL_COUNT * CELL_SIZE
BOARD_HEIGHT = ROW_COUNT * CELL_SIZE
BOARD_X = (VIRTUAL_WIDTH - BOARD_WIDTH) / 2
BOARD_Y = (VIRTUAL_HEIGHT - BOARD_HEIGHT) / 2

COLORS = {
  [RED] = { 1, 0, 0, 1 },
  [GREEN] = { 0, 1, 0, 1 },
  [BLUE] = { 0, 0, 1, 1 },
  [YELLOW] = { 1, 1, 0, 1 },
  [EMPTY] = { 1, 1, 1, 1 },
  [NO_CELL] = { 0, 0, 0, 0 }
}

DICE_SIZE = 200
GOTI_WIDTH = 100
GOTI_HEIGHT = 150

CORNERS = {
  [RED] = { 2, 1 },
  [GREEN] = { 2, 10 },
  [YELLOW] = { 11, 10 },
  [BLUE] = { 11, 1 }
}
