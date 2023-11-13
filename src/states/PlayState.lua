--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init()
  self.board = Board()
  self.turn = RED
  self.dicePosition = self.board.diceAreas[self.turn]
  self.dice = Dice(self.dicePosition[1] + 4.5, self.dicePosition[2] + 4.5)
end

function PlayState:update(dt) end

function PlayState:render()
  self.board:render()
  self.dice:render()
end
