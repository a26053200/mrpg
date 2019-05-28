---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/22 22:43
---

local BaseBehavior = require('Game.Modules.Common.Behavior.BaseBehavior')
local AvatarBehavior = require('Game.Modules.Battle.Behaviors.AvatarBehavior')

---@class Game.Modules.Battle.Behaviors.MonsterBehavior : Game.Modules.Battle.Behaviors.AvatarBehavior
---@field New fun() : Game.Modules.Battle.Behaviors.MonsterBehavior
---@field monster Game.Modules.Battle.Items.Monster
local MonsterBehavior = class("Game.Modules.Battle.Behaviors.MonsterBehavior",AvatarBehavior)

---@param monster Game.Modules.Battle.Items.Monster
function MonsterBehavior:Ctor(monster)
    self.monster = monster
    MonsterBehavior.super.Ctor(self, monster)

    self:AppendBehavior(self:RandomPatrol())
end

---@param node StateNode
function MonsterBehavior:Run()
    MonsterBehavior.super.Run(self)
    self.currArea = World.battleBehavior:GetCurrArea()
    self:Debug("MonsterBehavior:Run")
end

--随机巡逻
function MonsterBehavior:RandomPatrol()
    local behavior = self:CreateBehavior()

    behavior:AppendState(Handler.New(self.DoRandomPatrol, self, behavior))

    return behavior
end

function MonsterBehavior:DoRandomPatrol(behavior)
    local soonNode = self.currArea:GetReachableNode(self.monster.node)
    if soonNode then
        self:Debug("MonsterBehavior:DoRandomPatrol")
        self.monster.soonNode = soonNode
        self.monster:PlayRun()
        self.autoMove:MoveDirect(soonNode.worldPosition, Handler.New(self.OnPatrolMoveEnd,self, behavior))
    else
        self:Debug("Not MonsterBehavior DoRandomPatrol")
        self:NextState()
    end
end

---@param behavior Game.Modules.Common.Behavior.BaseBehavior
function MonsterBehavior:OnPatrolMoveEnd(behavior)
    self:Debug("MonsterBehavior:OnPatrolMoveEnd")
    self.monster:UpdateGridNode()
    self.monster:PlayIdle()
    self:NextState()
end

--移动到刷怪区域
function MonsterBehavior:MoveToTarget()
    local behavior = self:CreateBehavior()

    behavior:AppendState(Handler.New(self.DoMoveToArea, self))

    return behavior
end

function MonsterBehavior:DoMoveToTarget()
    self:Debug("MainHeroBehavior:DoMoveToArea")
    local tagPos = World.points[self.currArea.areaInfo.bornPos]
    self.hero:PlayRun()
    self.autoMove:SmoothMove(tagPos, Handler.New(self.OnMoveEnd,self))
end


function MonsterBehavior:Dispose()
    MonsterBehavior.super.Dispose(self)
end

return MonsterBehavior