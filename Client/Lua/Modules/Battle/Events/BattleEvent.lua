---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/23 22:51
---

local BattleEvent = {}

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""

--战场已经创建完毕
BattleEvent.BattleCreated = ""


BattleEvent.dispatcher = EventDispatcher.New()

function BattleEvent.Dispatch(event)
    if isString(event) then
        BattleEvent.dispatcher:Dispatcher(event)
    elseif event.type then
        BattleEvent.dispatcher:Dispatcher(event.type, event)
    end
end

return BattleEvent