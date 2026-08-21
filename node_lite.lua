

local RELAY = "ws://127.0.0.1:8080"

-- ── stand down if the full alt_node is present (it already reports) ──────────
if getgenv().__lunar_gen then
    return
end

-- ── self-cleanup: re-executing replaces the previous instance ────────────────
getgenv().__lunar_lite_gen = (getgenv().__lunar_lite_gen or 0) + 1
local MY_GEN = getgenv().__lunar_lite_gen
local function alive() return getgenv().__lunar_lite_gen == MY_GEN end
if getgenv().__lunar_lite_prev then pcall(getgenv().__lunar_lite_prev) end

local Players = game:GetService("Players")
local Http    = game:GetService("HttpService")
local LP      = Players.LocalPlayer

-- cash via Da Hood DataFolder.Currency (same source alt_node uses)
local function readCash(p)
    local df = p and p:FindFirstChild("DataFolder")
    local c  = df and df:FindFirstChild("Currency")
    return c and c.Value or 0
end

-- websocket connector (handle executor variants)
local wsConnect = (WebSocket and WebSocket.connect)
    or (syn and syn.websocket and syn.websocket.connect)
    or (Websocket and Websocket.connect)
if not wsConnect then
    warn("[node_lite] this executor has no WebSocket.connect")
    return
end

local ws, connected = nil, false
local function send(o)
    if ws and connected then
        pcall(function() ws:Send(Http:JSONEncode(o)) end)
    end
end

getgenv().__lunar_lite_prev = function()
    connected = false
    pcall(function() if ws then ws:Close() end end)
end

-- ── the few commands it's safe to honor while a farm script is driving ───────
local function handle(msg)
    local a = msg.action
    if a == "ping" then
        send({ type = "ack", action = "ping", ok = true, cmdId = msg.cmdId })

    elseif a == "rejoin" then
        send({ type = "ack", action = "rejoin", ok = true, cmdId = msg.cmdId })
        task.wait(0.3)
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, LP)
        end)

    elseif a == "reset" then
        send({ type = "ack", action = "reset", ok = true, cmdId = msg.cmdId })
        pcall(function()
            local ch = LP.Character
            local h = ch and ch:FindFirstChildOfClass("Humanoid")
            if h then h.Health = 0 end
        end)

    elseif a == "listplayers" then
        local names = {}
        for _, p in ipairs(Players:GetPlayers()) do names[#names + 1] = p.Name end
        send({ type = "ack", action = "listplayers", ok = true,
               cmdId = msg.cmdId, players = names })

    -- everything else (bounty/beTarget/config/...) belongs to the farm script or
    -- to alt_node; deliberately ignored so we never fight them.
    end
end

-- ── connect + auto-reconnect ────────────────────────────────────────────────
local function connect()
    if not alive() then return end
    local ok, sock = pcall(wsConnect, RELAY)
    if not ok or not sock then
        if not alive() then return end
        task.wait(3)
        return connect()
    end
    ws, connected = sock, true
    send({ type = "hello", userId = LP.UserId, name = LP.Name,
           cash = readCash(LP), owner = false, script = "lite" })

    ws.OnMessage:Connect(function(raw)
        if not alive() then return end
        local ok2, msg = pcall(function() return Http:JSONDecode(raw) end)
        if ok2 and type(msg) == "table" and msg.type == "cmd" then
            pcall(handle, msg)
        end
    end)
    ws.OnClose:Connect(function()
        connected = false
        if not alive() then return end
        task.wait(3)
        connect()
    end)
end
connect()

-- ── anti-AFK: farms sit still, so the 20-minute idle kick would nuke them ────
local VirtualUser = game:GetService("VirtualUser")
LP.Idled:Connect(function()
    if not alive() then return end
    pcall(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

-- ── periodic status = stock figure + the pool's heartbeat ────────────────────
task.spawn(function()
    while alive() do
        send({ type = "status", cash = readCash(LP) })
        task.wait(3)
    end
end)
