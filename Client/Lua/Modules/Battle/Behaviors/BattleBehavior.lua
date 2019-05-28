---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/21 22:48
---

local BornArea = require("Game.Modules.Battle.Behaviors.BornArea")
local BaseBehavior = require('Game.Modules.Common.Behavior.BaseBehavior')

---@class Game.Modules.Battle.Behaviors.BattleBehavior : Game.Modules.Common.Behavior.BaseBehavior
---@field battleInfo BattleInfo
---@field bornAreas table<number, Game.Modules.Battle.Behaviors.BornArea>
---@field points table<number, UnityEngine.Vector3>
---@field monsterList table<number, Game.Modules.Battle.Items.Monster>
local BattleBehavior = class("Game.Modules.Battle.Behaviors.BattleBehavior",BaseBehavior)

---@param battleInfo BattleInfo
---@param gameObject UnityEngine.GameObject
function BattleBehavior:Ctor(battleInfo, gameObject)
    BattleBehavior.super.Ctor(self, gameObject)
    self.battleInfo = battleInfo
    self.bornAreas = List.New()

    World.battleBehavior = self
end

--初始化战场
function BattleBehavior:CreateBattle()
    for i = 1, #self.battleInfo.areas do
        local area = BornArea.New(self.battleInfo.areas[i])
        self.bornAreas:Push(area)
        area:Refresh()
    end
end

--当前区域
---@return Game.Modules.Battle.Behaviors.BornArea
function BattleBehavior:GetCurrArea()
    return self.bornAreas:Peek()
end

--下一个区域
---@return Game.Modules.Battle.Behaviors.BornArea
function BattleBehavior:NextArea()
    return self.bornAreas:Shift()
end

---@param func Handler
function BattleBehavior:ForEachMonster(func)
    for i = 1, #self.bornAreas do
        for j = 1, #self.bornAreas[i].waves do
            for n = 1, #self.bornAreas[i].waves[j].monsterList do
                func:Execute(self.bornAreas[i].waves[j].monsterList[n])
            end
        end
    end
end

---@param func Handler
function BattleBehavior:ForEach(func)
    for i = 1, #self.bornAreas do
        func:Execute(self.bornAreas[i])
    end
end

function BattleBehavior:Dispose()
    BattleBehavior.super.Dispose(self)
    for i = 1, #self.bornAreas do
        self.bornAreas[i]:Dispose()
    end
end

return BattleBehavior