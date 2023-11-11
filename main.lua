require 'src.dependencies'

--[[
  Loads first time the game starts
]]
function love.load()
  -- window name
  love.window.setTitle("Family Ludo")

  -- setting up default filter
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- randomization
  love.math.setRandomSeed(os.time())

  -- creating the actual window
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = false,
    fullscreen = false,
    resizable = true
  })

  -- state stack
  gStateStack = StateStack()
  gStateStack:push(StartState())

  -- stores keyboard inputs
  love.keyboard.keyPressed = {}
end

--[[
  draws on each frame
]]
function love.draw()
  push:start()

  gStateStack:render()

  push:finish()
end

--[[
  triggered when resizing
]]
function love.resize(w, h)
  push:resize(w, h)
end

--[[
  updates on each frame
]]
function love.update(dt)
  gStateStack:update(dt)

  -- clearing the keypressed table on each frame
  love.keyboard.keyPressed = {}
end

--[[
  Gets keyboard inputs
]]
function love.keypressed(key)
  love.keyboard.keyPressed[key] = true

  if key == 'escape' then
    love.event.quit()
  end
end

--[[
  function to return if the key was pressed or not
]]
function love.keyboard.wasPressed(key)
  return love.keyboard.keyPressed[key]
end
