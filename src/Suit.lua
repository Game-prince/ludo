Suit = Class {}

function Suit:init(def)
  self.startX = def.startX
  self.startY = def.startY
  self.rotation = (def.rotation * math.pi) / 180 or 0
  self.color = def.color

  self.spawnCell = { self.startX + 1, self.startY + 6 }
  self.board = {}
  self:createBoard()

  self.gotis = {
    Goti(self.color),
    Goti(self.color),
    Goti(self.color),
    Goti(self.color),
  }

  table.insert(self.board[2][2].gotis, self.gotis[1])
  table.insert(self.board[2][5].gotis, self.gotis[2])
  table.insert(self.board[5][5].gotis, self.gotis[3])
  table.insert(self.board[5][2].gotis, self.gotis[4])
end

function Suit:render()
  -- rendering cells
  for y = 1, 9 do
    for x = 1, 6 do
      local cell = self.board[y][x]
      cell:render()
    end
  end

  -- rendering the show area
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(gTextures['showAreas'], gQuads['showAreas'][self.color],
    BOARD_X + (self.startX - 1) * CELL_SIZE,
    BOARD_Y + (self.startY - 1) * CELL_SIZE,
    self.rotation)
end

function Suit:update(dt)
  -- self.rotation = self.rotation + dt
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
        col = self.startX + x - 1,
        row = self.startY + y - 1,
        suit = self,
        color = self.color,
        type = CELL_TYPES["normal"]
      })

      -- showarea
      if x >= 1 and y >= 1 and x <= 6 and y <= 6 then
        self.board[y][x].type = CELL_TYPES["showArea"]

        -- sitting
      elseif (y == 7 and x == 2) or (y == 9 and x == 3) then
        self.board[y][x].type = CELL_TYPES['sitting']

        -- home
      elseif (y == 8 and x > 1 and x < 7) then
        self.board[y][x].type = CELL_TYPES["home"]
      end
    end
  end
end
