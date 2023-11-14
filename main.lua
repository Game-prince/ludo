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
  math.randomseed(os.time())

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

  -- stores mouse inputs
  love.mouse.keyPressed = {}
  love.mouse.keyReleased = {}
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
  Timer.update(dt)
  gStateStack:update(dt)

  -- clearing the keyboard and mouse inputs on each frame
  love.keyboard.keyPressed = {}
  love.mouse.keyPressed = {}
  love.mouse.keyReleased = {}
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
  Gets Mouse pressed input
]]
function love.mousepressed(x, y, key)
  love.mouse.keyPressed[key] = true
end

--[[
  Gets mouse released input
]]
function love.mousereleased(x, y, key)
  love.mouse.keyReleased[key] = true
end

--[[
  function to return if the key was pressed or not
]]
function love.keyboard.wasPressed(key)
  return love.keyboard.keyPressed[key]
end

--[[
  Function to return if the mouse key was pressed or not
]]
function love.mouse.wasPressed(key)
  return love.mouse.keyPressed[key]
end

--[[
  Function to return if the mousse key was released or not
]]
function love.mouse.wasReleased(key)
  return love.mouse.keyReleased[key]
end
