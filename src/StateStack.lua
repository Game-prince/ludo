--[[
  Statestack manages the different game states.
  We can display one state over the another
]]
StateStack = Class {}

--[[
  used when creating the class object
]]
function StateStack:init()
  self.states = {}
end

--[[
  used to render all the states
]]
function StateStack:render()
  for i = 1, #self.states do
    self.states[i]:render()
  end
end

--[[
  used to update the current state
]]
function StateStack:update(dt)
  self.states[#self.states]:update(dt)
end

--[[
  used to push a new state on the stack
]]
function StateStack:push(state)
  table.insert(self.states, state)
  state:enter()
end

--[[
  used to delete the top state from the stack
]]
function StateStack:pop()
  self.states[#self.states]:exit()
  table.remove(self.states, #self.states)
end
