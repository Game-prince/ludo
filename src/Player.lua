Player = Class {}

function Player:init(def)
  self.color = def.color
  self.canPlay = true
  self.canRoll = false
  self.canMove = false

  self.gotis = {}
  for i = 1, 4 do
    self.gotis[i] = Goti {
      color = self.color,
      x = GotiStartData[self.color][i].x,
      y = GotiStartData[self.color][i].y
    }
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

function Player:whichGotisCanMove(steps)
  local count = 0
  for _, goti in ipairs(self.gotis) do
    if not goti.alive then
      if steps == 6 then
        goti.canMove = true
        count = count + 1
      end
    else
      if goti:canMoveUpto(steps) then
        goti.canMove = true
        count = count + 1
      end
    end
  end

  return count
end
