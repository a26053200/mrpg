---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/26 22:30
---

local Tools3D = {}

---@param grid AStar.Grid
---@param center UnityEngine.Vector3
---@return UnityEngine.Rect
function Tools3D.GetAreaNodeRect(grid, center, w, h)
    local node = grid:NodeFromWorldPoint(center) ---@type AStar.Node
    local rect = Rect.New(node.gridX, node.gridY, w, h)
    return rect
end

--矩形区域随机世界坐标数组
---@param rect UnityEngine.Rect
function Tools3D.GetRectRandomPos(start, rect, r)
    local points = {}
    local idx = 1
    local randoms = Math3D.GetRandomArray(rect.width * rect.height)
    local L = r * 2
    for i = 1, rect.height do
        for j = 1, rect.width do
            local pt = start + Vector3.New(r + (j - 1) * L, 0, r + (i - 1) * L)
            points[randoms[idx]] = pt
            idx = idx + 1
        end
    end
    return points
end

--格子是否相等
---@param node1 AStar.Node
---@param node2 AStar.Node
function Tools3D.isEqualNode(node1, node2)
    return node1.gridX == node2.gridX and node1.gridY == node2.gridY
end

--在限定范围内随机上下左右方向点
---@param grid AStar.Grid
---@param self AStar.Node
---@return AStar.Node
function Tools3D.GetRandomNeighboursNode(grid, self)
    local rx = math.random(-1,1)
    local ry = math.random(-1,1)
    if rx == 0 and ry == 0 then
        return nil
    end
    if self.gridX + rx >= 0 and self.gridX + rx < grid.gridSizeX
        and self.gridY + ry >= 0 and self.gridY + ry < grid.gridSizeY then
        return World.grid:GetNode(self.gridX + rx, self.gridY + ry)
    end
    return nil
end


--在限定范围内随机上下左右方向点
---@param limitRect UnityEngine.Rect
---@param self AStar.Node
---@return AStar.Node
function Tools3D.GetRandomNLimitedNode(limitRect, self)
    local rx = math.random(-1,1)
    local ry = math.random(-1,1)
    if rx == 0 and ry == 0 then
        return nil
    end
    if self.gridX + rx >= limitRect.x and self.gridX + rx < limitRect.x + limitRect.width
            and self.gridY + ry >= limitRect.y and self.gridY + ry < limitRect.y + limitRect.height then
        return World.grid:GetNode(self.gridX + rx, self.gridY + ry)
    end
    return nil
end
return Tools3D