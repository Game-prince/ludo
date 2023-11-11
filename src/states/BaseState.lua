--[[
  BaseState is a template class which other state class extends.
  BaseState contains all the functions a state has to implement
]]

BaseState = Class {}

function BaseState:init() end

function BaseState:render() end

function BaseState:update(dt) end

function BaseState:enter() end

function BaseState:exit() end
