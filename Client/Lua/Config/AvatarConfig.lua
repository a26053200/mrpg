---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/21 23:45
---

---@class AvatarConfig
local AvatarConfig = {}

AvatarConfig.data = {
    HeroTemplate = {
        name = "HeroTemplate",
        prefabUrl = "",
        moveSpeed = 1,
        animBorn = "",
        animIdle = "",
        animAtkIdle = "",
        animWalk = "",
        animRun = "",
        baseAttr = {
            hpMax = 1000,
            hpMin = 1000,
            atkMax = 10,
            atkMin = 20,
            defMax = 2,
            defMin = 4,
            critMax = 0.2,
            critMin = 0.3,
        },
        skills = nil,
    },
    MonsterTemplate = {
        name = "MonsterTemplate",
        prefabUrl = "",
        moveSpeed = 1,
        animBorn = "",
        animIdle = "",
        animAtkIdle = "",
        animWalk = "",
        animRun = "",
        animDead = "",
        baseAttr = {
            hpMax = 100,
            hpMin = 200,
            atkMax = 5,
            atkMin = 10,
            defMax = 1,
            defMin = 2,
            critMax = 0.2,
            critMin = 0.3,
        },
        skills = nil,
    }
}

---@return AvatarInfo
function AvatarConfig.CreateHero(avatarName)
    local new = clone(AvatarConfig.data.HeroTemplate)
    new.name = avatarName
    AvatarConfig.data[avatarName] = new
    return new
end

---@return AvatarInfo
function AvatarConfig.CreateMonster(avatarName)
    local new = clone(AvatarConfig.data.MonsterTemplate)
    new.name = avatarName
    AvatarConfig.data[avatarName] = new
    return new
end


local t
t = AvatarConfig.CreateHero("TestHero")
t.prefabUrl = "Models/villarger_B_Boy/Prefabs/Villager_B_Boy.prefab"


t = AvatarConfig.CreateMonster("Dragon")
t.prefabUrl = "Models/Dragon/Prefabs/micro_dragon.prefab"
t.animBorn = "dragon_land_on_ground"
t.animIdle = "dragon_idle"
t.animRun = "dragon_take_off"
t.animDead = "dragon_die"
t.skills =
{
    [1] =
    {
        animName = "dragon_bite",
        accounts =
        {
            [1] = {
                delay = 0.5,
                baseAttr = {
                    atkMax = 5,
                    atkMin = 10,
                    critMax = 0.2,
                    critMin = 0.3,
                },
            }
        },
    }
}

t = AvatarConfig.CreateMonster("Ghost")
t.prefabUrl = "Models/Ghost/Prefabs/micro_ghost.prefab"
t.animBorn = "ghost_rise_from_floor"
t.animIdle = "ghost_idle_hover"
t.animRun = "ghost_idle_back_and_forth"
t.animDead = "ghost_lower_below_floor"
t.skills =
{
    [1] =
    {
        animName = "ghost_attack_with_ball",
        accounts =
        {
            [1] = {
                delay = 0.5,
                baseAttr = {
                    atkMax = 5,
                    atkMin = 10,
                    critMax = 0.2,
                    critMin = 0.3,
                },
            }
        },
    }
}

t = AvatarConfig.CreateMonster("Werewolf")
t.prefabUrl = "Models/Werewolf/Prefabs/micro_werewolf.prefab"
t.animBorn = "wolf_getup"
t.animIdle = "wolf_idle1"
t.animRun = "wolf_walk"
t.animDead = "wolf_die"
t.skills =
{
    [1] =
    {
        animName = "wolf_bite",
        accounts =
        {
            [1] = {
                delay = 0.5,
                baseAttr = {
                    atkMax = 5,
                    atkMin = 10,
                    critMax = 0.2,
                    critMin = 0.3,
                },
            }
        },
    }
}

---@return AvatarInfo
function AvatarConfig.Get(avatarName)
    local info = AvatarConfig.data[avatarName]
    if info then
        return info
    else
        logError("There is no info in AvatarConfig named:" .. avatarName)
    end
end

---@return AvatarInfo
function AvatarConfig.Clone(avatarName)
    local info = AvatarConfig.Get(avatarName)
    return clone(info)
end

return AvatarConfig