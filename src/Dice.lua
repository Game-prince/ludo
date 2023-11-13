Dice = Class {}

function Dice:init(x, y)
  self.x = x
  self.y = y
  self.value = nil
  self.value = self:roll()
end

function Dice:render()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, DICE_SIZE, DICE_SIZE)

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

  love.graphics.setColor(1, 0, 1, 1)
  for i, dot in ipairs(dots) do
    local x, y = math.modf(dot / 3)
    y = math.floor(y * 3)
    love.graphics.circle("fill", self.x + x * DICE_SIZE + DICE_SIZE / 2, self.y + (y - 1) * DICE_SIZE + DICE_SIZE / 2, 8)
  end

  love.graphics.printf(tostring(self.value), 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end

function Dice:roll()
  local value = math.random(1, 6)
  return value
end
