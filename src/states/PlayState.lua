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

  self.arrow = ArrowAnimated {
    x = self.dice.x, y = self.dice.y, interval = 0.5, direction = 'left'
  }

  self.isNil = false
  self.prevX, self.prevY = -1, -1
end

function PlayState:render()
  -- board and dice and player
  self.board:render()
  self.dice:render()
  for _, player in ipairs(self.players) do
    player:render()
  end

  -- player turn
  if self.players[self.turn].canRoll then
    self.arrow:render()
  end

  -- is nil
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf(self.prevX .. " " .. self.prevY, 0, VIRTUAL_HEIGHT - 200, VIRTUAL_WIDTH, 'center')
  if self.isNil then
    love.graphics.printf('NIL', 0, VIRTUAL_HEIGHT - 100, VIRTUAL_WIDTH, 'center')
  else
    love.graphics.printf('NOT NIL', 0, VIRTUAL_HEIGHT - 100, VIRTUAL_WIDTH, 'center')
  end
end

function PlayState:update(dt)
  -- checking if the player has won
  if self.players[self.turn]:hasWon() then
    gStateStack:change('win', {
      winner = self.players[self.turn].color
    })
  end

  -- updating arrow
  self.arrow.x = self.dice.x
  self.arrow.y = self.dice.y
  local currentPlayerColor = self.players[self.turn].color
  if currentPlayerColor == RED or currentPlayerColor == BLUE then
    self.arrow.direction = 'left'
  else
    self.arrow.direction = 'right'
  end

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

  -- handling left mouse click
  if love.mouse.wasPressed(1) then
    self:handleLeftMouseClick()
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

function PlayState:handleLeftMouseClick()
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
      local color, value = self.players[self.turn].color, self.dice.value


      -- move cell
      local newX, newY = nil, nil
      Chain(
        function(go)
          newX, newY = cell:moveGoti(color, value, function()
            self.players[self.turn].canMove = false
            for _, goti in ipairs(self.players[self.turn].gotis) do
              goti.canMove = false
            end
            if not (self.dice.value == 6) then
              self.turn = self.turn + 1 > 4 and 1 or self.turn + 1
            end
            self.players[self.turn].canRoll = true
          end)
          Timer.after(value * 0.2, go)
        end,
        function(go)
          if newX == nil or newY == nil then
            self.isNil = true
            return
          end

          self.isNil = false
          self.prevX, self.prevY = newX, newY

          -- handle goti killing
          local newCell = self.board.board[newY][newX]
          if newCell.type == NORMAL then
            newCell:handleGotiKilling(color)
          end

          Timer.after(0.1, go)
        end
      )()
    end
  else
    self.wrongCell = true
  end
end
