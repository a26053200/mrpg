---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/26 0:08
---

local LuaMonoBehaviour = require('Betel.LuaMonoBehaviour')

---@class Game.Modules.Common.Components.AnimController : Betel.LuaMonoBehaviour
---@field New fun() : Game.Modules.Common.Components.AnimController
---@field avatar Game.Modules.Battle.Items.Avatar
---@field animator UnityEngine.Animator
---@field animLengthMap table<string, number>
local AnimController = class("Game.Modules.Common.Components.AnimController",LuaMonoBehaviour)

---@param avatar Game.Modules.Battle.Items.Avatar
function AnimController:Ctor(avatar)
    AnimController.super.Ctor(self, avatar.renderObj)
    self.avatar = avatar

    self.animator = GetAnimator(self.gameObject)
    self.animLengthMap = {}
end

function AnimController:PlayAnim(animName, callback)
    self:DoPlayAnim(animName, callback, 1, true)
end

---@param callback Handler
function AnimController:DoPlayAnim(animName, callback, speed, force)
    speed = speed == nil and 1 or speed
    self.animator:Play(animName)
    if force then
        self.animator:Update(0)
    end
    if callback then
        local length = self:GetAnimLength(animName)
        if length then
            DelayCallback(length / speed, callback)
        else
            callback:Execute()
        end
    end
    self.animator.speed = speed
end

function AnimController:GetAnimLength(animName)
    local length = self.animLengthMap[animName]
    if length == nil then
        self.animator:Play(animName)
        self.animator.speed = 1
        self.animator:Update(0)
        length = self.animator:GetCurrentAnimatorStateInfo(0).length
    end
    return length
end

function AnimController:Dispose()
    AnimController.super.Dispose(self)
end

return AnimController