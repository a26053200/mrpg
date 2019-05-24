---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/24 23:22
---


---@class World
---@field mdr Game.Modules.World.View.WorldMdr
---@field battleScene Game.Modules.World.Scenes.BattleScene
---@field battleBehavior Game.Modules.Battle.Behaviors.BattleBehavior
local World = {}

World.battleScene = nil
World.battleBehavior = nil

function World.EnterScene(sceneInfo, callback)
    World.mdr:EnterScene(sceneInfo, callback)
end

return World