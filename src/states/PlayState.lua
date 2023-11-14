--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init()
  self.board = Board()
  self.players = { RED, GREEN, YELLOW, BLUE }
  self.turn = 1
  self.dicePosition = self.board.diceAreas[self.players[self.turn]]
  self.dice = Dice(self.dicePosition[1] + (2 * CELL_SIZE - DICE_SIZE) / 2,
    self.dicePosition[2] + (2 * CELL_SIZE - DICE_SIZE) / 2)
end

function PlayState:update(dt)
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getExactPosition()
    if x >= self.dice.x and x <= self.dice.x + DICE_SIZE and y >= self.dice.y and y <= self.dice.y + DICE_SIZE then
      self:rollDice()
    end
  end
end

function PlayState:render()
  self.board:render()
  self.dice:render()
end

function PlayState:rollDice()
  self.dice:roll(function()
    self.turn = self.turn == 4 and 1 or self.turn + 1
    self.dicePosition = self.board.diceAreas[self.players[self.turn]]
    self.dice.x = self.dicePosition[1] + (2 * CELL_SIZE - DICE_SIZE) / 2
    self.dice.y = self.dicePosition[2] + (2 * CELL_SIZE - DICE_SIZE) / 2
  end)
end
