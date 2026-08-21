

local RELAY = "ws://127.0.0.1:8080"   


getgenv().__lunar_gen = (getgenv().__lunar_gen or 0) + 1
local MY_GEN = getgenv().__lunar_gen
local function alive() return getgenv().__lunar_gen == MY_GEN end
if getgenv().__lunar_prev then pcall(getgenv().__lunar_prev) end

local Players = game:GetService("Players")
local Http    = game:GetService("HttpService")
local LP      = Players.LocalPlayer

local repo    = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

-- cash via Da Hood DataFolder.Currency
local function readCash(p)
    local df = p and p:FindFirstChild("DataFolder")
    local c = df and df:FindFirstChild("Currency")
    return c and c.Value or 0
end
local function rootOf(p) local ch = p and p.Character return ch and ch:FindFirstChild("HumanoidRootPart") end

-- in-game chat (TextChatService) — used to tell the customer to stomp
local TextChatService = game:GetService("TextChatService")
local function sayChat(text)
    pcall(function()
        local tc = TextChatService:FindFirstChild("TextChannels")
        local ch = tc and tc:FindFirstChild("RBXGeneral")
        if ch and ch.SendAsync then ch:SendAsync(tostring(text)) end
    end)
end
local function fmtAmt(n)
    n = tonumber(n) or 0
    if n >= 1e6 then local m = n/1e6 return (m == math.floor(m)) and (math.floor(m).."m") or string.format("%.1fm", m)
    else return math.max(1, math.floor(n/1000)).."k" end
end
local function money(n) local s = tostring(math.floor(n or 0)):reverse():gsub("(%d%d%d)","%1,"):reverse():gsub("^,","") return "$"..s end

-- tiny status panel
local Window = Library:CreateWindow({
    Title = "Lunar Alt", Footer = LP.Name, Center = true, AutoShow = true,
    ShowCustomCursor = false, Size = UDim2.fromOffset(300, 180),
})
local g = Window:AddTab("Status"):AddLeftGroupbox("Relay")
local lConn = g:AddLabel("Relay: connecting…")
local lName = g:AddLabel("Alt: " .. LP.Name)
local lCash = g:AddLabel("Cash: $0")
local lCmd  = g:AddLabel("Last cmd: none")

-- websocket connector (handle executor variants)
local wsConnect = (WebSocket and WebSocket.connect)
    or (syn and syn.websocket and syn.websocket.connect)
    or (Websocket and Websocket.connect)
if not wsConnect then
    lConn:SetText("Relay: NO WEBSOCKET SUPPORT")
    Library:Notify("Your executor has no WebSocket.connect", 6)
    return
end

local ws, connected = nil, false
local function send(o) if ws and connected then pcall(function() ws:Send(Http:JSONEncode(o)) end) end end

-- Da Hood bounty remote (captured): placer pays setAmount, killer of target gets setAmount*0.65
local RS = game:GetService("ReplicatedStorage")
local function setBountyRemote()
    local r = RS:FindFirstChild("Remotes")
    return r and r:FindFirstChild("SetBounty")
end

-- Private-server (VIP) owner tools: MainEvent handles "Shout" and "VIP_CMD"/"Kick".
-- These only succeed when THIS client is the private-server owner, so the relay
-- routes them to the owner alt (detected below).
local function mainEvent() return RS:FindFirstChild("MainEvent") end
local IS_OWNER = (game.PrivateServerOwnerId ~= 0 and game.PrivateServerOwnerId == LP.UserId)
local function vipShout(text)
    local ev = mainEvent()
    if not ev then return false end
    return pcall(function() ev:FireServer("Shout", tostring(text)) end)
end
local function vipKick(plr)
    local ev = mainEvent()
    if not ev or not plr then return false end
    return pcall(function() ev:FireServer("VIP_CMD", "Kick", plr) end)
end

-- graphics / performance controls (from lunar_rebuild.lua) — for running many alts
local RunService = game:GetService("RunService")
local Workspace  = game:GetService("Workspace")
local _setfps = rawget(getgenv and getgenv() or {}, "setfpscap") or setfpscap or set_fps_cap
    or (syn and syn.set_fps_cap)
local function setFps(n) if _setfps and n then pcall(_setfps, n) return true end return false end
local function set3D(on) pcall(function() RunService:Set3dRenderingEnabled(on) end) end
local function potato(on)
    pcall(function() settings().Rendering.QualityLevel = on and 1 or 21 end)
    pcall(function() game:GetService("Lighting").GlobalShadows = not on end)
    if on then
        for _, o in ipairs(Workspace:GetDescendants()) do
            pcall(function()
                if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Sparkles") then o.Enabled = false
                elseif o:IsA("Decal") or o:IsA("Texture") then o.Transparency = 1
                elseif o:IsA("BasePart") then o.Material = Enum.Material.SmoothPlastic o.Reflectance = 0 end
            end)
        end
    end
end

-- command dispatch. The relay hands each alt a concrete (target, setAmount).
local function handle(msg)
    lCmd:SetText("Last cmd: " .. tostring(msg.action))
    if msg.action == "bounty" then
        -- msg.target = victim alt the customer will kill ; msg.setAmount = gross to set
        local target    = msg.target
        local setAmount = tonumber(msg.setAmount)
        local setB      = setBountyRemote()
        if not setB then
            send({ type = "ack", action = "bounty", ok = false, reason = "no SetBounty remote", orderId = msg.orderId }); return
        end
        if not target or target == LP.Name then
            send({ type = "ack", action = "bounty", ok = false, reason = "bad target (self/none)", orderId = msg.orderId }); return
        end
        if not Players:FindFirstChild(target) then
            send({ type = "ack", action = "bounty", ok = false, reason = "target not in server", orderId = msg.orderId }); return
        end
        if not setAmount or setAmount < 100000 or setAmount > 8000000 then
            send({ type = "ack", action = "bounty", ok = false, reason = "setAmount out of range", orderId = msg.orderId }); return
        end
        local before = readCash(LP)
        if before < setAmount then
            send({ type = "ack", action = "bounty", ok = false, reason = "not enough cash", have = before, need = setAmount, orderId = msg.orderId }); return
        end
        local ok, ret = pcall(function() return setB:InvokeServer(target, setAmount) end)
        task.wait(1)
        local spent = before - readCash(LP)
        local success = ok and ret == true
        Library:Notify(("bounty %d on %s -> %s"):format(setAmount, target, tostring(success)), 3)
        send({ type = "ack", action = "bounty", ok = success, cmdId = msg.cmdId, target = target,
               setAmount = setAmount, spent = spent, deliver = msg.deliver, customer = msg.customer,
               orderId = msg.orderId, reason = (not success) and ("ret=" .. tostring(ret)) or nil })
    elseif msg.action == "beTarget" then
        -- I'm the bounty target: tp to the customer, then detect the payout.
        -- Two detectors, whichever fires first (deduped): (1) a 1s POLL of the
        -- customer's cash (bulletproof, no event dependency), (2) my own death
        -- (fast path). Both just check: did the customer's cash go up? -> collected.
        local customer = msg.customer
        local cplr = customer and Players:FindFirstChild(customer)
        local a, b = rootOf(LP), rootOf(cplr)
        if a and b then a.CFrame = b.CFrame + Vector3.new(0, 0, 3) end
        send({ type = "ack", action = "beTarget", ok = (a and b) ~= nil, orderId = msg.orderId })

        -- require the cash rise to be near the expected payout, so Da Hood's random
        -- couple-k passive income doesn't false-trigger a "collected".
        local expect    = tonumber(msg.expectedDeliver) or 60000
        local threshold = math.max(30000, math.floor(expect * 0.85))
        local base = cplr and readCash(cplr) or nil
        local reported = false
        local function checkPayout(via)
            if reported then return end
            local plr = Players:FindFirstChild(customer)
            local now = plr and readCash(plr)
            if base and now and (now - base) >= threshold then   -- near-expected rise = the payout
                reported = true
                send({ type = "collected", orderId = msg.orderId, target = LP.Name,
                       customer = customer, delta = now - base, via = via })
                Library:Notify(("collected %s +%d (%s)"):format(customer, now - base, tostring(via)), 3)
            end
        end

        -- (1) poll the customer's cash for ~200s
        task.spawn(function()
            for _ = 1, 200 do
                if reported or not alive() then break end
                task.wait(1)
                checkPayout("poll")
            end
        end)
        -- (2) fast path: react to my own death (rebinds on respawn via CharacterAdded)
        local function hookDeath(char)
            local h = char and char:FindFirstChildOfClass("Humanoid")
            if h then h.Died:Connect(function() task.wait(1.2); checkPayout("death") end) end
        end
        hookDeath(LP.Character)
        local cconn; cconn = LP.CharacterAdded:Connect(function(c)
            if reported then if cconn then cconn:Disconnect() end return end
            task.wait(0.3); hookDeath(c)
        end)
        task.delay(210, function() if cconn then cconn:Disconnect() end end)

        -- follow the customer (range-based: only re-tp if they get too far) and
        -- spam "stomp me" until the bounty is collected
        task.spawn(function()
            local amt = fmtAmt(msg.expectedDeliver)
            local ticks = 0
            while not reported and alive() and ticks < 90 do
                ticks = ticks + 1
                local cp = Players:FindFirstChild(customer)
                local a2, b2 = rootOf(LP), rootOf(cp)
                if a2 and b2 then
                    local dist = (a2.Position - b2.Position).Magnitude
                    if dist > 24 then a2.CFrame = b2.CFrame + Vector3.new(0, 0, 3) end  -- only snap back if far
                end
                if ticks % 3 == 1 then sayChat(("STOMP ME to collect your %s bounty!"):format(amt)) end
                task.wait(2)
            end
        end)

        Library:Notify(("target for %s"):format(tostring(customer)), 3)
    elseif msg.action == "reset" then
        local h = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.Health = 0 end
        send({ type = "ack", action = "reset", ok = true })
    elseif msg.action == "tp" then
        local tgt = msg.target and Players:FindFirstChild(msg.target)
        local a, b = rootOf(LP), rootOf(tgt)
        if a and b then a.CFrame = b.CFrame + Vector3.new(0, 0, 3) end
        send({ type = "ack", action = "tp", ok = (a and b) ~= nil })
    elseif msg.action == "config" then
        -- owner /config -> apply graphics/perf settings on the alts
        if msg.fps ~= nil then
            local n = tonumber(msg.fps)
            if not setFps(n == 0 and 0 or n) then Library:Notify("no setfpscap in this executor", 3) end
        end
        if msg.potato ~= nil then potato(msg.potato and true or false) end
        if msg.render3d ~= nil then set3D(msg.render3d and true or false) end
        send({ type = "ack", action = "config", ok = true,
               fps = msg.fps, potato = msg.potato, render3d = msg.render3d })
    elseif msg.action == "findplayer" then
        -- presence check: is the customer in this server?
        local present = msg.customer ~= nil and Players:FindFirstChild(msg.customer) ~= nil
        send({ type = "ack", action = "findplayer", ok = present, cmdId = msg.cmdId, customer = msg.customer })
    elseif msg.action == "listplayers" then
        -- report every player name in the server (relay filters out the alts)
        local names = {}
        for _, pl in ipairs(Players:GetPlayers()) do names[#names + 1] = pl.Name end
        send({ type = "ack", action = "listplayers", ok = true, cmdId = msg.cmdId, players = names })
    elseif msg.action == "shout" then
        -- server shout (owner only). relay only sends this to the owner alt.
        local ok = vipShout(msg.text or "")
        send({ type = "ack", action = "shout", ok = ok and IS_OWNER, cmdId = msg.cmdId })
    elseif msg.action == "kickothers" then
        -- kick everyone whose name is NOT in msg.keep (customer + all alts), never self.
        -- owner only; relay routes this to the owner alt.
        local keep = {}
        for _, n in ipairs(msg.keep or {}) do keep[tostring(n)] = true end
        keep[LP.Name] = true
        local kicked = {}
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl ~= LP and not keep[pl.Name] then
                if vipKick(pl) then kicked[#kicked + 1] = pl.Name end
            end
        end
        if #kicked > 0 then Library:Notify(("kicked: %s"):format(table.concat(kicked, ", ")), 3) end
        send({ type = "ack", action = "kickothers", ok = IS_OWNER, cmdId = msg.cmdId, kicked = kicked })
    elseif msg.action == "bring" then
        Library:Notify("bring (TODO)", 2)
        send({ type = "ack", action = "bring", ok = true })
    end
end

local function connect()
    if not alive() then return end
    local ok, sock = pcall(wsConnect, RELAY)
    if not ok or not sock then
        if not alive() then return end
        lConn:SetText("Relay: retrying…")
        task.wait(3); return connect()
    end
    ws, connected = sock, true
    lConn:SetText("Relay: connected")
    send({ type = "hello", userId = LP.UserId, name = LP.Name, cash = readCash(LP), owner = IS_OWNER })

    ws.OnMessage:Connect(function(raw)
        if not alive() then return end
        local ok2, msg = pcall(function() return Http:JSONDecode(raw) end)
        if ok2 and type(msg) == "table" and msg.type == "cmd" then handle(msg) end
    end)
    ws.OnClose:Connect(function()
        connected = false
        if not alive() then return end   -- a replaced instance must not reconnect
        lConn:SetText("Relay: disconnected")
        task.wait(3); connect()
    end)
end
connect()

-- anti-AFK: prevent the 20-minute idle kick (alts sit idle between drops)
local VirtualUser = game:GetService("VirtualUser")
LP.Idled:Connect(function()
    if not alive() then return end
    pcall(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

-- periodic status + cash label (stops when this instance is replaced)
task.spawn(function()
    while alive() do
        local c = readCash(LP)
        if lCash.SetText then lCash:SetText("Cash: " .. money(c)) end
        send({ type = "status", cash = c })
        task.wait(2)
    end
end)

-- store this instance's cleanup so the NEXT run can tear it down
getgenv().__lunar_prev = function()
    connected = false
    if ws then pcall(function() ws:Close() end) end
    pcall(function() Library:Unload() end)
end
Library:OnUnload(function() if ws then pcall(function() ws:Close() end) end end)
print("[alt-node] started (gen " .. MY_GEN .. "), connecting to " .. RELAY)
