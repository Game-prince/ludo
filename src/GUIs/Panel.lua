Panel = Class {}

--[[
  Creates a panel
  args:
  x
  y
  width
  height
  args
]]
function Panel:init(x, y, width, height, args)
  self.x = x
  self.y = y
  self.width = width
  self.height = height

  self.args = args or nil
  if self.args then
    self.backgroundColor = args.backgroundColor or { r = 0, g = 0, b = 0 }
    self.borderColor = args.borderColor or { r = 1, g = 1, b = 1 }
    self.backgroundOpacity = args.backgroundOpacity or 1
    self.borderOpacity = args.borderOpacity or 1
    self.borderWidth = args.borderWidth or 5
  end
end

function Panel:render()
  -- outer rectangle
  love.graphics.setColor(self.borderColor.r, self.borderColor.g, self.borderColor.b, self.borderOpacity)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

  --  inner rectangle
  love.graphics.setColor(self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b,
    self.backgroundOpacity)
  love.graphics.rectangle("fill", self.x + self.borderWidth, self.y + self.borderWidth, self.width - 2 * self
    .borderWidth, self.height - 2 * self.borderWidth)
end
