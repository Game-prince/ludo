Player = Class {}

function Player:init(color)
  self.color = color
  self.canMove = false
  self.canRoll = false

  self.corner = CORNERS[self.color]

  self.gotis = {
    Goti(self.corner[1] + 1, self.corner[2] + 1, self.color),
    Goti(self.corner[1] + 4, self.corner[2] + 1, self.color),
    Goti(self.corner[1] + 4, self.corner[2] + 4, self.color),
    Goti(self.corner[1] + 1, self.corner[2] + 4, self.color)
  }
end

function Player:render()
  for _, goti in pairs(self.gotis) do
    goti:render()
  end
end

function Player:update(dt)
  for _, goti in pairs(self.gotis) do
    goti:update(dt)
  end
end

function Player:allowMove(diceValue)
  local canMove = false

  for _, goti in pairs(self.gotis) do
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
