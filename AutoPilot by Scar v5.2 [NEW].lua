script_author("Scar | https://www.blast.hk/members/153622/")

local imgui = require("mimgui")
local inicfg = require("inicfg")
local faicons = require("fAwesome5")
local encoding = require("encoding")
encoding.default = 'CP1251'
local u8 = encoding.UTF8

local new = imgui.new
local speedfontsize = nil

local ap = {
    active = {
        active_menu = new.bool(),
        active_stat = new.bool(),
        ap_disable = new.bool(),
        active_pilot_metka = new.bool(),
        active_checkpoint = new.bool(),
        active_checkpoint_master = new.bool()
    }, settings = {
        ap_speed = new.float(30),
        ap_ride_type = new.int(0),
        ap_drive_type = new.int(7)
    }
}

local combo = { -- Так на заметку, не используеться!
    ride = {
        [1] = '0', -- едет обычно придерживаясь полосы
        [2] = '2', -- напрямую не сворачивая
        [3] = '3', -- едет по всей дорогe
        [4] = '4', -- садится в автомобиль
    }, drive = {
        [1] = '0', -- останавливаясь на светофорах и перед машинами
        [2] = '5', -- останавливаясь на светофорах и объезжая машины
        [3] = '2', -- проезжая светофоры и объезжая машины
        [4] = '4', -- проезжая светофоры и останавливаясь перед машинами
        [5] = '7' -- едет строго по дороге проезжая светофоры и не останавливаясь едет "через" машины
    }
}


local newFrame = imgui.OnFrame(
    function() return ap.active.active_menu[0] end,
    function(player)

        local sizeX, sizeY = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(300, 328), imgui.Cond.FirstUseEver)

        if ap.active.active_menu[0] then
                imgui.Begin(faicons.ICON_FA_CAR..u8" АвтоПилот v5.2 [NEW] by Scar " .. faicons.ICON_FA_CAR, ap.active.active_menu, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)

                if imgui.Button(faicons.ICON_FA_PLAY_CIRCLE..u8" Метка", imgui.ImVec2(128, 30)) then
                    if isCharInAnyCar(PLAYER_PED) then
                        if getTargetBlipCoordinatesFixed() then
                            bool, x, y, z = getTargetBlipCoordinatesFixed()
                            ap.active.active_stat[0] = true
                            if bool then apm = true end
                        else
                            ap.active.active_stat[0] = false
                            sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Поставьте метку.")
                        end
                    else
                        ap.active.active_stat[0] = false
                        sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Вы не в машине.")
                    end
                end imgui.SameLine()

                if imgui.Button(faicons.ICON_FA_STOP_CIRCLE..u8" Стоп", imgui.ImVec2(132, 30)) then
                    if isCharInAnyCar(PLAYER_PED) then
                        taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
                        apm = false apc = false apcm = false 
                        ap.active.active_stat[0] = false
                        printStringNow("~p~AutoPilot ~w~Disable", 1000)
                    else
                        sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Вы не в машине.")
                    end
                end

                if imgui.Button(faicons.ICON_FA_MAP_MARKED..u8" Чекпоинт", imgui.ImVec2(128, 30)) then
                    if isCharInAnyCar(PLAYER_PED) then
                        local pos = {getCharCoordinates(PLAYER_PED)}
                        res, x, y, z = SearchMarker(pos[1], pos[2], pos[3], 9999, true)
                        if res then
                            apc = true apcm = false
                            ap.active.active_stat[0] = true
                        else
                            sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Чекпоинт не найден.")
                        end
                    else
                        sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Вы не в машине.")
                    end
                end imgui.SameLine()

                if imgui.Button(faicons.ICON_FA_MAP_MARKED_ALT..u8" Чекпоинт-Мастер", imgui.ImVec2(132, 30)) then
                    if isCharInAnyCar(PLAYER_PED) then
                        apcm = true apc = false
                    else
                        sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Вы не в машине.")
                    end
                end

                imgui.Separator()

                if imgui.CollapsingHeader(faicons.ICON_FA_WRENCH..u8" Настройки") then
                    imgui.SetCursorPosY(161) imgui.Text(u8"Способ езды:") imgui.SameLine() imgui.SetCursorPos(imgui.ImVec2(115, 156)) 
                    imgui.RadioButtonIntPtr("##RB1", ap.settings.ap_ride_type, 0) imgui.TextQuestion(u8"Едет обычно придерживаясь полосы.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB2", ap.settings.ap_ride_type, 2) imgui.TextQuestion(u8"Едет напрямую не сворачивая.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB3", ap.settings.ap_ride_type, 3) imgui.TextQuestion(u8"Едет по всей дорогe.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB4", ap.settings.ap_ride_type, 4) imgui.TextQuestion(u8"Cадится в автомобиль.") imgui.SameLine()

                    imgui.SetCursorPosY(192) imgui.Separator()

                    imgui.SetCursorPosY(205) imgui.Text(u8"Тип вождения:") imgui.SameLine() imgui.SetCursorPosY(200) 
                    imgui.RadioButtonIntPtr("##RB5", ap.settings.ap_drive_type, 0) imgui.TextQuestion(u8"Останавливаясь на светофорах и перед машинами.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB6", ap.settings.ap_drive_type, 5) imgui.TextQuestion(u8"Останавливаясь на светофорах и объезжая машины.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB7", ap.settings.ap_drive_type, 2) imgui.TextQuestion(u8"Проезжая светофоры и объезжая машины.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB8", ap.settings.ap_drive_type, 4) imgui.TextQuestion(u8"Проезжая светофоры и останавливаясь перед машинами.") imgui.SameLine()
                    imgui.RadioButtonIntPtr("##RB9", ap.settings.ap_drive_type, 7) imgui.TextQuestion(u8"Едет строго по дороге проезжая светофоры и не останавливаясь едет сквозь машины.") imgui.SameLine()

                    imgui.SetCursorPosY(232) imgui.Separator()

                    imgui.SetCursorPosY(246) imgui.Text(u8"Скорость:") imgui.SameLine() imgui.SetCursorPosY(242)
                    imgui.PushItemWidth(140) imgui.SliderFloat(u8"##Slider", ap.settings.ap_speed, 1, 120) imgui.SameLine() imgui.PushItemWidth(50)
                    imgui.InputFloat("##InputFloat1", ap.settings.ap_speed) imgui.PushItemWidth(0)
                end

                imgui.Separator()

                if imgui.Button(faicons.ICON_FA_SAVE..u8"   Сохранить", imgui.ImVec2(128, 30)) then
                    iniSave() iniLoad()
                    printStringNow("~g~Config Save", 1000)
                end imgui.SameLine()
                if imgui.Button(faicons.ICON_FA_FILE_EXCEL..u8"   Сбросить", imgui.ImVec2(128, 30)) then
                    iniReset() iniLoad()
                    printStringNow("~y~Config Reset", 1000)
                end
        end

        imgui.End()
    end
)

local newFrame1 = imgui.OnFrame(
    function() return ap.active.active_stat[0] end,
    function(player)

            player.HideCursor = true
            local sizeX, sizeY = getScreenResolution()
            local pos = {getCharCoordinates(PLAYER_PED)}
		    imgui.SetNextWindowPos(imgui.ImVec2(sizeX - 180, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.SetNextWindowSize(imgui.ImVec2(280, 160), imgui.Cond.FirstUseEver)

            imgui.Begin(u8"##Start", ap.active.active_stat, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoMove)

            imgui.PushFont(speedfontsize)
            imgui.Text(faicons.ICON_FA_TACHOMETER_ALT..u8" Скорость:") imgui.SameLine() imgui.TextColoredRGB(u8"{00FF10}".. math.floor(getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED))))
            imgui.Text(faicons.ICON_FA_MAP_MARKER_ALT..u8" Дистанция:") imgui.SameLine() imgui.TextColoredRGB(u8"{00FF10}".. math.floor(getDistanceBetweenCoords3d(pos[1], pos[2], pos[3], x, y, z)))
            imgui.Text(faicons.ICON_FA_CAR_SIDE..u8" Модель:") imgui.SameLine() imgui.TextColoredRGB(u8"{00FF10}"..getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED))))

            imgui.Separator()

            imgui.SetCursorPosX(math.random(50, 54)) imgui.TextColoredRGB(u8"{FF0000}A{FF8F00}u{FFFF00}t{97FF00}o{13FF00}P{00FFB9}i{00C5FF}l{0078FF}o{00FBFF}t {7000FF}b{A600FF}y {FFFB00}S{1FFF00}c{00E8FF}a{D500FF}r")

            imgui.PopFont()

    end
)

function main()
    repeat wait(0) until isSampAvailable()
    iniLoad()
    sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}[v5.2] Загружен.")
    sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Меню: /ap")
    sampAddChatMessage("{0C7BF1}[AutoPilotNew]: {61A4EC}Автор: Scar для {C9D5E3}Blast.{67A2E1}hk")
    sampRegisterChatCommand("ap", function()
        ap.active.active_menu[0] = not ap.active.active_menu[0]
    end)

    while true do wait(0)

        if apm then
            if isCharInAnyCar(PLAYER_PED) then
                local pos = {getCharCoordinates(PLAYER_PED)}
                local distance = getDistanceBetweenCoords3d(pos[1], pos[2], pos[3], x, y, z)
                if distance >= 3 then
                    taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), x, y, z, ap.settings.ap_speed[0], ap.settings.ap_ride_type[0], nil, ap.settings.ap_drive_type[0])
                elseif distance <= 6 then
                    taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
                    apm = false
                    ap.active.active_stat[0] = false
                    printStringNow("~p~AutoPilot ~w~Disable", 1000)
                end
            end
        end

        if apc then
            if isCharInAnyCar(PLAYER_PED) then
                local pos = {getCharCoordinates(PLAYER_PED)}
                local distance = getDistanceBetweenCoords3d(pos[1], pos[2], pos[3], x, y, z)
                if distance >= 8 then
                    taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), x, y, z, ap.settings.ap_speed[0], ap.settings.ap_ride_type[0], nil, ap.settings.ap_drive_type[0])
                elseif distance <= 8 then
                    taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
                    setCarForwardSpeed(storeCarCharIsInNoSave(PLAYER_PED), 0,1)
                    apc = false
                    ap.active.active_stat[0] = false
                    printStringNow("~p~AutoPilot ~w~Disable", 1000)
                end
            end
        end

        if apcm then
            if isCharInAnyCar(PLAYER_PED) then
                local pos = {getCharCoordinates(PLAYER_PED)}
                res, x, y, z = SearchMarker(pos[1], pos[2], pos[3], 9999, true)
                if res then
                    ap.active.active_stat[0] = true
                    local distance = getDistanceBetweenCoords3d(pos[1], pos[2], pos[3], x, y, z)
                    if distance >= 3 then
                        taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), x, y, z, ap.settings.ap_speed[0], ap.settings.ap_ride_type[0], nil, ap.settings.ap_drive_type[0])
                    elseif distance <= 8 then
                        taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
                        setCarForwardSpeed(storeCarCharIsInNoSave(PLAYER_PED), 0,1)
                        printStringNow("~p~AutoPilot ~w~Wait", 100)
                    end
                end
            end
        end

        if apc or apcm then
            if isCharInAnyCar(PLAYER_PED) then
                local pos = {getCharCoordinates(PLAYER_PED)}
                res, x, y, z = SearchMarker(pos[1], pos[2], pos[3], 9999, true)
                if res and isPointOnScreen(x, y, z, 8) then
                    local x1, y1 = convert3DCoordsToScreen(pos[1], pos[2], pos[3])
                    local x2, y2 = convert3DCoordsToScreen(x, y, z)
                    renderDrawPolygon(x1, y1, 8, 8, 16, 0.0, 0xFF00FFF7)
                    renderDrawLine(x1, y1, x2, y2, 3, 0xFF0078FF)
                    renderDrawPolygon(x2, y2, 8, 8, 16, 0.0, 0xFF00FFF7)
                end
            end
        end

    end
end

function iniLoad()
	mainIni = inicfg.load(nil, "AutoPilot by Scar.ini")
	if mainIni == nil then
		iniSave()
	else
		ap.settings.ap_speed[0] = mainIni.config.ap_speed
        ap.settings.ap_ride_type[0] = mainIni.config.ap_ride_type
        ap.settings.ap_drive_type[0] = mainIni.config.ap_drive_type
	end
end

function iniSave()
	inicfg.save({
		config = {
            ap_speed = ap.settings.ap_speed[0],
            ap_ride_type = ap.settings.ap_ride_type[0],
            ap_drive_type = ap.settings.ap_drive_type[0]
		}
	}, "AutoPilot by Scar.ini")
end

function iniReset()
    inicfg.save({
		config = {
			ap_speed = 24,
            ap_ride_type = 0,
            ap_drive_type = 7
		}
	}, "AutoPilot by Scar.ini")
end

function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end

function SearchMarker(posX, posY, posZ, radius, isRace)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false

    for id = 0, 31 do
        local MarkerStruct = 0
        if isRace then MarkerStruct = 0xC7F168 + id * 56
        else MarkerStruct = 0xC7DD88 + id * 160 end
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))

        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            if getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ) < radius then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
                radius = getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ)
            end
        end
    end

    return isFind, ret_posX, ret_posY, ret_posZ
end

function imgui.TextQuestion(text)
    --imgui.TextDisabled(text)
    local war = u8'Подсказка:'
    --imgui.TextColored(imgui.ImVec4(0, 1, 0, 1), war)
    if imgui.IsItemHovered() then
            imgui.BeginTooltip()
            imgui.PushTextWrapPos(450)
            imgui.TextColored(imgui.ImVec4(1, 0, 0, 1), war)
            --imgui.TextColored(imgui.ImVec4(0, 0, 0, 1), text)
            imgui.TextUnformatted(text)
            imgui.PopTextWrapPos()
            imgui.EndTooltip()
    end
end

function imgui.TextColoredRGB(string)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col

    local function color_imvec4(color)
        if color:upper() == 'SSSSSS' then return colors[clr.Text] end
        local color = type(color) == 'number' and ('%X'):format(color):upper() or color:upper()
        local rgb = {}
        for i = 1, #color/2 do rgb[#rgb+1] = tonumber(color:sub(2*i-1, 2*i), 16) end
        return imgui.ImVec4(rgb[1]/255, rgb[2]/255, rgb[3]/255, rgb[4] and rgb[4]/255 or colors[clr.Text].w)
    end

    local function render_text(string)
        local text, color = {}, {}
        local m = 1
        while string:find('{......}') do
            local n, k = string:find('{......}')
            text[#text], text[#text+1] = string:sub(m, n-1), string:sub(k+1, #string)
            color[#color+1] = color_imvec4(string:sub(n+1, k-1))
            local t1, t2 = string:sub(1, n-1), string:sub(k+1, #string)
            string = t1..t2
            m = k-7
        end
        if text[0] then
            for i, _ in ipairs(text) do
                imgui.TextColored(color[i] or colors[clr.Text], u8(text[i]))
                imgui.SameLine(nil, 0)
            end
            imgui.NewLine()
        else imgui.Text(u8(string)) end
    end

    render_text(string)
end

imgui.OnInitialize(function()
    imgui.GetIO().IniFilename = nil
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    local config = imgui.ImFontConfig()
    config.MergeMode = true
    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    local iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
    imgui.GetIO().Fonts:AddFontFromFileTTF('Arial.ttf', 14.0, nil, glyph_ranges)
    icon = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 14.0, config, iconRanges)

    if speedfontsize == nil then
        speedfontsize = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 24.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
    end

    local config = imgui.ImFontConfig()
    config.MergeMode = true
    local glyph_ranges = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
    local iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
    imgui.GetIO().Fonts:AddFontFromFileTTF('trebucbd.ttf', 24.0, nil, glyph_ranges)
    icon = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 24.0, config, iconRanges)
 
     style.WindowPadding = ImVec2(15, 15)
     style.WindowRounding = 15.0
     style.FramePadding = ImVec2(5, 5)
     style.ItemSpacing = ImVec2(12, 8)
     style.ItemInnerSpacing = ImVec2(8, 6)
     style.IndentSpacing = 25.0
     style.ScrollbarSize = 15.0
     style.ScrollbarRounding = 15.0
     style.GrabMinSize = 15.0
     style.GrabRounding = 7.0
     style.ChildRounding = 15.0
     style.FrameRounding = 6.0
     style.WindowTitleAlign = ImVec2(0.5, 0.5)
	 style.ButtonTextAlign = ImVec2(0.5, 0.5)
   
 
       colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
       colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
       colors[clr.WindowBg] = ImVec4(0.11, 0.11, 0.24, 1.00)
       colors[clr.ChildBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
       colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
       colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
       colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
       colors[clr.FrameBg] = ImVec4(0.25, 0.20, 0.83, 0.69)
       colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
       colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
       colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
       colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
       colors[clr.TitleBgActive] = ImVec4(0.30, 0.25, 1.00, 1.00)
       colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
       colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
       colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
       colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
       --colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
       colors[clr.SliderGrab] = ImVec4(1.00, 0.34, 0.92, 1.00)
       colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
       colors[clr.Button] = ImVec4(0.12, 0.23, 0.93, 0.71)
       colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
       colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
       colors[clr.Header] = ImVec4(0.12, 0.23, 0.93, 0.71)
       colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
       colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
       colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
       colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
       colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
       --colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
       --colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
       --colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
       colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
       colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
       colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
       colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
       colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
       colors[clr.Separator] = ImVec4(0.43, 0.43, 0.50, 0.50)
       --colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end)