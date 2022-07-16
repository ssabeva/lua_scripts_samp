local mem = require 'memory'
local Vector3D = require "vector3d"
local samp = require 'samp.events'
local inicfg = require 'inicfg'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local iniFile = 'Gang Helper.ini'
local ini = inicfg.load({
	config = {
		MaxMaterials = 500,
		MaxDrugs = 150,
		AutoGetGunsDelay = 500,
		CaptureDelay = 300,
		ChatFilter = true,
		WearMask = true,
		SettingsCommand = 'ghelper',
		FastMaskCommand = 'fmask',
		CaptureFlooderCommand = 'cflood',
		AutoGetGunsCommand = 'agg',
		FastGetGunsCommand = 'fgg',
		FastLSACommand = 'flsa'
	},
	render = {
		active = false,
		minimalistic = false,
		x = 20,
		y = 400,
		font = 'arial',
		height = 9,
		flags = 5,
		need = true
	}
}, iniFile)
if not doesFileExist('moonloader/config/'..iniFile) then inicfg.save(ini, iniFile) end

local window = imgui.ImBool(false)

local SettingsCommand = imgui.ImBuffer(ini.config.SettingsCommand, 16)
local FastMaskCommand = imgui.ImBuffer(ini.config.FastMaskCommand, 16)
local CaptureFlooderCommand = imgui.ImBuffer(ini.config.CaptureFlooderCommand, 16)
local FastGetGunsCommand = imgui.ImBuffer(ini.config.FastGetGunsCommand, 16)
local AutoGetGunsCommand = imgui.ImBuffer(ini.config.AutoGetGunsCommand, 16)
local FastLSACommand = imgui.ImBuffer(ini.config.FastLSACommand, 16)

local MaxMaterials = imgui.ImInt(ini.config.MaxMaterials)
local MaxDrugs = imgui.ImInt(ini.config.MaxDrugs)
local AutoGetGunsDelay = imgui.ImInt(ini.config.AutoGetGunsDelay)
local CaptureDelay = imgui.ImInt(ini.config.CaptureDelay)
local ChatFilter = imgui.ImBool(ini.config.ChatFilter)
local WearMask = imgui.ImBool(ini.config.WearMask)

local RenderActive = imgui.ImBool(ini.render.active)
local RenderNeed = imgui.ImBool(ini.render.need)
local RenderMinimalistic = imgui.ImBool(ini.render.minimalistic)
local RenderFont = imgui.ImBuffer(ini.render.font, 32)
local RenderPos = {ini.render.x, ini.render.y}
local RenderHeight = imgui.ImInt(ini.render.height)
local RenderFlags = imgui.ImInt(ini.render.flags)

local AutoGetGuns = false
local fmask = false
local FlooderActive = false
local server = ''
local flsa = false
function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end
	while not stPickupPtr do stPickupPtr = sampGetPickupPoolPtr() PickupPtr = sampGetPickupPoolPtr() wait(100) end
	stPickupPtr = stPickupPtr + 0xf004
	sampAddChatMessage('[Gang Helper] {FFFFFF}Скрипт успешно загружен! Настойки: /'..ini.config.SettingsCommand, 0x993066)
	sampAddChatMessage('[Gang Helper] {FFFFFF}Автор скрипта: {993066}CaJlaT', 0x993066)
	sampRegisterChatCommand(ini.config.SettingsCommand, function() window.v = not window.v end)
	sampRegisterChatCommand(ini.config.FastMaskCommand, fastMask)
	sampRegisterChatCommand(ini.config.AutoGetGunsCommand, function()
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		UpdateStats()
		AutoGetGuns = not AutoGetGuns
	end)
	sampRegisterChatCommand(ini.config.CaptureFlooderCommand, function()
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		lua_thread.create(flooder)
	end)
	sampRegisterChatCommand(ini.config.FastGetGunsCommand, function()
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not MaterialsNeed or MaterialsNeed == 0 then
			sampAddChatMessage('[Gang Helper] {FFFFFF}Вам не требуются материалы', 0x993066)
			UpdateStats()
			return
		end
		sampSendChat('/get guns '..MaterialsNeed)
	end)
	sampRegisterChatCommand(ini.config.FastLSACommand, function()
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		flsa = not flsa
		lua_thread.create(function()
			while flsa do
				printStringNow('Fast LSA: ~p~ON', 1000)
				local pickup = nil
				for i=0, MAX_PICKUPS-1 do
					local m = mem.getuint32(stPickupPtr + i*20 + 0x04)
					if m and m ~= 0 then
						local px = mem.getfloat(stPickupPtr + i*20 + 0x08)
						local py = mem.getfloat(stPickupPtr + i*20 + 0x0C)
						local pz = mem.getfloat(stPickupPtr + i*20 + 0x10)
						local mx, my, mz = getCharCoordinates(PLAYER_PED)
						local distance_to_pickup = getDistanceBetweenCoords3d(px, py, pz, mx, my, mz)
						local pickup_model = mem.read(stPickupPtr + i* 20, 4)
						if distance_to_pickup < 6 and pickup_model == 2358 then
							pickup = i
						end
					end
				end
				if pickup then
					sampSendPickedUpPickup(pickup)
					sampSendChat('/materials put')
					wait(888) -- кд на команды
				else
					sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, Вы не на ЛСА или рядом нет пикапа с материалами!', 0x993066)
					flsa = false
				end
				wait(0)
			end
			printStringNow('Fast LSA: ~p~OFF', 1000)
		end)
	end)
	font = renderCreateFont(ini.render.font, ini.render.height, ini.render.flags)
	while true do
		wait(0)
		server = sampGetCurrentServerName()
		imgui.Process = window.v
		if server:find('Evolve%-Rp%.Ru') then
			if RenderActive.v then
				if (not materials or not drugs) and not checkstats then
					UpdateStats()
				else
					local text = 
					RenderMinimalistic.v and 
						string.format('M: {993066}%s\n{FFFFFF}D: {993066}%s', RenderNeed.v and string.format('%s (%s)', materials, MaterialsNeed) or materials, RenderNeed.v and string.format('%s (%s)', drugs, DrugsNeed) or drugs) 
					or 
						string.format('Материалов: {993066}%s\n{FFFFFF}Наркотиков: {993066}%s', RenderNeed.v and string.format('%s (%s)', materials, MaterialsNeed) or materials, RenderNeed.v and string.format('%s (%s)', drugs, DrugsNeed) or drugs)

					if changepos then
						showCursor(true, true)
						local X, Y = getCursorPos()
						renderFontDrawText(font, text, X, Y, -1)
						if isKeyJustPressed(13) then
							RenderPos = {X, Y}
							changepos = false
							showCursor(false, false)
							window.v = true
							sampAddChatMessage('[Gang Helper] {FFFFFF}Вы изменили положение рендера. Не забудьте {FFFF00}сохранить {FFFFFF}настройки', 0x993066)
						end
					else
						renderFontDrawText(font, text, RenderPos[1], RenderPos[2], -1)
					end
				end
			end
			if AutoGetGuns then
				printStringNow('Auto Get Guns: ~p~waiting...~n~~w~Need to take: ~p~'..tostring(MaterialsNeed), 1000)
				if MaterialsNeed == 0 then
					sampAddChatMessage('[Gang Helper] {FFFFFF}Вам не требуются материалы', 0x993066)
					AutoGetGuns = false
				end
			end
		end
		--[[for i = 0, 4000 do
			if sampTextdrawIsExists(i) then
				local model, rotX, rotY, rotZ, zoom, clr1, clr2 = sampTextdrawGetModelRotationZoomVehColor(i)
				local X, Y = sampTextdrawGetPos(i)
				X, Y = convertGameScreenCoordsToWindowScreenCoords(X, Y)
				renderFontDrawText(font, tostring(i..(model ~= 0 and '\n{eb0c69}'..model or '')), X, Y, -1)
			end
		end]]
	end
end

function imgui.OnDrawFrame()
	local X, Y = getScreenResolution()
	imgui.SetNextWindowSize(imgui.ImVec2(310, 375), imgui.Cond.FirstUseEver)
	imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.Begin('Gang Helper', window, imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize + imgui.WindowFlags.NoScrollbar)
		imgui.PushItemWidth(45)
		imgui.InputInt(u8'Максимальное кол-во материалов', MaxMaterials, 0, 0)
		imgui.InputInt(u8'Максимальное кол-во наркотиков', MaxDrugs, 0, 0)
		imgui.PopItemWidth()
		imgui.Checkbox(u8'Отображать материалы и наркотики', RenderActive)
		if RenderActive.v then
			imgui.NewLine() imgui.SameLine(20)
			if imgui.Button(u8'Изменить положение', imgui.ImVec2(-1, 0)) then
				changepos = true
				window.v = false
				sampAddChatMessage('[Gang Helper]: {FFFFFF}Для сохранения положения нажмите {FFFF00}Enter', 0x993066)
			end
			imgui.NewLine() imgui.SameLine(20)
			imgui.Checkbox(u8'Отображать сколько осталось максимума', RenderNeed)
			imgui.NewLine() imgui.SameLine(20)
			imgui.Checkbox(u8'Минималистичный рендер', RenderMinimalistic)
			imgui.NewLine() imgui.SameLine(20)
			imgui.PushItemWidth(160)
			if imgui.InputText(u8'Шрифт', RenderFont) then
				font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
			end
			imgui.PopItemWidth()
			imgui.NewLine() imgui.SameLine(20)
			imgui.PushItemWidth(78)
			if imgui.InputInt(u8'Размер шрифта', RenderHeight) then
				font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
			end
			imgui.NewLine() imgui.SameLine(20)
			if imgui.InputInt(u8'Стиль шрифта', RenderFlags) then
				font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
			end
			imgui.PopItemWidth()
		end
		imgui.PushItemWidth(90)
		imgui.InputInt(u8'Задержка авто /get guns (мс)', AutoGetGunsDelay)
		imgui.InputInt(u8'Задержка флудера (мс)', CaptureDelay)
		imgui.PopItemWidth()
		imgui.Checkbox(u8'Блокировать чат во время работы флудера', ChatFilter)
		imgui.Checkbox(u8'Прописывать /mask автоматически (/'..ini.config.FastMaskCommand..')', WearMask)
		imgui.PushItemWidth(100)
		imgui.InputText(u8'Команда настроек', SettingsCommand)
		imgui.InputText(u8'Команда авто-маски', FastMaskCommand)
		imgui.InputText(u8'Команда авто /get guns', AutoGetGunsCommand)
		imgui.InputText(u8'Команда быстрого /get guns', FastGetGunsCommand)
		imgui.InputText(u8'Команда флудера', CaptureFlooderCommand)
		imgui.InputText(u8'Команда быстрой загрузки на LSA', FastLSACommand)
		imgui.PopItemWidth()
		if imgui.Button(u8'Сохранить настройки', imgui.ImVec2(-1, 25)) then
			ini.config.MaxMaterials = MaxMaterials.v
			ini.config.CaptureDelay = CaptureDelay.v
			ini.config.AutoGetGunsDelay = AutoGetGunsDelay.v
			ini.config.ChatFilter = ChatFilter.v
			ini.config.WearMask = WearMask.v
			ini.config.SettingsCommand = SettingsCommand.v
			ini.config.FastMaskCommand = FastMaskCommand.v
			ini.config.CaptureFlooderCommand = CaptureFlooderCommand.v
			ini.config.AutoGetGunsCommand = AutoGetGunsCommand.v
			ini.config.FastGetGunsCommand = FastGetGunsCommand.v
			ini.config.FastLSACommand = FastLSACommand.v

			ini.render.active = RenderActive.v
			ini.render.need = RenderNeed.v
			ini.render.minimalistic = RenderMinimalistic.v
			ini.render.x = RenderPos[1]
			ini.render.y = RenderPos[2]
			ini.render.font = RenderFont.v
			ini.render.height = RenderHeight.v
			ini.render.flags = RenderFlags.v

			if inicfg.save(ini, iniFile) then
				sampAddChatMessage('[Gang Helper] {FFFFFF}Настройки успешно сохранены. Перезапуск скрипта...', 0x993066)
				showCursor(false)
				thisScript():reload()
			else
				sampAddChatMessage('[Gang Helper] {FF0000}Произошла ошибка сохранения настроек', 0x993066)
			end
		end
		imgui.SetCursorPosX((imgui.GetWindowSize().x-imgui.CalcTextSize('by CaJlaT').x)/2)
		imgui.TextDisabled('by CaJlaT')
	imgui.End()
end

local models = {19036, 19037, 19038, 18911, 18912, 18913, 18914, 18915, 18916, 18917, 18918, 18919, 18920, 11704}
function samp.onShowTextDraw(id, data)
	if not server:find('Evolve%-Rp%.Ru') then return true end
	if fmask then
		for i, v in ipairs(models) do
			if data.modelId == v then
				sampSendClickTextdraw(id)
				find = true
				return true
			end
		end
		if id == 2183 and not find then
			if data.text == '1' then
				sampSendClickTextdraw(2184)
			elseif data.text == '2' then
				sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, у вас нет маски', 0x993066)
				sampSendClickTextdraw(90)
				fmask = false
			end
		end
	end
end

function samp.onSendSpawn()
	if not server:find('Evolve%-Rp%.Ru') then return true end
	lua_thread.create(function() wait(0) UpdateStats() end)
end

function samp.onShowDialog(id, s, t, b1, b2 ,text)
	if not server:find('Evolve%-Rp%.Ru') then return true end
	if id == 24700 and fmask then
		if text:find('Надеть') then
			sampSendDialogResponse(id, 1, 1, _)
		else
			sampSendDialogResponse(id, 0, 0, _)
		end
		sampSendClickTextdraw(90)
		fmask = false
		if WearMask.v then lua_thread.create(function() wait(700) sampSendChat('/mask') end) end -- Я рот ебал кд на команды кста
		return false
	end
	if id == 9901 then
		if text:find('Наркотики.-(%d+).-Материалы.-(%d+)') then
			drugs, materials = text:match('Наркотики.-(%d+).-Материалы.-(%d+)')
			MaterialsNeed = MaxMaterials.v - materials
			DrugsNeed = MaxDrugs.v - drugs
			if checkstats then
				sampSendDialogResponse(id, 0, _, _)
				checkstats = false
				return false
			end
		end
	end
end

function samp.onServerMessage(color, text)
	if not server:find('Evolve%-Rp%.Ru') then return true end
	if text:find('^ Сначала нужно надеть маску') then
		lua_thread.create(function()
			wait(500)
			fastMask()
		end)
	end
	if text:find('Открыл %{......%}доступ к складу') and AutoGetGuns then
		lua_thread.create(function()
			wait(AutoGetGunsDelay.v) -- Я рот ебал кд на команды кста
			sampSendChat('/get guns '..MaterialsNeed)
			AutoGetGuns = false
		end)
	end
	if text:find('^ Осталось материалов: (%d+)') then
		materials = text:match('^ Осталось материалов: (%d+)')
		MaterialsNeed = MaxMaterials.v - materials
	end
	if text:find('^ %(%( Остаток: (%d+) грамм %)%)') then
		drugs = text:match('^ %(%( Остаток: (%d+) грамм %)%)')
		DrugsNeed = MaxDrugs.v - drugs
	end
	if text:find('^ У вас (%d+)/%d+ материалов с собой') then
		materials = text:match('^ У вас (%d+)/%d+ материалов с собой')
		MaterialsNeed = MaxMaterials.v - materials
	end
	if text:find('У вас есть (%d+)/%d+ грамм') then
		drugs = text:match('У вас есть (%d+)/%d+ грамм')
		DrugsNeed = MaxDrugs.v - drugs
	end
	if text:find('^ Вы взяли несколько комплектов') then
		lua_thread.create(function()
			wait(0)
			UpdateStats()
		end)
	end
	if text:find('^ Фургон заполнен') and flsa then
		flsa = false
	end
	if FlooderActive then
		if text:find('спровоцировала войну') and color == 12145578 then 
			FlooderActive = false
			printStringNow('Flooder: ~p~OFF', 2000)
		end
		if text:find('Нападаемая банда уже воюет') and color == -1263159297 then
			FlooderActive = false
			printStringNow('Flooder: ~p~OFF', 2000)
		end 
		if ChatFilter.v and color ~= -1347440726 then return false end
	end
end

function fastMask()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	fmask = true
	find = false
	sampSendChat('/items')
end

function UpdateStats()
	checkstats = true
	sampSendChat('/stats')
end

function flooder()
	FlooderActive = not FlooderActive
	while FlooderActive do
		printStringNow('Flooder: ~p~ON', CaptureDelay.v+1000)
		sampSendChat('/capture')
		wait(CaptureDelay.v)
	end
	printStringNow('Flooder: ~p~OFF', 2000)
end

function purple_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 10
	style.ChildWindowRounding = 10
	style.FrameRounding = 6.0
	style.ItemSpacing = imgui.ImVec2(9.0, 3.0)
	style.ItemInnerSpacing = imgui.ImVec2(3.0, 3.0)
	style.IndentSpacing = 21
	style.ScrollbarSize = 10.0
	style.ScrollbarRounding = 13
	style.GrabMinSize = 17.0
	style.GrabRounding = 16.0

	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.FrameBg]                = ImVec4(0.46, 0.11, 0.29, 1.00)
	colors[clr.FrameBgHovered]         = ImVec4(0.69, 0.16, 0.43, 1.00)
	colors[clr.FrameBgActive]          = ImVec4(0.58, 0.10, 0.35, 1.00)
	colors[clr.TitleBg]                = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.61, 0.16, 0.39, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.CheckMark]              = ImVec4(0.94, 0.30, 0.63, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.85, 0.11, 0.49, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.89, 0.24, 0.58, 1.00)
	colors[clr.Button]                 = ImVec4(0.46, 0.11, 0.29, 1.00)
	colors[clr.ButtonHovered]          = ImVec4(0.69, 0.17, 0.43, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.59, 0.10, 0.35, 1.00)
	colors[clr.Header]                 = ImVec4(0.46, 0.11, 0.29, 1.00)
	colors[clr.HeaderHovered]          = ImVec4(0.69, 0.16, 0.43, 1.00)
	colors[clr.HeaderActive]           = ImVec4(0.58, 0.10, 0.35, 1.00)
	colors[clr.Separator]              = ImVec4(0.69, 0.16, 0.43, 1.00)
	colors[clr.SeparatorHovered]       = ImVec4(0.58, 0.10, 0.35, 1.00)
	colors[clr.SeparatorActive]        = ImVec4(0.58, 0.10, 0.35, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.46, 0.11, 0.29, 0.70)
	colors[clr.ResizeGripHovered]      = ImVec4(0.69, 0.16, 0.43, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.70, 0.13, 0.42, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.78, 0.90, 0.35)
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.60, 0.19, 0.40, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.Border]                 = ImVec4(0.49, 0.14, 0.31, 1.00)
    colors[clr.BorderShadow]           = ImVec4(0.49, 0.14, 0.31, 0.00)
	colors[clr.MenuBarBg]              = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CloseButton]            = ImVec4(0.20, 0.20, 0.20, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
purple_style()