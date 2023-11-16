Player = Class {}

function Player:init(suit)
  self.suit = suit
  self.canMove = false
  self.canRoll = false

  -- for _, goti in ipairs(self.gotis) do
  --   local x, y = goti.col, goti.row
  --   table.insert(self.suit.board[y][x], goti)
  -- end
end

function Player:render()
  for _, goti in pairs(self.suit.gotis) do
    goti:render()
  end
end

function Player:update(dt)
  self.suit:update(dt)

  for _, goti in pairs(self.suit.gotis) do
    goti:update(dt)
  end
end

function Player:allowMove(diceValue)
  local canMove = false

  for _, goti in pairs(self.suit.gotis) do
    if not goti.dead then
      if goti:canTakeSteps(diceValue) then
        canMove = true
        goti.canMove = true
      end
    elseif goti.dead and diceValue == 6 then
      goti.canMove = true
      canMove = true
    end
  end

  return canMove
end
