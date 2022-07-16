function randomFunction	main ()
	var_0_0 = isSampLoaded()
	if var_0_0 then
		--jump to 0009 (if previous if statement is false) --0009 JMP-JMP
		var_0_0 = isSampfuncsLoaded()
		if not var_0_0 then
		end -- maybe?
	else
		--location 0009--0009 LOCATION-LOCATION_
		return
	end
	var_0_0 = isSampAvailable()
	if not var_0_0 then
		--jump to 0019 (if previous if statement is false) --0019 JMP-JMP
		repeat
		var_0_1 = 100 --var_0_1 NUMBER-NUMBER
		wait(var_0_1)
	else
		--location 0019--0019 LOCATION-LOCATION_
		until false or (previous if statement is true) --location 0019
		var_0_1 = "{edf511}[Taxi Helper] {ffffff}successful" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = -1 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		sampRegisterChatCommand("th", cmd_th)
		var_0_1 = false --var_0_1 PRIMITIVE-PRIMITIVE
		imgui.Process = var_0_1
		repeat
		var_0_1 = 0 --var_0_1 NUMBER-NUMBER
		wait(var_0_1)
		if uget_0_0.v == false then
			--jump to 0030 (if previous if statement is false) --0030 JMP-JMP
			var_0_1 = false --var_0_1 PRIMITIVE-PRIMITIVE
			imgui.Process = var_0_1
			--jump to 0030 (if previous if statement is false) --0030 JMP-JMP
			until false or (previous if statement is true) --location 0042
			return
		end
		
		

function randomFunction	cmd_th ()
	var_1_2 = not uget_1_0.v
	uget_1_0.v = var_1_2
	imgui.Process = uget_1_0.v
	return
end


function randomFunction	apply_custom_style ()
	imgui.SwitchContext()
	var_2_0 = imgui.GetStyle()
	var_2_4 = 3.5 --var_2_4 NUMBER-NUMBER
	var_2_0.WindowRounding = var_2_4
	var_2_5 = 0.5 --var_2_5 NUMBER-NUMBER
	var_2_6 = 0.5 --var_2_6 NUMBER-NUMBER
	var_2_4 = imgui.ImVec2(var_2_5, var_2_6)
	until false or (previous if statement is true) --location 0019
	var_2_0.WindowTitleAlign = var_2_4
	var_2_4 = 2 --var_2_4 NUMBER-NUMBER
	var_2_0.ChildWindowRounding = var_2_4
	var_2_4 = 3.5 --var_2_4 NUMBER-NUMBER
	var_2_0.FrameRounding = var_2_4
	var_2_5 = 5 --var_2_5 NUMBER-NUMBER
	var_2_6 = 4 --var_2_6 NUMBER-NUMBER
	var_2_4 = imgui.ImVec2(var_2_5, var_2_6)
	var_2_0.ItemSpacing = var_2_4
	var_2_4 = 13 --var_2_4 NUMBER-NUMBER
	var_2_0.ScrollbarSize = var_2_4
	var_2_4 = 0 --var_2_4 NUMBER-NUMBER
	var_2_0.ScrollbarRounding = var_2_4
	var_2_4 = 8 --var_2_4 NUMBER-NUMBER
	var_2_0.GrabMinSize = var_2_4
	var_2_4 = 1 --var_2_4 NUMBER-NUMBER
	var_2_0.GrabRounding = var_2_4
	var_2_5 = 4 --var_2_5 NUMBER-NUMBER
	var_2_6 = 4 --var_2_6 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0042
	var_2_4 = imgui.ImVec2(var_2_5, var_2_6)
	var_2_0.WindowPadding = var_2_4
	var_2_5 = 3.5 --var_2_5 NUMBER-NUMBER
	var_2_6 = 3.5 --var_2_6 NUMBER-NUMBER
	var_2_4 = imgui.ImVec2(var_2_5, var_2_6)
	var_2_0.FramePadding = var_2_4
	var_2_5 = 0 --var_2_5 NUMBER-NUMBER
	var_2_6 = 0.5 --var_2_6 NUMBER-NUMBER
	var_2_4 = imgui.ImVec2(var_2_5, var_2_6)
	var_2_0.ButtonTextAlign = var_2_4
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.1 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.83 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.01 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.8 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.CheckMark] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.85 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.63 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.01 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.8 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.Separator] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.85 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.63 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.01 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.8 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.TitleBg] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.85 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.63 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.01 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.8 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.TitleBgActive] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.06 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.06 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.06 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.91 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.WindowBg] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.65 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.6 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.05 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.8 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.Button] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.86 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.57 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.13 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.5 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.ButtonHovered] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.21 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.21 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.21 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0.81 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.ButtonActive] = var_2_5
	var_2_6 = 0.85 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.63 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.01 --var_2_8 NUMBER-NUMBER
	var_2_9 = 1 --var_2_9 NUMBER-NUMBER
	var_2_5 = imgui.ImVec4(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.SliderGrab] = var_2_5
	var_2_5 = imgui.ImVec4
	var_2_6 = 0.65 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0.6 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0.05 --var_2_8 NUMBER-NUMBER
	var_2_9 = 1 --var_2_9 NUMBER-NUMBER
	var_2_5 = var_2_5(var_2_6, var_2_7, var_2_8, var_2_9)
	var_2_0.Colors[imgui.Col.SliderGrabActive] = var_2_5
	return
end


function randomFunction	imgui.TextQuestion (INPUT_VAR_0_)
	imgui.TextDisabled("(?)")
	var_3_1 = imgui.IsItemHovered()
	if var_3_1 then
		--jump to 0027 (if previous if statement is false) --0027 JMP-JMP
		imgui.BeginTooltip()
		var_3_2 = 450 --var_3_2 NUMBER-NUMBER
		imgui.PushTextWrapPos(var_3_2)
		until false or (previous if statement is true) --location 0019
		var_3_2 = INPUT_VAR_0_
		imgui.TextUnformatted(var_3_2)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
	return
end


function randomFunction	imgui.OnDrawFrame ()
	var_4_2 = 400 --var_4_2 NUMBER-NUMBER
	var_4_3 = 260 --var_4_3 NUMBER-NUMBER
	imgui.SetNextWindowSize( imgui.ImVec2(var_4_2, var_4_3) )
	var_4_2 = uget_4_0 /  2 --var_4_2 NUMBER-NUMBER
	var_4_3 = uget_4_1 /  4 --var_4_3 NUMBER-NUMBER
	var_4_2 = var_4_2 - var_4_3 --var_4_2 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0019
	var_4_3 = uget_4_2 /  2 --var_4_3 NUMBER-NUMBER
	var_4_4 = uget_4_3 /  3 --var_4_4 NUMBER-NUMBER
	var_4_3 = var_4_3 - var_4_4 --var_4_3 NUMBER-NUMBER
	imgui.SetNextWindowPos( imgui.ImVec2(var_4_2, var_4_3) )
	var_4_1 = u8("Taxi Helper")
	var_4_3 = imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize --var_4_3 NUMBER-NUMBER
	imgui.Begin(var_4_1, uget_4_4, var_4_3)
	until false or (previous if statement is true) --location 0042
	var_4_1 = u8("Авто /clist")
	var_4_0 = imgui.Checkbox(var_4_1, autoClist)
	if var_4_0 then
		--jump to 0058 (if previous if statement is false) --0058 JMP-JMP
		uget_4_5.Main.autoClist = autoClist.v
		uget_4_6.save(uget_4_5, uget_4_7)
		var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
		var_4_2 = 5 --var_4_2 NUMBER-NUMBER
		imgui.SameLine(var_4_1, var_4_2)
		var_4_2 = "Автоматически включает заданный /clist п" --strings longer than 40 characters get cut off, so check to see if there's more!
		imgui.TextQuestion( u8(var_4_2) )
		var_4_1 = u8("Авто /sendcall")
		var_4_0 = imgui.Checkbox(var_4_1, autoAccept)
		if var_4_0 then
			--jump to 0088 (if previous if statement is false) --0088 JMP-JMP
			uget_4_5.Main.autoAccept = autoAccept.v
			uget_4_6.save(uget_4_5, uget_4_7)
			var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
			var_4_2 = 5 --var_4_2 NUMBER-NUMBER
			imgui.SameLine(var_4_1, var_4_2)
			var_4_2 = "Автоматически принимает вызов такси, есл" --strings longer than 40 characters get cut off, so check to see if there's more!
			imgui.TextQuestion( u8(var_4_2) )
			var_4_1 = u8("Авто /taxiskill")
			var_4_0 = imgui.Checkbox(var_4_1, autoSkill)
			if var_4_0 then
				--jump to 0118 (if previous if statement is false) --0118 JMP-JMP
				uget_4_5.Main.autoSkill = autoSkill.v
				uget_4_6.save(uget_4_5, uget_4_7)
				var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
				var_4_2 = 5 --var_4_2 NUMBER-NUMBER
				imgui.SameLine(var_4_1, var_4_2)
				var_4_2 = "Автоматически проверяет скилл через 2 се" --strings longer than 40 characters get cut off, so check to see if there's more!
				imgui.TextQuestion( u8(var_4_2) )
				imgui.NewLine()
				var_4_3 = 0 --var_4_3 NUMBER-NUMBER
				var_4_4 = 33 --var_4_4 NUMBER-NUMBER
				var_4_0 = imgui.SliderInt("Clist", clistId, var_4_3, var_4_4)
				if var_4_0 then
					--jump to 0151 (if previous if statement is false) --0151 JMP-JMP
					uget_4_5.Main.clist = clistId.v
					uget_4_6.save(uget_4_5, uget_4_7)
					var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
					var_4_2 = 5 --var_4_2 NUMBER-NUMBER
					imgui.SameLine(var_4_1, var_4_2)
					var_4_2 = "Устанавливает значение цвета для функции" --strings longer than 40 characters get cut off, so check to see if there's more!
					imgui.TextQuestion( u8(var_4_2) )
					imgui.NewLine()
					var_4_3 = 0 --var_4_3 NUMBER-NUMBER
					var_4_4 = 6000 --var_4_4 NUMBER-NUMBER
					var_4_0 = imgui.SliderInt("Accept Distance", accdist, var_4_3, var_4_4)
					if var_4_0 then
						--jump to 0184 (if previous if statement is false) --0184 JMP-JMP
						uget_4_5.Main.acceptDistance = accdist.v
						uget_4_6.save(uget_4_5, uget_4_7)
						var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
						var_4_2 = 5 --var_4_2 NUMBER-NUMBER
						imgui.SameLine(var_4_1, var_4_2)
						var_4_2 = "Устанавливает значение расстояния для фу" --strings longer than 40 characters get cut off, so check to see if there's more!
						imgui.TextQuestion( u8(var_4_2) )
						imgui.NewLine()
						var_4_3 = 1000 --var_4_3 NUMBER-NUMBER
						var_4_4 = 10000 --var_4_4 NUMBER-NUMBER
						var_4_0 = imgui.SliderInt("Delay", delay, var_4_3, var_4_4)
						if var_4_0 then
							--jump to 0217 (if previous if statement is false) --0217 JMP-JMP
							uget_4_5.Main.delay = delay.v
							uget_4_6.save(uget_4_5, uget_4_7)
							var_4_1 = nil --var_4_1 PRIMITIVE-PRIMITIVE
							var_4_2 = 5 --var_4_2 NUMBER-NUMBER
							imgui.SameLine(var_4_1, var_4_2)
							var_4_2 = "Устанавливает задержку между поступление" --strings longer than 40 characters get cut off, so check to see if there's more!
							imgui.TextQuestion( u8(var_4_2) )
							imgui.Separator()
							var_4_0 = imgui.Button( u8("Перезагрузить скрипт") )
							if var_4_0 then
								--jump to 0247 (if previous if statement is false) --0247 JMP-JMP
								var_4_1 = false --var_4_1 PRIMITIVE-PRIMITIVE
								showCursor(var_4_1)
								var_4_0 = thisScript()
								var_4_1 = var_4_0
								var_4_0.reload(var_4_1)
								imgui.End()
								return
							end
						end end end end end end end --REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME

function randomFunction	var_17_1.onDisplayGameText ()
	var_5_1 = 1000 --var_5_1 NUMBER-NUMBER
	wait(var_5_1)
	var_5_0, var_5_1 = sampGetPlayerIdByCharHandle(PLAYER_PED)
	myid = var_5_1
	_ = var_5_0
	var_5_0 = sampGetPlayerColor(myid)
	mycol = var_5_0
	if mycol == 0 then
		--jump to 0034 (if previous if statement is false) --0034 JMP-JMP
		var_5_1 = "{edf511}[Taxi Helper] {ffffff}Цвет ника " --strings longer than 40 characters get cut off, so check to see if there's more!
		until false or (previous if statement is true) --location 0019
		var_5_1 = var_5_1 .. uget_5_0.Main.clist
		var_5_2 = -1 --var_5_2 NUMBER-NUMBER
		sampAddChatMessage(var_5_1, var_5_2)
		var_5_1 = 100 --var_5_1 NUMBER-NUMBER
		wait(var_5_1)
		var_5_1 =  "/clist " .. uget_5_0.Main.clist
		sampSendChat(var_5_1)
	end
	return
end


function someFunc6(INPUT_VAR_0_,INPUT_VAR_1_,INPUT_VAR_2_)
	dtext = INPUT_VAR_2_
	dstyle = INPUT_VAR_0_
	dtime = INPUT_VAR_1_
	if dtext ==  "~b~~h~C: -$1000" then
		--jump to 0051 (if previous if statement is false) --0051 JMP-JMP
		var_6_4 = 13 --var_6_4 NUMBER-NUMBER
		var_6_5 = true --var_6_5 PRIMITIVE-PRIMITIVE
		setVirtualKeyDown(var_6_4, var_6_5)
		var_6_4 = 13 --var_6_4 NUMBER-NUMBER
		var_6_5 = false --var_6_5 PRIMITIVE-PRIMITIVE
		setVirtualKeyDown(var_6_4, var_6_5)
		if uget_6_0.Main.autoClist == true then
		end -- maybe?
		until false or (previous if statement is true) --location 0019
		--jump to 0024 (if previous if statement is false) --0024 JMP-JMP
		local randomFunction0 = function() end -- starts at  test.lua:0
		lua_thread.create(randomFunction0)
		--location 0024--0024 LOCATION-LOCATION
		if uget_6_0.Main.autoAccept == true then
			--jump to 0051 (if previous if statement is false) --0051 JMP-JMP
			var_6_3 = isCharInAnyCar(PLAYER_PED)
			if var_6_3 then
				--jump to 0051 (if previous if statement is false) --0051 JMP-JMP
				var_6_3 = storeCarCharIsInNoSave(PLAYER_PED)
				carhandle = var_6_3
				var_6_3 = getCarModel(carhandle)
				idcar = var_6_3
				until false or (previous if statement is true) --location 0042
				if idcar ~= 0 then
					--jump to 0049 (if previous if statement is false) --0049 JMP-JMP
					--jump to 0046 (if previous if statement is false) --0046 JMP-JMP
					--location 0046--0046 LOCATION-LOCATION
					--jump to 0049 (if previous if statement is false) --0049 JMP-JMP
					--jump to 0048 (if previous if statement is false) --0048 JMP-JMP
					--location 0048--0048 LOCATION-LOCATION
					--jump to 0049 (if previous if statement is false) --0049 JMP-JMP
					end_
					var_6_3 = true --var_6_3 PRIMITIVE-PRIMITIVE
				end
			end 
			rabden = var_6_3
		end
		return
	end
	

function randomFunction	var_17_1.onServerMessage ()
	var_7_1 = 100 --var_7_1 NUMBER-NUMBER
	wait(var_7_1)
	var_7_1 = uget_7_0
	var_7_2 = "- Диспетчер: Расстояние (.+) метр%(ов%)." --strings longer than 40 characters get cut off, so check to see if there's more!
	var_7_0, var_7_1 = uget_7_0.match(var_7_1, var_7_2)
	var_7_3 = var_7_0
	var_7_2 = tonumber(var_7_3)
	if var_7_2 <= uget_7_1.Main.acceptDistance then
		--jump to 0041 (if previous if statement is false) --0041 JMP-JMP
		var_7_3 = var_7_0
		until false or (previous if statement is true) --location 0019
		var_7_2 = tonumber(var_7_3)
		if var_7_2 ~= nil then
			--jump to 0041 (if previous if statement is false) --0041 JMP-JMP
			if rabden ~= true then
				--jump to 0028 (if previous if statement is false) --0028 JMP-JMP
				if rabden == nil then
				end -- maybe?
			else
				--location 0028--0028 LOCATION-LOCATION_
				wait(uget_7_1.Main.delay)
				var_7_4 = var_7_1
				var_7_3 =  "/sendcall " .. var_7_4
				sampSendChat(var_7_3)
				var_7_2 = false --var_7_2 PRIMITIVE-PRIMITIVE
				rabden = var_7_2
			end
		end 
		var_7_0 = 6000 --var_7_0 NUMBER-NUMBER
	end
	return
end


function randomFunction()
	var_8_1 = 100 --var_8_1 NUMBER-NUMBER
	wait(var_8_1)
	var_8_0 = false --var_8_0 PRIMITIVE-PRIMITIVE
	rabden = var_8_0
	return
end


function randomFunction()
	var_9_1 = 100 --var_9_1 NUMBER-NUMBER
	wait(var_9_1)
	var_9_0 = isCharInAnyCar(PLAYER_PED)
	if var_9_0 then
		--jump to 0023 (if previous if statement is false) --0023 JMP-JMP
		var_9_0 = storeCarCharIsInNoSave(PLAYER_PED)
		carhandle = var_9_0
		var_9_0, var_9_1 = getNumberOfPassengers(carhandle)
		passengers = var_9_1
		_ = var_9_0
		until false or (previous if statement is true) --location 0019
		if passengers == 0 then
			--jump to 0023 (if previous if statement is false) --0023 JMP-JMP
			var_9_0 = true --var_9_0 PRIMITIVE-PRIMITIVE
			rabden = var_9_0
		end 
	end
	return
end


function randomFunction()
	var_10_1 = 2000 --var_10_1 NUMBER-NUMBER
	wait(var_10_1)
	sampSendChat("/taxiskill")
	return
end


function randomFunction()
	var_11_1 = 100 --var_11_1 NUMBER-NUMBER
	wait(var_11_1)
	var_11_0 = true --var_11_0 PRIMITIVE-PRIMITIVE
	rabden = var_11_0
	return
end


function randomFunction()
	var_12_1 = 100 --var_12_1 NUMBER-NUMBER
	wait(var_12_1)
	var_12_0 = true --var_12_0 PRIMITIVE-PRIMITIVE
	rabden = var_12_0
	return
end


function randomFunction()
	var_13_1 = 100 --var_13_1 NUMBER-NUMBER
	wait(var_13_1)
	var_13_1 = "{edf511}[Taxi Helper] {ffffff}Цвет ника " --strings longer than 40 characters get cut off, so check to see if there's more!
	var_13_2 = -1 --var_13_2 NUMBER-NUMBER
	sampAddChatMessage(var_13_1, var_13_2)
	sampSendChat("/clist 0")
	var_13_0 = false --var_13_0 PRIMITIVE-PRIMITIVE
	rabden = var_13_0
	return
end


function someFunc14(INPUT_VAR_0_,INPUT_VAR_1_)
	var_14_2 = isGamePaused()
	if var_14_2 then
		--jump to 0009 (if previous if statement is false) --0009 JMP-JMP
		var_14_2 = isPauseMenuActive()
		if not var_14_2 then
		end -- maybe?
	else
		--location 0009--0009 LOCATION-LOCATION_
		if uget_14_0.Main.autoAccept == true then
			--jump to 0027 (if previous if statement is false) --0027 JMP-JMP
			var_14_3 = INPUT_VAR_1_
			var_14_5 = 1 --var_14_5 NUMBER-NUMBER
			until false or (previous if statement is true) --location 0019
			var_14_6 = true --var_14_6 PRIMITIVE-PRIMITIVE
			var_14_2 = string.find(var_14_3, "- Диспетчер: Расстояние", var_14_5, var_14_6)
			if var_14_2 then
				--jump to 0027 (if previous if statement is false) --0027 JMP-JMP
				local randomFunction1 = function() end -- starts at  test.lua:0
			end
		end 
		lua_thread.create(randomFunction1)
	end
	var_14_3 = INPUT_VAR_1_
	var_14_2 = INPUT_VAR_1_.find(var_14_3, "Пассажир .+ сел в ваше Такси.")
	if var_14_2 then
		--jump to 0040 (if previous if statement is false) --0040 JMP-JMP
		if rabden == true then
			--jump to 0040 (if previous if statement is false) --0040 JMP-JMP
			local randomFunction2 = function() end -- starts at  test.lua:0
			lua_thread.create(randomFunction2)
		end 
	end
	var_14_3 = INPUT_VAR_1_
	until false or (previous if statement is true) --location 0042
	var_14_2 = INPUT_VAR_1_.find(var_14_3, "Пассажир вышел из вашего Такси.")
	if var_14_2 then
		--jump to 0059 (if previous if statement is false) --0059 JMP-JMP
		local randomFunction3 = function() end -- starts at  test.lua:0
		lua_thread.create(randomFunction3)
		if uget_14_0.Main.autoSkill == true then
			--jump to 0059 (if previous if statement is false) --0059 JMP-JMP
			local randomFunction4 = function() end -- starts at  test.lua:0
			lua_thread.create(randomFunction4)
		end 
	end
	var_14_3 = INPUT_VAR_1_
	var_14_4 = "- Диспетчер: Пассажир уехал на другом та" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_14_2 = INPUT_VAR_1_.find(var_14_3, var_14_4)
	if var_14_2 then
		--jump to 0069 (if previous if statement is false) --0069 JMP-JMP
		local randomFunction5 = function() end -- starts at  test.lua:0
		lua_thread.create(randomFunction5)
	end
	var_14_3 = INPUT_VAR_1_
	var_14_4 = "- Диспетчер: Вызов отменен пользователем" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_14_2 = INPUT_VAR_1_.find(var_14_3, var_14_4)
	if var_14_2 then
		--jump to 0079 (if previous if statement is false) --0079 JMP-JMP
		local randomFunction6 = function() end -- starts at  test.lua:0
		lua_thread.create(randomFunction6)
	end
	var_14_3 = INPUT_VAR_1_
	var_14_4 = "Зарплата будет перечислена во время PayD" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_14_2 = INPUT_VAR_1_.find(var_14_3, var_14_4)
	if var_14_2 then
		--jump to 0097 (if previous if statement is false) --0097 JMP-JMP
		if uget_14_0.Main.autoClist == true then
			--jump to 0095 (if previous if statement is false) --0095 JMP-JMP
			local randomFunction7 = function() end -- starts at  test.lua:0
			lua_thread.create(randomFunction7)
		else
			--location 0095--0095 LOCATION-LOCATION_
			var_14_2 = false --var_14_2 PRIMITIVE-PRIMITIVE
			rabden = var_14_2
		end 
	end
	return
end


function randomFunction	var_17_1.onSendSpawn ()
	var_15_1 = 1200 --var_15_1 NUMBER-NUMBER
	wait(var_15_1)
	var_15_1 =  "/clist " .. uget_15_0.Main.clist
	sampSendChat(var_15_1)
	var_15_1 = "{edf511}[Taxi Helper] {ffffff}Цвет ника " --strings longer than 40 characters get cut off, so check to see if there's more!
	var_15_1 = var_15_1 .. uget_15_0.Main.clist
	var_15_2 = -1 --var_15_2 NUMBER-NUMBER
	sampAddChatMessage(var_15_1, var_15_2)
	until false or (previous if statement is true) --location 0019
	return
end


function someFunc16()
	if uget_16_0.Main.autoClist == true then
		--jump to 0013 (if previous if statement is false) --0013 JMP-JMP
		if rabden == true then
			--jump to 0013 (if previous if statement is false) --0013 JMP-JMP
			local randomFunction8 = function() end -- starts at  test.lua:0
			lua_thread.create(randomFunction8)
		end 
	end
	return
end


function someFunc17()
	script_name("[ERP] Taxi Helper")
	script_author("Baraw")
	require("lib.moonloader")
	require("lib.sampfuncs")
	var_17_0 = require("sampfuncs")
	var_17_1 = require("lib.samp.events")
	until false or (previous if statement is true) --location 0019
	var_17_2 = require("vkeys")
	var_17_3 = require("encoding")
	encoding = var_17_3
	var_17_3, var_17_4 = getScreenResolution()
	var_17_5 = var_17_3 -  500 --var_17_5 NUMBER-NUMBER
	var_17_6 = var_17_4 -  390 --var_17_6 NUMBER-NUMBER
	var_17_7 = require("inicfg")
	var_17_8 = require("imgui")
	imgui = var_17_8
	encoding.default = "CP1251"
	until false or (previous if statement is true) --location 0042
	u8 = encoding.UTF8
	var_17_8 = {} --to find out the contents of this table look inside the lua file
	var_17_9 = {} --to find out the contents of this table look inside the lua file
	var_17_8.Main = var_17_9
	var_17_11 = var_17_8
	var_17_10 = var_17_7.load(var_17_11, "TaxiHelper.ini")
	var_17_12 = var_17_10
	var_17_13 = "TaxiHelper.ini"
	var_17_7.save(var_17_12, var_17_13)
	var_17_12 = false --var_17_12 PRIMITIVE-PRIMITIVE
	var_17_11 = imgui.ImBool(var_17_12)
	var_17_13 = 256 --var_17_13 NUMBER-NUMBER
	var_17_12 = imgui.ImBuffer(var_17_13)
	local randomFunction9 = function() end -- starts at  test.lua:0
	main = randomFunction9
	local randomFunction10 = function() end -- starts at  test.lua:0
	cmd_th = randomFunction10
	var_17_13 = nil --var_17_13 PRIMITIVE-PRIMITIVE
	rabden = var_17_13
	var_17_13 = imgui.ImBool(var_17_10.Main.autoSkill)
	autoSkill = var_17_13
	var_17_13 = imgui.ImBool(var_17_10.Main.autoClist)
	autoClist = var_17_13
	var_17_13 = imgui.ImBool(var_17_10.Main.autoAccept)
	autoAccept = var_17_13
	var_17_13 = imgui.ImInt(var_17_10.Main.clist)
	clistId = var_17_13
	var_17_13 = imgui.ImInt(var_17_10.Main.acceptDistance)
	accdist = var_17_13
	var_17_13 = imgui.ImInt(var_17_10.Main.delay)
	delay = var_17_13
	local randomFunction11 = function() end -- starts at  test.lua:0
	apply_custom_style = randomFunction11
	apply_custom_style()
	local randomFunction12 = function() end -- starts at  test.lua:0
	imgui.TextQuestion = randomFunction12
	local randomFunction13 = function() end -- starts at  test.lua:0
	imgui.OnDrawFrame = randomFunction13
	local randomFunction14 = function() end -- starts at  test.lua:0
	var_17_1.onDisplayGameText = randomFunction14
	local randomFunction15 = function() end -- starts at  test.lua:0
	var_17_1.onServerMessage = randomFunction15
	local randomFunction16 = function() end -- starts at  test.lua:0
	var_17_1.onSendSpawn = randomFunction16
	return
end


