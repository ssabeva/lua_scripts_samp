script_name('fast fsafe&getgun for ERP')
script_author('Franchesko')
require("lib.moonloader")
local inicfg = require ('inicfg')
local imgui = require "imgui"
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local sampev = require 'samp.events'

local main_window_state = imgui.ImBool(false)
local sw, sh = getScreenResolution()
local fsafe = false
local fslastd = false
local fsak = false
local fsm4 = false
local fsde = false
local fsri = false
local fssh = false

local fgg = false
local arm = false
local ggak2 = 0
local ggm42 = 0
local ggde2 = 0
local ggri2 = 0
local ggsh2 = 0

local path_ini = '..\\config\\Fsafe&getgun.ini'
local mainIni = inicfg.load({
    fsafe = {      
		key = 123,
		ak = 0,
		m4 = 100,
		de = 50,
		ri = 15,
		sh = 10,
		delay = 200
    },
	getgun = {      
		key = 122,
		ak = 0,
		m4 = 2,
		de = 1,
		ri = 1,
		sh = 0,
		arm = true
    }
},path_ini)

function saveIniFile()
    local inicfgsaveparam = inicfg.save(mainIni,path_ini)
end
saveIniFile()

function sampev.onServerMessage(color, text)
	if (string.find(text, "Семейный склад закрыт")) or (string.find(text, "Вы не можете взять со склада более")) or (string.find(text, "Недостаточно патронов")) then
		fsafe = false
		fsak = false
		sfm4 = false
		sfde = false
		fsri = false
		fssh = false
		return true
	end
	if (string.find(text, "Склад закрыт")) then
		fgg = false
		arm = false
		return true
	end
end



local fskey = imgui.ImInt(mainIni.fsafe.key)
local fsdelay = imgui.ImInt(mainIni.fsafe.delay)
local fsakkol = imgui.ImInt(mainIni.fsafe.ak)
local fsm4kol = imgui.ImInt(mainIni.fsafe.m4)
local fsdekol = imgui.ImInt(mainIni.fsafe.de)
local fsrikol = imgui.ImInt(mainIni.fsafe.ri)
local fsshkol = imgui.ImInt(mainIni.fsafe.sh)

local ggkey = imgui.ImInt(mainIni.getgun.key)
local ggakkol = imgui.ImInt(mainIni.getgun.ak)
local ggm4kol = imgui.ImInt(mainIni.getgun.m4)
local ggdekol = imgui.ImInt(mainIni.getgun.de)
local ggrikol = imgui.ImInt(mainIni.getgun.ri)
local ggshkol = imgui.ImInt(mainIni.getgun.sh)
local ggarm = imgui.ImBool(mainIni.getgun.arm)



function main()
    if not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand("fgg", function() main_window_state.v = not main_window_state.v end)
    while true do
        wait(0)
		
		imgui.Process = main_window_state.v
		if isKeyJustPressed(mainIni.fsafe.key) and not isPauseMenuActive() and isPlayerPlaying(PLAYER_HANDLE) and not sampIsChatInputActive() and not sampIsDialogActive() then
			sampSendChat("/fsafe")
			fsafe = true
			fsak = true
			fsm4 = true
			fsde = true
			fsri = true
			fssh = true
		end
		if isKeyJustPressed(mainIni.getgun.key) and not isPauseMenuActive() and isPlayerPlaying(PLAYER_HANDLE) and not sampIsChatInputActive() and not sampIsDialogActive() then
		    sampSendChat("/healme")
			fgg = true
			arm = true
			ggak2 = mainIni.getgun.ak
			ggm42 = mainIni.getgun.m4
			ggde2 = mainIni.getgun.de
			ggri2 = mainIni.getgun.ri
			ggsh2 = mainIni.getgun.sh
			wait(1000)
			sampSendChat("/getgun")
		end
		
		if mainIni.fsafe.ak <= 0 then
			fsak = false
		end
		if mainIni.fsafe.m4 <= 0 then
			fsm4 = false
		end
		if mainIni.fsafe.de <= 0 then
			fsde = false
		end
		if mainIni.fsafe.ri <= 0 then
			fsri = false
		end
		if mainIni.fsafe.sh <= 0 then
			fssh = false
		end
    end
end


function imgui.OnDrawFrame()
    if main_window_state.v then 
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(450, 500), imgui.Cond.FirstUseEver)
		imgui.Begin("Fast fsafe&getgun for Evolve RP", main_window_state)
        imgui.Separator()
        imgui.SetCursorPosX(180)
		imgui.Text(u8"Настройки  fsafe")
		imgui.Separator()
		imgui.Text(u8"Код клавиши активации (По умолчанию F12 - 123): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fskey", fskey, 0 , 0) then
			mainIni.fsafe.key = tonumber(fskey.v)
			saveIniFile()
		end
        imgui.PopItemWidth()
		imgui.Text(u8"Количество патронов АК (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsakkol", fsakkol) then
			mainIni.fsafe.ak = tonumber(fsakkol.v)
			saveIniFile()
		end
        imgui.PopItemWidth()
		imgui.Text(u8"Количество патронов M4 (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsm4kol", fsm4kol) then
			mainIni.fsafe.m4 = tonumber(fsm4kol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Количество патронов Deagle (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsdekol", fsdekol) then
			mainIni.fsafe.de = tonumber(fsdekol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Количество патронов Rifle (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsrikol", fsrikol) then
			mainIni.fsafe.ri = tonumber(fsrikol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Количество патронов Shotgun (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsshkol", fsshkol) then
			mainIni.fsafe.sh = tonumber(fsshkol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Задержка: ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##fsdelay", fsdelay, 50) then
			mainIni.fsafe.delay = tonumber(fsdelay.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Separator()
		imgui.SetCursorPosX(180)
		imgui.Text(u8"Настройки  getgun")
		imgui.Separator()
		imgui.Text(u8"Код клавиши активации (По умолчанию F11 - 122): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggkey", ggkey, 0 , 0) then
			mainIni.getgun.key = tonumber(ggkey.v)
			saveIniFile()
		end
        imgui.PopItemWidth()
		imgui.Text(u8"Сколько раз брать АК (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggakkol", ggakkol) then
			mainIni.getgun.ak = tonumber(ggakkol.v)
			ggak2 = tonumber(ggakkol.v)
			saveIniFile()
		end
        imgui.PopItemWidth()
		imgui.Text(u8"Сколько раз брать M4 (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggm4kol", ggm4kol) then
			mainIni.getgun.m4 = tonumber(ggm4kol.v)
			ggm42 = tonumber(ggm4kol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Сколько раз брать Deagle (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggdekol", ggdekol) then
			mainIni.getgun.de = tonumber(ggdekol.v)
			ggde2 = tonumber(ggdekol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Сколько раз брать Rifle (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggrikol", ggrikol) then
			mainIni.getgun.ri = tonumber(ggrikol.v)
			ggri2 = tonumber(ggrikol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		imgui.Text(u8"Сколько раз брать Shotgun (0 для отключения): ")
		imgui.SameLine()
		imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ggshkol", ggshkol) then
			mainIni.getgun.sh = tonumber(ggshkol.v)
			ggsh2 = tonumber(ggshkol.v)
			saveIniFile()
        end
        imgui.PopItemWidth()
		if imgui.Checkbox(u8"Брать броню", ggarm) then
			mainIni.getgun.arm = ggarm.v
			saveIniFile()
        end
		imgui.Separator()
		imgui.End()
    end
end


function closedialog()
    wait(250)
	sampCloseCurrentDialogWithButton(0)
	wait(250)
	sampCloseCurrentDialogWithButton(0)
end

function sampev.onShowDialog(dialogId, dialogStyle, dialogTitle, okButtonText, cancelButtonText, dialogText)
	if fsafe then
		if dialogId == 6054 then
            sampSendDialogResponse(6054, 1, 0, -1)
            return false
        end
        if dialogId == 6053 and fsak then
            sampSendDialogResponse(6053, 1, 8, -1)
			fsak = false
            return false
        end
        if dialogId == 6064 then
			lua_thread.create(function()
				wait(mainIni.fsafe.delay)
				sampSendDialogResponse(6064, 1, 0, mainIni.fsafe.ak)
				sampCloseCurrentDialogWithButton(0)
			end)
        end
		if dialogId == 6053 and fsm4 then
            sampSendDialogResponse(6053, 1, 9, -1)
			fsm4 = false
            return false
        end
        if dialogId == 6065 then
			lua_thread.create(function()
				wait(mainIni.fsafe.delay)
				sampSendDialogResponse(6065, 1, 0, mainIni.fsafe.m4)
				sampCloseCurrentDialogWithButton(0)
			end)
        end
		if dialogId == 6053 and fsde then
            sampSendDialogResponse(6053, 1, 5, -1)
			fsde = false
            return false
        end
        if dialogId == 6061 then
			lua_thread.create(function()
				wait(mainIni.fsafe.delay)
				sampSendDialogResponse(6061, 1, 0, mainIni.fsafe.de)
				sampCloseCurrentDialogWithButton(0)
			end)
        end
		if dialogId == 6053 and fsri then
            sampSendDialogResponse(6053, 1, 10, -1)
			fsri = false
            return false
        end
        if dialogId == 6066 then
			lua_thread.create(function()
				wait(mainIni.fsafe.delay)
				sampSendDialogResponse(6066, 1, 0, mainIni.fsafe.ri)	
				sampCloseCurrentDialogWithButton(0)
			end)
        end
		if dialogId == 6053 and fssh then
            sampSendDialogResponse(6053, 1, 6, -1)
			fssh = false
            return false
        end
        if dialogId == 6062 then
			lua_thread.create(function()
				wait(mainIni.fsafe.delay)
				sampSendDialogResponse(6062, 1, 0, mainIni.fsafe.sh)
				sampCloseCurrentDialogWithButton(0)
			end)
        end
		if dialogId == 6053 and not fsak and not fsm4 and not fsde and not fsri and not fssh then
			fslastd = true
		end
    end
	if dialogId == 6053 and fslastd then
		fslastd = false
		fsafe = false
		lua_thread.create(closedialog)
    end
	
	if fgg then
        if dialogId == 20036 and (ggde2 > 0) then
            sampSendDialogResponse(20036, 1, 0, -1)
			ggde2 = ggde2 - 1
			return false
        end
		if dialogId == 20036 and (ggm42 > 0) then
            sampSendDialogResponse(20036, 1, 3, -1)
			ggm42 = ggm42 - 1
			return false
        end
		if dialogId == 20036 and (ggri2 > 0) then
            sampSendDialogResponse(20036, 1, 2, -1)
			ggri2 = ggri2 - 1
            return false
        end
		if dialogId == 20036 and (ggak2 > 0) then
            sampSendDialogResponse(20036, 1, 4, -1)
			ggak2 = ggak2 - 1
            return false
        end
		if dialogId == 20036 and (ggsh2 > 0) then
            sampSendDialogResponse(20036, 1, 1, -1)
			ggsh2 = ggsh2 - 1
            return false
        end
		if dialogId == 20036 and arm and mainIni.getgun.arm then
            sampSendDialogResponse(20036, 1, 7, -1)
			arm = false
            return false
		else
			arm = false
        end
		if dialogId == 20036 and not arm and (ggak2 == 0) and (ggm42 == 0) and (ggde2 == 0) and (ggri2 == 0) and (ggsh2 == 0) then
			fgg = false
			lua_thread.create(function()
				wait(200)
				sampCloseCurrentDialogWithButton(0)
			end)
		end
    end
end

function apply_custom_style()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	style.WindowRounding = 1.5
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 1.5
	style.FrameRounding = 1.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	style.WindowPadding = imgui.ImVec2(4.0, 4.0)
	style.FramePadding = imgui.ImVec2(2.5, 3.5)
	style.ButtonTextAlign = imgui.ImVec2(0.02, 0.4)
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = imgui.ImColor(20, 20, 20, 255):GetVec4()
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = imgui.ImColor(40, 142, 110, 90):GetVec4()
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = imgui.ImColor(40, 142, 110, 113):GetVec4()
	colors[clr.FrameBgHovered]         = imgui.ImColor(40, 142, 110, 164):GetVec4()
	colors[clr.FrameBgActive]          = imgui.ImColor(40, 142, 110, 255):GetVec4()
	colors[clr.TitleBg]                = imgui.ImColor(40, 142, 110, 236):GetVec4()
	colors[clr.TitleBgActive]          = imgui.ImColor(40, 142, 110, 236):GetVec4()
	colors[clr.TitleBgCollapsed]       = ImVec4(0.05, 0.05, 0.05, 0.79)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = imgui.ImColor(40, 142, 110, 236):GetVec4()
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.28, 0.28, 0.28, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.35, 0.35, 0.35, 1.00)
	colors[clr.Button]                 = imgui.ImColor(35, 35, 35, 255):GetVec4()
	colors[clr.ButtonHovered]          = imgui.ImColor(35, 121, 93, 174):GetVec4()
	colors[clr.ButtonActive]           = imgui.ImColor(44, 154, 119, 255):GetVec4()
	colors[clr.Header]                 = imgui.ImColor(40, 142, 110, 255):GetVec4()
	colors[clr.HeaderHovered]          = ImVec4(0.34, 0.34, 0.35, 0.89)
	colors[clr.HeaderActive]           = ImVec4(0.12, 0.12, 0.12, 0.94)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = imgui.ImColor(40, 142, 110, 255):GetVec4()
	colors[clr.ResizeGripHovered]      = imgui.ImColor(35, 121, 93, 174):GetVec4()
	colors[clr.ResizeGripActive]       = imgui.ImColor(44, 154, 119, 255):GetVec4()
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.10, 0.10, 0.10, 0.35)
end
apply_custom_style()