--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init()
  self.board = Board()
  self.players = {
    Player { color = RED },
    Player { color = GREEN },
    Player { color = YELLOW },
    Player { color = BLUE },
  }

  self.turn = 1
  self.dice = Dice(DiceData[1].x, DiceData[1].y)

  self.players[self.turn].canRoll = true
end

function PlayState:render()
  self.board:render()
  self.dice:render()
  for _, player in ipairs(self.players) do
    player:render()
  end

  -- player turn
  love.graphics.setFont(gFonts['large'])
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Player Turn : ", 0, 60, VIRTUAL_WIDTH, "left")
  love.graphics.setColor(COLORS[self.players[self.turn].color])
  love.graphics.rectangle("fill", 450, 30, 100, 100)
end

function PlayState:update(dt)
  -- updating player
  for _, player in ipairs(self.players) do
    player:update(dt)
  end

  -- placing goti data on the cell
  self.board:clearCells()
  for _, player in ipairs(self.players) do
    for _, goti in ipairs(player.gotis) do
      table.insert(self.board.board[goti.y][goti.x].gotis, goti)
    end
  end

  -- updating board
  self.board:update(dt)

  -- updating dice
  self.dice.x = DiceData[self.turn].x
  self.dice.y = DiceData[self.turn].y

  -- rolling dice
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getExactPosition()
    local row, col = self.board:getClickedCell()

    -- if clicked on the dice, roll the dice
    if self.players[self.turn].canRoll and x >= DiceData[self.turn].x and x <= DiceData[self.turn].x + DICE_SIZE and y >= DiceData[self.turn].y and y <= DiceData[self.turn].y + DICE_SIZE then
      self:rollDice()

      -- if clicked on the cell and can move, move the goti
    elseif row >= 1 and row <= ROW_COUNT and col >= 1 and col <= COL_COUNT then
      self.wrongCell = false
      if self.players[self.turn].canMove then
        local cell = self.board.board[row][col]

        -- move cell
        local newX, newY = cell:moveGoti(self.players[self.turn].color, self.dice.value, function()
          self.players[self.turn].canMove = false
          for _, goti in ipairs(self.players[self.turn].gotis) do
            goti.canMove = false
          end
          if not (self.dice.value == 6) then
            self.turn = self.turn + 1 > 4 and 1 or self.turn + 1
          end
          self.players[self.turn].canRoll = true
        end)
      end
    else
      self.wrongCell = true
    end
  end
end

function PlayState:rollDice()
  self.dice:roll(function()
    self.players[self.turn].canRoll = false
    local count = self.players[self.turn]:whichGotisCanMove(self.dice.value)
    if count == 0 then
      self.turn = self.turn + 1
      if self.turn > 4 then
        self.turn = 1
      end
      self.players[self.turn].canRoll = true
    else
      self.players[self.turn].canMove = true
    end
  end)
end
