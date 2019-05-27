---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zhengnan.
--- DateTime: 2019/5/20 15:51
---

local StateAction = require("Game.Modules.Common.Behavior.StateAction")
local StateMachine = require("Game.Modules.Common.Behavior.StateMachine")
local LuaMonoBehaviour = require("Betel.LuaMonoBehaviour")

---@class Game.Modules.Common.Behavior.BaseBehavior : Betel.LuaMonoBehaviour
---@field New fun() : Game.Modules.Common.Behavior.BaseBehavior
---@field stateMachine Game.Modules.Common.Behavior.StateMachine
---@field lastBehavior Game.Modules.Common.Behavior.BaseBehavior
local BaseBehavior = class("Game.Modules.Common.Behavior.BaseBehavior",LuaMonoBehaviour)

---@param gameObject UnityEngine.GameObject
function BaseBehavior:Ctor(gameObject)
    BaseBehavior.super.Ctor(self, gameObject)

    self.stateMachine = StateMachine.New()
end

function BaseBehavior:AppendState(OnStateEnter, name)
    local node = {} ---@type StateNode
    node.name = name
    node.OnEnter = OnStateEnter
    self:AppendStateNode(node)
end

---@param behavior Game.Modules.Common.Behavior.BaseBehavior
function BaseBehavior:AppendBehavior(behavior, name)
    local node = {} ---@type StateNode
    node.name = name
    node.OnEnter = Handler.New(function()
        behavior:Run()
    end, self)
    self:AppendStateNode(node)
end

---@param node StateNode
function BaseBehavior:AppendStateNode(node)
    self.stateMachine:AppendState(StateAction.New(node))
end

---@param node StateNode
function BaseBehavior:Run()
    self.stateMachine:Run()
end

---@param node StateNode
function BaseBehavior:Stop()
    self.stateMachine:Stop()
end

---@param node StateNode
function BaseBehavior:NextState()
    self.stateMachine:NextState()
end

function BaseBehavior:Debug(msg)
    print("<color=#FFFF00FF> [Behavior] </color>" .. msg)
end

---@param node StateNode
function BaseBehavior:Dispose()
    BaseBehavior.super.Dispose(self)
    self.stateMachine:Stop()
end

return BaseBehavior