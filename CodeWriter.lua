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
        lineNum = Color3.fromRGB(150, 150, 150)
    },
    midnight = {
        main = Color3.fromRGB(10, 15, 25),
        topBar = Color3.fromRGB(15, 22, 36),
        title = Color3.fromRGB(220, 230, 245),
        stroke = Color3.fromRGB(30, 45, 70),
        panel = Color3.fromRGB(13, 20, 32),
        btnBg = Color3.fromRGB(20, 30, 48),
        btnText = Color3.fromRGB(220, 230, 245),
        lineNum = Color3.fromRGB(80, 100, 130)
    },
    amber = {
        main = Color3.fromRGB(15, 10, 5),
        topBar = Color3.fromRGB(25, 16, 8),
        title = Color3.fromRGB(255, 176, 0),
        stroke = Color3.fromRGB(60, 35, 10),
        panel = Color3.fromRGB(20, 13, 6),
        btnBg = Color3.fromRGB(35, 22, 10),
        btnText = Color3.fromRGB(255, 176, 0),
        lineNum = Color3.fromRGB(120, 80, 30)
    },
    dark = {
        main = Color3.fromRGB(18, 18, 18),
        topBar = Color3.fromRGB(25, 25, 25),
        title = Color3.fromRGB(240, 240, 245),
        stroke = Color3.fromRGB(40, 40, 40),
        panel = Color3.fromRGB(22, 22, 22),
        btnBg = Color3.fromRGB(35, 35, 35),
        btnText = Color3.fromRGB(200, 200, 210),
        lineNum = Color3.fromRGB(100, 100, 110)
    },
    sky = {
        main = Color3.fromRGB(20, 30, 45),
        topBar = Color3.fromRGB(28, 42, 64),
        title = Color3.fromRGB(135, 206, 250),
        stroke = Color3.fromRGB(45, 75, 115),
        panel = Color3.fromRGB(24, 36, 54),
        btnBg = Color3.fromRGB(36, 54, 82),
        btnText = Color3.fromRGB(135, 206, 250),
        lineNum = Color3.fromRGB(90, 125, 160)
    },
    matrix = {
        main = Color3.fromRGB(5, 15, 5),
        topBar = Color3.fromRGB(8, 25, 8),
        title = Color3.fromRGB(50, 255, 50),
        stroke = Color3.fromRGB(15, 60, 15),
        panel = Color3.fromRGB(6, 20, 6),
        btnBg = Color3.fromRGB(12, 40, 12),
        btnText = Color3.fromRGB(50, 255, 50),
        lineNum = Color3.fromRGB(40, 120, 40)
    },
    sunset = {
        main = Color3.fromRGB(30, 12, 25),
        topBar = Color3.fromRGB(45, 18, 38),
        title = Color3.fromRGB(255, 140, 105),
        stroke = Color3.fromRGB(75, 30, 60),
        panel = Color3.fromRGB(35, 15, 30),
        btnBg = Color3.fromRGB(55, 22, 45),
        btnText = Color3.fromRGB(255, 140, 105),
        lineNum = Color3.fromRGB(130, 70, 95)
    },
    cyberpunk = {
        main = Color3.fromRGB(15, 10, 25),
        topBar = Color3.fromRGB(25, 15, 40),
        title = Color3.fromRGB(255, 0, 128),
        stroke = Color3.fromRGB(70, 20, 90),
        panel = Color3.fromRGB(20, 12, 32),
        btnBg = Color3.fromRGB(35, 20, 55),
        btnText = Color3.fromRGB(255, 0, 128),
        lineNum = Color3.fromRGB(120, 60, 140)
    },
    ocean = {
        main = Color3.fromRGB(10, 25, 35),
        topBar = Color3.fromRGB(16, 38, 52),
        title = Color3.fromRGB(0, 180, 216),
        stroke = Color3.fromRGB(30, 70, 95),
        panel = Color3.fromRGB(13, 30, 42),
        btnBg = Color3.fromRGB(20, 48, 66),
        btnText = Color3.fromRGB(0, 180, 216),
        lineNum = Color3.fromRGB(70, 110, 135)
    },
    coffee = {
        main = Color3.fromRGB(30, 22, 18),
        topBar = Color3.fromRGB(42, 31, 25),
        title = Color3.fromRGB(210, 160, 120),
        stroke = Color3.fromRGB(70, 52, 42),
        panel = Color3.fromRGB(35, 26, 21),
        btnBg = Color3.fromRGB(52, 39, 31),
        btnText = Color3.fromRGB(210, 160, 120),
        lineNum = Color3.fromRGB(110, 90, 75)
    },
    lavender = {
        main = Color3.fromRGB(22, 18, 32),
        topBar = Color3.fromRGB(32, 26, 46),
        title = Color3.fromRGB(190, 150, 230),
        stroke = Color3.fromRGB(60, 48, 85),
        panel = Color3.fromRGB(26, 21, 38),
        btnBg = Color3.fromRGB(40, 32, 58),
        btnText = Color3.fromRGB(190, 150, 230),
        lineNum = Color3.fromRGB(100, 85, 130)
    },
    emerald = {
        main = Color3.fromRGB(12, 28, 20),
        topBar = Color3.fromRGB(18, 40, 28),
        title = Color3.fromRGB(52, 211, 153),
        stroke = Color3.fromRGB(35, 75, 52),
        panel = Color3.fromRGB(15, 33, 23),
        btnBg = Color3.fromRGB(24, 52, 36),
        btnText = Color3.fromRGB(52, 211, 153),
        lineNum = Color3.fromRGB(75, 120, 90)
    },
    crimson = {
        main = Color3.fromRGB(32, 12, 15),
        topBar = Color3.fromRGB(46, 18, 22),
        title = Color3.fromRGB(248, 113, 113),
        stroke = Color3.fromRGB(80, 32, 38),
        panel = Color3.fromRGB(37, 14, 18),
        btnBg = Color3.fromRGB(58, 23, 28),
        btnText = Color3.fromRGB(248, 113, 113),
        lineNum = Color3.fromRGB(130, 75, 80)
    },
    gold = {
        main = Color3.fromRGB(28, 24, 10),
        topBar = Color3.fromRGB(40, 34, 14),
        title = Color3.fromRGB(250, 204, 21),
        stroke = Color3.fromRGB(75, 64, 25),
        panel = Color3.fromRGB(33, 28, 12),
        btnBg = Color3.fromRGB(50, 43, 18),
        btnText = Color3.fromRGB(250, 204, 21),
        lineNum = Color3.fromRGB(120, 105, 50)
    },
    slate = {
        main = Color3.fromRGB(25, 28, 36),
        topBar = Color3.fromRGB(35, 39, 50),
        title = Color3.fromRGB(148, 163, 184),
        stroke = Color3.fromRGB(60, 68, 86),
        panel = Color3.fromRGB(29, 33, 42),
        btnBg = Color3.fromRGB(44, 49, 63),
        btnText = Color3.fromRGB(148, 163, 184),
        lineNum = Color3.fromRGB(95, 105, 125)
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
    local text = rawText:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
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
        substitute("([^%w_%z])(" .. fn .. ")(%f[%D])", "%1<font color=\"#DCDCAA\">%2</font>%3")
        substitute("^(%z?" .. fn .. ")(%f[%D])", "<font color=\"#DCDCAA\">%1</font>%2")
    end

    for _, c in ipairs(constants) do
        substitute("([^%w_%z])(" .. c .. ")(%f[%D])", "%1<font color=\"#569CD6\">%2</font>%3")
        substitute("^(%z?" .. c .. ")(%f[%D])", "<font color=\"#569CD6\">%1</font>%2")
    end

    for _, ann in ipairs(annotations) do
        substitute("([^%w_%z])(" .. ann .. ")(%f[%D])", "%1<font color=\"#4EC9B0\">%2</font>%3")
        substitute("^(%z?" .. ann .. ")(%f[%D])", "<font color=\"#4EC9B0\">%1</font>%2")
    end

    for _, kw in ipairs(keywords) do
        substitute("([^%w_%z])(" .. kw .. ")(%f[%D])", "%1<font color=\"#007ACC\">%2</font>%3")
        substitute("^(%z?" .. kw .. ")(%f[%D])", "<font color=\"#007ACC\">%1</font>%2")
    end

    for placeholder, html in pairs(snippets) do
        text = text:gsub(placeholder, html)
    end

    return text
end

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

local CodeBox = Instance.new("TextBox")
CodeBox.Size = UDim2.new(1, -45, 1, 0)
CodeBox.Position = UDim2.new(0, 40, 0, 0)
CodeBox.BackgroundTransparency = 1
CodeBox.ClearTextOnFocus = false
CodeBox.MultiLine = true
CodeBox.TextWrapped = true
CodeBox.Text = tabs[1].code
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.TextTransparency = 1
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

local InjectBtn = createActionBtn("Inject", 12, 60)
local ExecBtn = createActionBtn("Execute", 78, 65)
local ClearCodeBtn = createActionBtn("Clr Code", 149, 65)
local ClearCacheBtn = createActionBtn("Clr Cache", 220, 68)

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
    CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBar.BackgroundColor3 = t.panel
    SnippetSidebar.BackgroundColor3 = t.panel
    HelperPanel.BackgroundColor3 = t.panel
    HelperTitle.TextColor3 = t.title
    ConsolePanel.BackgroundColor3 = t.panel
    ConsoleTitle.TextColor3 = t.title
    ThemePanel.BackgroundColor3 = t.panel
    ThemeTitle.TextColor3 = t.title
    ActionBar.BackgroundColor3 = t.topBar
    
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
