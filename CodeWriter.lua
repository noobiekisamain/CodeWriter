local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Safely attempt to force open the F9 Developer Console
pcall(function()
    StarterGui:SetCore("DevConsoleVisible", true)
end)

-- Safe executor and platform identification
local executorName = "Unknown Executor"
pcall(function()
    if identifyexecutor then
        executorName = identifyexecutor()
    end
end)

local platformName = "Unknown"
pcall(function()
    platformName = tostring(RunService:GetPlatform())
end)

-- Print the text and symbols into the console output
print([[
==================================================
   _____          _        __          ____ _            
  / ____|        | |      \ \        / / (_)           
 | |     ___   __| | ___   \ \  /\  / /| |_  ___ _ __  
 | |    / _ \ / _` |/ _ \   \ \/  \/ / | | |/ _ \ '__| 
 | |___| (_) | (_| |  __/    \  /\  /  | | |  __/ |    
  \_____\___/ \__,_|\___|     \/  \/   |_|_|\___|_|    
==================================================
               BUILT BY NOOBIEKISA             
==================================================
[INFO] Username:    ]] .. LocalPlayer.Name .. [[
[INFO] Display Name:]] .. LocalPlayer.DisplayName .. [[
[INFO] User ID:     ]] .. LocalPlayer.UserId .. [[
[INFO] Platform:    ]] .. platformName .. [[
[INFO] Executor:    ]] .. executorName .. [[
==================================================
]])

-- Clean up any existing GUI
if PlayerGui:FindFirstChild("CodeWriter") then
    PlayerGui.CodeWriter:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CodeWriter"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local themes = {
    white = {
        main = Color3.fromRGB(250, 250, 250),
        topBar = Color3.fromRGB(240, 240, 240),
        title = Color3.fromRGB(30, 30, 30),
        stroke = Color3.fromRGB(220, 220, 220),
        panel = Color3.fromRGB(245, 245, 245),
        btnBg = Color3.fromRGB(230, 230, 230),
        btnText = Color3.fromRGB(40, 40, 40),
        lineNum = Color3.fromRGB(150, 150, 150),
        defaultText = Color3.fromRGB(30, 30, 30)
    },
    midnight = {
        main = Color3.fromRGB(10, 15, 25),
        topBar = Color3.fromRGB(15, 22, 36),
        title = Color3.fromRGB(220, 230, 245),
        stroke = Color3.fromRGB(30, 45, 70),
        panel = Color3.fromRGB(13, 20, 32),
        btnBg = Color3.fromRGB(20, 30, 48),
        btnText = Color3.fromRGB(220, 230, 245),
        lineNum = Color3.fromRGB(80, 100, 130),
        defaultText = Color3.fromRGB(220, 230, 245)
    },
    amber = {
        main = Color3.fromRGB(15, 10, 5),
        topBar = Color3.fromRGB(25, 16, 8),
        title = Color3.fromRGB(255, 176, 0),
        stroke = Color3.fromRGB(60, 35, 10),
        panel = Color3.fromRGB(20, 13, 6),
        btnBg = Color3.fromRGB(35, 22, 10),
        btnText = Color3.fromRGB(255, 176, 0),
        lineNum = Color3.fromRGB(120, 80, 30),
        defaultText = Color3.fromRGB(255, 220, 150)
    },
    dark = {
        main = Color3.fromRGB(18, 18, 18),
        topBar = Color3.fromRGB(25, 25, 25),
        title = Color3.fromRGB(240, 240, 245),
        stroke = Color3.fromRGB(40, 40, 40),
        panel = Color3.fromRGB(22, 22, 22),
        btnBg = Color3.fromRGB(35, 35, 35),
        btnText = Color3.fromRGB(200, 200, 210),
        lineNum = Color3.fromRGB(100, 100, 110),
        defaultText = Color3.fromRGB(220, 220, 220)
    },
    sky = {
        main = Color3.fromRGB(20, 30, 45),
        topBar = Color3.fromRGB(28, 42, 64),
        title = Color3.fromRGB(135, 206, 250),
        stroke = Color3.fromRGB(45, 75, 115),
        panel = Color3.fromRGB(24, 36, 54),
        btnBg = Color3.fromRGB(36, 54, 82),
        btnText = Color3.fromRGB(135, 206, 250),
        lineNum = Color3.fromRGB(90, 125, 160),
        defaultText = Color3.fromRGB(220, 235, 250)
    },
    matrix = {
        main = Color3.fromRGB(5, 15, 5),
        topBar = Color3.fromRGB(8, 25, 8),
        title = Color3.fromRGB(50, 255, 50),
        stroke = Color3.fromRGB(15, 60, 15),
        panel = Color3.fromRGB(6, 20, 6),
        btnBg = Color3.fromRGB(12, 40, 12),
        btnText = Color3.fromRGB(50, 255, 50),
        lineNum = Color3.fromRGB(40, 120, 40),
        defaultText = Color3.fromRGB(180, 255, 180)
    },
    sunset = {
        main = Color3.fromRGB(30, 12, 25),
        topBar = Color3.fromRGB(45, 18, 38),
        title = Color3.fromRGB(255, 140, 105),
        stroke = Color3.fromRGB(75, 30, 60),
        panel = Color3.fromRGB(35, 15, 30),
        btnBg = Color3.fromRGB(55, 22, 45),
        btnText = Color3.fromRGB(255, 140, 105),
        lineNum = Color3.fromRGB(130, 70, 95),
        defaultText = Color3.fromRGB(255, 220, 210)
    },
    cyberpunk = {
        main = Color3.fromRGB(15, 10, 25),
        topBar = Color3.fromRGB(25, 15, 40),
        title = Color3.fromRGB(255, 0, 128),
        stroke = Color3.fromRGB(70, 20, 90),
        panel = Color3.fromRGB(20, 12, 32),
        btnBg = Color3.fromRGB(35, 20, 55),
        btnText = Color3.fromRGB(255, 0, 128),
        lineNum = Color3.fromRGB(120, 60, 140),
        defaultText = Color3.fromRGB(240, 210, 245)
    },
    ocean = {
        main = Color3.fromRGB(10, 25, 35),
        topBar = Color3.fromRGB(16, 38, 52),
        title = Color3.fromRGB(0, 180, 216),
        stroke = Color3.fromRGB(30, 70, 95),
        panel = Color3.fromRGB(13, 30, 42),
        btnBg = Color3.fromRGB(20, 48, 66),
        btnText = Color3.fromRGB(0, 180, 216),
        lineNum = Color3.fromRGB(70, 110, 135),
        defaultText = Color3.fromRGB(200, 235, 245)
    },
    coffee = {
        main = Color3.fromRGB(30, 22, 18),
        topBar = Color3.fromRGB(42, 31, 25),
        title = Color3.fromRGB(210, 160, 120),
        stroke = Color3.fromRGB(70, 52, 42),
        panel = Color3.fromRGB(35, 26, 21),
        btnBg = Color3.fromRGB(52, 39, 31),
        btnText = Color3.fromRGB(210, 160, 120),
        lineNum = Color3.fromRGB(110, 90, 75),
        defaultText = Color3.fromRGB(240, 220, 205)
    },
    lavender = {
        main = Color3.fromRGB(22, 18, 32),
        topBar = Color3.fromRGB(32, 26, 46),
        title = Color3.fromRGB(190, 150, 230),
        stroke = Color3.fromRGB(60, 48, 85),
        panel = Color3.fromRGB(26, 21, 38),
        btnBg = Color3.fromRGB(40, 32, 58),
        btnText = Color3.fromRGB(190, 150, 230),
        lineNum = Color3.fromRGB(100, 85, 130),
        defaultText = Color3.fromRGB(230, 220, 245)
    },
    emerald = {
        main = Color3.fromRGB(12, 28, 20),
        topBar = Color3.fromRGB(18, 40, 28),
        title = Color3.fromRGB(52, 211, 153),
        stroke = Color3.fromRGB(35, 75, 52),
        panel = Color3.fromRGB(15, 33, 23),
        btnBg = Color3.fromRGB(24, 52, 36),
        btnText = Color3.fromRGB(52, 211, 153),
        lineNum = Color3.fromRGB(75, 120, 90),
        defaultText = Color3.fromRGB(210, 245, 225)
    },
    crimson = {
        main = Color3.fromRGB(32, 12, 15),
        topBar = Color3.fromRGB(46, 18, 22),
        title = Color3.fromRGB(248, 113, 113),
        stroke = Color3.fromRGB(80, 32, 38),
        panel = Color3.fromRGB(37, 14, 18),
        btnBg = Color3.fromRGB(58, 23, 28),
        btnText = Color3.fromRGB(248, 113, 113),
        lineNum = Color3.fromRGB(130, 75, 80),
        defaultText = Color3.fromRGB(255, 220, 220)
    },
    gold = {
        main = Color3.fromRGB(28, 24, 10),
        topBar = Color3.fromRGB(40, 34, 14),
        title = Color3.fromRGB(250, 204, 21),
        stroke = Color3.fromRGB(75, 64, 25),
        panel = Color3.fromRGB(33, 28, 12),
        btnBg = Color3.fromRGB(50, 43, 18),
        btnText = Color3.fromRGB(250, 204, 21),
        lineNum = Color3.fromRGB(120, 105, 50),
        defaultText = Color3.fromRGB(255, 245, 210)
    },
    slate = {
        main = Color3.fromRGB(25, 28, 36),
        topBar = Color3.fromRGB(35, 39, 50),
        title = Color3.fromRGB(148, 163, 184),
        stroke = Color3.fromRGB(60, 68, 86),
        panel = Color3.fromRGB(29, 33, 42),
        btnBg = Color3.fromRGB(44, 49, 63),
        btnText = Color3.fromRGB(148, 163, 184),
        lineNum = Color3.fromRGB(95, 105, 125),
        defaultText = Color3.fromRGB(220, 225, 235)
    }
}

local currentTheme = themes.white

local tabs = {
    {name = "Script 1", code = 'local part = Instance.new("Part")\npart.Parent = workspace'},
    {name = "Script 2", code = 'print("Hello from Script 1!")'},
    {name = "Script 3", code = 'print("Type your code here")'}
}
local currentTabIdx = 1

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 1110, 0, 440)
MainFrame.Position = UDim2.new(0.5, -555, 0.5, -220)
MainFrame.BackgroundColor3 = currentTheme.main
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = currentTheme.stroke
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundColor3 = currentTheme.topBar
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "code writer | made by noobiekisa"
TitleLabel.TextColor3 = currentTheme.title
TitleLabel.TextSize = 12
TitleLabel.Font = Enum.Font.Code
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local WindowControls = Instance.new("Frame")
WindowControls.Size = UDim2.new(0, 40, 1, 0)
WindowControls.Position = UDim2.new(1, -40, 0, 0)
WindowControls.BackgroundTransparency = 1
WindowControls.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 33, 1, 0)
CloseBtn.Position = UDim2.new(0, 0, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = currentTheme.title
CloseBtn.TextSize = 12
CloseBtn.Font = Enum.Font.Code
CloseBtn.Parent = WindowControls

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Workspace = Instance.new("Frame")
Workspace.Size = UDim2.new(1, 0, 1, -32)
Workspace.Position = UDim2.new(0, 0, 0, 32)
Workspace.BackgroundTransparency = 1
Workspace.Parent = MainFrame

local TabBar = Instance.new("ScrollingFrame")
TabBar.Size = UDim2.new(0, 90, 1, -80)
TabBar.Position = UDim2.new(0, 0, 0, 0)
TabBar.BackgroundColor3 = currentTheme.panel
TabBar.BorderSizePixel = 0
TabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
TabBar.ScrollBarThickness = 2
TabBar.Parent = Workspace

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)
TabListLayout.Parent = TabBar

local TabListPadding = Instance.new("UIPadding")
TabListPadding.PaddingTop = UDim.new(0, 6)
TabListPadding.PaddingLeft = UDim.new(0, 6)
TabListPadding.PaddingRight = UDim.new(0, 6)
TabListPadding.Parent = TabBar

local EditorScroll = Instance.new("ScrollingFrame")
EditorScroll.Size = UDim2.new(1, -650, 1, -80)
EditorScroll.Position = UDim2.new(0, 95, 0, 0)
EditorScroll.BackgroundTransparency = 1
EditorScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
EditorScroll.ScrollBarThickness = 3
EditorScroll.Parent = Workspace

local LineNumBar = Instance.new("TextLabel")
LineNumBar.Size = UDim2.new(0, 35, 1, 0)
LineNumBar.BackgroundTransparency = 1
LineNumBar.Text = "1"
LineNumBar.TextColor3 = currentTheme.lineNum
LineNumBar.TextSize = 12
LineNumBar.Font = Enum.Font.Code
LineNumBar.TextYAlignment = Enum.TextYAlignment.Top
LineNumBar.Parent = EditorScroll

local keywords = {
    "local", "function", "if", "then", "else", "elseif", "end", "for", "in", 
    "do", "while", "repeat", "until", "return", "break", "continue", "and", 
    "or", "not", "type", "export"
}

local constants = {
    "self", "true", "false", "nil", "_G", "_VERSION", "script", 
    "math.huge", "math.pi", "utf8.charpattern"
}

local functions = {
    "print", "warn", "error", "assert", "type", "typeof", "tonumber", "tostring", 
    "select", "rawget", "rawset", "rawequal", "collectgarbage", "xpcall", "pcall",
    "table.insert", "table.remove", "table.concat", "table.sort", "table.clear", 
    "table.create", "table.clone", "table.pack", "table.unpack",
    "string.byte", "string.char", "string.find", "string.format", "string.gmatch", 
    "string.gsub", "string.len", "string.lower", "string.upper", "string.match", 
    "string.rep", "string.reverse", "string.sub", "string.split",
    "math.abs", "math.acos", "math.asin", "math.atan", "math.atan2", "math.ceil", 
    "math.floor", "math.round", "math.cos", "math.sin", "math.tan", "math.cosh", 
    "math.sinh", "math.tanh", "math.deg", "math.rad", "math.exp", "math.log", 
    "math.log10", "math.max", "math.min", "math.pow", "math.sqrt", "math.modf", 
    "math.fmod", "math.noise", "math.random", "math.randomseed", "math.clamp", "math.sign",
    "coroutine.create", "coroutine.resume", "coroutine.yield", "coroutine.status", 
    "coroutine.running", "coroutine.wrap", "coroutine.isyieldable",
    "utf8.char", "utf8.codepoint", "utf8.codes", "utf8.len", "utf8.offset"
}

local annotations = {
    "boolean", "string", "number", "thread", "userdata", "any", "never", 
    "Instance", "Vector3", "CFrame", "Color3", "BrickColor", "UDim", "UDim2", 
    "TweenInfo", "Ray", "Region3", "Vector2", "Rect", "Axes", "Faces", "Font"
}

local function highlightText(rawText)
    if not rawText or rawText == "" then return "" end
    local text = rawText:gsub("&", "&amp;"):gsub("<", "&lt;")
    local snippets = {}

    local function substitute(pattern, color)
        text = text:gsub(pattern, function(match)
            local placeholder = "\0" .. #snippets + 1 .. "\0"
            snippets[placeholder] = '<font color="' .. color .. '">' .. match .. '</font>'
            return placeholder
        end)
    end

    substitute("%-%-.-$", "#6a9955")
    substitute('"[^"\\]*(?:\\.[^"\\]*)*"', "#ce9178")
    substitute("'[^'\\\\]*(?:\\.[^'\\\\]*)*'", "#ce9178")
    substitute("%d+%.?%d*", "#b5cea8")

    for _, fn in ipairs(functions) do
        substitute("([^%w_%z])(" .. fn  .. ")(%f[%D])", "%1<font color=\"#DCDCAA\">%2</font>%3")
        substitute("^(%z?" .. fn  .. ")(%f[%D])", "<font color=\"#DCDCAA\">%1</font>%2")
    end

    for _, c in ipairs(constants) do
        substitute("([^%w_%z])(" .. c  .. ")(%f[%D])", "%1<font color=\"#569CD6\">%2</font>%3")
        substitute("^(%z?" .. c  .. ")(%f[%D])", "<font color=\"#569CD6\">%1</font>%2")
    end

    for _, ann in ipairs(annotations) do
        substitute("([^%w_%z])(" .. ann .. ")(%f[%D])", "%1<font color=\"#4EC9B0\">%2</font>%3")
        substitute("^(%z?" .. ann .. ")(%f[%D])", "<font color=\"#4EC9B0\">%1</font>%2")
    end

    for _, kw in ipairs(keywords) do
        substitute("([^%w_%z])(" .. kw  .. ")(%f[%D])", "%1<font color=\"#007ACC\">%2</font>%3")
        substitute("^(%z?" .. kw  .. ")(%f[%D])", "<font color=\"#007ACC\">%1</font>%2")
    end

    for placeholder, html in pairs(snippets) do
        text = text:gsub(placeholder, html)
    end

    return text
end

-- Syntax Highlight Background Layer (Renders colors behind the real text box)
local HighlightLabel = Instance.new("TextLabel")
HighlightLabel.Size = UDim2.new(1, -45, 1, 0)
HighlightLabel.Position = UDim2.new(0, 40, 0, 0)
HighlightLabel.BackgroundTransparency = 1
HighlightLabel.RichText = true
HighlightLabel.TextWrapped = true
HighlightLabel.Text = ""
HighlightLabel.TextSize = 12
HighlightLabel.Font = Enum.Font.Code
HighlightLabel.TextXAlignment = Enum.TextXAlignment.Left
HighlightLabel.TextYAlignment = Enum.TextYAlignment.Top
HighlightLabel.Parent = EditorScroll

-- Real TextBox Layer (Has visible text, native cursor, and native selection highlights)
local CodeBox = Instance.new("TextBox")
CodeBox.Size = UDim2.new(1, -45, 1, 0)
CodeBox.Position = UDim2.new(0, 40, 0, 0)
CodeBox.BackgroundTransparency = 1
CodeBox.ClearTextOnFocus = false
CodeBox.MultiLine = true
CodeBox.TextWrapped = true
CodeBox.Text = tabs[1].code
CodeBox.TextColor3 = currentTheme.defaultText
CodeBox.TextTransparency = 0 -- Enabled so native Windows selection / cursor shows properly
CodeBox.TextSize = 12
CodeBox.Font = Enum.Font.Code
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top
CodeBox.Parent = EditorScroll

local tabButtons = {}
local updateTabs

local function updateLineNumbers(text)
    local count = 1
    for _ in text:gmatch("\n") do
        count = count + 1
    end
    local linesStr = ""
    for i = 1, count do
        linesStr = linesStr .. i .. "\n"
    end
    LineNumBar.Text = linesStr
end

CodeBox:GetPropertyChangedSignal("Text"):Connect(function()
    HighlightLabel.Text = highlightText(CodeBox.Text)
    tabs[currentTabIdx].code = CodeBox.Text
    updateLineNumbers(CodeBox.Text)
end)

local SnippetSidebar = Instance.new("ScrollingFrame")
SnippetSidebar.Size = UDim2.new(0, 50, 1, -80)
SnippetSidebar.Position = UDim2.new(1, -560, 0, 0)
SnippetSidebar.BackgroundColor3 = currentTheme.panel
SnippetSidebar.BorderSizePixel = 0
SnippetSidebar.CanvasSize = UDim2.new(0, 0, 0, 370)
SnippetSidebar.ScrollBarThickness = 2
SnippetSidebar.Parent = Workspace

local snippetButtons = {}
local function createSnippetBtn(text, yPos, insertText)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 38, 0, 32)
    btn.Position = UDim2.new(0.5, -19, 0, yPos)
    btn.BackgroundColor3 = currentTheme.btnBg
    btn.Text = text
    btn.TextColor3 = currentTheme.btnText
    btn.TextSize = 10
    btn.Font = Enum.Font.Code
    btn.Parent = SnippetSidebar
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        CodeBox.Text = CodeBox.Text .. insertText
    end)
    table.insert(snippetButtons, btn)
    return btn
end

createSnippetBtn('""', 6, '""')
createSnippetBtn("()", 42, "()")
createSnippetBtn("{}", 78, "{}")
createSnippetBtn("[]", 114, "[]")
createSnippetBtn("fn", 150, "function()\n\t\nend")
createSnippetBtn("if", 186, "if condition then\n\t\nend")
createSnippetBtn("for", 222, "for i = 1, 10 do\n\t\nend")
createSnippetBtn("loc", 258, "local ")
createSnippetBtn("prt", 294, 'print("")')
createSnippetBtn("nil", 330, "nil")

local HelperPanel = Instance.new("Frame")
HelperPanel.Size = UDim2.new(0, 160, 1, 0)
HelperPanel.Position = UDim2.new(1, -505, 0, 0)
HelperPanel.BackgroundColor3 = currentTheme.panel
HelperPanel.BorderSizePixel = 0
HelperPanel.Parent = Workspace

local HelperTitle = Instance.new("TextLabel")
HelperTitle.Size = UDim2.new(1, -10, 0, 24)
HelperTitle.Position = UDim2.new(0, 8, 0, 4)
HelperTitle.BackgroundTransparency = 1
HelperTitle.Text = "Helper"
HelperTitle.TextColor3 = currentTheme.title
HelperTitle.TextSize = 11
HelperTitle.Font = Enum.Font.Code
HelperTitle.TextXAlignment = Enum.TextXAlignment.Left
HelperTitle.Parent = HelperPanel

local HelperScroll = Instance.new("ScrollingFrame")
HelperScroll.Size = UDim2.new(1, -8, 1, -32)
HelperScroll.Position = UDim2.new(0, 4, 0, 28)
HelperScroll.BackgroundTransparency = 1
HelperScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
HelperScroll.ScrollBarThickness = 2
HelperScroll.Parent = HelperPanel

local HelperLog = Instance.new("TextLabel")
HelperLog.Size = UDim2.new(1, 0, 1, 0)
HelperLog.BackgroundTransparency = 1
HelperLog.RichText = true
HelperLog.Text = "No issues found."
HelperLog.TextColor3 = Color3.fromRGB(34, 197, 94)
HelperLog.TextSize = 10
HelperLog.Font = Enum.Font.Code
HelperLog.TextXAlignment = Enum.TextXAlignment.Left
HelperLog.TextYAlignment = Enum.TextYAlignment.Top
HelperLog.TextWrapped = true
HelperLog.Parent = HelperScroll

local function analyzeCode()
    local text = CodeBox.Text
    local issues = {}
    local trimmed = text:gsub("%s+", "")
    
    if trimmed == "" then
        table.insert(issues, "• Code box is empty.")
    else
        local _, doubleQuotes = text:gsub('"', '"')
        if doubleQuotes % 2 ~= 0 then
            table.insert(issues, "• Unclosed double quote (\") found.")
        end
        
        local _, singleQuotes = text:gsub("'", "'")
        if singleQuotes % 2 ~= 0 then
            table.insert(issues, "• Unclosed single quote (') found.")
        end
        
        local _, openParen = text:gsub("%(", "")
        local _, closeParen = text:gsub("%)", "")
        if openParen > closeParen then
            table.insert(issues, "• Missing closing parenthesis ')'")
        elseif closeParen > openParen then
            table.insert(issues, "• Extra closing parenthesis ')'")
        end
        
        local _, openBrace = text:gsub("{", "")
        local _, closeBrace = text:gsub("}", "")
        if openBrace > closeBrace then
            table.insert(issues, "• Missing closing brace '}'")
        elseif closeBrace > openBrace then
            table.insert(issues, "• Extra closing brace '}'")
        end
        
        local _, parseErr = loadstring(text)
        if parseErr then
            parseErr = parseErr:gsub(":%d+: ", "")
            table.insert(issues, "• Syntax: " .. parseErr)
        end
    end
    
    if #issues > 0 then
        HelperLog.TextColor3 = Color3.fromRGB(239, 68, 68)
        HelperLog.Text = table.concat(issues, "\n")
    else
        HelperLog.TextColor3 = Color3.fromRGB(34, 197, 94)
        HelperLog.Text = "Code looks clean!"
    end
end

CodeBox:GetPropertyChangedSignal("Text"):Connect(analyzeCode)
task.spawn(analyzeCode)

local ConsolePanel = Instance.new("Frame")
ConsolePanel.Size = UDim2.new(0, 170, 1, 0)
ConsolePanel.Position = UDim2.new(1, -340, 0, 0)
ConsolePanel.BackgroundColor3 = currentTheme.panel
ConsolePanel.BorderSizePixel = 0
ConsolePanel.Parent = Workspace

local ConsoleTitle = Instance.new("TextLabel")
ConsoleTitle.Size = UDim2.new(1, -10, 0, 24)
ConsoleTitle.Position = UDim2.new(0, 8, 0, 4)
ConsoleTitle.BackgroundTransparency = 1
ConsoleTitle.Text = "Console"
ConsoleTitle.TextColor3 = currentTheme.title
ConsoleTitle.TextSize = 11
ConsoleTitle.Font = Enum.Font.Code
ConsoleTitle.TextXAlignment = Enum.TextXAlignment.Left
ConsoleTitle.Parent = ConsolePanel

local ConsoleScroll = Instance.new("ScrollingFrame")
ConsoleScroll.Size = UDim2.new(1, -8, 1, -32)
ConsoleScroll.Position = UDim2.new(0, 4, 0, 28)
ConsoleScroll.BackgroundTransparency = 1
ConsoleScroll.CanvasSize = UDim2.new(0, 0, 2, 0)
ConsoleScroll.ScrollBarThickness = 2
ConsoleScroll.Parent = ConsolePanel

local ConsoleLog = Instance.new("TextLabel")
ConsoleLog.Size = UDim2.new(1, 0, 1, 0)
ConsoleLog.BackgroundTransparency = 1
ConsoleLog.RichText = true
ConsoleLog.Text = "Ready to write code."
ConsoleLog.TextColor3 = currentTheme.title
ConsoleLog.TextSize = 10
ConsoleLog.Font = Enum.Font.Code
ConsoleLog.TextXAlignment = Enum.TextXAlignment.Left
ConsoleLog.TextYAlignment = Enum.TextYAlignment.Top
ConsoleLog.TextWrapped = true
ConsoleLog.Parent = ConsoleScroll

local function logMessage(msg, isSuccess)
    local colorHex = isSuccess and "#22c55e" or "#ef4444"
    local prefix = isSuccess and "[SUCCESS]: " or "[ERROR]: "
    ConsoleLog.Text = ConsoleLog.Text .. "\n<font color=\"" .. colorHex .. "\">" .. prefix .. msg .. "</font>"
end

local ThemePanel = Instance.new("ScrollingFrame")
ThemePanel.Size = UDim2.new(0, 160, 1, 0)
ThemePanel.Position = UDim2.new(1, -170, 0, 0)
ThemePanel.BackgroundColor3 = currentTheme.panel
ThemePanel.BorderSizePixel = 0
ThemePanel.CanvasSize = UDim2.new(0, 0, 0, 300)
ThemePanel.ScrollBarThickness = 2
ThemePanel.Parent = Workspace

local ThemeTitle = Instance.new("TextLabel")
ThemeTitle.Size = UDim2.new(1, -10, 0, 24)
ThemeTitle.Position = UDim2.new(0, 8, 0, 4)
ThemeTitle.BackgroundTransparency = 1
ThemeTitle.Text = "Themes"
ThemeTitle.TextColor3 = currentTheme.title
ThemeTitle.TextSize = 11
ThemeTitle.Font = Enum.Font.Code
ThemeTitle.TextXAlignment = Enum.TextXAlignment.Left
ThemeTitle.Parent = ThemePanel

local ActionBar = Instance.new("Frame")
ActionBar.Size = UDim2.new(1, 0, 0, 70)
ActionBar.Position = UDim2.new(0, 0, 1, -70)
ActionBar.BackgroundColor3 = currentTheme.topBar
ActionBar.BorderSizePixel = 0
ActionBar.Parent = Workspace

local function createActionBtn(name, xPos, width, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width or 75, 0, 32)
    btn.Position = UDim2.new(0, xPos, 0, 19)
    btn.BackgroundColor3 = currentTheme.btnBg
    btn.Text = name
    btn.TextColor3 = color or currentTheme.btnText
    btn.TextSize = 11
    btn.Font = Enum.Font.Code
    btn.Parent = ActionBar
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn
    return btn
end

local InjectBtn = createActionBtn("Inject", 12, 55)
local ExecBtn = createActionBtn("Execute", 71, 60)
local ClearCodeBtn = createActionBtn("Clr Code", 135, 62)
local ClearCacheBtn = createActionBtn("Clr Cache", 201, 62)
local PresetsBtn = createActionBtn("Presets", 267, 62)

local PresetsMenu = Instance.new("ScrollingFrame")
PresetsMenu.Size = UDim2.new(0, 140, 0, 200)
PresetsMenu.Position = UDim2.new(0, 267, 1, -275)
PresetsMenu.BackgroundColor3 = currentTheme.panel
PresetsMenu.BorderSizePixel = 0
PresetsMenu.Visible = false
PresetsMenu.CanvasSize = UDim2.new(0, 0, 0, 290)
PresetsMenu.ScrollBarThickness = 2
PresetsMenu.ZIndex = 10
PresetsMenu.Parent = Workspace

local PresetsStroke = Instance.new("UIStroke")
PresetsStroke.Color = currentTheme.stroke
PresetsStroke.Thickness = 1
PresetsStroke.Parent = PresetsMenu

local PresetsLayout = Instance.new("UIListLayout")
PresetsLayout.SortOrder = Enum.SortOrder.LayoutOrder
PresetsLayout.Padding = UDim.new(0, 4)
PresetsLayout.Parent = PresetsMenu

local PresetsPadding = Instance.new("UIPadding")
PresetsPadding.PaddingTop = UDim.new(0, 6)
PresetsPadding.PaddingLeft = UDim.new(0, 6)
PresetsPadding.PaddingRight = UDim.new(0, 6)
PresetsPadding.Parent = PresetsMenu

PresetsBtn.MouseButton1Click:Connect(function()
    PresetsMenu.Visible = not PresetsMenu.Visible
end)

local presetsData = {
    {
        name = "obsidian", 
        code = [[-- Obsidian UI Preset
local success, Obsidian = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/(obsidian)"))()
end)

if not success or not Obsidian then
    print("[Obsidian Mock] Library loaded in safe preview mode!")
    Obsidian = {
        New = function(title)
            print("Created Window:", title)
            return {
                NewTab = function(_, name)
                    print("Created Tab:", name)
                    return {
                        NewSection = function(_, secName)
                            print("Created Section:", secName)
                            return {
                                NewButton = function(_, text, desc, cb) print("Button:", text); cb() end,
                                NewToggle = function(_, text, desc, cb) print("Toggle:", text); cb(true) end,
                                NewSlider = function(_, text, desc, min, max, cb) print("Slider:", text); cb(50) end,
                                NewDropdown = function(_, text, desc, opts, cb) print("Dropdown:", text); cb(opts[1]) end
                            }
                        end
                    }
                end
            }
        end
    }
end

local Window = Obsidian:New("Obsidian UI")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Player Features")

Section:NewButton("Godmode", "Makes you invincible", function()
    print("Godmode activated!")
end)

Section:NewToggle("Auto Farm", "Enables automatic farming", function(state)
    print("Auto Farm set to:", state)
end)

Section:NewSlider("Walkspeed", "Changes character speed", 16, 250, function(value)
    print("Walkspeed set to:", value)
end)

Section:NewDropdown("Weapons", "Select your weapon", {"Sword", "Bow", "Staff"}, function(selected)
    print("Selected weapon:", selected)
end)]]
    },
    {
        name = "windui", 
        code = [[-- WindUI Preset
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/(windui)"))()
end)

if not success or not WindUI then
    print("[WindUI Mock] Library loaded in safe preview mode!")
    WindUI = {
        CreateWindow = function(config)
            print("Created Window:", config.Title)
            return {
                Tab = function(_, tabConfig)
                    print("Created Tab:", tabConfig.Title)
                    return {
                        Button = function(_, cfg) print("Button:", cfg.Title); cfg.Callback() end,
                        Toggle = function(_, cfg) print("Toggle:", cfg.Title); cfg.Callback(true) end,
                        Slider = function(_, cfg) print("Slider:", cfg.Title); cfg.Callback(cfg.Default) end,
                        Dropdown = function(_, cfg) print("Dropdown:", cfg.Title); cfg.Callback(cfg.Values[1]) end
                    }
                end
            }
        end
    }
end

local Window = WindUI:CreateWindow({ Title = "WindUI Hub", Theme = "Dark" })
local Tab = Window:Tab({ Title = "Main", Icon = "home" })

Tab:Button({ Title = "Print Hello", Callback = function() print("Hello from WindUI!") end })
Tab:Toggle({ Title = "Infinite Jump", Default = false, Callback = function(v) print("Infinite Jump:", v) end })
Tab:Slider({ Title = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(v) print("JumpPower:", v) end })
Tab:Dropdown({ Title = "Select Team", Values = {"Red", "Blue", "Green"}, Callback = function(v) print("Chosen team:", v) end })]]
    },
    {
        name = "fluent", 
        code = [[-- Fluent UI Preset
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success or not Fluent then
    print("[Fluent Mock] Library loaded in safe preview mode!")
    Fluent = {
        CreateWindow = function(config)
            return {
                AddTab = function(_, tabConfig)
                    return {
                        AddButton = function(_, cfg) print("Button:", cfg.Title); cfg.Callback() end,
                        AddToggle = function(_, name, cfg) 
                            print("Toggle:", cfg.Title)
                            return { OnChanged = function(_, cb) cb(cfg.Default) end }
                        end,
                        AddSlider = function(_, name, cfg)
                            print("Slider:", cfg.Title)
                            return { OnChanged = function(_, cb) cb(cfg.Default) end }
                        end,
                        AddDropdown = function(_, name, cfg)
                            print("Dropdown:", cfg.Title)
                            return { OnChanged = function(_, cb) cb(cfg.Values[cfg.Default]) end }
                        end
                    }
                end,
                Notify = function(_, notif) print("Notification:", notif.Title, "-", notif.Content) end
            }
        end
    }
end

local Window = Fluent:CreateWindow({ Title = "Fluent UI", SubTitle = "by dawid" })
local Tabs = { Main = Window:AddTab({ Title = "Main" }) }

Tabs.Main:AddButton({ Title = "Button", Description = "Click me", Callback = function() print("Button clicked!") end })
Tabs.Main:AddToggle("MyToggle", { Title = "Toggle", Default = false })
Tabs.Main:AddSlider("Slider", { Title = "Speed", Min = 16, Max = 200, Default = 16 })
Tabs.Main:AddDropdown("Dropdown", { Title = "Dropdown", Values = {"One", "Two"}, Default = 1 })]]
    },
    {
        name = "linoria", 
        code = [[-- LinoriaLib Preset
local success, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
end)

if not success or not Library then
    print("[Linoria Mock] Library loaded in safe preview mode!")
    Library = {
        CreateWindow = function(config)
            return {
                AddTab = function(_, name)
                    return {
                        AddLeftGroupbox = function(_, groupName)
                            return {
                                AddButton = function(_, text, cb) print("Button:", text); cb() end,
                                AddToggle = function(_, name, cfg) print("Toggle:", cfg.Text) end,
                                AddSlider = function(_, name, cfg) print("Slider:", cfg.Text) end,
                                AddDropdown = function(_, name, cfg) print("Dropdown:", cfg.Text) end
                            }
                        end
                    }
                end
            }
        end
    }
end

local Window = Library:CreateWindow({ Title = 'Linoria UI' })
local Tabbox = Window:AddTab('Main'):AddLeftGroupbox('Controls')

Tabbox:AddButton('Print Button', function() print('Button clicked!') end)
Tabbox:AddToggle('MyToggle', { Text = 'Enable Feature', Default = false })
Tabbox:AddSlider('MySlider', { Text = 'Walkspeed', Min = 16, Max = 200, Default = 16 })
Tabbox:AddDropdown('MyDropdown', { Values = { 'Option 1', 'Option 2' }, Default = 1, Text = 'Choose' })]]
    },
    {
        name = "rayfield", 
        code = [[-- Rayfield Preset
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    print("[Rayfield Mock] Library loaded in safe preview mode!")
    Rayfield = {
        CreateWindow = function(config)
            return {
                CreateTab = function(_, name)
                    return {
                        CreateButton = function(_, cfg) print("Button:", cfg.Name); cfg.Callback() end,
                        CreateToggle = function(_, cfg) print("Toggle:", cfg.Name); cfg.Callback(cfg.CurrentValue) end,
                        CreateSlider = function(_, cfg) print("Slider:", cfg.Name); cfg.Callback(cfg.CurrentValue) end,
                        CreateDropdown = function(_, cfg) print("Dropdown:", cfg.Name); cfg.Callback(cfg.CurrentOption) end
                    }
                end
            }
        end
    }
end

local Window = Rayfield:CreateWindow({ Name = "Rayfield Example" })
local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateButton({ Name = "Button Example", Callback = function() print("Clicked button") end })
Tab:CreateToggle({ Name = "Toggle Example", CurrentValue = false, Callback = function(v) print("Toggle:", v) end })
Tab:CreateSlider({ Name = "Slider Example", Range = {0, 100}, CurrentValue = 16, Callback = function(v) print("Slider:", v) end })
Tab:CreateDropdown({ Name = "Dropdown Example", Options = {"Opt 1", "Opt 2"}, CurrentOption = "Opt 1", Callback = function(o) print("Dropdown:", o) end })]]
    },
    {
        name = "orion", 
        code = [[-- Orion Library Preset
local success, OrionLib = pcall(function()
    return loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
end)

if not success or not OrionLib then
    print("[Orion Mock] Library loaded in safe preview mode!")
    OrionLib = {
        MakeWindow = function(config)
            return {
                MakeTab = function(_, cfg)
                    return {
                        AddButton = function(_, cfg2) print("Button:", cfg2.Name); cfg2.Callback() end,
                        AddToggle = function(_, cfg2) print("Toggle:", cfg2.Name); cfg2.Callback(true) end,
                        AddSlider = function(_, cfg2) print("Slider:", cfg2.Name); cfg2.Callback(cfg2.Default) end,
                        AddDropdown = function(_, cfg2) print("Dropdown:", cfg2.Name); cfg2.Callback(cfg2.Default) end
                    }
                end
            }
        end
    }
end

local Window = OrionLib:MakeWindow({Name = "Orion Library"})
local Tab = Window:MakeTab({Name = "Main Tab"})

Tab:AddButton({ Name = "Button!", Callback = function() print("button pressed") end })
Tab:AddToggle({ Name = "Toggle!", Default = false, Callback = function(v) print(v) end })
Tab:AddSlider({ Name = "Slider!", Min = 0, Max = 100, Default = 50, Callback = function(v) print(v) end })
Tab:AddDropdown({ Name = "Dropdown!", Default = "1", Options = {"1", "2"}, Callback = function(v) print(v) end })]]
    },
    {
        name = "maclib", 
        code = [[-- MacLib Preset
local success, MacLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/(maclib)"))()
end)

if not success or not MacLib then
    print("[MacLib Mock] Library loaded in safe preview mode!")
    MacLib = {
        Window = function(config)
            return {
                Tab = function(_, cfg)
                    return {
                        Section = function(_, cfg2)
                            return {
                                Button = function(_, cfg3) print("Button:", cfg3.Name); cfg3.Callback() end,
                                Toggle = function(_, cfg3) print("Toggle:", cfg3.Name); cfg3.Callback(true) end,
                                Slider = function(_, cfg3) print("Slider:", cfg3.Name); cfg3.Callback(cfg3.Default) end,
                                Dropdown = function(_, cfg3) print("Dropdown:", cfg3.Name); cfg3.Callback(cfg3.Default) end
                            }
                        end
                    }
                end
            }
        end
    }
end

local Window = MacLib:Window({ Title = "MacLib UI" })
local Tab = Window:Tab({ Name = "Main" })
local Group = Tab:Section({ Name = "Controls" })

Group:Button({ Name = "Button", Callback = function() print("MacLib Button") end })
Group:Toggle({ Name = "Toggle", Default = false, Callback = function(s) print("Toggle:", s) end })
Group:Slider({ Name = "Slider", Min = 0, Max = 100, Default = 50, Callback = function(v) print("Slider:", v) end })
Group:Dropdown({ Name = "Dropdown", Options = {"A", "B"}, Default = "A", Callback = function(o) print("Dropdown:", o) end })]]
    },
    {
        name = "emerald", 
        code = [[-- Emerald UI Preset
local success, Emerald = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/(emerald)"))()
end)

if not success or not Emerald then
    print("[Emerald Mock] Library loaded in safe preview mode!")
    Emerald = {
        CreateWindow = function(title)
            return {
                CreateTab = function(_, name)
                    return {
                        CreateButton = function(_, text, cb) print("Button:", text); cb() end,
                        CreateToggle = function(_, text, cb) print("Toggle:", text); cb(true) end,
                        CreateSlider = function(_, text, min, max, cb) print("Slider:", text); cb(70) end,
                        CreateDropdown = function(_, text, opts, cb) print("Dropdown:", text); cb(opts[1]) end
                    }
                end
            }
        end
    }
end

local Window = Emerald:CreateWindow("Emerald UI")
local Tab = Window:CreateTab("Home")

Tab:CreateButton("Click Me", function() print("Emerald Button clicked") end)
Tab:CreateToggle("Auto Clicker", function(state) print("Toggle state:", state) end)
Tab:CreateSlider("FOV Slider", 70, 120, function(val) print("FOV:", val) end)
Tab:CreateDropdown("Mode", {"Easy", "Medium", "Hard"}, function(choice) print("Selected mode:", choice) end)]]
    }
}

for _, preset in ipairs(presetsData) do
    local pBtn = Instance.new("TextButton")
    pBtn.Size = UDim2.new(1, 0, 0, 28)
    pBtn.BackgroundColor3 = currentTheme.btnBg
    pBtn.Text = preset.name
    pBtn.TextColor3 = currentTheme.btnText
    pBtn.TextSize = 10
    pBtn.Font = Enum.Font.Code
    pBtn.ZIndex = 11
    pBtn.Parent = PresetsMenu
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = pBtn
    
    pBtn.MouseButton1Click:Connect(function()
        CodeBox.Text = preset.code
        PresetsMenu.Visible = false
        logMessage("Loaded preset: " .. preset.name, true)
    end)
end

ClearCodeBtn.MouseButton1Click:Connect(function()
    CodeBox.Text = ""
    logMessage("Cleared code box.", true)
end)

ClearCacheBtn.MouseButton1Click:Connect(function()
    ConsoleLog.Text = "Ready to write code."
    logMessage("Cleared console cache.", true)
end)

updateTabs = function()
    for _, btn in ipairs(tabButtons) do
        btn:Destroy()
    end
    tabButtons = {}
    
    for i, tab in ipairs(tabs) do
        local tBtn = Instance.new("TextButton")
        tBtn.Size = UDim2.new(1, 0, 0, 28)
        tBtn.BackgroundColor3 = (i == currentTabIdx) and currentTheme.stroke or currentTheme.btnBg
        tBtn.Text = tab.name
        tBtn.TextColor3 = currentTheme.btnText
        tBtn.TextSize = 10
        tBtn.Font = Enum.Font.Code
        tBtn.Parent = TabBar
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = tBtn
        
        tBtn.MouseButton1Click:Connect(function()
            currentTabIdx = i
            CodeBox.Text = tab.code
            updateTabs()
        end)
        
        table.insert(tabButtons, tBtn)
    end
    
    local addBtn = Instance.new("TextButton")
    addBtn.Size = UDim2.new(1, 0, 0, 28)
    addBtn.BackgroundColor3 = currentTheme.btnBg
    addBtn.Text = "+ New Tab"
    addBtn.TextColor3 = currentTheme.btnText
    addBtn.TextSize = 10
    addBtn.Font = Enum.Font.Code
    addBtn.Parent = TabBar
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = addBtn
    
    addBtn.MouseButton1Click:Connect(function()
        table.insert(tabs, {name = "Script " .. (#tabs + 1), code = ""})
        currentTabIdx = #tabs
        CodeBox.Text = ""
        updateTabs()
    end)
    table.insert(tabButtons, addBtn)
    
    TabBar.CanvasSize = UDim2.new(0, 0, 0, (#tabs + 1) * 32)
end

local themeNames = {"light", "midnight", "amber", "dark", "sky", "matrix", "sunset", "cyberpunk", "ocean", "coffee", "lavender", "emerald", "crimson", "gold", "slate"}
local themeKeys = {"white", "midnight", "amber", "dark", "sky", "matrix", "sunset", "cyberpunk", "ocean", "coffee", "lavender", "emerald", "crimson", "gold", "slate"}
local themeButtons = {}

local function applyTheme(themeName)
    local t = themes[themeName]
    if not t then return end
    currentTheme = t
    
    MainFrame.BackgroundColor3 = t.main
    MainStroke.Color = t.stroke
    TopBar.BackgroundColor3 = t.topBar
    TitleLabel.TextColor3 = t.title
    CloseBtn.TextColor3 = t.title
    LineNumBar.TextColor3 = t.lineNum
    CodeBox.TextColor3 = t.defaultText
    TabBar.BackgroundColor3 = t.panel
    SnippetSidebar.BackgroundColor3 = t.panel
    HelperPanel.BackgroundColor3 = t.panel
    HelperTitle.TextColor3 = t.title
    ConsolePanel.BackgroundColor3 = t.panel
    ConsoleTitle.TextColor3 = t.title
    ThemePanel.BackgroundColor3 = t.panel
    ThemeTitle.TextColor3 = t.title
    ActionBar.BackgroundColor3 = t.topBar
    PresetsMenu.BackgroundColor3 = t.panel
    PresetsStroke.Color = t.stroke
    
    for _, btn in ipairs(snippetButtons) do
        btn.BackgroundColor3 = t.btnBg
        btn.TextColor3 = t.btnText
    end
    
    InjectBtn.BackgroundColor3 = t.btnBg
    InjectBtn.TextColor3 = t.btnText
    ExecBtn.BackgroundColor3 = t.btnBg
    ExecBtn.TextColor3 = t.btnText
    ClearCodeBtn.BackgroundColor3 = t.btnBg
    ClearCodeBtn.TextColor3 = t.btnText
    ClearCacheBtn.BackgroundColor3 = t.btnBg
    ClearCacheBtn.TextColor3 = t.btnText
    PresetsBtn.BackgroundColor3 = t.btnBg
    PresetsBtn.TextColor3 = t.btnText
    
    for _, tBtn in ipairs(themeButtons) do
        tBtn.BackgroundColor3 = t.btnBg
        tBtn.TextColor3 = t.btnText
    end
    
    updateTabs()
end

local themeY = 32
for i, name in ipairs(themeNames) do
    local key = themeKeys[i]
    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(1, -16, 0, 26)
    tBtn.Position = UDim2.new(0, 8, 0, themeY)
    tBtn.BackgroundColor3 = currentTheme.btnBg
    tBtn.Text = name
    tBtn.TextColor3 = currentTheme.btnText
    tBtn.TextSize = 10
    tBtn.Font = Enum.Font.Code
    tBtn.Parent = ThemePanel
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = tBtn
    
    tBtn.MouseButton1Click:Connect(function()
        applyTheme(key)
    end)
    table.insert(themeButtons, tBtn)
    themeY = themeY + 30
end
ThemePanel.CanvasSize = UDim2.new(0, 0, 0, themeY + 10)

local isInjected = false

InjectBtn.MouseButton1Click:Connect(function()
    InjectBtn.Text = "Inject..."
    task.wait(0.5)
    isInjected = true
    InjectBtn.Text = "Injected"
    logMessage("Successfully injected script engine.", true)
end)

ExecBtn.MouseButton1Click:Connect(function()
    if not isInjected then
        logMessage("Execute failed: Not injected!", false)
        return
    end
    
    local success, err = pcall(function()
        local codeFunc = loadstring(CodeBox.Text)
        if codeFunc then
            codeFunc()
        end
    end)
    
    if success then
        logMessage("Code executed successfully.", true)
    else
        logMessage("Bad script: " .. tostring(err), false)
    end
end)

updateTabs()
updateLineNumbers(CodeBox.Text)
HighlightLabel.Text = highlightText(CodeBox.Text)
