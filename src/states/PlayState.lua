--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init()
  self.board = Board()
  self.player_colors = { RED, GREEN, YELLOW, BLUE }
  self.players = { Player(RED), Player(GREEN), Player(YELLOW), Player(BLUE) }
  self.turn = 1
  self.dicePosition = self.board.diceAreas[self.player_colors[self.turn]]
  self.dice = Dice(self.dicePosition[1] + (2 * CELL_SIZE - DICE_SIZE) / 2,
    self.dicePosition[2] + (2 * CELL_SIZE - DICE_SIZE) / 2)

  self.players[self.turn].canRoll = true
end

function PlayState:update(dt)
  -- updating dice position
  self.dicePosition = self.board.diceAreas[self.player_colors[self.turn]]
  self.dice.x = self.dicePosition[1] + (2 * CELL_SIZE - DICE_SIZE) / 2
  self.dice.y = self.dicePosition[2] + (2 * CELL_SIZE - DICE_SIZE) / 2

  -- updating players
  for _, player in pairs(self.players) do
    player:update(dt)
  end

  -- if the mouse is clicked
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getExactPosition()
    if self.players[self.turn].canRoll and x >= self.dice.x and x <= self.dice.x + DICE_SIZE and y >= self.dice.y and y <= self.dice.y + DICE_SIZE then
      self:rollDice()
    end
  end
end

function PlayState:render()
  self.board:render()
  self.dice:render()

  for _, player in pairs(self.players) do
    player:render()
  end
end

function PlayState:rollDice()
  self.dice:roll(function()
    local currentPlayer = self.players[self.turn]
    currentPlayer.canRoll = false
    currentPlayer.canMove = true

    local isMoving = currentPlayer:allowMove(self.dice.value)

    if not isMoving then
      self.turn = self.turn == 4 and 1 or self.turn + 1
      currentPlayer.canRoll = false
      currentPlayer.canMove = false
      currentPlayer = self.players[self.turn]
      currentPlayer.canRoll = true
    end
  end)
end
