--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init()
  self.board = Board()
  self.players = { RED, GREEN, BLUE, YELLOW }
  self.turn = 1
  self.dicePosition = self.board.diceAreas[self.players[self.turn]]
  self.dice = Dice(self.dicePosition[1] + 4.5, self.dicePosition[2] + 4.5)
end

function PlayState:update(dt)
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getPosition()
    local diceX, diceY = self.dicePosition[1], self.dicePosition[2]
    if x >= diceX and x <= diceX + 2 * CELL_SIZE and y >= diceY and y <= diceY + 2 * CELL_SIZE then
      self.dice:roll()
    end
  end
end

function PlayState:render()
  self.board:render()
  self.dice:render()
end

-- function PlayState:rollDice()
--   self.dice:roll()
--   self.turn = self.turn == 4 and 1 or self.turn + 1
--   self.dicePosition = self.board.diceAreas[self.players[self.turn]]
--   self.dice.x = self.dicePosition[1] + 4.5
--   self.dice.y = self.dicePosition[2] + 4.5
-- end
