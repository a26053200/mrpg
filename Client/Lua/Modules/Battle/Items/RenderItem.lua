---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/19 0:46
---

local SceneItem = require('Game.Modules.Battle.Items.SceneItem')

---@class Game.Modules.Battle.Items.RenderItem : Game.Modules.Battle.Items.SceneItem
---@field renderObj UnityEngine.GameObject
local RenderItem = class("Game.Modules.Battle.Items.RenderItem",SceneItem)

function RenderItem:Ctor(sceneItemInfo)
    RenderItem.super.Ctor(self, sceneItemInfo)
end

function RenderItem:LoadRenderObj()
    self.renderObj = Instantiate()
end

function RenderItem:OnLoadedRenderObj()

end

function RenderItem:Dispose()
    RenderItem.super.Dispose(self)
end

return RenderItem