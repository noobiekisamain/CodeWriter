local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

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
        text = Color3.fromRGB(30, 30, 30),
        highlight = Color3.fromRGB(30, 30, 30),
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
        text = Color3.fromRGB(220, 230, 245),
        highlight = Color3.fromRGB(220, 230, 245),
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
        text = Color3.fromRGB(255, 200, 80),
        highlight = Color3.fromRGB(255, 200, 80),
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
        text = Color3.fromRGB(220, 220, 230),
        highlight = Color3.fromRGB(220, 220, 230),
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
        text = Color3.fromRGB(224, 255, 255),
        highlight = Color3.fromRGB(224, 255, 255),
        panel = Color3.fromRGB(24, 36, 54),
        btnBg = Color3.fromRGB(36, 54, 82),
        btnText = Color3.fromRGB(135, 206, 250),
        lineNum = Color3.fromRGB(90, 125, 160)
    }
}

local currentTheme = themes.white

-- Tabs State
local tabs = {
    {name = "Script 1", code = 'local part = Instance.new("Part")\npart.Parent = workspace'},
    {name = "Script 2", code = 'print("Hello from Script 2!")'},
    {name = "Script 3", code = '-- Type your code here'}
}
local currentTabIdx = 1

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 930, 0, 440)
MainFrame.Position = UDim2.new(0.5, -465, 0.5, -220)
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

-- Tab Bar (Left side of workspace)
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
EditorScroll.Size = UDim2.new(1, -470, 1, -80)
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

local function highlightText(rawText)
    local text = rawText:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
    local tokens = {}

    local function tokenize(pattern, color)
        text = text:gsub(pattern, function(match)
            table.insert(tokens, '<font color="' .. color .. '">' .. match .. '</font>')
            return "\0TK" .. #tokens .. "\0"
        end)
    end

    tokenize("%-%-.+$", "#569cd6")
    tokenize("%f[%d]%d+%.?%d*%f[%D]", "#b5cea8")

    local keywords = {"local", "if", "then", "end", "true", "false", "function", "return", "nil", "in", "do", "for", "while", "repeat", "until", "elseif", "else", "break"}
    for _, kw in ipairs(keywords) do
        tokenize("(%f[%a]" .. kw .. "%f[%A])", "#569cd6")
    end

    for i = #tokens, 1, -1 do
        text = text:gsub("\0TK" .. i .. "\0", tokens[i])
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
HighlightLabel.TextColor3 = currentTheme.highlight
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
CodeBox.TextColor3 = currentTheme.text
CodeBox.TextTransparency = 0.25
CodeBox.TextSize = 12
CodeBox.Font = Enum.Font.Code
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top
CodeBox.Parent = EditorScroll

local tabButtons = {}
local updateTabs

CodeBox:GetPropertyChangedSignal("Text"):Connect(function()
    HighlightLabel.Text = highlightText(CodeBox.Text)
    tabs[currentTabIdx].code = CodeBox.Text
end)

local SnippetSidebar = Instance.new("ScrollingFrame")
SnippetSidebar.Size = UDim2.new(0, 50, 1, -80)
SnippetSidebar.Position = UDim2.new(1, -380, 0, 0)
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
HelperPanel.Position = UDim2.new(1, -330, 0, 0)
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
        
        local func, parseErr = loadstring(text)
        if parseErr then
            parseErr = parseErr:gsub(":%d+: ", "")
            table.insert(issues, "• Syntax: " .. parseErr)
        else
            if not text:find("%(") and not text:find("=") and not text:find("local") and not text:find("if") and not text:find("return") then
                table.insert(issues, "• Incomplete statement or expression.")
            end
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
ConsolePanel.Position = UDim2.new(1, -170, 0, 0)
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
    
    -- Add Tab Button (+)
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

local themeNames = {"light", "midnight", "amber", "dark", "sky"}
local themeKeys = {"white", "midnight", "amber", "dark", "sky"}
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
    HighlightLabel.TextColor3 = t.highlight
    CodeBox.TextColor3 = t.text
    TabBar.BackgroundColor3 = t.panel
    SnippetSidebar.BackgroundColor3 = t.panel
    HelperPanel.BackgroundColor3 = t.panel
    HelperTitle.TextColor3 = t.title
    ConsolePanel.BackgroundColor3 = t.panel
    ConsoleTitle.TextColor3 = t.title
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

local startX = 294
for i, name in ipairs(themeNames) do
    local key = themeKeys[i]
    local tBtn = createActionBtn(name, startX, 52)
    tBtn.MouseButton1Click:Connect(function()
        applyTheme(key)
    end)
    table.insert(themeButtons, tBtn)
    startX = startX + 56
end

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
