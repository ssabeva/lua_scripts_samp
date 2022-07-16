script_author('KatranLife and AndY')

local sampev = require 'samp.events'
local imgui = require 'imgui'
local encoding = require 'encoding'
local inicfg = require 'inicfg'

encoding.default = 'CP1251'
u8 = encoding.UTF8

local imgState = imgui.ImBool(false)
local imgClickInfState = imgui.ImBool(false)
local imgSliderInfFov = imgui.ImFloat(0.0)
local imgClickInfAng = imgui.ImBool(false)
local imgClickInfObj = imgui.ImBool(false)
local imgClickInfVeh = imgui.ImBool(false)
local imgClickInfLine = imgui.ImBool(false)
local imgSliderInfBlood = imgui.ImFloat(0.0)
local imgSliderInfRand = imgui.ImFloat(0.0)
local imgClickinfCust = imgui.ImBool(false)
local imgClickinfClist = imgui.ImBool(false)

local imgClickinfKey2 = imgui.ImBool(false)
local imgClickinfKey3 = imgui.ImBool(false)
local imgClickinfKeyQ = imgui.ImBool(false)
local imgClickinfKeyE = imgui.ImBool(false)
local imgClickinfKeyX = imgui.ImBool(false)

local imgClickinfTorso = imgui.ImBool(false)
local imgClickinfGroin = imgui.ImBool(false)
local imgClickinfHead = imgui.ImBool(false)

local arrFriends = {}
local imgSliderInfFovN = { imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0) }
local imgSliderInfRandN = { imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0), imgui.ImFloat(0.0) }

local config = inicfg.load({settings =
{
    infState = imgClickInfState.v,
    infFov = imgSliderInfFov.v,
    infAng = imgClickInfAng.v,
    infObj = imgClickInfObj.v,
	infVeh = imgClickInfVeh.v,
	infLine = imgClickInfLine.v,
	infBlood = imgSliderInfBlood.v,
	infRand = imgSliderInfRand.v,
	infCust = imgClickinfCust.v,
	infClist = imgClickinfClist.v,
	
	infKey2 = imgClickinfKey2.v,
	infKey3 = imgClickinfKey3.v,
	infKeyQ = imgClickinfKeyQ.v,
	infKeyE = imgClickinfKeyE.v,
	infKeyX = imgClickinfKeyX.v,
	
	infTorso = imgClickinfTorso.v,
	infGroin = imgClickinfGroin.v,
	infHead = imgClickinfHead.v,
	
	infFovN1 = imgSliderInfFovN[1].v,
	infFovN2 = imgSliderInfFovN[2].v,
	infFovN3 = imgSliderInfFovN[3].v,
	infFovN4 = imgSliderInfFovN[4].v,
	infFovN5 = imgSliderInfFovN[5].v,
	infFovN6 = imgSliderInfFovN[6].v,
	infFovN7 = imgSliderInfFovN[7].v,
	infFovN8 = imgSliderInfFovN[8].v,
	infFovN9 = imgSliderInfFovN[9].v,
	infFovN10 = imgSliderInfFovN[10].v,
	infFovN11 = imgSliderInfFovN[11].v,
	infFovN12 = imgSliderInfFovN[12].v,
	infFovN13 = imgSliderInfFovN[13].v,
	infFovN14 = imgSliderInfFovN[14].v,
	
	infRandN1 = imgSliderInfRandN[1].v,
	infRandN2 = imgSliderInfRandN[2].v,
	infRandN3 = imgSliderInfRandN[3].v,
	infRandN4 = imgSliderInfRandN[4].v,
	infRandN5 = imgSliderInfRandN[5].v,
	infRandN6 = imgSliderInfRandN[6].v,
	infRandN7 = imgSliderInfRandN[7].v,
	infRandN8 = imgSliderInfRandN[8].v,
	infRandN9 = imgSliderInfRandN[9].v,
	infRandN10 = imgSliderInfRandN[10].v,
	infRandN11 = imgSliderInfRandN[11].v,
	infRandN12 = imgSliderInfRandN[12].v,
	infRandN13 = imgSliderInfRandN[13].v,
	infRandN14 = imgSliderInfRandN[14].v
}})

function LoadSettings()
	local file = inicfg.load(config, script.this.filename..'.ini')
	if file == nil then return end

	imgClickInfState.v = file.settings.infState
    imgSliderInfFov.v = file.settings.infFov
    imgClickInfAng.v = file.settings.infAng
    imgClickInfObj.v = not file.settings.infObj
    imgClickInfVeh.v = not file.settings.infVeh
	imgClickInfLine.v = file.settings.infLine
	imgSliderInfBlood.v = file.settings.infBlood
	imgSliderInfRand.v = file.settings.infRand
 	imgClickinfCust.v = file.settings.infCust
 	imgClickinfClist.v = file.settings.infClist
 	
	imgClickinfKey2.v = file.settings.infKey2
	imgClickinfKey3.v = file.settings.infKey3
	imgClickinfKeyQ.v = file.settings.infKeyQ
	imgClickinfKeyE.v = file.settings.infKeyE
 	imgClickinfKeyX.v = file.settings.infKeyX
 	
	imgClickinfTorso.v = file.settings.infTorso
	imgClickinfGroin.v = file.settings.infGroin
 	imgClickinfHead.v = file.settings.infHead
 	
  	imgSliderInfFovN[1].v = file.settings.infFovN1
	imgSliderInfFovN[2].v = file.settings.infFovN2
	imgSliderInfFovN[3].v = file.settings.infFovN3
	imgSliderInfFovN[4].v = file.settings.infFovN4
	imgSliderInfFovN[5].v = file.settings.infFovN5
	imgSliderInfFovN[6].v = file.settings.infFovN6
	imgSliderInfFovN[7].v = file.settings.infFovN7
	imgSliderInfFovN[8].v = file.settings.infFovN8
	imgSliderInfFovN[9].v = file.settings.infFovN9
	imgSliderInfFovN[10].v = file.settings.infFovN10
	imgSliderInfFovN[11].v = file.settings.infFovN11
	imgSliderInfFovN[12].v = file.settings.infFovN12
	imgSliderInfFovN[13].v = file.settings.infFovN13
	imgSliderInfFovN[14].v = file.settings.infFovN14

	imgSliderInfRandN[1].v = file.settings.infRandN1
	imgSliderInfRandN[2].v = file.settings.infRandN2
	imgSliderInfRandN[3].v = file.settings.infRandN3
	imgSliderInfRandN[4].v = file.settings.infRandN4
	imgSliderInfRandN[5].v = file.settings.infRandN5
	imgSliderInfRandN[6].v = file.settings.infRandN6
	imgSliderInfRandN[7].v = file.settings.infRandN7
	imgSliderInfRandN[8].v = file.settings.infRandN8
	imgSliderInfRandN[9].v = file.settings.infRandN9
	imgSliderInfRandN[10].v = file.settings.infRandN10
	imgSliderInfRandN[11].v = file.settings.infRandN11
	imgSliderInfRandN[12].v = file.settings.infRandN12
	imgSliderInfRandN[13].v = file.settings.infRandN13
	imgSliderInfRandN[14].v = file.settings.infRandN14
end

function SaveSettings()
	inicfg.save(config, script.this.filename..'.ini')
end

function DisableAllBody(tr, gr, hd)
    imgClickinfTorso.v = tr config.settings.infTorso = tr
	imgClickinfGroin.v = gr config.settings.infGroin = gr
 	imgClickinfHead.v = hd config.settings.infHead = hd
 	SaveSettings()
end

function DisableAllKey(k2, k3, kq, ke, kx)
	config.settings.infKey2 = k2 imgClickinfKey2.v = k2
	config.settings.infKey3 = k3 imgClickinfKey3.v = k3
	config.settings.infKeyQ = kq imgClickinfKeyQ.v = kq
	config.settings.infKeyE = ke imgClickinfKeyE.v = ke
	config.settings.infKeyX = kx imgClickinfKeyX.v = kx
	SaveSettings()
end

function imgui.OnDrawFrame()
	if imgState.v then
	    imgui.SetNextWindowPos(imgui.ImVec2(350.0, 250.0), imgui.Cond.FirstUseEver)
	    imgui.SetNextWindowSize(imgui.ImVec2(700.0, 450.0), imgui.Cond.FirstUseEver)
	    imgui.Begin(u8'[SilentAim] Настройки', imgState)
	    
	    if imgui.Checkbox(u8'Вкл/Выкл', imgClickInfState) then
	        tarPed = -1
			config.settings.infState = imgClickInfState.v
			SaveSettings()
		end
		if imgui.CollapsingHeader(u8'Вкл/Выкл по клавише') then
		    if imgui.Checkbox('2', imgClickinfKey2) then DisableAllKey(true, false, false, false, false) end
			if imgui.Checkbox('3', imgClickinfKey3) then DisableAllKey(false, true, false, false, false) end
			if imgui.Checkbox('Q', imgClickinfKeyQ) then DisableAllKey(false, false, true, false, false) end
			if imgui.Checkbox('E', imgClickinfKeyE) then DisableAllKey(false, false, false, true, false) end
			if imgui.Checkbox('X', imgClickinfKeyX) then DisableAllKey(false, false, false, false, true) end
		end
		if imgui.CollapsingHeader(u8'Части тела') then
		    if imgui.Checkbox(u8'Торс', imgClickinfTorso) then DisableAllBody(true, false, false) end
			if imgui.Checkbox(u8'Пах', imgClickinfGroin) then DisableAllBody(false, true, false) end
			if imgui.Checkbox(u8'Голова', imgClickinfHead) then DisableAllBody(false, false, true) end
		end
		imgui.Text('\n\n')
		
		if imgui.SliderFloat('Fov', imgSliderInfFov, 0.0, 80.0) then
			config.settings.infFov = imgSliderInfFov.v
			SaveSettings()
		end
		if imgui.SliderFloat('Hit', imgSliderInfRand, 0.0, 100.0) then
			config.settings.infRand = imgSliderInfRand.v
			SaveSettings()
		end
		imgui.Text('\n\n')
		
	    if imgui.Checkbox(u8'Доворот к игроку на синхре', imgClickInfAng) then
			config.settings.infAng = imgClickInfAng.v
			SaveSettings()
		end
		if imgui.Checkbox(u8'Игнорировать объекты', imgClickInfObj) then
			config.settings.infObj = not imgClickInfObj.v
			SaveSettings()
		end
		if imgui.Checkbox(u8'Игнорировать транспорт', imgClickInfVeh) then
			config.settings.infVeh = not imgClickInfVeh.v
			SaveSettings()
		end
		if imgui.Checkbox(u8'Игнорировать игроков с моим цветом', imgClickinfClist) then
			config.settings.infClist = imgClickinfClist.v
			SaveSettings()
		end
		if imgui.Checkbox(u8'Рисовать линии', imgClickInfLine) then
			config.settings.infLine = imgClickInfLine.v
			SaveSettings()
		end
		if imgui.SliderFloat(u8'Плотность крови', imgSliderInfBlood, 0.0, 100.0) then
			config.settings.infBlood = imgSliderInfBlood.v
			SaveSettings()
		end
		imgui.Text('\n\n')
		
		local text = u8'Чёрный список:'
		local count0 = 0
		local count1 = 10
		for i = 1, 200 do
	        if arrFriends[i] ~= nil then
				text = string.format('%s %i,', text, arrFriends[i])
				count0 = count0 + 1
				if count0 > count1 then
					text = string.format('%s\n', text)
					count1 = count1 * 2
				end
    	    end
		end
		if count ~= nil and count > 0 then
		    text = string.format('%s\n\n', text)
			imgui.Text(text)
		end
		
		if imgui.Checkbox(u8'Индивидуальный Fov/Hit', imgClickinfCust) then
			config.settings.infCust = imgClickinfCust.v
			SaveSettings()
		end
		if config.settings.infCust then
			if imgui.CollapsingHeader(GetWeaponName(22)) then
				if imgui.SliderFloat('Fov##'..1, imgSliderInfFovN[1], 0.0, 80.0) then config.settings.infFovN1 = imgSliderInfFovN[1].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..1, imgSliderInfRandN[1], 0.0, 100.0) then config.settings.infRandN1 = imgSliderInfRandN[1].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(23)) then
				if imgui.SliderFloat('Fov##'..2, imgSliderInfFovN[2], 0.0, 80.0) then config.settings.infFovN2 = imgSliderInfFovN[2].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..2, imgSliderInfRandN[2], 0.0, 100.0) then config.settings.infRandN2 = imgSliderInfRandN[2].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(24)) then
				if imgui.SliderFloat('Fov##'..3, imgSliderInfFovN[3], 0.0, 80.0) then config.settings.infFovN3 = imgSliderInfFovN[3].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..3, imgSliderInfRandN[3], 0.0, 100.0) then config.settings.infRandN3 = imgSliderInfRandN[3].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(25)) then
				if imgui.SliderFloat('Fov##'..4, imgSliderInfFovN[4], 0.0, 80.0) then config.settings.infFovN4 = imgSliderInfFovN[4].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..4, imgSliderInfRandN[4], 0.0, 100.0) then config.settings.infRandN4 = imgSliderInfRandN[4].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(26)) then
				if imgui.SliderFloat('Fov##'..5, imgSliderInfFovN[5], 0.0, 80.0) then config.settings.infFovN5 = imgSliderInfFovN[5].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..5, imgSliderInfRandN[5], 0.0, 100.0) then config.settings.infRandN5 = imgSliderInfRandN[5].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(27)) then
				if imgui.SliderFloat('Fov##'..6, imgSliderInfFovN[6], 0.0, 80.0) then config.settings.infFovN6 = imgSliderInfFovN[6].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..6, imgSliderInfRandN[6], 0.0, 100.0) then config.settings.infRandN6 = imgSliderInfRandN[6].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(28)) then
				if imgui.SliderFloat('Fov##'..7, imgSliderInfFovN[7], 0.0, 80.0) then config.settings.infFovN7 = imgSliderInfFovN[7].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..7, imgSliderInfRandN[7], 0.0, 100.0) then config.settings.infRandN7 = imgSliderInfRandN[7].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(29)) then
				if imgui.SliderFloat('Fov##'..8, imgSliderInfFovN[8], 0.0, 80.0) then config.settings.infFovN8 = imgSliderInfFovN[8].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..8, imgSliderInfRandN[8], 0.0, 100.0) then config.settings.infRandN8 = imgSliderInfRandN[8].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(30)) then
				if imgui.SliderFloat('Fov##'..9, imgSliderInfFovN[9], 0.0, 80.0) then config.settings.infFovN9 = imgSliderInfFovN[9].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..9, imgSliderInfRandN[9], 0.0, 100.0) then config.settings.infRandN9 = imgSliderInfRandN[9].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(31)) then
				if imgui.SliderFloat('Fov##'..10, imgSliderInfFovN[10], 0.0, 80.0) then config.settings.infFovN10 = imgSliderInfFovN[10].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..10, imgSliderInfRandN[10], 0.0, 100.0) then config.settings.infRandN10 = imgSliderInfRandN[10].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(32)) then
				if imgui.SliderFloat('Fov##'..11, imgSliderInfFovN[11], 0.0, 80.0) then config.settings.infFovN11 = imgSliderInfFovN[11].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..11, imgSliderInfRandN[11], 0.0, 100.0) then config.settings.infRandN11 = imgSliderInfRandN[11].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(33)) then
				if imgui.SliderFloat('Fov##'..12, imgSliderInfFovN[12], 0.0, 80.0) then config.settings.infFovN12 = imgSliderInfFovN[12].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..12, imgSliderInfRandN[12], 0.0, 100.0) then config.settings.infRandN12 = imgSliderInfRandN[12].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(34)) then
				if imgui.SliderFloat('Fov##'..13, imgSliderInfFovN[13], 0.0, 80.0) then config.settings.infFovN13 = imgSliderInfFovN[13].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..13, imgSliderInfRandN[13], 0.0, 100.0) then config.settings.infRandN13 = imgSliderInfRandN[13].v SaveSettings() end
			end
			if imgui.CollapsingHeader(GetWeaponName(38)) then
				if imgui.SliderFloat('Fov##'..14, imgSliderInfFovN[14], 0.0, 80.0) then config.settings.infFovN14 = imgSliderInfFovN[14].v SaveSettings() end
				if imgui.SliderFloat('Hit##'..14, imgSliderInfRandN[14], 0.0, 100.0) then config.settings.infRandN14 = imgSliderInfRandN[14].v SaveSettings() end
			end
		end
	    imgui.End()
	end
end

function main()
    if not isSampLoaded() or not isCleoLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(200) end
	
	LoadSettings()
	sampRegisterChatCommand('sadd', function(arg)
		if arg == nil then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /sadd [id]', -1) return end
	    local num = tonumber(arg)
		if num == nil then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /sadd [id]', -1) return end
	    if num < 0 or num > 999 then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /sadd [id]', -1) return end
		
		for i = 1, 200 do
	        if arrFriends[i] == num then
				sampAddChatMessage(string.format('{3E8BFE}[SilentAim] {FFFFFF}%i есть в чёрном списке', num), -1)
				return
	        end
        end
        for i = 1, 200 do
	        if arrFriends[i] == nil then
				arrFriends[i] = num
				sampAddChatMessage(string.format('{3E8BFE}[SilentAim] {FFFFFF}%i добавлен в чёрный список', num), -1)
				return
	        end
        end
        sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}чёрный список переполнен', -1)
		return
    end)
    sampRegisterChatCommand('srem', function(arg)
        if arg == nil then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /srem [id]', -1) return end
	    local num = tonumber(arg)
		if num == nil then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /srem [id]', -1) return end
	    if num < 0 or num > 999 then sampAddChatMessage('{3E8BFE}[SilentAim] {FFFFFF}используйте: /srem [id]', -1) return end
	    
        for i = 1, 200 do
	        if arrFriends[i] == num then
				arrFriends[i] = nil
				sampAddChatMessage(string.format('{3E8BFE}[SilentAim] {FFFFFF}%i удален из чёрного списка', num), -1)
				return
	        end
        end
		sampAddChatMessage(string.format('{3E8BFE}[SilentAim] {FFFFFF}%i не найден в чёрном списке', num), -1)
		return
    end)
    sampRegisterChatCommand('silent', function() imgState.v = not imgState.v end)
	
	while true do wait(10)
	    if sampIsDialogActive() == false and sampIsChatInputActive() == false and isPauseMenuActive() == false then
		    if config.settings.infKey2 and isKeyDown(50) then
				StartInKey()
				while isKeyDown(50) do wait(10) end
	        end
	        if config.settings.infKey3 and isKeyDown(51) then
	            StartInKey()
				while isKeyDown(51) do wait(10) end
	        end
	        if config.settings.infKeyQ and isKeyDown(233) then
	            StartInKey()
				while isKeyDown(233) do wait(10) end
	        end
	        if config.settings.infKeyE and isKeyDown(243) then
	            StartInKey()
				while isKeyDown(243) do wait(10) end
	        end
	        if config.settings.infKeyX and isKeyDown(247) then
	            StartInKey()
				while isKeyDown(247) do wait(10) end
	        end
		end
		imgui.Process = imgState.v
	end
end

function StartInKey()
    tarPed = -1
	config.settings.infState = not config.settings.infState
	imgClickInfState.v = config.settings.infState
	SaveSettings()
end

function sampev.onPlayerQuit(playerId, reason)
    for i = 1, 200 do
		if arrFriends[i] == playerId then
			arrFriends[i] = nil
			sampAddChatMessage(string.format('{3E8BFE}[SilentAim] {FFFFFF}%i удален из чёрного списка', playerId), -1)
			break
	    end
    end
end

function sampev.onSendPlayerSync(data)
	if config.settings.infState and config.settings.infAng and camMode == 53 and tarPed ~= -1 then
	local result, id = sampGetPlayerIdByCharHandle(tarPed)
	
	if result then
	    local posX, posY, posZ = getCharCoordinates(tarPed)
		local ang = getHeadingFromVector2d(posX - data.position.x, posY - data.position.y)
		local w, x, y, z = CalculateQuat(0.0, 0.0, ang)

		data.keysData = 2
		data.quaternion[0] = w
		data.quaternion[3] = -z
	end
	end
end

function sampev.onSendAimSync(data)
    camMode = data.camMode
	if config.settings.infState then
	
	local weap = getCurrentCharWeapon(PLAYER_PED)
	local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	
	if weap ~= nil and GetWeaponOkay(weap) and not isCharDead(PLAYER_PED) and not sampIsPlayerPaused(id) then
	    camX = data.camPos.x
		camY = data.camPos.y
		camZ = data.camPos.z
		
		frontX = data.camFront.x
		frontY = data.camFront.y
		frontZ = data.camFront.z
		CheckTarget()
	end
	end
end

function sampev.onSendBulletSync(data)
 	if config.settings.infState and tarPed ~= -1 and stopwork ~= 1 and data.targetType ~= 1 and data.weaponId ~= nil and GetWeaponOkay(data.weaponId) then
    local result, id = sampGetPlayerIdByCharHandle(tarPed)

	if result then
	    local respol = 0
	    if config.settings.infClist then
	        local _, mid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	 	    local color0 = sampGetPlayerColor(mid)
	 	    local color1 = sampGetPlayerColor(id)
	 	    if color0 ~= nil and color1 ~= nil and color0 == color1 then respol = 1 end
	 	end
	    for i = 1, 200 do
			if arrFriends[i] == id then respol = 1 end
	  	end
	    if respol == 0 then
			local posX, posY, posZ = getCharCoordinates(tarPed)
			local mposX, mposY, mposZ = getCharCoordinates(PLAYER_PED)
			
			local dist = getDistanceBetweenCoords3d(mposX, mposY, mposZ, posX, posY, posZ)
			local wdist = GetWeaponDist(data.weaponId)

            local rand = config.settings.infRand
		    if config.settings.infCust then
		        if data.weaponId == 22 then rand = config.settings.infRandN1
		        elseif data.weaponId == 23 then rand = config.settings.infRandN2
		        elseif data.weaponId == 24 then rand = config.settings.infRandN3
		        elseif data.weaponId == 25 then rand = config.settings.infRandN4
		        elseif data.weaponId == 26 then rand = config.settings.infRandN5
		        elseif data.weaponId == 27 then rand = config.settings.infRandN6
		        elseif data.weaponId == 28 then rand = config.settings.infRandN7
		        elseif data.weaponId == 29 then rand = config.settings.infRandN8
		        elseif data.weaponId == 30 then rand = config.settings.infRandN9
		        elseif data.weaponId == 31 then rand = config.settings.infRandN10
		        elseif data.weaponId == 32 then rand = config.settings.infRandN11
		        elseif data.weaponId == 33 then rand = config.settings.infRandN12
		        elseif data.weaponId == 34 then rand = config.settings.infRandN13
		        elseif data.weaponId == 38 then rand = config.settings.infRandN14
				else rand = config.settings.infRand end
		    end
		    if rand ~= nil and dist ~= nil and wdist ~= nil and dist > 0 and dist < wdist and math.random(100) < rand and isCharDead(tarPed) == false and sampIsPlayerPaused(id) == false then

				local randX = RandomFloat(-0.25, 0.25)
				local randY = RandomFloat(-0.25, 0.25)
				local randZ = RandomFloat(-0.80, 0.80)
				
				if math.abs(randX) < 0.01 then randX = 0.01 end
				if math.abs(randY) < 0.01 then randY = 0.01 end
				if math.abs(randZ) < 0.01 then randZ = 0.01 end

				data.targetType = 1
				data.targetId = id
				data.origin = {x = mposX + randX, y = mposY + randY, z = mposZ + randZ}
			    data.target = {x = posX + randX, y = posY + randY, z = posZ + randZ}
				data.center = {x = randX, y = randY, z = randZ}

				local body
				local diff
				if config.settings.infHead then body = 9 diff = RandomFloat(0.7, 0.8)
				elseif config.settings.infGroin then body = 4 diff = RandomFloat(-0.3, -0.2)
				else body = 3 diff = RandomFloat(-0.1, 0.6) end
				
				sampSendGiveDamage(id, GetWeaponDamage(data.weaponId), data.weaponId, body)
				if config.settings.infLine then fireSingleBullet(mposX, mposY, mposZ + RandomFloat(0.5, 0.7), posX + randX, posY + randY, posZ + diff, 1) end
				if config.settings.infBlood > 0 then addBlood(posX + randX, posY + randY, posZ + diff, 0.0, 0.0, 0.0, config.settings.infBlood, tarPed) end
			end
		end
	end
	end
end

function CheckTarget()
	local mped = getAllChars()
	local mposX, mposY, mposZ = getCharCoordinates(PLAYER_PED)
	
	local tdist = config.settings.infFov
	local weap = getCurrentCharWeapon(PLAYER_PED)
    local wdist = GetWeaponDist(weap)
    
    if config.settings.infCust then
        if weap == 22 then tdist = config.settings.infFovN1
        elseif weap == 23 then tdist = config.settings.infFovN2
        elseif weap == 24 then tdist = config.settings.infFovN3
        elseif weap == 25 then tdist = config.settings.infFovN4
        elseif weap == 26 then tdist = config.settings.infFovN5
        elseif weap == 27 then tdist = config.settings.infFovN6
        elseif weap == 28 then tdist = config.settings.infFovN7
        elseif weap == 29 then tdist = config.settings.infFovN8
        elseif weap == 30 then tdist = config.settings.infFovN9
        elseif weap == 31 then tdist = config.settings.infFovN10
        elseif weap == 32 then tdist = config.settings.infFovN11
        elseif weap == 33 then tdist = config.settings.infFovN12
        elseif weap == 34 then tdist = config.settings.infFovN13
        elseif weap == 38 then tdist = config.settings.infFovN14
		else tdist = config.settings.infFov end
    end
    if tdist == nil or weap == nil or wdist == nil then return end
    
	tarPed = -1
	for _, ped in pairs(mped) do
	if ped ~= PLAYER_PED then
	
		local posX, posY, posZ = getCharCoordinates(ped)
		if isLineOfSightClear(mposX, mposY, mposZ, posX, posY, posZ, config.settings.infObj, config.settings.infVeh, false, config.settings.infObj, false) then

		local result, id = sampGetPlayerIdByCharHandle(ped)
		if result then
		
		local ndist = FacingToCoords(posX, posY, tdist)
		local dist = getDistanceBetweenCoords3d(mposX, mposY, mposZ, posX, posY, posZ)

		if ndist ~= nil and dist ~= nil and ndist < tdist and dist and dist < wdist and not isCharDead(ped) and not sampIsPlayerPaused(id) then
		    tarPed = ped
		    tdist = ndist
		end
		end
		end
	end
	end
end

function RandomFloat(low, great)
    return low + math.random() * (great - low)
end

function VectorySize(amount1, amount2, amount3)
	return math.sqrt(amount1 * amount1 + amount2 * amount2, amount3 * amount3)
end

function GetWeaponOkay(weap)
	if weap >= 22 and weap <= 34 or weap == 38 then return 1 end
	return 0
end

function GetWeaponName(weap)
	local namearray =
	{
	    [22] = "9mm",
	    [23] = "Silenced 9mm",
	    [24] = "Desert Eagle",
	    [25] = "Shotgun",
	    [26] = "Sawnoff Shotgun",
	    [27] = "Combat Shotgun",
	    [28] = "Micro SMG/Uzi",
	    [29] = "MP5",
	    [30] = "AK-47",
	    [31] = "M4",
	    [32] = "Tec-9",
	    [33] = "Country Rifle",
	    [34] = "Sniper Rifle",
	    [38] = "Minigun"
	}
	return namearray[weap]
end

function GetWeaponDamage(weap)
    local dmgarray =
    {
        [22] = 8.25,
        [23] = 13.2,
        [24] = 46.2,
        [25] = 3.3,
        [26] = 3.3,
        [27] = 4.95,
        [28] = 6.6,
        [29] = 8.25,
        [30] = 9.9,
        [31] = 9.9,
        [32] = 6.6,
        [33] = 24.75,
        [34] = 41.25,
        [38] = 46.2
    }
    return dmgarray[weap]
end

function GetWeaponDist(weap)
	local distarray =
	{
		[22] = 35.0,
		[23] = 35.0,
		[24] = 35.0,
		[25] = 40.0,
		[26] = 35.0,
		[27] = 40.0,
		[28] = 35.0,
		[29] = 45.0,
		[30] = 70.0,
		[31] = 90.0,
		[32] = 35.0,
		[33] = 95.0,
        [34] = 320.0,
        [38] = 75.0
	}
	return distarray[weap]
end

function FacingToCoords(posX, posY, ang)
    local vecX = camX + (frontX * 50.0)
    local vecY = camY + (frontY * 50.0)
    local mposX, mposY, mposZ = getCharCoordinates(PLAYER_PED)
    
    local dist = VectorySize(mposX - posX, mposY - posY, 0.0)
    local ndist = 7.0 - (dist / 5)
    if ndist < 0.0 then ndist = 0.0 end
    
    local uang = math.atan2(mposX - vecX, mposY - vecY)
	local tang = math.atan2(mposX - posX, mposY - posY)
	local ugrad = math.deg(uang) + ndist
	local tgrad = math.deg(tang)

	if tgrad - ang < ugrad and tgrad + ang > ugrad then
        if ugrad > tgrad then return ugrad - tgrad
        else return tgrad - ugrad end
	end
    return nil
end

function CalculateQuat(rotX, rotY, rotZ)
    local b = rotX * math.pi / 360.0
    local h = rotY * math.pi / 360.0
    local a = rotZ * math.pi / 360.0
    
    local c1, c2, c3 = math.cos(h), math.cos(a), math.cos(b)
    local s1, s2, s3 = math.sin(h), math.sin(a), math.sin(b)
    
    local qw = c1 * c2 * c3 - s1 * s2 * s3
    local qx = s1 * s2 * c3 + c1 * c2 * s3
    local qy = s1 * c2 * c3 + c1 * s2 * s3
    local qz = c1 * s2 * c3 - s1 * c2 * s3
    return qw, qx, qy, qz
end
