script_author("Scar | https://www.blast.hk/members/153622/")

require "lib.moonloader"

local inicfg = require("inicfg")
local imgui = require("imgui")
local encoding = require("encoding")
encoding.default = "CP1251"
u8 = encoding.UTF8

imgui.Process = false

local main_pilot = imgui.ImBool(false)
local type_drive_car = imgui.ImInt(0)
local type_ride_car = imgui.ImInt(0)
local speedPilot = imgui.ImInt(30)

function imgui.OnDrawFrame()
	  if not main_pilot then imgui.Process = false end

		local sw, sh = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(400, 280), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2((sw / 2), sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))

		imgui.Begin(u8"АвтоПилот by Scar", main_pilot, imgui.WindowFlags.NoResize)
		imgui.BeginChild("Obvodka", imgui.ImVec2(382, 240), true)
		imgui.SetCursorPosX(98)
		imgui.Text(u8"Скорость авто-пилота:  ")
		imgui.SameLine()
		imgui.PushItemWidth(50)
		imgui.SetCursorPos(imgui.ImVec2(236, 7))
		  imgui.InputInt(u8"", speedPilot, 0, 0)
			mainIni = inicfg.load(nil, "AutoPilot.ini")
			mainIni.config.speed = speedPilot.v
			inicfg.save(mainIni, "AutoPilot.ini")
			if getTargetBlipCoordinates() then
				imgui.SetCursorPos(imgui.ImVec2(92, 28))
				local _, x, y, z = getTargetBlipCoordinates()
				imgui.Text(u8("Метка :  X:  ".. math.floor(x) ..'  Y:  '.. math.floor(y) ..'  Z:  '.. math.floor(z)))
				imgui.SetCursorPosY(52)
				imgui.Separator()
			elseif not getTargetBlipCoordinates() then
				imgui.SetCursorPos(imgui.ImVec2(138, 28))
				imgui.Text(u8"Поставьте метку")
				imgui.SetCursorPosY(52)
				imgui.Separator()
			end
		imgui.SetCursorPosY(64)
			if imgui.Button(u8"Метка", imgui.ImVec2(180, 20)) then
				result, TargetX, TargetY, TargetZ = getTargetBlipCoordinatesFixed()
				taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), TargetX, TargetY, TargetZ, speedPilot.v, type_ride, 0, type_drive_car.v)
				dist_blip = true
			end
		imgui.SameLine()
			if imgui.Button(u8"Стоп",imgui.ImVec2(180, 20)) then
				taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
				dist_blip = false
				checkpoint = false
				checkpoint_master = false
			end

			if imgui.Button(u8"Чекпоинт", imgui.ImVec2(180, 20)) then
				checkpoint = true
			end
		imgui.SameLine()
		  if imgui.Button(u8"Чекпоинт-Мастер", imgui.ImVec2(180, 20)) then
				checkpoint_master = true
			end

		imgui.SetCursorPosY(122)
		imgui.Separator()
		imgui.SetCursorPosY(132)
		imgui.Text(u8"Тип вождения:  ")
		imgui.SameLine()
		imgui.PushItemWidth(240)
			if imgui.Combo(u8"##combo1", type_drive_car, {u8'Тип №1', u8'Тип №2', u8'Тип №3', u8'Тип №4', u8'Тип №5'}) then
				if type_drive_car.v == 0 then
					type_drive = 7
				end
				if type_drive_car.v == 1 then
					type_drive = 0
				end
				if type_drive_car.v == 2 then
					type_drive = 5
				end
				if type_drive_car.v == 3 then
					type_drive = 2
				end
				if type_drive_car.v == 4 then
					type_drive = 4
				end
		  end
		imgui.SameLine()
		imgui.TextQuestion(u8"Тип №1 - Едет строго по дороге проезжая светофоры и не останавливаясь едет сквозь машины.\nТип №2 - Останавливаясь на светофорах и перед машинами.\nТип №3 - Останавливаясь на светофорах и объезжая машины.\nТип №4 - Проезжая светофоры и объезжая машины.\n Тип№5 - проезжая светофоры и останавливаясь перед машинами.")

		imgui.SetCursorPosY(164)
		imgui.Text(u8"Способ езды:    ")
		imgui.SameLine()
		imgui.PushItemWidth(240)
			if imgui.Combo(u8"##combo2", type_ride_car, {u8'Тип №1', u8'Тип №2', u8'Тип №3', u8'Тип №4'}) then
				if type_ride_car.v == 0 then
					type_ride = 0
				end
				if type_ride_car.v == 1 then
					type_ride = 2
				end
				if type_ride_car.v == 2 then
					type_ride = 3
				end
				if type_ride_car.v == 3 then
					type_ride = 4
				end
			end

		imgui.SameLine()
		imgui.TextQuestion(u8"Тип №1 - Едет обычно придерживаясь полосы.\nТип №2 - Напрямую не сворачивая.\nТип №3 - Едет по всей дорогe.\nТип №4 - Садится в автомобиль(Хз вообще зачем это :/ ).")

		imgui.SetCursorPosY(200)
		imgui.Separator()
		imgui.SetCursorPos(imgui.ImVec2(10, 208))
		  if imgui.Button(u8"Мой профиль: Blast.hk", imgui.ImVec2(362, 24)) then
			  os.execute("start https://www.blast.hk/members/153622/")
		  end
		imgui.EndChild(Obvodka)
		imgui.End()
end

function main()
	repeat wait(0) until isSampAvailable()
	iniLoad()
	sampRegisterChatCommand("ap", cmd_ap)
	while true do wait(0)

		if main_pilot.v == false then imgui.Process = false end

		if dist_blip then
			if isCharInAnyCar(PLAYER_PED) and getTargetBlipCoordinates() then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				local dist = getDistanceBetweenCoords2d(x, y, TargetX, TargetY)
				if dist then
					printStringNow("~r~(Metka) ~w~X: ".. math.floor(x) ..' Y: '.. math.floor(y) ..' Z: '.. math.floor(z) ..'\n~r~Dist: ~w~'.. math.floor(dist)..'\n~w~AutoPilot by ~r~Scar ~w~for Blast.~b~hk', 100)
					if dist <= 6 then
						taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
						dist_blip = false
						setCharCoordinates(PLAYER_PED, TargetX, TargetY, TargetZ)
						printStringNow("~r~[AutoPilot by Scar]: ~w~Drive Final", 6000)
					end
				end
			end
		end

		if checkpoint then
			if isCharInAnyCar(PLAYER_PED) then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				local result, TargetX, TargetY, TargetZ = SearchMarker(x, y, z, 9999, true)
				if result then
					local dist = getDistanceBetweenCoords2d(x, y, TargetX, TargetY)
					if dist then
						taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), TargetX, TargetY, TargetZ, speedPilot.v, type_ride, 0, type_drive_car.v)
						printStringNow("~r~(CheckPoint) ~w~X: ".. math.floor(x) ..' Y: '.. math.floor(y) ..' Z: '.. math.floor(z) ..'\n~r~Dist: ~w~'.. math.floor(dist)..'\n~w~AutoPilot by ~r~Scar ~w~for Blast.~b~hk', 100)
						if dist <= 6 then
							taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
							checkpoint = false
							setCharCoordinates(PLAYER_PED, TargetX, TargetY, TargetZ)
							printStringNow("~r~[AutoPilot by Scar]: ~w~Drive Final", 6000)
						end
					end
				end
			end
		end

		if checkpoint_master then
			if isCharInAnyCar(PLAYER_PED) then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				local result, TargetX, TargetY, TargetZ = SearchMarker(x, y, z, 9999, true)
				local dist = getDistanceBetweenCoords2d(x, y, TargetX, TargetY)
				if dist then
					taskCarDriveToCoord(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED), TargetX, TargetY, TargetZ, speedPilot.v, type_ride, 0, type_drive_car.v)
					printStringNow("~r~(CheckPoint Master) ~w~X: ".. math.floor(x) ..' Y: '.. math.floor(y) ..' Z: '.. math.floor(z) ..'\n~r~Dist: ~w~'.. math.floor(dist)..'\n~w~AutoPilot by ~r~Scar ~w~for Blast.~b~hk', 100)
					if dist <= 6 then
						taskWarpCharIntoCarAsDriver(PLAYER_PED, storeCarCharIsInNoSave(PLAYER_PED))
						setCharCoordinates(PLAYER_PED, TargetX, TargetY, TargetZ)
						printStringNow("~r~[AutoPilot by Scar]: ~w~ Wait CheckPoint", 6000)
					end
				end
			end
		end

	end
end

function cmd_ap()
	main_pilot.v = not main_pilot.v
	imgui.Process = main_pilot.v
end

--Дополнительные функции:
function getTargetBlipCoordinatesFixed()
  local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
  requestCollision(x, y); loadScene(x, y, z)
  local bool, x, y, z = getTargetBlipCoordinates()
  return bool, x, y, z
end

function imgui.TextQuestion(text)
  imgui.TextDisabled('(?)')
  if imgui.IsItemHovered() then
    imgui.BeginTooltip()
    imgui.PushTextWrapPos(450)
    imgui.TextUnformatted(text)
    imgui.PopTextWrapPos()
    imgui.EndTooltip()
  end
end

function iniLoad()
	mainIni = inicfg.load(nil, "AutoPilot.ini")
	if mainIni == nil then
		iniSave()
	else
		speedPilot.v = mainIni.config.speed
	end
end

function iniSave()
	inicfg.save({
		config = {
			speed = speedPilot.v
		}
	}, "AutoPilot.ini")
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

--Стиль ImGui:
function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

apply_custom_style()
