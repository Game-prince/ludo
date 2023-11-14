--[[
  function to slice a spritesheet.
  Generates slices of size width x height from the atlas spritesheet
  @params:
  atlas: the spritesheet
  width: width of the slice
  height: height of the slice
]]
function GenerateQuads(atlas, width, height)
  local sheetWidth = atlas:getWidth() / width
  local sheetHeight = atlas:getHeight() / height

  local quads = {}
  local sheetCounter = 1

  for y = 1, sheetHeight do
    for x = 1, sheetWidth do
      quads[sheetCounter] = love.graphics.newQuad((x - 1) * width, (y - 1) * height, width, height, atlas:getDimensions())
      sheetCounter = sheetCounter + 1
    end
  end

  return quads
end

--[[
  Function to slice a table.
  @Params
  tbl: table to be slices
  first: first index of the slice, default 1
  last: last index of the slice, default #tbl
  step: step of the slice, default 1
]]
function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced + 1] = tbl[i]
  end

  return sliced
end
