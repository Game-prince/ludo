Class = require 'lib.class'
push = require 'lib.push'
Timer = require 'lib.knife.timer'

-- src
require 'src.constants'
require 'src.StateStack'
require 'src.Board'
require 'src.Dice'
require 'src.Util'
require 'src.Goti'
require 'src.Player'
require 'src.Cell'

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
  ['small'] = love.graphics.newFont("fonts/font.ttf", 16),
  ['medium'] = love.graphics.newFont("fonts/font.ttf", 32),
  ['large'] = love.graphics.newFont("fonts/font.ttf", 64),
  ['huge'] = love.graphics.newFont("fonts/font.ttf", 96),
}


--[[
  graphics
]]
gTextures = {
  ['cells'] = love.graphics.newImage("graphics/cells.png"),
  ['dice'] = love.graphics.newImage("graphics/dice.png"),
  ['stars'] = love.graphics.newImage("graphics/stars.png"),
  ['winArea'] = love.graphics.newImage("graphics/winArea.png"),
  ['showAreas'] = love.graphics.newImage("graphics/showAreas.png"),
  ['gotis'] = love.graphics.newImage("graphics/pieces.png")
}

gQuads = {
  ['stars'] = GenerateQuads(gTextures['stars'], CELL_SIZE, CELL_SIZE),
  ['showAreas'] = GenerateQuads(gTextures['showAreas'], 6 * CELL_SIZE, 6 * CELL_SIZE),
  ['cells'] = GenerateQuads(gTextures['cells'], CELL_SIZE, CELL_SIZE),
  ['dice'] = GenerateQuads(gTextures['dice'], DICE_SIZE, DICE_SIZE),
  ['gotis'] = GenerateQuads(gTextures['gotis'], GOTI_WIDTH, GOTI_HEIGHT)
}
