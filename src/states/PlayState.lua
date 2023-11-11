--[[
  PlayState

  Family Ludo
  Author: Rishikesh Kumar
  rishi7258prince@gmail.com
]]
PlayState = Class { __includes = BaseState }

function PlayState:init() end

function PlayState:update(dt) end

function PlayState:render()
  love.graphics.printf("Play state", 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, "center")
end
