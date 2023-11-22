ArrowAnimated = Class {}

function ArrowAnimated:init(def)
  self.x = def.x
  self.y = def.y
  self.interval = def.interval or 0.5
  self.color = def.color or { 1, 1, 0, 1 }
  self.visible = true
  self.direction = def.direction or 'left'


  Timer.every(self.interval, function()
    self.visible = not self.visible
  end
  )
end

function ArrowAnimated:render()
  love.graphics.setColor(self.color)
  if self.visible then
    if self.direction == 'left' then
      love.graphics.draw(gTextures['arrow-left'], self.x + DICE_SIZE, self.y)
    else
      love.graphics.draw(gTextures['arrow-right'], self.x - DICE_SIZE, self.y)
    end
  end
end
