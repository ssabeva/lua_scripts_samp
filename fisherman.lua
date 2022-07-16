script_author('meowizzy')
script_name("Fisherman for E-RP")
script_version("0.1")
local sampev = require 'lib.samp.events'
local worms = 0

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
	sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Loaded!", 0xAE433D)
	sampRegisterChatCommand("mworms", mworms)
	sampRegisterChatCommand("mbot", mbot)
	while true do wait(0) 
		if worms > 0 then
			if sampGetCurrentDialogId() == 1342 then
				sampSendDialogResponse(1342, 1, 0, -1)
				wait(200)
			end
		elseif sampGetCurrentDialogId() == 1342 and closedialog == true then
			sampCloseCurrentDialogWithButton(0)
			closedialog = false
		end
		if act then
			for i = 1, 4096 do
				if sampTextdrawIsExists(i) then
					model = sampTextdrawGetModelRotationZoomVehColor(i)
					if model == 19630 then
						sampSendClickTextdraw(i)
						wait(100)
					end
				end
			end
		end
	end
end

function mbot()
	act = not act
	if act then sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Activate", 0xAE433D)
	else sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Deactivate", 0xAE433D)
	end
end

function mworms(params)
	if isCharInAnyCar(PLAYER_PED) then sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Ошибка, нужно быть вне авто", 0xAE433D) return false end
	worms = tonumber(params)
	if worms ~= nil then
		worm = worms
		sampAddChatMessage(string.format("["..script.this.name.."]: {FFFFFF}Начал копать %s червей", worms), 0xAE433D)
		sampSendChat("/mfish")
	elseif worms == '' or worms == nil then
		worms = 0
		sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Use: /mworms [count]", 0xAE433D)
	end
end

function sampev.onServerMessage(color, text)
	if worms > 0 then
		if color == -65366 then
			if text:find('Вы не обнаружили наживку') then return false
			elseif text:find('Вы выкопали 10 червей') then
				worms = worms-10
				if worms <= 0 then
					sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Успешно выкопал "..worm.." червей", 0xAE433D)
					worm = 0
					worms = 0
					closedialog = true
				end
				return false
			end
		elseif color == -2116380246 then
			if text:find('Неудачное место для поиска') then
				worms = 0
				worm = 0
				sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Ошибка, нужно быть на ферме!", 0xAE433D)
				sampCloseCurrentDialogWithButton(0)
			end
		end
	end
	if act then
		if color == -1697828182 then
			if text:find('Вы успешно окончили ловлю рыбы.') then sampAddChatMessage("["..script.this.name.."]: {FFFFFF}Deactivate", 0xAE433D) act = not act end
		end
	end
end
