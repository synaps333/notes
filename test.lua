local cg = game:GetService("CoreGui")
local ts = game:GetService("TweenService")

local gui = Instance.new("ScreenGui", cg)
gui.Name = "LoadingGui"
gui.ResetOnSpawn = false

local mf = Instance.new("Frame", gui)
mf.Size = UDim2.new(0, 300, 0, 140)
mf.Position = UDim2.new(0.5, -150, 0.5, -70)
mf.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mf.BorderSizePixel = 0
Instance.new("UICorner", mf).CornerRadius = UDim.new(0, 10)

local textRu = Instance.new("TextLabel", mf)
textRu.Size = UDim2.new(1, 0, 0, 25)
textRu.Position = UDim2.new(0, 0, 0, 20)
textRu.BackgroundTransparency = 1
textRu.Text = "Загрузка"
textRu.TextColor3 = Color3.fromRGB(255, 255, 255)
textRu.TextSize = 16
textRu.Font = Enum.Font.GothamBold

local textEn = Instance.new("TextLabel", mf)
textEn.Size = UDim2.new(1, 0, 0, 20)
textEn.Position = UDim2.new(0, 0, 0, 45)
textEn.BackgroundTransparency = 1
textEn.Text = "Loading takes 5 seconds"
textEn.TextColor3 = Color3.fromRGB(140, 140, 140)
textEn.TextSize = 12
textEn.Font = Enum.Font.GothamMedium

local barBg = Instance.new("Frame", mf)
barBg.Size = UDim2.new(1, -40, 0, 8)
barBg.Position = UDim2.new(0, 20, 0, 90)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

ts:Create(barFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()

task.delay(5, function()
    gui:Destroy()

    -- Полный код твоих заметок
    if not writefile or not readfile then return end

    local p, hs = game:GetService("Players"), game:GetService("HttpService")
    local f = "notes_data.json"
    local notes = {}

    if pcall(function() return readfile(f) end) then
        local s, d = pcall(function() return hs:JSONDecode(readfile(f)) end)
        if s and type(d) == "table" then notes = d end
    end

    local function save()
        pcall(function() writefile(f, hs:JSONEncode(notes)) end)
    end

    local lang = "ru"
    local texts = {
        ru = {
            title = "Заметки | synaps333",
            placeholder = "Текст заметки...",
            add = "Добавить",
            credit = "Created By synaps333 (in tiktok)"
        },
        en = {
            title = "Notes | synaps333",
            placeholder = "Note text...",
            add = "Add",
            credit = "Created By synaps333 (in tiktok)"
        }
    }

    local mainGui = Instance.new("ScreenGui", cg)
    mainGui.Name = "\0\0\0"
    mainGui.ResetOnSpawn = false

    local langMf = Instance.new("Frame", mainGui)
    langMf.Size = UDim2.new(0, 260, 0, 180)
    langMf.Position = UDim2.new(0.5, -130, 0.5, -90)
    langMf.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    langMf.BorderSizePixel = 0
    langMf.Active = true
    langMf.Draggable = true
    Instance.new("UICorner", langMf).CornerRadius = UDim.new(0, 6)

    local langTitle = Instance.new("TextLabel", langMf)
    langTitle.Size = UDim2.new(1, 0, 0, 40)
    langTitle.BackgroundTransparency = 1
    langTitle.Text = "Select Language / Выберите язык"
    langTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    langTitle.TextSize = 12
    langTitle.Font = Enum.Font.GothamBold

    local btnRu = Instance.new("TextButton", langMf)
    btnRu.Size = UDim2.new(1, -20, 0, 35)
    btnRu.Position = UDim2.new(0, 10, 0, 50)
    btnRu.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btnRu.BorderSizePixel = 0
    btnRu.Text = "Русский"
    btnRu.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnRu.TextSize = 13
    btnRu.Font = Enum.Font.GothamMedium
    Instance.new("UICorner", btnRu).CornerRadius = UDim.new(0, 4)

    local btnEn = Instance.new("TextButton", langMf)
    btnEn.Size = UDim2.new(1, -20, 0, 35)
    btnEn.Position = UDim2.new(0, 10, 0, 95)
    btnEn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btnEn.BorderSizePixel = 0
    btnEn.Text = "English"
    btnEn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnEn.TextSize = 13
    btnEn.Font = Enum.Font.GothamMedium
    Instance.new("UICorner", btnEn).CornerRadius = UDim.new(0, 4)

    local creditLbl = Instance.new("TextLabel", langMf)
    creditLbl.Size = UDim2.new(1, 0, 0, 30)
    creditLbl.Position = UDim2.new(0, 0, 0, 140)
    creditLbl.BackgroundTransparency = 1
    creditLbl.Text = "Created By synaps333 (in tiktok)"
    creditLbl.TextColor3 = Color3.fromRGB(120, 120, 120)
    creditLbl.TextSize = 10
    creditLbl.Font = Enum.Font.GothamMedium

    local openBtn = Instance.new("TextButton", mainGui)
    openBtn.Size = UDim2.new(0, 60, 0, 30)
    openBtn.Position = UDim2.new(0, 15, 0.5, -15)
    openBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    openBtn.BorderSizePixel = 0
    openBtn.Text = "Open"
    openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    openBtn.TextSize = 12
    openBtn.Font = Enum.Font.GothamBold
    openBtn.Visible = false
    openBtn.Active = true
    openBtn.Draggable = true
    Instance.new("UICorner", openBtn).CornerRadius = UDim.new(0, 6)

    local mfNotes = Instance.new("Frame", mainGui)
    mfNotes.Size = UDim2.new(0, 300, 0, 400)
    mfNotes.Position = UDim2.new(0.5, -150, 0.5, -200)
    mfNotes.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    mfNotes.BorderSizePixel = 0
    mfNotes.Active = true
    mfNotes.Draggable = true
    mfNotes.Visible = false
    Instance.new("UICorner", mfNotes).CornerRadius = UDim.new(0, 6)

    local tb = Instance.new("Frame", mfNotes)
    tb.Size = UDim2.new(1, 0, 0, 30)
    tb.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tb.BorderSizePixel = 0
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)

    local tl = Instance.new("TextLabel", tb)
    tl.Size = UDim2.new(1, -30, 1, 0)
    tl.Position = UDim2.new(0, 8, 0, 0)
    tl.BackgroundTransparency = 1
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.TextSize = 13
    tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = Enum.TextXAlignment.Left

    local cb = Instance.new("TextButton", tb)
    cb.Size = UDim2.new(0, 30, 0, 30)
    cb.Position = UDim2.new(1, -30, 0, 0)
    cb.BackgroundTransparency = 1
    cb.Text = "×"
    cb.TextColor3 = Color3.fromRGB(180, 180, 180)
    cb.TextSize = 18

    cb.MouseButton1Click:Connect(function()
        mfNotes.Visible = false
        openBtn.Visible = true
    end)

    openBtn.MouseButton1Click:Connect(function()
        mfNotes.Visible = true
        openBtn.Visible = false
    end)

    local box = Instance.new("TextBox", mfNotes)
    box.Size = UDim2.new(1, -16, 0, 35)
    box.Position = UDim2.new(0, 8, 0, 40)
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    box.BorderSizePixel = 0
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 13
    box.Font = Enum.Font.GothamMedium
    box.ClearTextOnFocus = false
    box.Text = ""
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)

    local ab = Instance.new("TextButton", mfNotes)
    ab.Size = UDim2.new(1, -16, 0, 30)
    ab.Position = UDim2.new(0, 8, 0, 80)
    ab.BackgroundColor3 = Color3.fromRGB(50, 120, 50)
    ab.BorderSizePixel = 0
    ab.TextColor3 = Color3.fromRGB(255, 255, 255)
    ab.TextSize = 13
    ab.Font = Enum.Font.GothamBold
    Instance.new("UICorner", ab).CornerRadius = UDim.new(0, 4)

    local sf = Instance.new("ScrollingFrame", mfNotes)
    sf.Size = UDim2.new(1, -16, 1, -145)
    sf.Position = UDim2.new(0, 8, 0, 115)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.CanvasSize = UDim2.new(0, 0, 0, 0)
    sf.ScrollBarThickness = 4

    local ul = Instance.new("UIListLayout", sf)
    ul.SortOrder = Enum.SortOrder.LayoutOrder
    ul.Padding = UDim.new(0, 4)

    ul:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sf.CanvasSize = UDim2.new(0, 0, 0, ul.AbsoluteContentSize.Y)
    end)

    local mainCredit = Instance.new("TextLabel", mfNotes)
    mainCredit.Size = UDim2.new(1, 0, 0, 20)
    mainCredit.Position = UDim2.new(0, 0, 1, -22)
    mainCredit.BackgroundTransparency = 1
    mainCredit.Text = "Created By synaps333 (in tiktok)"
    mainCredit.TextColor3 = Color3.fromRGB(100, 100, 100)
    mainCredit.TextSize = 10
    mainCredit.Font = Enum.Font.GothamMedium

    local function render()
        for _, v in ipairs(sf:GetChildren()) do
            if v:IsA("Frame") then v:Destroy() end
        end
        for i, txt in ipairs(notes) do
            local item = Instance.new("Frame", sf)
            item.Size = UDim2.new(1, 0, 0, 35)
            item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            item.BorderSizePixel = 0
            Instance.new("UICorner", item).CornerRadius = UDim.new(0, 4)

            local t = Instance.new("TextLabel", item)
            t.Size = UDim2.new(1, -65, 1, 0)
            t.Position = UDim2.new(0, 6, 0, 0)
            t.BackgroundTransparency = 1
            t.Text = txt
            t.TextColor3 = Color3.fromRGB(220, 220, 220)
            t.TextSize = 12
            t.Font = Enum.Font.GothamMedium
            t.TextXAlignment = Enum.TextXAlignment.Left
            t.TextTruncate = Enum.TextTruncate.AtEnd

            local cp = Instance.new("TextButton", item)
            cp.Size = UDim2.new(0, 26, 0, 26)
            cp.Position = UDim2.new(1, -58, 0.5, -13)
            cp.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            cp.BorderSizePixel = 0
            cp.Text = "C"
            cp.TextColor3 = Color3.fromRGB(255, 255, 255)
            cp.TextSize = 12
            cp.Font = Enum.Font.GothamBold
            Instance.new("UICorner", cp).CornerRadius = UDim.new(0, 3)

            cp.MouseButton1Click:Connect(function()
                if setclipboard then setclipboard(txt) end
            end)

            local dl = Instance.new("TextButton", item)
            dl.Size = UDim2.new(0, 26, 0, 26)
            dl.Position = UDim2.new(1, -28, 0.5, -13)
            dl.BackgroundColor3 = Color3.fromRGB(120, 50, 50)
            dl.BorderSizePixel = 0
            dl.Text = "X"
            dl.TextColor3 = Color3.fromRGB(255, 255, 255)
            dl.TextSize = 12
            dl.Font = Enum.Font.GothamBold
            Instance.new("UICorner", dl).CornerRadius = UDim.new(0, 3)

            dl.MouseButton1Click:Connect(function()
                table.remove(notes, i)
                save()
                render()
            end)
        end
    end

    local function applyLang(selectedLang)
        lang = selectedLang
        tl.Text = texts[lang].title
        box.PlaceholderText = texts[lang].placeholder
        ab.Text = texts[lang].add
        langMf.Visible = false
        mfNotes.Visible = true
    end

    btnRu.MouseButton1Click:Connect(function()
        applyLang("ru")
        render()
    end)

    btnEn.MouseButton1Click:Connect(function()
        applyLang("en")
        render()
    end)

    ab.MouseButton1Click:Connect(function()
        local text = box.Text
        if text ~= "" then
            table.insert(notes, text)
            box.Text = ""
            save()
            render()
        end
    end)
end)
