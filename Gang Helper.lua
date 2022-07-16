script_author('CaJlaT')
script_name('Gang Helper')
script_version('2.0')

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
		DeleteUselessWeapon = false,
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
	},
	DNKH = {
		active = false,
		GetDeagle = 'vd',
		PutDeagle = 'pd',
		GetShotgun = 'vs',
		PutShotgun = 'ps',
		GetM4 = 'vm4',
		PutM4 = 'pm4',
		GetMaterials = 'vm',
		PutMaterials = 'pm',
		GetDrugs = 'vn',
		PutDrugs = 'pn'
	}
}, iniFile)
if not doesDirectoryExist(getWorkingDirectory().."\\config") then createDirectory(getWorkingDirectory().."\\config") end
inicfg.save(ini, iniFile)
local window = imgui.ImBool(false)
local tab = 1

local SettingsCommand = imgui.ImBuffer(ini.config.SettingsCommand, 16)
local FastMaskCommand = imgui.ImBuffer(ini.config.FastMaskCommand, 16)
local CaptureFlooderCommand = imgui.ImBuffer(ini.config.CaptureFlooderCommand, 16)
local FastGetGunsCommand = imgui.ImBuffer(ini.config.FastGetGunsCommand, 16)
local AutoGetGunsCommand = imgui.ImBuffer(ini.config.AutoGetGunsCommand, 16)
local FastLSACommand = imgui.ImBuffer(ini.config.FastLSACommand, 16)

local ActiveDNKH = imgui.ImBool(ini.DNKH.active)
local GetDeagle = imgui.ImBuffer(ini.DNKH.GetDeagle, 16)
local PutDeagle = imgui.ImBuffer(ini.DNKH.PutDeagle, 16)
local GetShotgun = imgui.ImBuffer(ini.DNKH.GetShotgun, 16)
local PutShotgun = imgui.ImBuffer(ini.DNKH.PutShotgun, 16)
local GetM4 = imgui.ImBuffer(ini.DNKH.GetM4, 16)
local PutM4 = imgui.ImBuffer(ini.DNKH.PutM4, 16)
local GetMaterials = imgui.ImBuffer(ini.DNKH.GetMaterials, 16)
local PutMaterials = imgui.ImBuffer(ini.DNKH.PutMaterials, 16)
local GetDrugs = imgui.ImBuffer(ini.DNKH.GetDrugs, 16)
local PutDrugs = imgui.ImBuffer(ini.DNKH.PutDrugs, 16)

local MaxMaterials = imgui.ImInt(ini.config.MaxMaterials)
local MaxDrugs = imgui.ImInt(ini.config.MaxDrugs)
local AutoGetGunsDelay = imgui.ImInt(ini.config.AutoGetGunsDelay)
local CaptureDelay = imgui.ImInt(ini.config.CaptureDelay)
local ChatFilter = imgui.ImBool(ini.config.ChatFilter)
local WearMask = imgui.ImBool(ini.config.WearMask)
local DeleteUselessWeapon = imgui.ImBool(ini.config.DeleteUselessWeapon)

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
	sampAddChatMessage('[Gang Helper] {FFFFFF}Скрипт успешно загружен, версия: {993066}'..thisScript().version..'{FFFFFF}. Настройки: {993066}/'..ini.config.SettingsCommand, 0x993066)
	sampAddChatMessage('[Gang Helper] {FFFFFF}Автор скрипта: {993066}CaJlaT', 0x993066)
	sampRegisterChatCommand(ini.config.SettingsCommand, settings)
	sampRegisterChatCommand(ini.config.FastMaskCommand, fastMask)
	sampRegisterChatCommand(ini.config.AutoGetGunsCommand, AGGCMD)
	sampRegisterChatCommand(ini.config.CaptureFlooderCommand, flooder)
	sampRegisterChatCommand(ini.config.FastGetGunsCommand, fastGetGuns)
	sampRegisterChatCommand(ini.config.FastLSACommand, fastLSA)
	UpdateDNKH()
	if ActiveDNKH.v then
		for i, v in ipairs(CommandsDNKH) do
			sampRegisterChatCommand(v[1], v[2])
		end
	end


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
						string.format('M: {993066}%s\n{FFFFFF}D: {993066}%s', RenderNeed.v and string.format('%s (%s)', materials, ((MaterialsNeed and MaterialsNeed > 0) and MaterialsNeed or 'MAX')) or materials, RenderNeed.v and string.format('%s (%s)', drugs, ((DrugsNeed and DrugsNeed > 0) and DrugsNeed or 'MAX')) or drugs) 
					or 
						string.format('Материалов: {993066}%s\n{FFFFFF}Наркотиков: {993066}%s', RenderNeed.v and string.format('%s (%s)', materials, ((MaterialsNeed and MaterialsNeed > 0) and MaterialsNeed or 'MAX')) or materials, RenderNeed.v and string.format('%s (%s)', drugs, ((DrugsNeed and DrugsNeed > 0) and DrugsNeed or 'MAX')) or drugs)

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
			if DeleteUselessWeapon.v then
				local weapon = getCurrentCharWeapon(PLAYER_PED)
				if weapon == 2 or weapon == 5 or weapon == 7 or weapon == 8 then
					removeWeaponFromChar(PLAYER_PED, weapon)
				end
			end
		end
	end
end

function imgui.OnDrawFrame()
	local X, Y = getScreenResolution()
	imgui.SetNextWindowSize(imgui.ImVec2(445, 370), imgui.Cond.FirstUseEver)
	imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	imgui.Begin('Gang Helper', window, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollbar)
		if imgui.Button(u8'Команды', imgui.ImVec2(100, 30)) then tab = 1 end
		imgui.SameLine()
		if imgui.Button(u8'Рендер', imgui.ImVec2(100, 30)) then tab = 2 end
		imgui.SameLine()
		if imgui.Button(u8'Дом на колёсах', imgui.ImVec2(100, 30)) then tab = 3 end
		imgui.SameLine()
		if imgui.Button(u8'Прочее', imgui.ImVec2(100, 30)) then tab = 4 end
		imgui.Separator()
		imgui.BeginChild('##main', imgui.ImVec2(430, 335))
			if tab == 1 then
				imgui.PushItemWidth(100)
				imgui.InputText(u8'Настройки', SettingsCommand)
				imgui.InputText(u8'Авто-маска', FastMaskCommand)
				imgui.InputText(u8'Автоматический /get guns', AutoGetGunsCommand)
				imgui.InputText(u8'Быстрый /get guns', FastGetGunsCommand)
				imgui.InputText(u8'Флудер /capture', CaptureFlooderCommand)
				imgui.InputText(u8'Быстрая загрузка фуры на LSA', FastLSACommand)
				imgui.PopItemWidth()
			elseif tab == 2 then
				imgui.Checkbox(u8'Отображать материалы и наркотики', RenderActive)
				if RenderActive.v then
					if imgui.Button(u8'Изменить положение', imgui.ImVec2(-1, 0)) then
						if not server:find('Evolve%-Rp%.Ru') then
							sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066)
						else
							changepos = true
							window.v = false
							sampAddChatMessage('[Gang Helper]: {FFFFFF}Для сохранения положения нажмите {FFFF00}Enter', 0x993066)
						end
					end
					imgui.Checkbox(u8'Отображать сколько осталось до максимума', RenderNeed)
					imgui.Checkbox(u8'Минималистичный рендер', RenderMinimalistic)
					imgui.PushItemWidth(160)
					if imgui.InputText(u8'Шрифт', RenderFont) then
						font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
					end
					imgui.PopItemWidth()
					imgui.PushItemWidth(78)
					if imgui.InputInt(u8'Размер шрифта', RenderHeight) then
						font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
					end
					if imgui.InputInt(u8'Стиль шрифта', RenderFlags) then
						font = renderCreateFont(RenderFont.v, RenderHeight.v, RenderFlags.v)
					end
					imgui.PopItemWidth()
				end
			elseif tab == 3 then
				imgui.Checkbox(u8'Включить хелпер для дома на колёсах', ActiveDNKH)
				if ActiveDNKH.v then
					imgui.PushItemWidth(100)
					imgui.InputText(u8'Взять Deagle', GetDeagle)
					imgui.InputText(u8'Положить Deagle', PutDeagle)
					imgui.InputText(u8'Взять Shotgun', GetShotgun)
					imgui.InputText(u8'Положить Shotgun', PutShotgun)
					imgui.InputText(u8'Взять M4', GetM4)
					imgui.InputText(u8'Положить M4', PutM4)
					imgui.InputText(u8'Взять материалы до максимума', GetMaterials)
					imgui.InputText(u8'Положить материалы', PutMaterials)
					imgui.InputText(u8'Взять наркотики до максимума', GetDrugs)
					imgui.InputText(u8'Положить наркотики', PutDrugs)
					imgui.PopItemWidth()
				end
			elseif tab == 4 then
				imgui.PushItemWidth(45)
				imgui.InputInt(u8'Максимальное кол-во материалов', MaxMaterials, 0, 0)
				imgui.InputInt(u8'Максимальное кол-во наркотиков', MaxDrugs, 0, 0)
				imgui.PopItemWidth()
				imgui.PushItemWidth(90)
				imgui.InputInt(u8'Задержка авто /get guns (мс)', AutoGetGunsDelay)
				imgui.InputInt(u8'Задержка флудера (мс)', CaptureDelay)
				imgui.PopItemWidth()
				imgui.Checkbox(u8'Блокировать чат во время работы флудера', ChatFilter)
				imgui.Checkbox(u8'Прописывать /mask автоматически (/'..ini.config.FastMaskCommand..')', WearMask)
				imgui.Checkbox(u8'Удалять оружие ближнего боя', DeleteUselessWeapon)
			end
			imgui.SetCursorPos(imgui.ImVec2(188, 255))
			imgui.TextDisabled('by CaJlaT')
			if imgui.Button(u8'Сохранить настройки', imgui.ImVec2(-1, 25)) then
				sampUnregisterChatCommand(ini.config.SettingsCommand)
				sampUnregisterChatCommand(ini.config.FastMaskCommand)
				sampUnregisterChatCommand(ini.config.AutoGetGunsCommand)
				sampUnregisterChatCommand(ini.config.CaptureFlooderCommand)
				sampUnregisterChatCommand(ini.config.FastGetGunsCommand)
				sampUnregisterChatCommand(ini.config.FastLSACommand)
				for i, v in ipairs(CommandsDNKH) do
					sampUnregisterChatCommand(v[1])
				end
				updateIni()
				UpdateDNKH()
				sampRegisterChatCommand(ini.config.SettingsCommand, settings)
				sampRegisterChatCommand(ini.config.FastMaskCommand, fastMask)
				sampRegisterChatCommand(ini.config.AutoGetGunsCommand, AGGCMD)
				sampRegisterChatCommand(ini.config.CaptureFlooderCommand, flooder)
				sampRegisterChatCommand(ini.config.FastGetGunsCommand, fastGetGuns)
				sampRegisterChatCommand(ini.config.FastLSACommand, fastLSA)
				if ActiveDNKH.v then
					for i, v in ipairs(CommandsDNKH) do
						sampRegisterChatCommand(v[1], v[2])
					end
				end
				sampAddChatMessage('[Gang Helper] {FFFFFF}Настройки успешно сохранены.', 0x993066)
			end
		imgui.EndChild()
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
		if WearMask.v then lua_thread.create(function() wait(888) sampSendChat('/mask') end) end -- Я рот ебал кд на команды кста
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
			wait(888)
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
	if text:find('^%s*Вы положили материалы в сейф') or text:find('^%s*Вы взяли патроны из сейфа') or text:find('^%s*Вы взяли материалы из сейфа') then
		lua_thread.create(function()
			wait(888) -- Кд на команды
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

function UpdateStats()
	checkstats = true
	sampSendChat('/stats')
end

function onScriptTerminate(script, quitGame)
	if script == thisScript() then updateIni() end
end

function updateIni()
	ini.config.MaxMaterials = MaxMaterials.v
	ini.config.MaxDrugs = MaxDrugs.v
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
	ini.config.DeleteUselessWeapon = DeleteUselessWeapon.v

	ini.render.active = RenderActive.v
	ini.render.need = RenderNeed.v
	ini.render.minimalistic = RenderMinimalistic.v
	ini.render.x = RenderPos[1]
	ini.render.y = RenderPos[2]
	ini.render.font = RenderFont.v
	ini.render.height = RenderHeight.v
	ini.render.flags = RenderFlags.v
	
	ini.DNKH.active = ActiveDNKH.v
	ini.DNKH.GetDeagle = GetDeagle.v
	ini.DNKH.PutDeagle = PutDeagle.v
	ini.DNKH.GetShotgun = GetShotgun.v
	ini.DNKH.PutShotgun = PutShotgun.v
	ini.DNKH.GetM4 = GetM4.v
	ini.DNKH.PutM4 = PutM4.v
	ini.DNKH.GetMaterials = GetMaterials.v
	ini.DNKH.PutMaterials = PutMaterials.v
	ini.DNKH.GetDrugs = GetDrugs.v
	ini.DNKH.PutDrugs = PutDrugs.v

	inicfg.save(ini, iniFile)
end

-- Команды
function UpdateDNKH()
CommandsDNKH = {
	{ini.DNKH.GetDeagle, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.GetDeagle..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 0)
		sampSendDialogResponse(2053, 1, 5)
		sampSendDialogResponse(2061, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.PutDeagle, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.PutDeagle..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 1)
		sampSendDialogResponse(2052, 1, 5)
		sampSendDialogResponse(2072, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.GetShotgun, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.GetShotgun..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 0)
		sampSendDialogResponse(2053, 1, 6)
		sampSendDialogResponse(2062, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.PutShotgun, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.PutShotgun..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 1)
		sampSendDialogResponse(2052, 1, 6)
		sampSendDialogResponse(2073, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.GetM4, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.GetM4..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 0)
		sampSendDialogResponse(2053, 1, 9)
		sampSendDialogResponse(2065, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.PutM4, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.PutM4..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 1)
		sampSendDialogResponse(2052, 1, 9)
		sampSendDialogResponse(2076, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.GetDrugs, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not DrugsNeed or DrugsNeed <= 0 then sampAddChatMessage('[GangHelper] {FF0000}Ошибка, вам не нужны наркотики', 0x993066) UpdateStats() return end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 0)
		sampSendDialogResponse(2053, 1, 1)
		sampSendDialogResponse(2057, 1, 0, DrugsNeed)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.PutDrugs, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.PutDrugs..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 1)
		sampSendDialogResponse(2052, 1, 1)
		sampSendDialogResponse(2068, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.GetMaterials, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not MaterialsNeed or MaterialsNeed <= 0 then sampAddChatMessage('[GangHelper] {FF0000}Ошибка, вам не нужны материалы', 0x993066) UpdateStats() return end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 0)
		sampSendDialogResponse(2053, 1, 0)
		sampSendDialogResponse(2056, 1, 0, MaterialsNeed)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end},
	{ini.DNKH.PutMaterials, function(arg)
		if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
		if not ActiveDNKH.v then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, у вас выключен хелпер для дома на колёсах', 0x993066) end
		if not tonumber(arg) then return sampAddChatMessage('[GangHelper] {FF0000}Ошибка, используйте /'..ini.DNKH.PutMaterials..' [кол-во]', 0x993066) end
		sampSendChat("/safe")
		sampSendDialogResponse(2054, 1, 1)
		sampSendDialogResponse(2052, 1, 0)
		sampSendDialogResponse(2067, 1, 0, arg)
		lua_thread.create(function()
			while not sampIsDialogActive() do wait(0) end
			sampCloseCurrentDialogWithButton(1)
		end)
	end}
}
end

function settings() window.v = not window.v end

function fastMask()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	fmask = true
	find = false
	sampSendChat('/items')
end
function AGGCMD()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	UpdateStats()
	AutoGetGuns = not AutoGetGuns
end

function flooder()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	lua_thread.create(function()
		FlooderActive = not FlooderActive
		while FlooderActive do
			printStringNow('Flooder: ~p~ON', CaptureDelay.v+1000)
			sampSendChat('/capture')
			wait(CaptureDelay.v)
		end
		printStringNow('Flooder: ~p~OFF', 2000)
	end)
end

function fastGetGuns()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	if not MaterialsNeed or MaterialsNeed == 0 then
		sampAddChatMessage('[Gang Helper] {FFFFFF}Вам не требуются материалы', 0x993066)
		UpdateStats()
		return
	end
	sampSendChat('/get guns '..MaterialsNeed)
end

function fastLSA()
	if not server:find('Evolve%-Rp%.Ru') then return sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, скрипт работает только на серверах Evolve-Rp', 0x993066) end
	flsa = not flsa
	lua_thread.create(function()
		while flsa do
			printStringNow('Fast LSA: ~p~ON', 1000)
			if isCharInAnyCar(PLAYER_PED) then
				sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, нельзя использовать скрипт в машине!', 0x993066)
				flsa = false
				printStringNow('Fast LSA: ~p~OFF', 1000)
				return
			end
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
					local check = isLineOfSightClear(mx, my, mz, px, py, pz, true, false, false, false, false)
					if distance_to_pickup < 5 and pickup_model == 2358 and check then
						pickup = i
					end
				end
			end
			if pickup then
				sampSendPickedUpPickup(pickup)
				sampSendChat('/materials put')
				wait(888) -- кд на команды
			else
				sampAddChatMessage('[Gang Helper] {FF0000}Ошибка, не удалось найти нужный пикап! Попробуйте подойти ближе.', 0x993066)
				flsa = false
			end
			wait(0)
		end
		printStringNow('Fast LSA: ~p~OFF', 1000)
	end)
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