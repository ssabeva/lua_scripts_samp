script_name('Bikers helper for ERP')
script_author('Franchesko')
require("lib.moonloader")
local inicfg = require ('inicfg')
local rkeys = require 'rkeys'
local imgui = require "imgui"
imgui.HotKey = require('imgui_addons').HotKey
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local sampev = require 'samp.events'

local main_window_state = imgui.ImBool(false)
local sw, sh = getScreenResolution()
local spawncaractive = false
local fsafeactive = false
local fbankactive = false
local captureactive = false
local activeautoload = false
local proccesautoload = false
local pid = nil
local pickup = nil
local x, y, z = nil


local path_ini = '..\\config\\bikershelper.ini'
local mainIni = inicfg.load({
    maincfg = {
		spawncar = false,
		fsafecmd = "fswl",
		deletekiy = false,
		smskontr = false,
		uvedkontr = false,
		autobar = false,
		autodrugs = false,
		fbankcmd = "fbwl",
		almatcmd = "autoloadmat",
		albenzcmd = "autoloadbenz",
		albarcmd = "autoloadbar",
		keys = encodeJson({112}),
		ctime = 200,
		clist = 1
    }
},path_ini)

function saveIniFile()
    local inicfgsaveparam = inicfg.save(mainIni,path_ini)
end
saveIniFile()


function sampev.onServerMessage(color, text)
	if (string.find(text, "Выезд занят другим транспортным средством")) then
		spawncaractive = false
		return true
	end
	if (string.find(text, "Данный дом не привязан к Вашей семье")) then
		spawncaractive = false
		return true
	end
	if (string.find(text, "Отправитель: Контрабандист")) and mainIni.maincfg.smskontr then
		return false
	end
	if (string.find(text, "Сообщает: Контрабандист")) and mainIni.maincfg.uvedkontr then
		return false
	end
	if text:find("Несите ящик в фургон") and activeautoload then
		lua_thread.create(function()
			proccesautoload = false
			wait(1000)
			sampSendChat("/bput")
		end)
	end
	if text:find("Несите канистру в фургон") and activeautoload then
		lua_thread.create(function()
			proccesautoload = false
			wait(1000)
			sampSendChat("/bput")
		end)
	end
	if text:find("Вы уронили ящик") and activeautoload then
		lua_thread.create(function()
			wait(1500)
			proccesautoload = true
		end)
	end
	if text:find("Вы уронили канистру") and activeautoload then
		lua_thread.create(function()
			wait(1500)
			proccesautoload = true
		end)
	end
	if text:find("Вы положили в фургон") and activeautoload then
		lua_thread.create(function()
			wait(1500)
			proccesautoload = true
		end)
	end
end


local bindID = 0
local captHotkey = {
    v = decodeJson(mainIni.maincfg.keys)
}
local spawncar = imgui.ImBool(mainIni.maincfg.spawncar)
local fsafecmd = imgui.ImBuffer(u8(mainIni.maincfg.fsafecmd), 265)
local deletekiy = imgui.ImBool(mainIni.maincfg.deletekiy)
local smskontr = imgui.ImBool(mainIni.maincfg.smskontr)
local uvedkontr = imgui.ImBool(mainIni.maincfg.uvedkontr)
local autobar = imgui.ImBool(mainIni.maincfg.autobar)
local autodrugs = imgui.ImBool(mainIni.maincfg.autodrugs)
local fbankcmd = imgui.ImBuffer(u8(mainIni.maincfg.fbankcmd), 265)
local ctime = imgui.ImInt(mainIni.maincfg.ctime)
local clist = imgui.ImInt(mainIni.maincfg.clist)
local almatcmd = imgui.ImBuffer(u8(mainIni.maincfg.almatcmd), 265)
local albenzcmd = imgui.ImBuffer(u8(mainIni.maincfg.albenzcmd), 265)
local albarcmd = imgui.ImBuffer(u8(mainIni.maincfg.albarcmd), 265)


function main()
    while not isSampAvailable() do wait(100) end
		sampRegisterChatCommand("bhelper", function() main_window_state.v = not main_window_state.v end)
		sampRegisterChatCommand(mainIni.maincfg.fsafecmd, function() sampSendChat("/fpanel"); fsafeactive = true end)
		sampRegisterChatCommand(mainIni.maincfg.fbankcmd, function() sampSendChat("/fpanel"); fbankactive = true end)
		sampRegisterChatCommand(mainIni.maincfg.almatcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с материалами включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с материалами выключена.", -1) end; pid = pickupid(2358); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)
		sampRegisterChatCommand(mainIni.maincfg.albenzcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка канистры с заправки включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка канистры с заправки выключена.", -1) end; pid = pickupid(1650); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)
		sampRegisterChatCommand(mainIni.maincfg.albarcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с бара включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с бара выключена.", -1) end; pid = pickupid(2912); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)

		bindID = rkeys.registerHotKey(captHotkey.v, true, function ()
			captureactive = not captureactive
			if captureactive then
				sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Флудер /capture запущен. Для отключения нажмите клавишу еще раз.", -1)
			else
				sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Флудер /capture остановлен.", -1)
			end
		end)
		while true do
        wait(0)
				imgui.Process = main_window_state.v
				if isKeyJustPressed(18) and not isPauseMenuActive() and isPlayerPlaying(PLAYER_HANDLE) and not sampIsChatInputActive() and not sampIsDialogActive() then
					spawncaractive = true
				end
				if mainIni.maincfg.deletekiy then
					local weapon = getCurrentCharWeapon(PLAYER_PED)
					if weapon == 7 then
						removeWeaponFromChar(PLAYER_PED, weapon)
					end
				end
				if captureactive then
					sampSendChat("/capture")
					sampSendDialogResponse(32700, 1, mainIni.maincfg.clist - 1, -1)
					wait(mainIni.maincfg.ctime)
				end
    end
end


function imgui.OnDrawFrame()
		local tLastKeys = {}
    if main_window_state.v then
      	imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(450, 500), imgui.Cond.FirstUseEver)
				imgui.Begin("Bikers Helper [Evolve RP] for PLITTS CREW", main_window_state, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
        imgui.Separator()
				imgui.SetCursorPosX(150)
				imgui.Text(u8"Настройки функций для семьи")
				imgui.Separator()
				if imgui.Checkbox(u8"Автоспавн свободной семейной машины при открытии меню дома", spawncar) then
						mainIni.maincfg.spawncar = spawncar.v
						saveIniFile()
        end
				imgui.Text(u8'Команда открытия/закрытия сейфа семьи: ')
				imgui.SameLine()
				imgui.PushItemWidth(50)
				if imgui.InputText(u8"##fsafecmd", fsafecmd) then
					sampUnregisterChatCommand(mainIni.maincfg.fsafecmd)
					mainIni.maincfg.fsafecmd = tostring(u8:decode(fsafecmd.v))
					saveIniFile()
					sampRegisterChatCommand(mainIni.maincfg.fsafecmd, function() sampSendChat("/fpanel"); fsafeactive = true end)
				end
				imgui.PopItemWidth()
				imgui.Text(u8'Команда открытия/закрытия банка семьи: ')
				imgui.SameLine()
				imgui.PushItemWidth(50)
				if imgui.InputText(u8"##fbankcmd", fbankcmd) then
					sampUnregisterChatCommand(mainIni.maincfg.fbankcmd)
					mainIni.maincfg.fbankcmd = tostring(u8:decode(fbankcmd.v))
					saveIniFile()
					sampRegisterChatCommand(mainIni.maincfg.fbankcmd, function() sampSendChat("/fpanel"); fbankactive = true end)
				end
				imgui.PopItemWidth()
				imgui.Separator()
				imgui.SetCursorPosX(150)
				imgui.Text(u8"Настройки общих функций для байкеров")
				imgui.Separator()
				if imgui.Checkbox(u8"Удалять кий", deletekiy) then
						mainIni.maincfg.deletekiy = deletekiy.v
						saveIniFile()
        end
				if imgui.Checkbox(u8"Не показывать SMS от Контрабандиста", smskontr) then
						mainIni.maincfg.smskontr = smskontr.v
						saveIniFile()
        end
				if imgui.Checkbox(u8"Не показывать уведомления о поставках Контрабандиста", uvedkontr) then
						mainIni.maincfg.uvedkontr = uvedkontr.v
						saveIniFile()
        end
				if imgui.Checkbox(u8"При открытии меню бара автопополнение до фулла", autobar) then
						mainIni.maincfg.autobar = autobar.v
						saveIniFile()
        end
				if imgui.Checkbox(u8"Автовзятие нарко со склада до максимума", autodrugs) then
						mainIni.maincfg.autodrugs = autodrugs.v
						saveIniFile()
        end
				imgui.Text(u8'Команда автозагрузки ящиков с материалами: ')
				imgui.SameLine()
				imgui.PushItemWidth(100)
				if imgui.InputText(u8"##almatcmd", almatcmd) then
					sampUnregisterChatCommand(mainIni.maincfg.almatcmd)
					mainIni.maincfg.almatcmd = tostring(u8:decode(almatcmd.v))
					saveIniFile()
					sampRegisterChatCommand(mainIni.maincfg.almatcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с материалами включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с материалами выключена.", -1) end; pid = pickupid(2358); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)
				end
				imgui.Text(u8'Команда автозагрузки канистры с заправки: ')
				imgui.SameLine()
				imgui.PushItemWidth(100)
				if imgui.InputText(u8"##albenzcmd", albenzcmd) then
					sampUnregisterChatCommand(mainIni.maincfg.albenzcmd)
					mainIni.maincfg.albenzcmd = tostring(u8:decode(albenzcmd.v))
					saveIniFile()
					sampRegisterChatCommand(mainIni.maincfg.albenzcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка канистры с заправки включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка канистры с заправки выключена.", -1) end; pid = pickupid(1650); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)
				end
				imgui.Text(u8'Команда автозагрузки ящиков из бара: ')
				imgui.SameLine()
				imgui.PushItemWidth(100)
				if imgui.InputText(u8"##albarcmd", albarcmd) then
					sampUnregisterChatCommand(mainIni.maincfg.albarcmd)
					mainIni.maincfg.albarcmd = tostring(u8:decode(albarcmd.v))
					saveIniFile()
					sampRegisterChatCommand(mainIni.maincfg.albarcmd, function() activeautoload = not activeautoload; proccesautoload = activeautoload; if activeautoload then sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с бара включена. После завершения введите команду еще раз.", -1) else sampAddChatMessage("{008080}[Bikers Helper] {ffffff}Автозагрузка ящиков с бара выключена.", -1) end; pid = pickupid(2912); pickup = sampGetPickupHandleBySampId(pid); x, y, z = getPickupCoordinates(pickup) end)
				end
				imgui.PopItemWidth()
				imgui.Separator()
				imgui.SetCursorPosX(150)
				imgui.Text(u8"Настройки автокаптера для байкеров")
				imgui.Separator()
				imgui.Text(u8("Старт/стоп флуд [Изменяется после перезахода]: "))
				imgui.SameLine()
				if imgui.HotKey('##tesst', captHotkey, tLastKeys, 150) then
		        mainIni.maincfg.keys = encodeJson(captHotkey.v)
		        saveIniFile()
		    end
				imgui.Text(u8"Задержка: ")
				imgui.SameLine()
				imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##ctime", ctime) then
					mainIni.maincfg.ctime = tonumber(ctime.v)
					saveIniFile()
        end
        imgui.PopItemWidth()
				imgui.Text(u8"Номер бизнеса: ")
				imgui.SameLine()
				imgui.PushItemWidth(100)
        if imgui.InputInt(u8"##clist", clist) then
					mainIni.maincfg.clist = tonumber(clist.v)
					saveIniFile()
        end
        imgui.PopItemWidth()
				imgui.Separator()
				imgui.End()
		    end
	end





	function sampev.onShowDialog(dialogId, dialogStyle, dialogTitle, okButtonText, cancelButtonText, dialogText)
		--spawncar
		if dialogId == 6700 and mainIni.maincfg.spawncar and spawncaractive then
			sampSendDialogResponse(6700, 1, 8, -1)
			return false
	    end
		if dialogId == 6707 and mainIni.maincfg.spawncar and spawncaractive then
			local n = 0
			for line in string.gmatch(dialogText, "[^\r\n]+") do
				if line:find('На парковке') then
					sampSendDialogResponse(6707, 1, n - 1, -1)
					return false
				end
				n = n + 1
			end
		end
		if dialogId == 6708 and mainIni.maincfg.spawncar and spawncaractive then
			spawncaractive = false
			sampSendDialogResponse(6708, 1, 0, -1)
			lua_thread.create(closedialog)
		end

		--warelock fsafe/fbank
		if dialogTitle:find("Панель | {ae433d}Семья") and fsafeactive then
			sampSendDialogResponse(dialogId, 1, 6, -1)
			return false
		end
		if dialogTitle:find("Склад | {ae433d}Семья") and fsafeactive then
			fsafeactive = false
			sampSendDialogResponse(dialogId, 1, 0, -1)
			lua_thread.create(closedialog)
		end
		if dialogTitle:find("Панель | {ae433d}Семья") and fbankactive then
			sampSendDialogResponse(dialogId, 1, 7, -1)
			return false
		end
		if dialogTitle:find("Банк | {ae433d}Семья") and fbankactive then
			fbankactive = false
			sampSendDialogResponse(dialogId, 1, 0, -1)
			lua_thread.create(closedialog)
		end

		--autobar
		if dialogId == 32700 and dialogTitle:find("Меню бара") and mainIni.maincfg.autobar then
			lua_thread.create(function()
				sampSendDialogResponse(dialogId, 1, 0, -1)
				wait(300)
				sampSendDialogResponse(dialogId, 1, 0, -1)
				wait(300)
				sampSendDialogResponse(dialogId, 1, 0, -1)
				wait(300)
				sampSendDialogResponse(dialogId, 1, 0, -1)
				wait(300)
				sampCloseCurrentDialogWithButton(0)
			end)
		end

		--autodrugs
		if dialogTitle:find('Склад наркотиков') and dialogText:find('Наркотиков на руках') and mainIni.maincfg.autodrugs then
			local currentDrugs, maxDrugs = dialogText:match('Наркотиков на руках: {......}(%d+) {FFFFFF}/ {......}(%d+)')
			if tonumber(maxDrugs) > tonumber(currentDrugs) then
				sampSendDialogResponse(dialogId, 1, 0, maxDrugs - currentDrugs)
				lua_thread.create(closedialog)
			end
	  end
	end


	function closedialog()
	  wait(250)
		sampCloseCurrentDialogWithButton(0)
		wait(250)
		sampCloseCurrentDialogWithButton(0)
	end


	function sampev.onSendPlayerSync(data)
		if proccesautoload and pid then
			lua_thread.create(function()
				while proccesautoload do
						data.position.x = x
				    data.position.y = y
				    data.position.z = z
						wait(100)
				end
			end)
		end
	end



	function pickupid(model)
	   local poolPtr = sampGetPickupPoolPtr()
	   local ptwo = readMemory(poolPtr, 4, 0)
	   if ptwo > 0 then
	     ptwo = poolPtr + 0x4
	     local pthree = poolPtr + 0xF004
	     for id = 1, 4096 do
	       local pfive = readMemory(ptwo + id * 4, 4, false)
	       if pfive < 0 or pfive > 0 then
	         pfive = readMemory(pthree + id * 20, 4, false)
	         if pfive == model then
	           return id
	         end
	       end
	     end
	   end
	end



function apply_custom_style()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	style.WindowRounding = 5
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 5
	style.FrameRounding = 2.0
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
