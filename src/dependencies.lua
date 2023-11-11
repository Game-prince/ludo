Class = require 'lib.class'
push = require 'lib.push'
Timer = require 'lib.knife.timer'

-- src
require 'src.constants'
require 'src.StateStack'

-- states
require 'src.states.BaseState'
require 'src.states.StartState'
require 'src.states.PlayState'
require 'src.states.FadeInState'
require 'src.states.FadeOutState'

-- GUIs
require 'src.GUIs.Panel'


--[[
  fonts
]]
gFonts = {
  ['small'] = love.graphics.newFont("fonts/font.ttf", 8),
  ['medium'] = love.graphics.newFont("fonts/font.ttf", 16),
  ['large'] = love.graphics.newFont("fonts/font.ttf", 32),
  ['huge'] = love.graphics.newFont("fonts/font.ttf", 54),
}
