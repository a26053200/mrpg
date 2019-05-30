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

    self:AppendBehavior(self:SearchTarget(), "MonsterBehavior SearchTarget")
    self:AppendBehavior(self:MoveToTarget(), "MonsterBehavior MoveToTarget")
    self:AppendBehavior(self:AttackUntilTargetDead(), "MonsterBehavior AttackUntilTargetDead")

    self:AppendInterval(2)
end

function MonsterBehavior:Run()
    MonsterBehavior.super.Run(self)
    self:Debug("MonsterBehavior:Run")
end

--随机巡逻
function MonsterBehavior:RandomPatrol()
    local behavior = self:CreateBehavior()

    behavior:AppendState(Handler.New(self.DoRandomPatrol, self, behavior), "MonsterBehavior RandomPatrol")

    return behavior
end

function MonsterBehavior:DoRandomPatrol(behavior)
    self.currArea = World.battleBehavior:GetCurrArea()
    if self.target then
        self:NextState() --有目标了就不需要巡逻了
    elseif self.monster.isWakeup then
        self:NextState() --被惊醒了
    else
        local soonNode = self.currArea:GetReachableNode(self.monster.node)
        if soonNode then
            --self:Debug("MonsterBehavior:DoRandomPatrol")
            self.monster.soonNode = soonNode
            self.monster:PlayRun()
            self.autoMove:MoveDirect(soonNode.worldPosition, Handler.New(self.OnPatrolMoveEnd,self, behavior))
        else
            --self:Debug("Not MonsterBehavior DoRandomPatrol")
            self:NextState()
        end
    end

end

function MonsterBehavior:OnPatrolMoveEnd()
    --self:Debug("MonsterBehavior:OnPatrolMoveEnd")
    self.monster:UpdateNode()
    self.monster:PlayIdle()
    self:NextState()
end

function MonsterBehavior:SearchTarget()
    local behavior = self:CreateBehavior()

    behavior:AppendState(Handler.New(function()
        if self.monster.isWakeup then
            self.target = World.mainHero
        else
            self.target = nil
        end
        self:NextState()
    end , self))

    return behavior
end

--一轮攻击开始
---@param behavior Game.Modules.Common.Behavior.BaseBehavior
function MonsterBehavior:AttackStart(behavior)
    behavior:AppendState(Handler.New(function()
        if self.target then
            self:Debug("MonsterBehavior AttackStart")
            behavior:NextState()
        else
            self:NextState()
        end
    end, self))
end

--攻击单个目标知道目标死亡
function MonsterBehavior:AttackUntilTargetDead()
    local behavior = self:CreateBehavior()

    local skills = self.monster.monsterInfo.skills

    self:AttackStart(behavior)
    self:AppendSkill(behavior, skills[1])
    self:AttackEnd(behavior)

    return behavior
end

function MonsterBehavior:Stop()
    MonsterBehavior.super.Stop(self)
    self:Debug("MonsterBehavior:Stop")
end

function MonsterBehavior:Dispose()
    MonsterBehavior.super.Dispose(self)
end

return MonsterBehavior