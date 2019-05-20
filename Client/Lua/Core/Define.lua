---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2018/6/10 20:56
---

---UnityEngine

---Framework
gameMgr = Framework.GameManager.GetGameManager()
sceneMgr = Framework.GameManager.GetSceneManager()
netMgr = Framework.GameManager.GetNetworkManager()
monoMgr = Framework.GameManager.GetMonoBehaviourManager()

LuaHelper = Framework.LuaHelper

---Game
require("Game.Config.Action")

Alert = require("Game.Modules.Common.View.Alert")
Tips = require("Game.Modules.Common.View.Tips")
NetModal = require("Game.Modules.Common.View.NetModal")
ImageHelper = require("Game.Modules.Common.View.ImageHelper")

World = {}
World.ins = nil

--View 状态
ViewStatus = {}
ViewStatus.Loading      = "Loading"
ViewStatus.Loaded       = "Loaded"
ViewStatus.Unloading    = "Unloading"
ViewStatus.Unloaded     = "Unloaded"