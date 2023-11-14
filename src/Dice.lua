Dice = Class {}

function Dice:init(x, y)
  self.x = x
  self.y = y

  -- dice value
  self.value = nil
  self:roll()
end

function Dice:render()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, DICE_SIZE, DICE_SIZE)

  self.value = math.floor(self.value)

  local dots = {}
  if self.value == 1 then
    dots = { 5 }
  elseif self.value == 2 then
    dots = { 4, 6 }
  elseif self.value == 3 then
    dots = { 1, 5, 9 }
  elseif self.value == 4 then
    dots = { 1, 3, 7, 9 }
  elseif self.value == 5 then
    dots = { 1, 3, 5, 7, 9 }
  elseif self.value == 6 then
    dots = { 1, 4, 7, 3, 6, 9 }
  end

  local boxSize = DICE_SIZE / 3

  love.graphics.setColor(0, 0, 0, 1)
  for i, dot in ipairs(dots) do
    local y, x = math.modf((dot - 1) / 3)
    x = math.ceil(x * 3)
    love.graphics.circle("fill", self.x + x * boxSize + boxSize / 2, self.y + y * boxSize + boxSize / 2,
      6)
  end
end

function Dice:roll()
  self.value = 1

  Timer.tween(0.5, {
    [self] = { value = 6 }
  }):finish(function()
    self.value = math.random(1, 6)
  end)
end
