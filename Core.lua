local addonName, ns = ...

ClayToolBoxDB = ClayToolBoxDB or { buttonPos = { x = -200, y = 0 }, macros = {} }
ClayToolBoxDB.buttonPos = ClayToolBoxDB.buttonPos or { x = -200, y = 0 }
ClayToolBoxDB.macros = ClayToolBoxDB.macros or {}
_G.ClayToolBoxDB = ClayToolBoxDB
local DB = ClayToolBoxDB

-- Common macro icon textures
local MACRO_ICONS = {
    "INV_Misc_QuestionMark",
    "Ability_Warrior_Challange",
    "Ability_MeleeDamage",
    "Spell_Holy_SealOfMight",
    "Spell_Fire_Fireball",
    "Spell_Frost_FrostBolt02",
    "Spell_Nature_Lightning",
    "Spell_Shadow_ShadowWordPain",
    "Spell_Holy_Heal",
    "Spell_Holy_PrayerOfHealing",
    "Ability_Hunter_BeastWithin",
    "Ability_Hunter_MendPet",
    "Ability_Rogue_SliceDice",
    "Ability_Rogue_Shadowstep",
    "Spell_Arcane_Blink",
    "Spell_Arcane_TeleportOrgrimmar",
    "Spell_Arcane_TeleportStormwind",
    "INV_Misc_Gem_Pearl_05",
    "INV_Misc_Food_73",
    "INV_Potion_01",
    "INV_Scroll_03",
    "INV_Letter_05",
    "Ability_Mount_WhiteTiger",
    "Ability_Mount_NetherDrakeElite",
    "Spell_Nature_Polymorph",
    "Spell_Frost_WizardMark",
    "Spell_Fire_FlameShock",
    "Spell_Holy_DivineSpirit",
    "Spell_Shadow_DetectLesserInvisibility",
    "Ability_EyeOfTheOwl",
    "Ability_Creature_Cursed_05",
    "Ability_Creature_Disease_05",
    "Ability_Creature_Poison_06",
    "INV_Misc_EngGizmos_19",
    "INV_Misc_Bomb_01",
    "INV_Misc_Bandage_08",
    "INV_Misc_Rune_01",
    "INV_Misc_Key_14",
    "INV_Misc_Key_05",
    "INV_Misc_Coin_01",
    "INV_Misc_Head_Dragon_01",
    "INV_Misc_Orb_01",
    "INV_Misc_Heart_01",
    "Spell_Holy_Renew",
    "Spell_Holy_PowerWordShield",
    "Spell_Holy_MindVision",
    "Spell_Holy_MindSooth",
    "Spell_Holy_Resurrection",
    "Spell_Fire_SealOfFire",
    "Spell_Fire_Immolation",
    "Spell_Fire_Incinerate",
    "Spell_Frost_FrostArmor02",
    "Spell_Frost_IceStorm",
    "Spell_Frost_Glacier",
    "Spell_Nature_HealingTouch",
    "Spell_Nature_Thorns",
    "Spell_Nature_FaerieFire",
    "Spell_Nature_RemoveCurse",
    "Spell_Nature_TimeStop",
    "Spell_Shadow_DeathCoil",
    "Spell_Shadow_CurseOfTounges",
    "Spell_Shadow_UnholyFrenzy",
    "Spell_Shadow_SummonSuccubus",
    "Spell_Shadow_RaiseDead",
    "Ability_Warrior_BattleShout",
    "Ability_Warrior_Disarm",
    "Ability_Warrior_PunishingBlow",
    "Ability_Warrior_Sunder",
    "Ability_Warrior_OffensiveStance",
    "Ability_Warrior_DefensiveStance",
    "Ability_Warrior_InnerRage",
    "Ability_Druid_TravelForm",
    "Ability_Druid_CatForm",
    "Ability_Druid_BearForm",
    "Ability_Druid_AquaticForm",
    "Ability_Druid_FlightForm",
    "Ability_Druid_MoonkinForm",
    "Ability_Druid_TreeofLife",
    "Ability_Hunter_AspectOfTheHawk",
    "Ability_Hunter_SniperShot",
    "Ability_Hunter_SwiftStrike",
    "Ability_Hunter_Pet_Bear",
    "Ability_Hunter_Pet_Wolf",
    "Ability_Hunter_Pet_Cat",
    "Ability_Marksmanship",
    "Ability_SearingArrow",
    "Ability_Throw",
    "Ability_ShootWand",
    "Ability_GolemThunderClap",
    "Ability_GolemStormBolt",
    "INV_Sword_01",
    "INV_Sword_04",
    "INV_Sword_05",
    "INV_Sword_07",
    "INV_Axe_01",
    "INV_Axe_09",
    "INV_Mace_01",
    "INV_Mace_04",
    "INV_Staff_01",
    "INV_Staff_08",
    "INV_Shield_01",
    "INV_Shield_04",
    "INV_Weapon_Bow_01",
    "INV_Weapon_Crossbow_01",
    "INV_Weapon_Gun_01",
    "INV_Weapon_Halbard_01",
    "INV_Weapon_Halberd15",
    "INV_Weapon_Hand_01",
    "INV_Weapon_ShortBlade_01",
    "INV_Weapon_ShortBlade_05",
    "INV_Wand_01",
    "INV_Wand_05",
    "INV_Misc_Book_01",
    "INV_Misc_Book_06",
    "INV_Misc_Gem_BloodGem_01",
    "INV_Misc_Gem_Amethyst_01",
    "INV_Misc_Gem_Diamond_01",
    "INV_Misc_Gem_Emerald_01",
    "INV_Misc_Gem_Ruby_01",
    "INV_Misc_Gem_Sapphire_01",
    "INV_Misc_Gem_Topaz_01",
    "INV_Misc_Gem_Pearl_01",
    "INV_Misc_Gem_Variety_01",
    "INV_Misc_EssenceOfLife",
    "INV_Misc_Herb_01",
    "INV_Misc_Herb_07",
    "INV_Misc_Herb_11",
    "INV_Misc_Ore_01",
    "INV_Misc_Ore_04",
    "INV_Misc_Ore_07",
    "INV_Misc_LeatherScrap_01",
    "INV_Misc_ClothScrap_01",
    "INV_Misc_Rune_06",
    "INV_Misc_Rune_07",
    "INV_Misc_TabardPVP_01",
    "INV_Misc_TabardSummer01",
    "INV_Misc_TabardSummer02",
    "INV_Misc_Tournament_Banner",
    "INV_Misc_BannerPVP_01",
    "INV_Misc_Banner_01",
    "INV_Misc_Cape_01",
    "INV_Misc_Cape_07",
    "INV_Misc_Cape_14",
    "INV_Misc_Cape_20",
    "INV_Misc_Crown_01",
    "INV_Misc_Crown_02",
    "INV_Misc_Horn_01",
    "INV_Misc_PocketWatch_01",
    "INV_Misc_Spyglass_01",
    "INV_Misc_Spyglass_02",
    "INV_Misc_Spyglass_03",
    "INV_Misc_StoneTablet_01",
    "INV_Misc_StoneTablet_04",
    "INV_Misc_StoneTablet_05",
    "INV_Misc_StoneTablet_11",
    "INV_Misc_Urn_01",
    "INV_Misc_Platnumdisks",
    "INV_Misc_Bag_01",
    "INV_Misc_Bag_07",
    "INV_Misc_Bag_08",
    "INV_Misc_Bag_09",
    "INV_Misc_Bag_10",
    "INV_Misc_Bag_11",
    "INV_Misc_Bag_14",
    "INV_Misc_Bag_15",
    "INV_Misc_Bag_16",
    "INV_Misc_Bag_17",
    "INV_Misc_Bag_18",
    "INV_Misc_Bag_19",
    "INV_Misc_Bag_20",
    "INV_Misc_Bag_21",
    "INV_Misc_Bag_22",
    "INV_Misc_Bag_23",
    "INV_Misc_Bag_24",
    "INV_Misc_Bag_25",
    "INV_Misc_Bag_26",
    "INV_Misc_Bag_27",
    "INV_Misc_Bag_28_Netherweave",
    "INV_Misc_Bag_29_Mooncloth",
    "INV_Misc_Bag_30_Spellfire",
    "INV_Misc_Bag_31_Frostweave",
    "INV_Misc_Bag_32_Embersilk",
    "INV_Misc_Bag_33_Windwool",
    "INV_Misc_Bag_34_Silkweave",
    "INV_Misc_Bag_35_Shaladrassil",
    "INV_Misc_Bag_CursedFeathers",
    "INV_Misc_Bag_Enchanting",
    "INV_Misc_Bag_HerbPouch",
    "INV_Misc_Bag_JewelBag",
    "INV_Misc_Bag_Leatherworking",
    "INV_Misc_Bag_SatchelofCenarius",
    "INV_Misc_Bag_Soulbag",
    "INV_Misc_Bag_CoreFelclothBag",
    "INV_Misc_Bag_EnchantedMageweave",
    "INV_Misc_Bag_BigBagofEnchantments",
    "INV_Misc_Bag_FelclothBag",
    "INV_Misc_Bag_CenarionHerbBag",
    "INV_Misc_Bag_CoreFelclothBag",
    "INV_Misc_Bag_GlacialBag",
    "INV_Misc_Bag_SatchelofCenarius",
    "INV_Misc_Bag_Soulbag",
    "INV_Misc_Bag_Timewalker",
    "INV_Misc_Bag_WarlordsSatchel",
    "INV_Misc_Bag_SatchelofCenarius",
}

-- Remove duplicates
local seen = {}
local uniqueIcons = {}
for _, icon in ipairs(MACRO_ICONS) do
    if not seen[icon] then
        seen[icon] = true
        table.insert(uniqueIcons, icon)
    end
end
MACRO_ICONS = uniqueIcons

-- ============================================================
-- Helper functions
-- ============================================================

local function GetMacroTexture(iconName)
    if not iconName then return "Interface\\Icons\\INV_Misc_QuestionMark" end
    if iconName:find("^%d+$") then
        local path = GetMacroIconInfo(tonumber(iconName))
        return path or "Interface\\Icons\\INV_Misc_QuestionMark"
    end
    if not iconName:find("^Interface\\") then
        return "Interface\\Icons\\" .. iconName
    end
    return iconName
end

local function FindIconIndex(texture)
    if not texture then return 1 end
    for i, icon in ipairs(MACRO_ICONS) do
        if icon == texture or texture:find(icon, 1, true) then
            return i
        end
    end
    return 1
end

-- ============================================================
-- Main Button
-- ============================================================

local function CreateMainButton()
    local btn = CreateFrame("Button", "ClayToolBoxButton", UIParent)
    btn:SetSize(60, 60)
    btn:SetMovable(true)
    btn:EnableMouse(true)
    btn:RegisterForDrag("LeftButton")
    btn:SetClampedToScreen(true)

    btn:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    btn:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local p, _, r, x, y = self:GetPoint()
        DB.buttonPos = { x = x, y = y }
    end)

    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
    btn.bg = bg

    local border = btn:CreateTexture(nil, "BORDER")
    border:SetAllPoints()
    border:SetColorTexture(0.6, 0.4, 0.1, 1)
    btn.border = border

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    text:SetText("Clay")
    text:SetPoint("CENTER")
    btn.text = text

    btn:SetPoint("CENTER", DB.buttonPos.x, DB.buttonPos.y)

    return btn
end

-- ============================================================
-- Dropdown Menu
-- ============================================================

local dropdownFrame
local menuButtons = {}
local hideTimer = nil
local dropdownAlive = false
local ShowEditor
local FindOrCreateGameMacro
local UpdateGameMacro

local function HideDropdown()
    if hideTimer then
        hideTimer:Cancel()
        hideTimer = nil
    end
    dropdownAlive = false
    if dropdownFrame then
        dropdownFrame:Hide()
    end
end

local function CheckMousePosition()
    if not dropdownAlive then return end
    if not dropdownFrame or not dropdownFrame:IsShown() then return end
    local mx, my = GetCursorPosition()
    local bx, by = ClayToolBoxButton:GetCenter()
    local bw, bh = ClayToolBoxButton:GetSize()
    local bscale = ClayToolBoxButton:GetEffectiveScale()
    local dx, dy = dropdownFrame:GetCenter()
    local dw, dh = dropdownFrame:GetSize()
    local dscale = dropdownFrame:GetEffectiveScale()

    local btnLeft = (bx * bscale) - (bw/2) * bscale
    local btnRight = (bx * bscale) + (bw/2) * bscale
    local btnTop = (by * bscale) + (bh/2) * bscale
    local btnBottom = (by * bscale) - (bh/2) * bscale

    local ddLeft = (dx * dscale) - (dw/2) * dscale
    local ddRight = (dx * dscale) + (dw/2) * dscale
    local ddTop = (dy * dscale) + (dh/2) * dscale
    local ddBottom = (dy * dscale) - (dh/2) * dscale

    local overBtn = mx >= btnLeft and mx <= btnRight and my >= btnBottom and my <= btnTop
    local overDD = mx >= ddLeft and mx <= ddRight and my >= ddBottom and my <= ddTop

    if not overBtn and not overDD then
        HideDropdown()
    else
        C_Timer.After(0.5, CheckMousePosition)
    end
end

local function ShowDropdown()
    if InCombatLockdown() then return end
    local wasShown = dropdownFrame and dropdownFrame:IsShown()
    dropdownAlive = false
    if dropdownFrame then
        dropdownFrame:Hide()
    end

    if not dropdownFrame then
        dropdownFrame = CreateFrame("Frame", "ClayToolBoxDropdown", UIParent, "BackdropTemplate")
        dropdownFrame:SetSize(200, 40)
        dropdownFrame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        })
        dropdownFrame:SetBackdropColor(0, 0, 0, 0.85)
        dropdownFrame:SetFrameStrata("DIALOG")
        dropdownFrame:EnableMouse(true)
        dropdownFrame:Hide()

        dropdownFrame.scrollFrame = CreateFrame("ScrollFrame", nil, dropdownFrame)
        dropdownFrame.scrollFrame:SetPoint("TOPLEFT", 8, -8)
        dropdownFrame.scrollFrame:SetPoint("BOTTOMRIGHT", -28, 8)

        local scrollBg = dropdownFrame.scrollFrame:CreateTexture(nil, "BACKGROUND")
        scrollBg:SetAllPoints()
        scrollBg:SetColorTexture(0, 0, 0, 0.8)

        dropdownFrame.scrollChild = CreateFrame("Frame", nil, dropdownFrame.scrollFrame)
        dropdownFrame.scrollChild:SetSize(180, 10)
        dropdownFrame.scrollFrame:SetScrollChild(dropdownFrame.scrollChild)
    end

    local btn = ClayToolBoxButton
    dropdownFrame:SetPoint("TOPLEFT", btn, "TOPRIGHT", 0, 0)

    local child = dropdownFrame.scrollChild
    for _, b in ipairs(child.buttons or {}) do
        b:Hide()
    end
    if not child.buttons then child.buttons = {} end
    wipe(child.buttons)

    dropdownAlive = true
    dropdownFrame:Show()
    C_Timer.After(0.5, CheckMousePosition)

    local yOffset = -5

    -- New Macro button
    local newBtn = CreateFrame("Button", nil, child)
    newBtn:SetSize(170, 30)
    newBtn:SetPoint("TOPLEFT", 5, yOffset)
    newBtn:SetNormalFontObject("GameFontNormal")
    newBtn:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight2", "ADD")
    newBtn:SetText("+ New Macro")
    newBtn:GetFontString():SetPoint("LEFT", 10, 0)
    newBtn:GetFontString():SetPoint("RIGHT", -10, 0)
    newBtn:SetScript("OnClick", function()
        HideDropdown()
        ShowEditor()
    end)
    newBtn:SetScript("OnEnter", function(self)
        self:GetFontString():SetTextColor(1, 0.82, 0)
    end)
    newBtn:SetScript("OnLeave", function(self)
        self:GetFontString():SetTextColor(1, 0.82, 0)
    end)
    newBtn:GetFontString():SetTextColor(1, 0.82, 0)
    table.insert(child.buttons, newBtn)

    yOffset = yOffset - 35

    -- Macro buttons
    for i, macro in ipairs(DB.macros) do
        local mBtn = CreateFrame("Button", nil, child, "SecureActionButtonTemplate")
        mBtn:SetSize(170, 30)
        mBtn:SetPoint("TOPLEFT", 5, yOffset)
        mBtn:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight2", "ADD")
        mBtn:SetAttribute("type1", "macro")
        mBtn:SetAttribute("type2", nil)

        local macroIndex = FindOrCreateGameMacro(i)
        if macroIndex then
            UpdateGameMacro(i)
            mBtn:SetAttribute("macro1", macroIndex)
        else
            mBtn:SetAttribute("type1", nil)
        end

        local icon = mBtn:CreateTexture(nil, "ARTWORK")
        icon:SetSize(24, 24)
        icon:SetPoint("LEFT", 4, 0)
        icon:SetTexture(GetMacroTexture(macro.icon))
        mBtn.icon = icon

        local label = mBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetText(macro.name)
        label:SetPoint("LEFT", 34, 0)
        label:SetPoint("RIGHT", -10, 0)
        label:SetJustifyH("LEFT")
        mBtn.label = label

        mBtn:SetScript("PostClick", function(self, button)
            if button == "RightButton" then
                HideDropdown()
                ShowEditor(i)
            end
        end)
        mBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        mBtn:SetScript("OnEnter", function(self)
            self.label:SetTextColor(1, 0.82, 0)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(macro.name, 1, 0.82, 0)
            if macro.body and macro.body ~= "" then
                local lines = { strsplit("\n", macro.body) }
                for _, line in ipairs(lines) do
                    if line ~= "" then
                        GameTooltip:AddLine(line, 0.8, 0.8, 0.8)
                    end
                end
            else
                GameTooltip:AddLine("(empty)", 0.5, 0.5, 0.5)
            end
            GameTooltip:AddLine(" ", 1, 1, 1)
            GameTooltip:AddLine("Left-click: Execute", 0.5, 1, 0.5)
            GameTooltip:AddLine("Right-click: Edit", 1, 0.5, 0.5)
            GameTooltip:Show()
        end)
        mBtn:SetScript("OnLeave", function(self)
            self.label:SetTextColor(1, 1, 1)
            GameTooltip:Hide()
        end)

        table.insert(child.buttons, mBtn)
        yOffset = yOffset - 35
    end

    local totalHeight = math.max(40, #DB.macros * 35 + 70)
    dropdownFrame:SetHeight(math.min(totalHeight, 400))
    child:SetHeight(totalHeight - 16)

    dropdownAlive = true
    dropdownFrame:Show()
    C_Timer.After(0.5, CheckMousePosition)
end

-- ============================================================
-- Game Macro Management
-- ============================================================

FindOrCreateGameMacro = function(dbIndex)
    local macro = DB.macros[dbIndex]
    if not macro then return nil end

    local numAccount, numChar = GetNumMacros()
    local totalMacros = numAccount + numChar

    -- Search for our macro by name
    for i = 1, totalMacros do
        local name = GetMacroInfo(i)
        if name and name == "CTB_" .. dbIndex then
            return i
        end
    end

    -- Create new game macro
    local icon = GetMacroTexture(macro.icon)
    local macroId = CreateMacro("CTB_" .. dbIndex, icon, macro.body, nil)
    return macroId
end

UpdateGameMacro = function(dbIndex)
    local macro = DB.macros[dbIndex]
    if not macro then return end

    local numAccount, numChar = GetNumMacros()
    local totalMacros = numAccount + numChar

    for i = 1, totalMacros do
        local name = GetMacroInfo(i)
        if name and name == "CTB_" .. dbIndex then
            local icon = GetMacroTexture(macro.icon)
            EditMacro(i, nil, icon, macro.body)
            return
        end
    end
end

local function DeleteGameMacroByName(targetName)
    if not targetName or targetName == "" then return end

    local numAccount, numChar = GetNumMacros()
    local totalMacros = numAccount + numChar
    for i = totalMacros, 1, -1 do
        local name = GetMacroInfo(i)
        if name and name == targetName then
            DeleteMacro(i)
        end
    end
end

-- ============================================================
-- Macro Editor
-- ============================================================

local editorFrame

local function HideEditor()
    if editorFrame then
        editorFrame:Hide()
    end
    ShowDropdown()
end

ShowEditor = function(editIndex)
    if InCombatLockdown() then return end

    if not editorFrame then
        editorFrame = CreateFrame("Frame", "ClayToolBoxEditor", UIParent, "BackdropTemplate")
        editorFrame:SetSize(380, 420)
        editorFrame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        })
        editorFrame:SetBackdropColor(0, 0, 0, 0.9)
        editorFrame:SetFrameStrata("DIALOG")
        editorFrame:SetMovable(true)
        editorFrame:EnableMouse(true)
        editorFrame:RegisterForDrag("LeftButton")
        editorFrame:SetClampedToScreen(true)
        editorFrame:Hide()

        editorFrame:SetScript("OnDragStart", function(self)
            self:StartMoving()
        end)
        editorFrame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)

        -- Title
        local title = editorFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        title:SetText("Macro Editor")
        title:SetPoint("TOP", 0, -15)
        editorFrame.title = title

        -- Name label and edit box
        local nameLabel = editorFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        nameLabel:SetText("Name:")
        nameLabel:SetPoint("TOPLEFT", 15, -45)
        editorFrame.nameLabel = nameLabel

        local nameEdit = CreateFrame("EditBox", nil, editorFrame, "InputBoxTemplate")
        nameEdit:SetSize(250, 30)
        nameEdit:SetPoint("LEFT", nameLabel, "RIGHT", 5, 0)
        nameEdit:SetAutoFocus(false)
        nameEdit:SetMaxLetters(16)

        local nameBg = nameEdit:CreateTexture(nil, "BACKGROUND")
        nameBg:SetAllPoints()
        nameBg:SetColorTexture(0.05, 0.05, 0.05, 1)

        editorFrame.nameEdit = nameEdit

        -- Icon label
        local iconLabel = editorFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        iconLabel:SetText("Icon:")
        iconLabel:SetPoint("TOPLEFT", 15, -85)
        editorFrame.iconLabel = iconLabel

        -- Icon display
        local iconDisplay = CreateFrame("Button", nil, editorFrame)
        iconDisplay:SetSize(36, 36)
        iconDisplay:SetPoint("LEFT", iconLabel, "RIGHT", 10, 0)

        local iconBg = iconDisplay:CreateTexture(nil, "BACKGROUND")
        iconBg:SetAllPoints()
        iconBg:SetColorTexture(0.1, 0.1, 0.1, 1)
        iconDisplay.iconBg = iconBg

        local iconTex = iconDisplay:CreateTexture(nil, "ARTWORK")
        iconTex:SetAllPoints()
        iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        iconDisplay.iconTex = iconTex

        local iconHlBorder = iconDisplay:CreateTexture(nil, "OVERLAY")
        iconHlBorder:SetAllPoints()
        iconHlBorder:SetColorTexture(0, 0, 0, 0)
        iconDisplay.hlBorder = iconHlBorder

        editorFrame.iconDisplay = iconDisplay

        iconDisplay:SetScript("OnClick", function(self)
            if not editorFrame.iconPicker then
                editorFrame.iconPicker = CreateFrame("Frame", nil, editorFrame, "BackdropTemplate")
                editorFrame.iconPicker:SetSize(320, 280)
                editorFrame.iconPicker:SetBackdrop({
                    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                    edgeSize = 16,
                    insets = { left = 4, right = 4, top = 4, bottom = 4 },
                })
                editorFrame.iconPicker:SetBackdropColor(0, 0, 0, 0.95)
                editorFrame.iconPicker:SetFrameStrata("TOOLTIP")
                editorFrame.iconPicker:Hide()

                local pickerScroll = CreateFrame("ScrollFrame", nil, editorFrame.iconPicker, "UIPanelScrollFrameTemplate")
                pickerScroll:SetPoint("TOPLEFT", 8, -8)
                pickerScroll:SetPoint("BOTTOMRIGHT", -28, 8)
                editorFrame.iconPicker.scroll = pickerScroll

                local pickerChild = CreateFrame("Frame", nil, pickerScroll)
                pickerChild:SetSize(280, 10)
                pickerScroll:SetScrollChild(pickerChild)
                editorFrame.iconPicker.child = pickerChild

                local closeBtn = CreateFrame("Button", nil, editorFrame.iconPicker, "UIPanelCloseButton")
                closeBtn:SetPoint("TOPRIGHT", -2, 2)
                closeBtn:SetScript("OnClick", function()
                    editorFrame.iconPicker:Hide()
                end)
            end

            local picker = editorFrame.iconPicker
            local child = picker.child
            for _, b in ipairs(child.buttons or {}) do
                b:Hide()
            end
            child.buttons = child.buttons or {}
            wipe(child.buttons)

            local cols = 7
            local btnSize = 36
            local spacing = 4
            local x, y = 5, -5

            for i, icon in ipairs(MACRO_ICONS) do
                local iconBtn = CreateFrame("Button", nil, child)
                iconBtn:SetSize(btnSize, btnSize)
                iconBtn:SetPoint("TOPLEFT", x, y)

                local iconBg = iconBtn:CreateTexture(nil, "BACKGROUND")
                iconBg:SetAllPoints()
                iconBg:SetColorTexture(0.1, 0.1, 0.1, 1)
                iconBtn.iconBg = iconBg

                local iconTex = iconBtn:CreateTexture(nil, "ARTWORK")
                iconTex:SetAllPoints()
                iconTex:SetTexture(GetMacroTexture(icon))
                iconBtn.iconTex = iconTex

                local hlBorder = iconBtn:CreateTexture(nil, "OVERLAY")
                hlBorder:SetAllPoints()
                hlBorder:SetColorTexture(0, 0, 0, 0)
                hlBorder:SetDrawLayer("OVERLAY")
                iconBtn.hlBorder = hlBorder

                iconBtn:SetScript("OnClick", function()
                    editorFrame.currentIconIndex = i
                    editorFrame.iconDisplay.iconTex:SetTexture(GetMacroTexture(icon))
                    picker:Hide()
                end)

                iconBtn:SetScript("OnEnter", function(self)
                    self.hlBorder:SetColorTexture(1, 1, 0, 1)
                end)
                iconBtn:SetScript("OnLeave", function(self)
                    self.hlBorder:SetColorTexture(0, 0, 0, 0)
                end)

                table.insert(child.buttons, iconBtn)

                x = x + btnSize + spacing
                if x + btnSize > 280 then
                    x = 5
                    y = y - btnSize - spacing
                end
            end

            child:SetHeight(math.ceil(#MACRO_ICONS / cols) * (btnSize + spacing) + 10)

            picker:SetPoint("TOPLEFT", editorFrame, "TOPRIGHT", 5, 0)
            picker:Show()
        end)

        iconDisplay:SetScript("OnEnter", function(self)
            self.hlBorder:SetColorTexture(1, 1, 0, 1)
        end)
        iconDisplay:SetScript("OnLeave", function(self)
            self.hlBorder:SetColorTexture(0, 0, 0, 0)
        end)

        -- Body label
        local bodyLabel = editorFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        bodyLabel:SetText("Content:")
        bodyLabel:SetPoint("TOPLEFT", 15, -130)
        editorFrame.bodyLabel = bodyLabel

        -- Body edit box (multi-line via scroll)
        local bodyScroll = CreateFrame("ScrollFrame", nil, editorFrame, "UIPanelScrollFrameTemplate")
        bodyScroll:SetSize(340, 180)
        bodyScroll:SetPoint("TOPLEFT", 15, -155)
        editorFrame.bodyScroll = bodyScroll

        local bodyBg = bodyScroll:CreateTexture(nil, "BACKGROUND")
        bodyBg:SetAllPoints()
        bodyBg:SetColorTexture(0.05, 0.05, 0.05, 1)

        local bodyBorder = bodyScroll:CreateTexture(nil, "BORDER")
        bodyBorder:SetAllPoints()
        bodyBorder:SetColorTexture(0.4, 0.3, 0.2, 1)

        local bodyEdit = CreateFrame("EditBox", nil, bodyScroll)
        bodyEdit:SetSize(320, 180)
        bodyEdit:SetMultiLine(true)
        bodyEdit:SetAutoFocus(false)
        bodyEdit:SetFontObject("ChatFontNormal")
        bodyEdit:SetScript("OnEscapePressed", function() bodyEdit:ClearFocus() end)
        bodyEdit:SetScript("OnEditFocusGained", function() bodyEdit:HighlightText() end)
        bodyEdit:SetScript("OnEditFocusLost", function() bodyEdit:HighlightText(0, 0) end)
        bodyScroll:SetScrollChild(bodyEdit)
        editorFrame.bodyEdit = bodyEdit

        -- Save button
        local saveBtn = CreateFrame("Button", nil, editorFrame, "UIPanelButtonTemplate")
        saveBtn:SetSize(100, 30)
        saveBtn:SetPoint("BOTTOMLEFT", 20, 15)
        saveBtn:SetText("Save")
        saveBtn:SetScript("OnClick", function()
            local name = editorFrame.nameEdit:GetText()
            local body = editorFrame.bodyEdit:GetText()
            local iconIndex = editorFrame.currentIconIndex or 1
            local icon = MACRO_ICONS[iconIndex] or "INV_Misc_QuestionMark"

            if name == "" then
                print("|cffff0000ClayToolBox:|r Macro name cannot be empty!")
                return
            end

            local macroData = {
                name = name,
                body = body,
                icon = icon,
            }

            if editorFrame.editIndex then
                DB.macros[editorFrame.editIndex] = macroData
                local macroId = FindOrCreateGameMacro(editorFrame.editIndex)
                if macroId then
                    UpdateGameMacro(editorFrame.editIndex)
                end
            else
                table.insert(DB.macros, macroData)
                local newIndex = #DB.macros
                local macroId = FindOrCreateGameMacro(newIndex)
                if macroId then
                    UpdateGameMacro(newIndex)
                end
            end

            HideEditor()
            ShowDropdown()
            print("|cff00ff00ClayToolBox:|r Macro saved!")
        end)
        editorFrame.saveBtn = saveBtn

        -- Delete button
        local deleteBtn = CreateFrame("Button", nil, editorFrame, "UIPanelButtonTemplate")
        deleteBtn:SetSize(100, 30)
        deleteBtn:SetPoint("LEFT", saveBtn, "RIGHT", 10, 0)
        deleteBtn:SetText("Delete")
        deleteBtn:SetScript("OnClick", function()
            if editorFrame.editIndex then
                local oldCount = #DB.macros
                table.remove(DB.macros, editorFrame.editIndex)

                for i = editorFrame.editIndex, #DB.macros do
                    local macroId = FindOrCreateGameMacro(i)
                    if macroId then
                        UpdateGameMacro(i)
                    end
                end

                if oldCount > #DB.macros then
                    DeleteGameMacroByName("CTB_" .. oldCount)
                end

                HideEditor()
                print("|cff00ff00ClayToolBox:|r Macro deleted!")
            else
                HideEditor()
            end
        end)
        editorFrame.deleteBtn = deleteBtn

        -- Cancel button
        local cancelBtn = CreateFrame("Button", nil, editorFrame, "UIPanelButtonTemplate")
        cancelBtn:SetSize(100, 30)
        cancelBtn:SetPoint("LEFT", deleteBtn, "RIGHT", 10, 0)
        cancelBtn:SetText("Cancel")
        cancelBtn:SetScript("OnClick", function()
            HideEditor()
        end)
        editorFrame.cancelBtn = cancelBtn
    end

    -- Position editor
    editorFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 50)

    -- Reset or populate fields
    editorFrame.editIndex = editIndex

    if editIndex and DB.macros[editIndex] then
        local macro = DB.macros[editIndex]
        editorFrame.title:SetText("Edit Macro")
        editorFrame.nameEdit:SetText(macro.name)
        editorFrame.bodyEdit:SetText(macro.body)
        editorFrame.currentIconIndex = FindIconIndex(macro.icon)
        editorFrame.iconDisplay.iconTex:SetTexture(GetMacroTexture(macro.icon))
        editorFrame.deleteBtn:Show()
    else
        editorFrame.title:SetText("New Macro")
        editorFrame.nameEdit:SetText("")
        editorFrame.bodyEdit:SetText("")
        editorFrame.currentIconIndex = 1
        editorFrame.iconDisplay.iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        editorFrame.deleteBtn:Hide()
    end

    -- Hide icon picker if open
    if editorFrame.iconPicker then
        editorFrame.iconPicker:Hide()
    end

    editorFrame:Show()
end

-- ============================================================
-- Initialization
-- ============================================================

local function OnLoad()
    local btn = CreateMainButton()

    btn:SetScript("OnEnter", function(self)
        self.bg:SetColorTexture(0.25, 0.25, 0.25, 0.9)
        self.border:SetColorTexture(1, 0.82, 0, 1)
        ShowDropdown()
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("ClayToolBox", 1, 0.82, 0)
        GameTooltip:AddLine("Hover: Open menu", 0.8, 0.8, 0.8)
        GameTooltip:AddLine("Right-click: New macro", 0.8, 0.8, 0.8)
        GameTooltip:AddLine("Drag: Move button", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function(self)
        self.bg:SetColorTexture(0.15, 0.15, 0.15, 0.9)
        self.border:SetColorTexture(0.6, 0.4, 0.1, 1)
        GameTooltip:Hide()
    end)

    btn:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            HideDropdown()
            ShowEditor()
        end
    end)
    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

-- Create a hidden frame to run OnLoad
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        OnLoad()
        self:UnregisterAllEvents()
    end
end)
