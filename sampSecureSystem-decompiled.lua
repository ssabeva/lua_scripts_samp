function randomFunction			main (INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_0_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0033 (if previous if statement is false) --0033 JMP-JMP
		var_0_3 = nil --var_0_3 PRIMITIVE-PRIMITIVE
		var_0_2 = uget_0_1.load(var_0_3, uget_0_2)
		updateIni = var_0_2
		var_0_2 = tonumber(updateIni.info.vers)
		if uget_0_3 < var_0_2 then
			--jump to 0029 (if previous if statement is false) --0029 JMP-JMP
			var_0_3 =  "Есть обновление! Версия: " .. updateIni.info.vers_text
			var_0_4 = -1 --var_0_4 NUMBER-NUMBER
			sampAddChatMessage(var_0_3, var_0_4)
			var_0_2 = true --var_0_2 PRIMITIVE-PRIMITIVE
			update_state = var_0_2
		end
		os.remove(uget_0_2)
	end
	return
end


function randomFunction(INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_1_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0006 (if previous if statement is false) --0006 JMP-JMP
		USETP unhandled at 0005
	end
	return
end


function randomFunction()
	var_2_1 = not uget_2_0.v
	uget_2_0.v = var_2_1
	return
end


function randomFunction()
	var_3_1 = not uget_3_0.v
	uget_3_0.v = var_3_1
	var_3_1 = false --var_3_1 PRIMITIVE-PRIMITIVE
	uget_3_1.ShowCursor = var_3_1
	return
end


function randomFunction(INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_4_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0014 (if previous if statement is false) --0014 JMP-JMP
		var_4_4 = -1 --var_4_4 NUMBER-NUMBER
		sampAddChatMessage("Скрипт успешно обновлен!", var_4_4)
		var_4_2 = thisScript()
		var_4_3 = var_4_2
		var_4_2.reload(var_4_3)
	end
	return
end


function someFunc5()
	var_5_0 = isSampLoaded()
	if var_5_0 then
		--jump to 0009 (if previous if statement is false) --0009 JMP-JMP
		var_5_0 = isSampfuncsLoaded()
		if not var_5_0 then
		end -- maybe?
	else
		--location 0009--0009 LOCATION-LOCATION_
	end
	var_5_0 = isSampAvailable()
	if not var_5_0 then
		--jump to 0019 (if previous if statement is false) --0019 JMP-JMP
		repeat
		var_5_1 = 100 --var_5_1 NUMBER-NUMBER
		wait(var_5_1)
	else
		--location 0019--0019 LOCATION-LOCATION_
		until false or (previous if statement is true) --location 0019
		local randomFunction0 = function() end -- starts at  test.lua:0
		downloadUrlToFile(uget_5_0, uget_5_1, randomFunction0)
		var_5_0 = doesFileExist("moonloader\sampsecure")
		if not var_5_0 then
			--jump to 0046 (if previous if statement is false) --0046 JMP-JMP
			createDirectory("moonloader\sampsecure\fonts")
			USETP unhandled at 0032
			var_5_2 = "moonloader\sampsecure\fonts\fontawesome-" --strings longer than 40 characters get cut off, so check to see if there's more!
			local randomFunction1 = function() end -- starts at  test.lua:0
			downloadUrlToFile(uget_5_6, var_5_2, randomFunction1)
			if uget_5_5 then
				--jump to 0046 (if previous if statement is false) --0046 JMP-JMP
				repeat
				var_5_1 = 0 --var_5_1 NUMBER-NUMBER
				wait(var_5_1)
			end 
		else
			--location 0046--0046 LOCATION-LOCATION_
			until false or (previous if statement is true) --location 0046
			var_5_1 = var_5_1 .. "  LOAD. VERSION {FF0000} " .. uget_5_8
			print(var_5_1)
			var_5_2 = "  {FFFFFF}Сервера которые поддерживаются" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_5_1 = var_5_1 .. var_5_2
			print(var_5_1)
			var_5_2 = " {FFFFFF}Загружен. Меню с командами и ин" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_5_1 = var_5_1 .. var_5_2 .. uget_5_8
			var_5_2 = -1 --var_5_2 NUMBER-NUMBER
			sampAddChatMessage(var_5_1, var_5_2)
			sampRegisterChatCommand("pt7", cmd_pt7)
			sampRegisterChatCommand("setnamess", cmd_setnamess)
			sampRegisterChatCommand("getnamess", cmd_getnamess)
			sampRegisterChatCommand("jb", cmd_jb)
			local randomFunction2 = function() end -- starts at  test.lua:0
			sampRegisterChatCommand("secures", randomFunction2)
			local randomFunction3 = function() end -- starts at  test.lua:0
			sampRegisterChatCommand("soverlay", randomFunction3)
			repeat
			var_5_1 = 0 --var_5_1 NUMBER-NUMBER
			wait(var_5_1)
			if update_state then
				--jump to 0101 (if previous if statement is false) --0101 JMP-JMP
				local randomFunction4 = function() end -- starts at  test.lua:0
				downloadUrlToFile(uget_5_12, uget_5_13, randomFunction4)
			else
				--location 0101--0101 LOCATION-LOCATION_
				if not uget_5_9.v then
					--jump to 0112 (if previous if statement is false) --0112 JMP-JMP
					if not uget_5_14.v then
						--jump to 0112 (if previous if statement is false) --0112 JMP-JMP
					end 
					end_
					uget_5_11.Process = uget_5_10.v
					var_5_0 = isKeyJustPressed(VK_K)
					if var_5_0 then
						--jump to 0127 (if previous if statement is false) --0127 JMP-JMP
						var_5_0 = sampIsChatInputActive()
						if not var_5_0 then
							--jump to 0127 (if previous if statement is false) --0127 JMP-JMP
							var_5_1 = not uget_5_14.v
							uget_5_14.v = var_5_1
						end 
					end
					if not uget_5_9.v then
						--jump to 0135 (if previous if statement is false) --0135 JMP-JMP
						if uget_5_14.v then
						end -- maybe?
					else
						--location 0135--0135 LOCATION-LOCATION_
						var_5_1 = true --var_5_1 PRIMITIVE-PRIMITIVE
						uget_5_11.ShowCursor = var_5_1
					else
						--location 0139--0139 LOCATION-LOCATION_
						var_5_1 = false --var_5_1 PRIMITIVE-PRIMITIVE
						uget_5_11.ShowCursor = var_5_1
					end
					var_5_0, var_5_1 = sampGetPlayerIdByCharHandle(playerPed)
					var_5_3 = var_5_1
					var_5_2 = sampGetPlayerNickname(var_5_3)
					mynick = var_5_2
				else
					--location 0150--0150 LOCATION-LOCATION_
					until false or (previous if statement is true) --location 0150
					return
					return
				end
			end
		end 
	end
	

function randomFunction			var_20_2.onSendTakeDamage (INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_0_ ~= 0 then
		--jump to 0015 (if previous if statement is false) --0015 JMP-JMP
		var_6_5 = "%.0f"
		var_6_6 = INPUT_VAR_1_
		var_6_4 = var_6_4.format(var_6_5, var_6_6)
		var_6_1 = var_6_4
		uget_6_0.antidm.playerId = INPUT_VAR_0_
		uget_6_0.antidm.damage = var_6_1
	end
	until false or (previous if statement is true) --location 0019
	var_6_4 = uget_6_1.save(uget_6_0, uget_6_2)
	if var_6_4 then
		--jump to 0022 (if previous if statement is false) --0022 JMP-JMP
		return
	end
end --REVERSE ME

function randomFunction			cmd_jb ()
	var_7_1 = var_7_1 .. "{FFFFFF} Успешно отправил жалобу!"
	sampAddChatMessage(var_7_1)
	var_7_1 = 1 --var_7_1 NUMBER-NUMBER
	wait(var_7_1)
	sampSendChat("/report")
	var_7_1 = 1 --var_7_1 NUMBER-NUMBER
	wait(var_7_1)
	var_7_1 = 32 --var_7_1 NUMBER-NUMBER
	var_7_2 = -1 --var_7_2 NUMBER-NUMBER
	var_7_3 = -1 --var_7_3 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0019
	sampSendDialogResponse(var_7_1, var_7_2, var_7_3, "Помогите, меня ДМ-ит игрок")
	var_7_1 = 150 --var_7_1 NUMBER-NUMBER
	wait(var_7_1)
	var_7_1 = 0 --var_7_1 NUMBER-NUMBER
	sampCloseCurrentDialogWithButton(var_7_1)
	return
end


function someFunc8()
	local randomFunction5 = function() end -- starts at  test.lua:0
	lua_thread.create(randomFunction5)
	return
end


function randomFunction			cmd_getnamess (INPUT_VAR_0_)
	var_9_2 = nil --var_9_2 PRIMITIVE-PRIMITIVE
	var_9_1 = uget_9_1.load(var_9_2, uget_9_2)
	var_9_1 = INPUT_VAR_0_
	var_9_2 = var_9_2 .. "{FFFFFF} Cохраненый ник: " .. uget_9_0.savename.name .. "."
	var_9_3 = -1 --var_9_3 NUMBER-NUMBER
	sampAddChatMessage(var_9_2, var_9_3)
	return
end


function randomFunction			cmd_setnamess (INPUT_VAR_0_)
	uget_10_0.savename.name = INPUT_VAR_0_
	var_10_1 = uget_10_1.save(uget_10_0, uget_10_2)
	if var_10_1 then
		--jump to 0017 (if previous if statement is false) --0017 JMP-JMP
		var_10_2 = var_10_2 .. "{FFFFFF} Ник успешно сохранён!"
		var_10_3 = -1 --var_10_3 NUMBER-NUMBER
		sampAddChatMessage(var_10_2, var_10_3)
	end
	return
end


function randomFunction			cmd_pt7 ()
	var_11_2 = "{FF0000} Включен режим сделки. Начинаю в" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_11_1 = var_11_1 .. var_11_2
	sampAddChatMessage(var_11_1)
	var_11_1 = var_11_1 .. "{FFFFFF} Проверь включил ли ты фрапс."
	sampAddChatMessage(var_11_1)
	var_11_1 =  "/id " .. uget_11_1
	sampSendChat(var_11_1)
	var_11_1 = 1500 --var_11_1 NUMBER-NUMBER
	wait(var_11_1)
	until false or (previous if statement is true) --location 0019
	sampSendChat("/time")
	var_11_2 = "{FFFFFF} Чтобы сохранить ник введите /se" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_11_1 = var_11_1 .. var_11_2
	sampAddChatMessage(var_11_1)
	return
end


function someFunc12(INPUT_VAR_0_)
	var_12_2 = INPUT_VAR_0_
	var_12_1 = INPUT_VAR_0_.match(var_12_2, "%d")
	if var_12_1 then
		--jump to 0012 (if previous if statement is false) --0012 JMP-JMP
		local randomFunction6 = function() end -- starts at  test.lua:0
		lua_thread.create(randomFunction6)
	else
		--location 0012--0012 LOCATION-LOCATION_
		var_12_2 = var_12_2 .. "{FF0000} Ошибка | Введите ID"
		sampAddChatMessage(var_12_2)
	end
	return
end


function randomFunction			var_20_3.BeforeDrawFrame ()
	if fa_font == nil then
		--jump to 0021 (if previous if statement is false) --0021 JMP-JMP
		var_13_0 = uget_13_0.ImFontConfig()
		var_13_1 = true --var_13_1 PRIMITIVE-PRIMITIVE
		var_13_0.MergeMode = var_13_1
		var_13_1 = uget_13_0.GetIO()
		var_13_2 = var_13_1.Fonts
		var_13_3 = "moonloader/sampsecure/fonts/fontawesome-" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_13_4 = 14 --var_13_4 NUMBER-NUMBER
		var_13_5 = var_13_0
		until false or (previous if statement is true) --location 0019
		var_13_1 = var_13_1.Fonts.AddFontFromFileTTF(var_13_2, var_13_3, var_13_4, var_13_5, uget_13_1)
		fa_font = var_13_1
	end
	return
end


function randomFunction			var_20_3.OnDrawFrame ()
	var_14_2 = "{FFFFFF} Протокол 13 активирован! Начина" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_14_1 = var_14_1 .. var_14_2
	sampAddChatMessage(var_14_1)
	var_14_1 = 100 --var_14_1 NUMBER-NUMBER
	wait(var_14_1)
	sampSendChat("/armour")
	var_14_1 = 3500 --var_14_1 NUMBER-NUMBER
	wait(var_14_1)
	sampSendChat("/mask")
	return
end


function randomFunction()
	var_15_2 = "{FFFFFF} Протокол Anti-Cheat активирован" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_15_1 = var_15_1 .. var_15_2
	sampAddChatMessage(var_15_1)
	sampSendChat("/report")
	var_15_1 = 1 --var_15_1 NUMBER-NUMBER
	wait(var_15_1)
	var_15_1 = 32 --var_15_1 NUMBER-NUMBER
	var_15_2 = -1 --var_15_2 NUMBER-NUMBER
	var_15_3 = -1 --var_15_3 NUMBER-NUMBER
	sampSendDialogResponse(var_15_1, var_15_2, var_15_3, "Помогите, тут читер! ")
	until false or (previous if statement is true) --location 0019
	var_15_1 = 150 --var_15_1 NUMBER-NUMBER
	wait(var_15_1)
	var_15_1 = 0 --var_15_1 NUMBER-NUMBER
	sampCloseCurrentDialogWithButton(var_15_1)
	return
end


function randomFunction()
	var_16_1 = var_16_1 .. "{FFFFFF} Протокол Anti-DB активирован!"
	sampAddChatMessage(var_16_1)
	sampSendChat("/report")
	var_16_1 = 1 --var_16_1 NUMBER-NUMBER
	wait(var_16_1)
	var_16_1 = 32 --var_16_1 NUMBER-NUMBER
	var_16_2 = -1 --var_16_2 NUMBER-NUMBER
	var_16_3 = -1 --var_16_3 NUMBER-NUMBER
	sampSendDialogResponse(var_16_1, var_16_2, var_16_3, "Помогите, меня ДБшат!! ")
	until false or (previous if statement is true) --location 0019
	var_16_1 = 150 --var_16_1 NUMBER-NUMBER
	wait(var_16_1)
	var_16_1 = 0 --var_16_1 NUMBER-NUMBER
	sampCloseCurrentDialogWithButton(var_16_1)
	var_16_1 = 1500 --var_16_1 NUMBER-NUMBER
	wait(var_16_1)
	sampSendChat("/usemed")
	return
end


function randomFunction()
	var_17_1 = var_17_1 .. "{FFFFFF} Успешно отправил жалобу!"
	sampAddChatMessage(var_17_1)
	var_17_1 = 1 --var_17_1 NUMBER-NUMBER
	wait(var_17_1)
	sampSendChat("/report")
	var_17_1 = 1 --var_17_1 NUMBER-NUMBER
	wait(var_17_1)
	var_17_1 = 32 --var_17_1 NUMBER-NUMBER
	var_17_2 = -1 --var_17_2 NUMBER-NUMBER
	var_17_3 = -1 --var_17_3 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0019
	var_17_4 =  "Помогите, меня ДМ-ит игрок c ID " .. uget_17_1.antidm.playerId
	sampSendDialogResponse(var_17_1, var_17_2, var_17_3, var_17_4)
	var_17_1 = 150 --var_17_1 NUMBER-NUMBER
	wait(var_17_1)
	var_17_1 = 0 --var_17_1 NUMBER-NUMBER
	sampCloseCurrentDialogWithButton(var_17_1)
	return
end


function someFunc18()
	if uget_18_0.v then
		--jump to 0315 (if previous if statement is false) --0315 JMP-JMP
		var_18_0, var_18_1 = getScreenResolution()
		var_18_4 = var_18_0 /  2 --var_18_4 NUMBER-NUMBER
		var_18_5 = var_18_1 /  2 --var_18_5 NUMBER-NUMBER
		var_18_3 = uget_18_1.ImVec2(var_18_4, var_18_5)
		until false or (previous if statement is true) --location 0019
		var_18_6 = 0.5 --var_18_6 NUMBER-NUMBER
		var_18_7 = 0.5 --var_18_7 NUMBER-NUMBER
		uget_18_1.SetNextWindowPos(var_18_3, uget_18_1.Cond.FirstUseEver,  uget_18_1.ImVec2(var_18_6, var_18_7) )
		var_18_4 = 700 --var_18_4 NUMBER-NUMBER
		var_18_5 = 500 --var_18_5 NUMBER-NUMBER
		var_18_3 = uget_18_1.ImVec2(var_18_4, var_18_5)
		uget_18_1.SetNextWindowSize(var_18_3, uget_18_1.Cond.FirstUseEver)
		var_18_4 = u8(" Главное меню SampSecureSystem v. ")
		var_18_3 = var_18_3 .. var_18_4 .. uget_18_3
		uget_18_1.Begin(var_18_3, uget_18_0)
		until false or (previous if statement is true) --location 0046
		uget_18_1.SameLine()
		var_18_5 = 130 --var_18_5 NUMBER-NUMBER
		var_18_6 = 312 --var_18_6 NUMBER-NUMBER
		var_18_4 = uget_18_1.ImVec2(var_18_5, var_18_6)
		var_18_5 = true --var_18_5 PRIMITIVE-PRIMITIVE
		uget_18_1.BeginChild("child2", var_18_4, var_18_5)
		var_18_4 = u8(" Информация")
		var_18_3 = var_18_3 .. var_18_4
		var_18_5 = 100 --var_18_5 NUMBER-NUMBER
		var_18_6 = 50 --var_18_6 NUMBER-NUMBER
		var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
		if var_18_2 then
			--jump to 0076 (if previous if statement is false) --0076 JMP-JMP
			var_18_2 = 1 --var_18_2 NUMBER-NUMBER
			act = var_18_2
			var_18_4 = u8(" Протоколы")
			var_18_3 = var_18_3 .. var_18_4
			var_18_5 = 100 --var_18_5 NUMBER-NUMBER
			var_18_6 = 50 --var_18_6 NUMBER-NUMBER
			var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
			if var_18_2 then
				--jump to 0094 (if previous if statement is false) --0094 JMP-JMP
				var_18_2 = 2 --var_18_2 NUMBER-NUMBER
				act = var_18_2
				var_18_4 = u8(" Команды")
				var_18_3 = var_18_3 .. var_18_4
				var_18_5 = 100 --var_18_5 NUMBER-NUMBER
				var_18_6 = 50 --var_18_6 NUMBER-NUMBER
				var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
				if var_18_2 then
					--jump to 0112 (if previous if statement is false) --0112 JMP-JMP
					var_18_2 = 3 --var_18_2 NUMBER-NUMBER
					act = var_18_2
					var_18_4 = u8(" Руководства")
					var_18_3 = var_18_3 .. var_18_4
					var_18_5 = 100 --var_18_5 NUMBER-NUMBER
					var_18_6 = 50 --var_18_6 NUMBER-NUMBER
					var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
					if var_18_2 then
						--jump to 0130 (if previous if statement is false) --0130 JMP-JMP
						var_18_2 = 4 --var_18_2 NUMBER-NUMBER
						act = var_18_2
						var_18_4 = u8(" Новости")
						var_18_3 = var_18_3 .. var_18_4
						var_18_5 = 100 --var_18_5 NUMBER-NUMBER
						var_18_6 = 50 --var_18_6 NUMBER-NUMBER
						var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
						if var_18_2 then
							--jump to 0148 (if previous if statement is false) --0148 JMP-JMP
							var_18_2 = 5 --var_18_2 NUMBER-NUMBER
							act = var_18_2
							until false or (previous if statement is true) --location 0150
							uget_18_1.EndChild()
							uget_18_1.SameLine()
							var_18_5 = -1 --var_18_5 NUMBER-NUMBER
							var_18_6 = -1 --var_18_6 NUMBER-NUMBER
							var_18_4 = uget_18_1.ImVec2(var_18_5, var_18_6)
							var_18_5 = true --var_18_5 PRIMITIVE-PRIMITIVE
							uget_18_1.BeginChild("child3", var_18_4, var_18_5)
							if act == 2 then
								--jump to 0275 (if previous if statement is false) --0275 JMP-JMP
								uget_18_1.Text( u8(uget_18_4) )
								var_18_3 = u8("Ваша версия ")
								var_18_3 = var_18_3 .. uget_18_3 .. "."
								uget_18_1.Text(var_18_3)
								uget_18_1.Text(uget_18_5)
								uget_18_1.SameLine()
								var_18_4 = u8(" Обновить скрипт")
								var_18_3 = var_18_3 .. var_18_4
								var_18_5 = 159 --var_18_5 NUMBER-NUMBER
								var_18_6 = 25 --var_18_6 NUMBER-NUMBER
								var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
								if var_18_2 then
									--jump to 0209 (if previous if statement is false) --0209 JMP-JMP
									os.execute("explorer ")
									var_18_4 = u8(" Тема на BlastHack")
									var_18_3 = var_18_3 .. var_18_4
									var_18_5 = 150 --var_18_5 NUMBER-NUMBER
									var_18_6 = 25 --var_18_6 NUMBER-NUMBER
									var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
									if var_18_2 then
										--jump to 0229 (if previous if statement is false) --0229 JMP-JMP
										os.execute("explorer ")
										uget_18_1.SameLine()
										var_18_4 = u8(" Тех.Поддержка")
										var_18_3 = var_18_3 .. var_18_4
										var_18_5 = 150 --var_18_5 NUMBER-NUMBER
										var_18_6 = 25 --var_18_6 NUMBER-NUMBER
										var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
										if var_18_2 then
											--jump to 0252 (if previous if statement is false) --0252 JMP-JMP
											os.execute("explorer ")
											uget_18_1.SameLine()
											var_18_4 = u8(" Группа ВК")
											var_18_3 = var_18_3 .. var_18_4
											var_18_5 = 150 --var_18_5 NUMBER-NUMBER
											var_18_6 = 25 --var_18_6 NUMBER-NUMBER
											var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
											if var_18_2 then
												--jump to 0275 (if previous if statement is false) --0275 JMP-JMP
												os.execute("explorer ")
												if act == 0 then
													--jump to 0284 (if previous if statement is false) --0284 JMP-JMP
													uget_18_1.Text( u8(uget_18_6) )
													if act == 3 then
														--jump to 0293 (if previous if statement is false) --0293 JMP-JMP
														uget_18_1.Text( u8(uget_18_7) )
														if act == 4 then
															--jump to 0302 (if previous if statement is false) --0302 JMP-JMP
															uget_18_1.Text( u8(uget_18_8) )
															if act == 5 then
																--jump to 0309 (if previous if statement is false) --0309 JMP-JMP
																uget_18_1.Text(uget_18_9)
																uget_18_1.EndChild()
																uget_18_1.End()
																if uget_18_10.v then
																	--jump to 0435 (if previous if statement is false) --0435 JMP-JMP
																	var_18_0, var_18_1 = getScreenResolution()
																	var_18_4 = var_18_0 /  2 --var_18_4 NUMBER-NUMBER
																	var_18_5 = var_18_1 /  2 --var_18_5 NUMBER-NUMBER
																	var_18_3 = uget_18_1.ImVec2(var_18_4, var_18_5)
																	var_18_6 = 0.5 --var_18_6 NUMBER-NUMBER
																	var_18_7 = 0.5 --var_18_7 NUMBER-NUMBER
																	uget_18_1.SetNextWindowPos(var_18_3, uget_18_1.Cond.FirstUseEver,  uget_18_1.ImVec2(var_18_6, var_18_7) )
																	var_18_4 = 300 --var_18_4 NUMBER-NUMBER
																	var_18_5 = 200 --var_18_5 NUMBER-NUMBER
																	var_18_3 = uget_18_1.ImVec2(var_18_4, var_18_5)
																	uget_18_1.SetNextWindowSize(var_18_3, uget_18_1.Cond.FirstUseEver)
																	var_18_4 = u8(" Протоколы")
																	var_18_3 = var_18_3 .. var_18_4
																	uget_18_1.Begin(var_18_3, uget_18_10)
																	var_18_3 = u8("P:Anti-DM")
																	var_18_5 = 80 --var_18_5 NUMBER-NUMBER
																	var_18_6 = 30 --var_18_6 NUMBER-NUMBER
																	var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
																	if var_18_2 then
																		--jump to 0375 (if previous if statement is false) --0375 JMP-JMP
																		local randomFunction7 = function() end -- starts at  test.lua:0
																		lua_thread.create(randomFunction7)
																		uget_18_1.SameLine()
																		var_18_3 = u8("P:Anti-Cheat")
																		var_18_5 = 80 --var_18_5 NUMBER-NUMBER
																		var_18_6 = 30 --var_18_6 NUMBER-NUMBER
																		var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
																		if var_18_2 then
																			--jump to 0395 (if previous if statement is false) --0395 JMP-JMP
																			local randomFunction8 = function() end -- starts at  test.lua:0
																			lua_thread.create(randomFunction8)
																			uget_18_1.SameLine()
																			var_18_3 = u8("P:Anti-DB")
																			var_18_5 = 80 --var_18_5 NUMBER-NUMBER
																			var_18_6 = 30 --var_18_6 NUMBER-NUMBER
																			var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
																			if var_18_2 then
																				--jump to 0415 (if previous if statement is false) --0415 JMP-JMP
																				local randomFunction9 = function() end -- starts at  test.lua:0
																				lua_thread.create(randomFunction9)
																				var_18_3 = u8("Жалоба DM")
																				var_18_5 = 80 --var_18_5 NUMBER-NUMBER
																				var_18_6 = 30 --var_18_6 NUMBER-NUMBER
																				var_18_2 = uget_18_1.Button(var_18_3,  uget_18_1.ImVec2(var_18_5, var_18_6) )
																				if var_18_2 then
																					--jump to 0432 (if previous if statement is false) --0432 JMP-JMP
																					local randomFunction10 = function() end -- starts at  test.lua:0
																					lua_thread.create(randomFunction10)
																					uget_18_1.End()
																					if uget_18_13.v then
																						--jump to 0530 (if previous if statement is false) --0530 JMP-JMP
																						var_18_1 = nil --var_18_1 PRIMITIVE-PRIMITIVE
																						var_18_0 = uget_18_14.load(var_18_1, uget_18_15)
																						var_18_0 = 
																						var_18_0 = os.time( os.date("!*t") )
																						var_18_1 = var_18_0 +  10800 --var_18_1 NUMBER-NUMBER
																						var_18_2, var_18_3 = sampGetPlayerIdByCharHandle(PLAYER_PED)
																						var_18_5 = var_18_3
																						var_18_4 = sampGetPlayerPing(var_18_5)
																						var_18_6 = var_18_3
																						var_18_5 = sampGetPlayerNickname(var_18_6)
																						var_18_6, var_18_7 = getScreenResolution()
																						var_18_10 = var_18_6 /  1.1 --var_18_10 NUMBER-NUMBER
																						var_18_11 = var_18_7 /  1.5 --var_18_11 NUMBER-NUMBER
																						var_18_9 = uget_18_1.ImVec2(var_18_10, var_18_11)
																						var_18_12 = 0.5 --var_18_12 NUMBER-NUMBER
																						var_18_13 = 0.5 --var_18_13 NUMBER-NUMBER
																						uget_18_1.SetNextWindowPos(var_18_9, uget_18_1.Cond.Always,  uget_18_1.ImVec2(var_18_12, var_18_13) )
																						var_18_11 = uget_18_1.WindowFlags.NoResize + uget_18_1.WindowFlags.NoCollapse --var_18_11 NUMBER-NUMBER
																						var_18_11 = var_18_11 + uget_18_1.WindowFlags.NoTitleBar --var_18_11 NUMBER-NUMBER
																						uget_18_1.Begin("##SecureOverlay", uget_18_13.v, var_18_11)
																						var_18_9 = var_18_9 .. " SecureOverlay"
																						uget_18_1.Text(var_18_9)
																						var_18_10 = u8(" ID игрока ")
																						var_18_9 = var_18_9 .. var_18_10 .. uget_18_12.antidm.playerId
																						uget_18_1.Text(var_18_9)
																						var_18_9 = u8("Количество урона ")
																						var_18_9 = var_18_9 .. uget_18_12.antidm.damage .. " HP"
																						uget_18_1.Text(var_18_9)
																						uget_18_1.End()
																						return
																					end
																				end end end end end end end end end end end end end end end end end end end end end --REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME

function randomFunction			apply_custom_style ()
	uget_19_0.SwitchContext()
	var_19_0 = uget_19_0.GetStyle()
	var_19_5 = uget_19_0.ImVec2
	var_19_6 = 15 --var_19_6 NUMBER-NUMBER
	var_19_7 = 15 --var_19_7 NUMBER-NUMBER
	var_19_5 = var_19_5(var_19_6, var_19_7)
	var_19_0.WindowPadding = var_19_5
	until false or (previous if statement is true) --location 0019
	var_19_5 = 15 --var_19_5 NUMBER-NUMBER
	var_19_0.WindowRounding = var_19_5
	var_19_5 = uget_19_0.ImVec2
	var_19_6 = 5 --var_19_6 NUMBER-NUMBER
	var_19_7 = 5 --var_19_7 NUMBER-NUMBER
	var_19_5 = var_19_5(var_19_6, var_19_7)
	var_19_0.FramePadding = var_19_5
	var_19_5 = uget_19_0.ImVec2
	var_19_6 = 12 --var_19_6 NUMBER-NUMBER
	var_19_7 = 8 --var_19_7 NUMBER-NUMBER
	var_19_5 = var_19_5(var_19_6, var_19_7)
	var_19_0.ItemSpacing = var_19_5
	var_19_5 = uget_19_0.ImVec2
	var_19_6 = 8 --var_19_6 NUMBER-NUMBER
	var_19_7 = 6 --var_19_7 NUMBER-NUMBER
	var_19_5 = var_19_5(var_19_6, var_19_7)
	var_19_0.ItemInnerSpacing = var_19_5
	var_19_5 = 25 --var_19_5 NUMBER-NUMBER
	var_19_0.IndentSpacing = var_19_5
	var_19_5 = 15 --var_19_5 NUMBER-NUMBER
	var_19_0.ScrollbarSize = var_19_5
	var_19_5 = 15 --var_19_5 NUMBER-NUMBER
	var_19_0.ScrollbarRounding = var_19_5
	var_19_5 = 15 --var_19_5 NUMBER-NUMBER
	var_19_0.GrabMinSize = var_19_5
	var_19_5 = 7 --var_19_5 NUMBER-NUMBER
	var_19_0.GrabRounding = var_19_5
	until false or (previous if statement is true) --location 0046
	var_19_5 = 8 --var_19_5 NUMBER-NUMBER
	var_19_0.ChildWindowRounding = var_19_5
	var_19_5 = 6 --var_19_5 NUMBER-NUMBER
	var_19_0.FrameRounding = var_19_5
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.95 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.96 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.Text] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.36 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.42 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.47 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.TextDisabled] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.11 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.15 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.17 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.WindowBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.15 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.18 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.22 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ChildWindowBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.08 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.08 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.08 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.94 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.PopupBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.43 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.43 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.5 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.5 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.Border] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.BorderShadow] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.2 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.25 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.29 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.FrameBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.12 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.2 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.28 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.FrameBgHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.09 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.12 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.14 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.FrameBgActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.09 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.12 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.14 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.65 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.TitleBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.51 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.TitleBgCollapsed] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.08 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.1 --var_19_8 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0150
	var_19_9 = 0.12 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.TitleBgActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.15 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.18 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.22 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.MenuBarBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.02 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.02 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.02 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.39 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ScrollbarBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.2 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.25 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.29 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ScrollbarGrab] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.18 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.22 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.25 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ScrollbarGrabHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.09 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.21 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.31 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ScrollbarGrabActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.2 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.25 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.29 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ComboBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.28 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.56 --var_19_8 NUMBER-NUMBER
	var_19_9 = 1 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.CheckMark] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.28 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.56 --var_19_8 NUMBER-NUMBER
	var_19_9 = 1 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.SliderGrab] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.37 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.61 --var_19_8 NUMBER-NUMBER
	var_19_9 = 1 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.SliderGrabActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.2 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.25 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.29 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.Button] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.28 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.56 --var_19_8 NUMBER-NUMBER
	var_19_9 = 1 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ButtonHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.06 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.53 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ButtonActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.2 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.25 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.29 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.55 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.Header] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.26 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.59 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.8 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.HeaderHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.26 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.59 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.HeaderActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.26 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.59 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.25 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ResizeGrip] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.26 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.59 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.98 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.67 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ResizeGripHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.06 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.05 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.07 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ResizeGripActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.4 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.39 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.38 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.16 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.CloseButton] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.4 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.39 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.38 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.39 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.CloseButtonHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.4 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.39 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.38 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.CloseButtonActive] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.61 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.61 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.61 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.PlotLines] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 1 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.43 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.35 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.PlotLinesHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.9 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.7 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.PlotHistogram] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 1 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.6 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0 --var_19_9 NUMBER-NUMBER
	var_19_10 = 1 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.PlotHistogramHovered] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 0.25 --var_19_7 NUMBER-NUMBER
	var_19_8 = 1 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.43 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.TextSelectedBg] = var_19_6
	var_19_6 = uget_19_0.ImVec4
	var_19_7 = 1 --var_19_7 NUMBER-NUMBER
	var_19_8 = 0.98 --var_19_8 NUMBER-NUMBER
	var_19_9 = 0.95 --var_19_9 NUMBER-NUMBER
	var_19_10 = 0.73 --var_19_10 NUMBER-NUMBER
	var_19_6 = var_19_6(var_19_7, var_19_8, var_19_9, var_19_10)
	var_19_0.Colors[uget_19_0.Col.ModalWindowDarkening] = var_19_6
	return
end


function someFunc20()
	require("lib.moonloader")
	var_20_0 = -1 --var_20_0 NUMBER-NUMBER
	var_20_1 = require("vkeys")
	var_20_2 = require("lib.samp.events")
	var_20_3 = require("imgui")
	var_20_4 = require("encoding")
	var_20_4.default = "CP1251"
	until false or (previous if statement is true) --location 0019
	u8 = var_20_4.UTF8
	var_20_6 = false --var_20_6 PRIMITIVE-PRIMITIVE
	var_20_5 = var_20_3.ImBool(var_20_6)
	var_20_7 = false --var_20_7 PRIMITIVE-PRIMITIVE
	var_20_6 = var_20_3.ImBool(var_20_7)
	var_20_8 = false --var_20_8 PRIMITIVE-PRIMITIVE
	var_20_7 = var_20_3.ImBool(var_20_8)
	var_20_8 = require("inicfg")
	var_20_12 = {} --to find out the contents of this table look inside the lua file
	var_20_13 = {} --to find out the contents of this table look inside the lua file
	var_20_12.savename = var_20_13
	var_20_13 = {} --to find out the contents of this table look inside the lua file
	var_20_12.antidm = var_20_13
	var_20_13 = "sampsecure.ini"
	var_20_10 = var_20_8.load( var_20_8.load(var_20_12, var_20_13) )
	var_20_12 = var_20_10
	until false or (previous if statement is true) --location 0046
	var_20_13 = var_20_9
	var_20_8.save(var_20_12, var_20_13)
	var_20_12 = nil --var_20_12 PRIMITIVE-PRIMITIVE
	var_20_13 = var_20_9
	var_20_11 = var_20_8.load(var_20_12, var_20_13)
	var_20_12 = 16711680 --var_20_12 NUMBER-NUMBER
	var_20_13 = 2003199 --var_20_13 NUMBER-NUMBER
	var_20_14 = "{1E90FF}[SECURE{FF0000}{1E90FF}SYSTEM]" --var_20_14 STRING-STRING
	var_20_15 = require("faIcons")
	var_20_17 = {}
	var_20_17[1] = var_20_15.min_range
	var_20_17[2] = var_20_15.max_range
	var_20_16 = var_20_3.ImGlyphRanges(var_20_17)
	var_20_17 = "1.3" --var_20_17 STRING-STRING
	var_20_18 = "https://raw.githubusercontent.com/mrmast" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_20_19 = false --var_20_19 PRIMITIVE-PRIMITIVE
	var_20_20 = require("moonloader")
	var_20_21 = false --var_20_21 PRIMITIVE-PRIMITIVE
	update_state = var_20_21
	var_20_21 = 13 --var_20_21 NUMBER-NUMBER
	var_20_22 = "0.1.3" --var_20_22 STRING-STRING
	var_20_23 = "https://raw.githubusercontent.com/mrmast" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_20_24 = getWorkingDirectory()
	var_20_24 = var_20_24 .. "/update.ini"
	var_20_25 = "https://github.com/mrmastirie221/SampSec" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_20_26 = thisScript()
	var_20_27 = require("requests")
	var_20_28 = "loading..." --var_20_28 STRING-STRING
	var_20_30 = "https://raw.githubusercontent.com/mrmast" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_20_29 = var_20_27.get(var_20_30)
	if var_20_29.status_code == 2 then
		--jump to 0096 (if previous if statement is false) --0096 JMP-JMP
		var_20_30 = "loading..." --var_20_30 STRING-STRING
		var_20_32 = "https://raw.githubusercontent.com/mrmast" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_20_31 = var_20_27.get(var_20_32)
		if var_20_31.status_code == 2 then
			--jump to 0104 (if previous if statement is false) --0104 JMP-JMP
			var_20_32 = "SecureSystem - Это скрипт для защиты вас" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_20_33 = "Меню протоколов активируется через кнопк" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_20_34 = "/soverlay - Оверлей, выводит информацию " --strings longer than 40 characters get cut off, so check to see if there's more!
			var_20_35 = "Здесь информация как не попасться на раз" --strings longer than 40 characters get cut off, so check to see if there's more!
			local randomFunction11 = function() end -- starts at  test.lua:0
			main = randomFunction11
			local randomFunction12 = function() end -- starts at  test.lua:0
			var_20_2.onSendTakeDamage = randomFunction12
			local randomFunction13 = function() end -- starts at  test.lua:0
			cmd_jb = randomFunction13
			local randomFunction14 = function() end -- starts at  test.lua:0
			cmd_getnamess = randomFunction14
			local randomFunction15 = function() end -- starts at  test.lua:0
			cmd_setnamess = randomFunction15
			local randomFunction16 = function() end -- starts at  test.lua:0
			cmd_pt7 = randomFunction16
			local randomFunction17 = function() end -- starts at  test.lua:0
			var_20_3.BeforeDrawFrame = randomFunction17
			local randomFunction18 = function() end -- starts at  test.lua:0
			var_20_3.OnDrawFrame = randomFunction18
			local randomFunction19 = function() end -- starts at  test.lua:0
			apply_custom_style = randomFunction19
			apply_custom_style()
			return
		end
	end end --REVERSE ME--REVERSE ME

