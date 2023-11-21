Board = Class {}

function Board:init()
  self.board = {}
  self:createBoard()

  self.prevX = -1
  self.prevY = -1
end

function Board:render()
  -- render cells
  for y = 1, ROW_COUNT do
    for x = 1, COL_COUNT do
      self.board[y][x]:render()
    end
  end


  -- render show area
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][1], BOARD_X, BOARD_Y)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][2], BOARD_X + 9 * CELL_SIZE, BOARD_Y)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][3], BOARD_X + 9 * CELL_SIZE, BOARD_Y + 9 * CELL_SIZE)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][4], BOARD_X, BOARD_Y + 9 * CELL_SIZE)

  -- render win area
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['winArea'], BOARD_X + 6 * CELL_SIZE, BOARD_Y + 6 * CELL_SIZE)

  -- render dice area
  love.graphics.setColor(1, 1, 1, 1)
  for i = 1, 4 do
    love.graphics.rectangle('fill', DiceData[i].x, DiceData[i].y, DICE_SIZE, DICE_SIZE)
  end
end

function Board:update(dt)
  -- cell update
  for y = 1, ROW_COUNT do
    for x = 1, COL_COUNT do
      self.board[y][x]:update(dt)
    end
  end
end

--[[
  function to create board using board_data table
]]
function Board:createBoard()
  for y = 1, ROW_COUNT do
    self.board[y] = {}
    for x = 1, COL_COUNT do
      self.board[y][x] = Cell {
        x = x, y = y, color = BoardData[y][x].color, type = BoardData[y][x].type
      }
    end
  end
end

function Board:getClickedCell()
  local row, col = -1, -1
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getExactPosition()

    col = math.floor((x - BOARD_X) / CELL_SIZE + 1)
    row = math.floor((y - BOARD_Y) / CELL_SIZE + 1)
  end

  self.prevX = col
  self.prevY = row
  return row, col
end

function Board:clearCells()
  for y = 1, ROW_COUNT do
    for x = 1, COL_COUNT do
      self.board[y][x].gotis = {}
    end
  end
end
