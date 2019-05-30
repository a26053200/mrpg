---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/1/28 0:04
---

local RectTransform     = "RectTransform"
local Image             = "Image"
local Button            = "Button"
local Toggle            = "Toggle"
local CanvasGroup       = "CanvasGroup"
local Slider            = "Slider"
local Text              = "Text"
local ListView          = "ListView"
local Animator          = "Animator"
local TextMesh          = "TextMesh"

---@param go UnityEngine.GameObject
---@return UnityEngine.RectTransform
function GetRectTransform(go)
    return go:GetCom(RectTransform)
end


---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Text
function GetText(go)
    return go:GetText()
end

---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Text
function GetInputField(go)
    return go:GetInputField()
end

---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Image
function GetImage(go)
    return go:GetImage()
end


---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Button
function GetButton(go)
    return go:GetButton(Button)
end

---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Toggle
function GetToggle(go)
    return go:GetCom(Toggle)
end

---@param go UnityEngine.GameObject
---@return UnityEngine.CanvasGroup
function GetCanvasGroup(go)
    return go:GetCanvasGroup()
end

---@param go UnityEngine.GameObject
---@return UnityEngine.UI.Slider
function GetSlider(go)
    return go:GetSlider()
end

---@param go UnityEngine.GameObject
---@return ListView
function GetListView(go)
    return go:GetCom(ListView)
end

---@param go UnityEngine.GameObject
---@return UnityEngine.Animator
function GetAnimator(go)
    return go:GetCom(Animator)
end

---@param go UnityEngine.GameObject
---@return UnityEngine.TextMesh
function GetText3D(go)
    return go:GetCom(TextMesh)
end