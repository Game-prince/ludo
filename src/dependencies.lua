Class = require 'lib.class'
push = require 'lib.push'

-- src
require 'src.constants'
require 'src.StateStack'

-- states
require 'src.states.BaseState'
require 'src.states.StartState'
require 'src.states.PlayState'


--[[
  fonts
]]
gFonts = {
  ['small'] = love.graphics.newFont("fonts/font.ttf", 8),
  ['medium'] = love.graphics.newFont("fonts/font.ttf", 16),
  ['large'] = love.graphics.newFont("fonts/font.ttf", 32),
  ['huge'] = love.graphics.newFont("fonts/font.ttf", 54),
}
