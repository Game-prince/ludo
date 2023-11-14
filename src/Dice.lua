Dice = Class {}

function Dice:init(x, y)
  self.x = x
  self.y = y

  -- dice value
  self.value = math.random(1, 6)
end

function Dice:render()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, DICE_SIZE, DICE_SIZE)

  self.value = math.floor(self.value)

  love.graphics.draw(gTextures['dice'], gQuads['dice'][self.value], self.x, self.y)
end

function Dice:roll(callback)
  self.value = 1

  Timer.tween(0.5, {
    [self] = { value = 6 }
  }):finish(function()
    self.value = math.random(1, 6)

    if callback then
      callback()
    end
  end)
end
