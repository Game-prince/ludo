Player = Class {}

function Player:init(def)
  self.color = def.color
  self.canPlay = true
  self.canRoll = false
  self.canMove = false

  self.gotis = {}
  for i = 1, 4 do
    table.insert(self.gotis, Goti {
      color = self.color,
      x = GotiStartData[self.color][i].x,
      y = GotiStartData[self.color][i].y
    })
  end
end

function Player:render()
  for _, goti in ipairs(self.gotis) do
    goti:render()
  end
end

function Player:update(dt)
  for _, goti in ipairs(self.gotis) do
    goti:update(dt)
  end
end

function Player:whichGotisCanMove()
  for _, goti in ipairs(self.gotis) do
    if goti:canMove() then
      goti.canMove = true
    end
  end
end
