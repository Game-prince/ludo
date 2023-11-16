Suit = Class {}

function Suit:init(def)
  self.startX = def.startX
  self.startY = def.startY
  self.rotate = def.rotate
  self.offsetX = 3 * CELL_SIZE
  self.offsetY = 4.5 * CELL_SIZE

  self.board = {}
  self.spawnCell = { self.startY + 6, self.startX + 1 }
  self.sitting = { self.startY + 8, self.startX + 2 }
end

function Suit:render()

end

function Suit:update(dt)

end

--[[
  Used to find out if the current cell is the suit's home
]]
function Suit:isHome(x, y)
  if y == self.startY + 7 and x > self.startX and x < self.startX + 7 then
    return true
  end

  return false
end

--[[
  used to find out if the current cell is the suit's area
]]
function Suit:isSuitArea(x, y)
  if y >= self.startY and x >= self.startX and y < self.startY + 9 and x < self.startX + 9 then
    return true
  end

  return false
end

function Suit:createBoard()
  for y = 1, 9 do
    self.board[y] = {}
    for x = 1, 6 do
      -- creating normal cells for each position
      self.board[y][x] = Cell({
        x = self.startX + x - 1,
        y = self.startY + y - 1,
        color = self.color,
        type = CELL_TYPES["normal"]
      })
    end
  end
end
