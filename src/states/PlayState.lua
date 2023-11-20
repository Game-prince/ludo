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
    Player { color = BLUE },
    Player { color = YELLOW }
  }
  self.turn = 1
  self.dice = Dice(DiceData[1].x, DiceData[1].y)

  self.players[self.turn].canRoll = true
end

function PlayState:update(dt)
  -- updating player
  for _, player in ipairs(self.players) do
    player:update(dt)
  end

  -- updating board
  self.board:update(dt)

  -- updating dice
  self.dice.x = DiceData[self.turn].x
  self.dice.y = DiceData[self.turn].y

  -- rolling dice
  if love.mouse.wasPressed(1) then
    local x, y = love.mouse.getExactPosition()

    if self.players[self.turn].canRoll and x >= DiceData[self.turn].x and x <= DiceData[self.turn].x + DICE_SIZE and y >= DiceData[self.turn].y and y <= DiceData[self.turn].y + DICE_SIZE then
      self:rollDice()
    end
  end
end

function PlayState:render()
  self.board:render()
  self.dice:render()
  for _, player in ipairs(self.players) do
    player:render()
  end
end

function PlayState:rollDice()
  self.dice:roll(function()
    self.players[self.turn].canRoll = false
    self.players[self.turn].canMove = true
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
