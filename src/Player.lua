Player = Class {}

function Player:init(color)
  self.color = color
  self.isTurn = false

  self.gotis = {
    Goti(self.color),
    Goti(self.color),
    Goti(self.color),
    Goti(self.color)
  }
end

function Player:render()

end

function Player:makeTurn()

end
