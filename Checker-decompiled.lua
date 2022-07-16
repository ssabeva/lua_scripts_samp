function randomFunction	main ()
	var_0_0 = isSampfuncsLoaded()
	if var_0_0 then
		--jump to 0009 (if previous if statement is false) --0009 JMP-JMP
		var_0_0 = isSampLoaded()
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
		var_0_0, var_0_1 = sampGetCurrentServerAddress()
		_ = var_0_1
		IP = var_0_0
		var_0_1 = {} --to find out the contents of this table look inside the lua file
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.Main = var_0_2
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.List1 = var_0_2
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.List2 = var_0_2
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.List3 = var_0_2
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.List4 = var_0_2
		var_0_2 = {} --to find out the contents of this table look inside the lua file
		var_0_1.List5 = var_0_2
		var_0_2 =  "Checker/" .. IP .. "/Settings.ini"
		var_0_0 = uget_0_0.load(var_0_1, var_0_2)
		ini = var_0_0
		LoadingINI()
		Register_CMD()
		var_0_0 = {}
		var_0_1 = renderCreateFont(ini.List1.Fonts, ini.List1.FontsSize, ini.List1.Flag)
		var_0_0[1] = var_0_1
		var_0_1 = renderCreateFont(ini.List2.Fonts, ini.List2.FontsSize, ini.List2.Flag)
		var_0_0[2] = var_0_1
		var_0_1 = renderCreateFont(ini.List3.Fonts, ini.List3.FontsSize, ini.List3.Flag)
		var_0_0[3] = var_0_1
		var_0_1 = renderCreateFont(ini.List4.Fonts, ini.List4.FontsSize, ini.List4.Flag)
		var_0_0[4] = var_0_1
		var_0_1 = renderCreateFont(ini.List5.Fonts, ini.List5.FontsSize, ini.List5.Flag) --var_0_1 REPLACE-REPLACE
		TSETM unhandled at 0108
		Font = var_0_0
		var_0_2 = "{8c8c8c}Checker: {ffffff}Автор скрипта: " --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_1 = string.format(var_0_2)
		var_0_2 = 16777215 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_0 = sampIsLocalPlayerSpawned()
		if not var_0_0 then
			--jump to 0126 (if previous if statement is false) --0126 JMP-JMP
			repeat
			var_0_1 = 100 --var_0_1 NUMBER-NUMBER
			wait(var_0_1)
		else
			--location 0126--0126 LOCATION-LOCATION_
			until false or (previous if statement is true) --location 0126
			var_0_0 = lua_thread.create(CreatZoneStats)
			ThrCreatZoneStats = var_0_0
			repeat
			var_0_1 = 1 --var_0_1 NUMBER-NUMBER
			wait(var_0_1)
			var_0_0, var_0_1 = sampGetCurrentServerAddress()
			_ = var_0_1
			UPDIP = var_0_0
			var_0_0 = sampGetGamestate()
			if var_0_0 ~= 2 then
				--jump to 0147 (if previous if statement is false) --0147 JMP-JMP
				var_0_0 = sampGetGamestate()
				if var_0_0 == 3 then
				end -- maybe?
			else
				--location 0147--0147 LOCATION-LOCATION_
				var_0_0 = {}
				var_0_1 = {}
				var_0_0[1] = var_0_1
				var_0_1 = {}
				var_0_0[2] = var_0_1
				var_0_1 = {}
				var_0_0[3] = var_0_1
				var_0_1 = {}
				var_0_0[4] = var_0_1
				var_0_1 = {}
				var_0_0[5] = var_0_1
				PlayerOnli = var_0_0
			end
			if UPDIP ~= IP then
				--jump to 0194 (if previous if statement is false) --0194 JMP-JMP
				IP = UPDIP
				var_0_0 = {}
				var_0_1 = {}
				var_0_0[1] = var_0_1
				var_0_1 = {}
				var_0_0[2] = var_0_1
				var_0_1 = {}
				var_0_0[3] = var_0_1
				var_0_1 = {}
				var_0_0[4] = var_0_1
				var_0_1 = {}
				var_0_0[5] = var_0_1
				PlayerList = var_0_0
				var_0_0 = {}
				var_0_1 = {}
				var_0_0[1] = var_0_1
				var_0_1 = {}
				var_0_0[2] = var_0_1
				var_0_1 = {}
				var_0_0[3] = var_0_1
				var_0_1 = {}
				var_0_0[4] = var_0_1
				var_0_1 = {}
				var_0_0[5] = var_0_1
				PlayerOnli = var_0_0
				var_0_1 = 100 --var_0_1 NUMBER-NUMBER
				wait(var_0_1)
				LoadingINI()
			end
			uget_0_1.Process = main_window_state.v
			if MainActive.v then
				--jump to 0131 (if previous if statement is false) --0131 JMP-JMP
				var_0_0 = isPauseMenuActive()
				if not var_0_0 then
					--jump to 0131 (if previous if statement is false) --0131 JMP-JMP
					var_0_0 = 1 --var_0_0 NUMBER-NUMBER
					var_0_1 = 5 --var_0_1 NUMBER-NUMBER
					var_0_2 = 1 --var_0_2 NUMBER-NUMBER
					for var_0_3 = var_0_0,var_0_1,var_0_2 do --location 0209, loop ends at 0716-1
						if unknown0.v then
							--jump to 0715 (if previous if statement is false) --0715 JMP-JMP
							if unknown1.v then
								--jump to 0225 (if previous if statement is false) --0225 JMP-JMP
								var_0_4 = isKeyDown(VK_F8)
								if var_0_4 then
								end -- maybe?
							else
								--location 0225--0225 LOCATION-LOCATION_
								if not unknown2.v then
								else
									--location 0230--0230 LOCATION-LOCATION_
									if unknown3 then
										--jump to 0276 (if previous if statement is false) --0276 JMP-JMP
										var_0_5 = 3 --var_0_5 NUMBER-NUMBER
										sampSetCursorMode(var_0_5)
										var_0_6, var_0_7 = getCursorPos()
										unknown5.v = var_0_7
										unknown4.v = var_0_6
										var_0_5 = 1 --var_0_5 NUMBER-NUMBER
										var_0_4 = isKeyJustPressed(var_0_5)
										if var_0_4 then
											--jump to 0276 (if previous if statement is false) --0276 JMP-JMP
											var_0_5 = false --var_0_5 PRIMITIVE-PRIMITIVE
											MoveList[var_0_3] = var_0_5
											var_0_5 = 0 --var_0_5 NUMBER-NUMBER
											sampSetCursorMode(var_0_5)
											SaveToINI()
											var_0_6 = "{8c8c8c}Checker: {ffffff}Настройки позиц" --strings longer than 40 characters get cut off, so check to see if there's more!
											var_0_5 = string.format(var_0_6)
											var_0_6 = 16777215 --var_0_6 NUMBER-NUMBER
											sampAddChatMessage(var_0_5, var_0_6)
											var_0_5 = 0 --var_0_5 NUMBER-NUMBER
											var_0_6 = 0 --var_0_6 NUMBER-NUMBER
											var_0_7 = 0 --var_0_7 NUMBER-NUMBER
											var_0_8 = 1057 --var_0_8 NUMBER-NUMBER
											addOneOffSound(var_0_5, var_0_6, var_0_7, var_0_8)
											var_0_5 = not main_window_state.v
											main_window_state.v = var_0_5
										end 
									end
									LEN unhandled at 0289
									var_0_7 = string.format("%s[%d]:", unknown8, unknown9)
									var_0_9 = unknown6.v - unknown11.v --var_0_9 NUMBER-NUMBER
									var_0_11 = uget_0_1.ImColor.FromFloat4(unknown12.v.unknownB13, unknown14.v.unknownB15, unknown16.v.unknownB17, unknown18.v.unknownB19)
									var_0_12 = var_0_11
									var_0_10 = uget_0_1.ImColor( var_0_11.GetVec4(var_0_12) )
									var_0_11 = var_0_10
									renderFontDrawText(unknown7, var_0_7, unknown10.v, var_0_9,  var_0_10.GetU32(var_0_11) )
									LEN unhandled at 0330
									var_0_6 = 0 --var_0_6 NUMBER-NUMBER
									if var_0_6 < unknown20 then
										--jump to 0715 (if previous if statement is false) --0715 JMP-JMP
										var_0_5 = 1 --var_0_5 NUMBER-NUMBER
										LEN unhandled at 0337
										var_0_7 = 1 --var_0_7 NUMBER-NUMBER
										for var_0_8 = var_0_5,unknown21,var_0_7 do --location 0339, loop ends at 0715-1
											var_0_9, var_0_10 = sampGetCharHandleBySampPlayerId(unknown23)
											if unknown24.v then
												--jump to 0361 (if previous if statement is false) --0361 JMP-JMP
												var_0_11 = string.format(" LVL: %d",  sampGetPlayerScore(unknown26) )
												if not var_0_11 then
												end -- maybe?
											else
												--location 0361--0361 LOCATION-LOCATION_
												var_0_11 = string.format("")
											end
											LVL = var_0_11
											if unknown27.v then
												--jump to 0380 (if previous if statement is false) --0380 JMP-JMP
												var_0_11 = string.format("[%d]", unknown29)
												if not var_0_11 then
												end -- maybe?
											else
												--location 0380--0380 LOCATION-LOCATION_
												var_0_11 = string.format("")
											end
											IDS = var_0_11
											if unknown30.v then
												--jump to 0401 (if previous if statement is false) --0401 JMP-JMP
												var_0_11 = string.format(" Ping: %d",  sampGetPlayerPing(unknown32) )
												if not var_0_11 then
												end -- maybe?
											else
												--location 0401--0401 LOCATION-LOCATION_
												var_0_11 = string.format("")
											end
											Ping = var_0_11
											if unknown33.v then
												--jump to 0433 (if previous if statement is false) --0433 JMP-JMP
												var_0_12 = var_0_10
												var_0_11 = doesCharExist(var_0_12)
												if var_0_11 then
													--jump to 0427 (if previous if statement is false) --0427 JMP-JMP
													var_0_11 = string.format(" HP: %d",  sampGetPlayerHealth(unknown35) )
													if not var_0_11 then
													end -- maybe?
												else
													--location 0427--0427 LOCATION-LOCATION_
													var_0_11 = string.format("")
												end
												HP = var_0_11
											else
												--location 0433--0433 LOCATION-LOCATION_
												var_0_11 = string.format("")
												HP = var_0_11
											end
											if unknown36.v then
												--jump to 0465 (if previous if statement is false) --0465 JMP-JMP
												var_0_12 = var_0_10
												var_0_11 = doesCharExist(var_0_12)
												if var_0_11 then
													--jump to 0459 (if previous if statement is false) --0459 JMP-JMP
													var_0_11 = string.format(" AR: %d",  sampGetPlayerArmor(unknown38) )
													if not var_0_11 then
													end -- maybe?
												else
													--location 0459--0459 LOCATION-LOCATION_
													var_0_11 = string.format("")
												end
												AR = var_0_11
											else
												--location 0465--0465 LOCATION-LOCATION_
												var_0_11 = string.format("")
												AR = var_0_11
											end
											if unknown39.v then
												--jump to 0496 (if previous if statement is false) --0496 JMP-JMP
												var_0_12 = var_0_10
												var_0_11 = doesCharExist(var_0_12)
												if var_0_11 then
													--jump to 0490 (if previous if statement is false) --0490 JMP-JMP
													var_0_15 = var_0_10
													var_0_11 = string.format(" Dis: %d",  getDistanceToPlayer(PLAYER_PED, var_0_15) )
													if not var_0_11 then
													end -- maybe?
												else
													--location 0490--0490 LOCATION-LOCATION_
													var_0_11 = string.format("")
												end
												DIST = var_0_11
											else
												--location 0496--0496 LOCATION-LOCATION_
												var_0_11 = string.format("")
												DIST = var_0_11
											end
											if not unknown40.v then
												--jump to 0665 (if previous if statement is false) --0665 JMP-JMP
												var_0_12 = var_0_10
												var_0_11 = doesCharExist(var_0_12)
												if var_0_11 then
													--jump to 0616 (if previous if statement is false) --0616 JMP-JMP
													var_0_11 = sampIsPlayerPaused(unknown42)
													if var_0_11 then
														--jump to 0567 (if previous if statement is false) --0567 JMP-JMP
														var_0_16 = uget_0_1.ImColor.FromFloat4(unknown43.v.unknownB44, unknown45.v.unknownB46, unknown47.v.unknownB48, unknown49.v.unknownB50)
														var_0_17 = var_0_16
														var_0_15 = uget_0_1.ImColor( var_0_16.GetVec4(var_0_17) )
														var_0_16 = var_0_15
														var_0_14 = argb_to_rgb( var_0_15.GetU32(var_0_16) )
														var_0_15 = sampGetPlayerNickname(unknown52)
														var_0_12 = string.format("{%06X}%s%s%s%s%s%s%s", var_0_14, var_0_15, IDS, HP, AR, LVL, Ping, DIST)
														RenderText[var_0_3] = var_0_12
													else
														--location 0567--0567 LOCATION-LOCATION_
														var_0_16 = uget_0_1.ImColor.FromFloat4(unknown53.v.unknownB54, unknown55.v.unknownB56, unknown57.v.unknownB58, unknown59.v.unknownB60)
														var_0_17 = var_0_16
														var_0_15 = uget_0_1.ImColor( var_0_16.GetVec4(var_0_17) )
														var_0_16 = var_0_15
														var_0_14 = argb_to_rgb( var_0_15.GetU32(var_0_16) )
														var_0_15 = sampGetPlayerNickname(unknown62)
														var_0_12 = string.format("{%06X}%s%s%s%s%s%s%s", var_0_14, var_0_15, IDS, HP, AR, LVL, Ping, DIST)
														RenderText[var_0_3] = var_0_12
													end 
												else
													--location 0616--0616 LOCATION-LOCATION_
													var_0_16 = uget_0_1.ImColor.FromFloat4(unknown63.v.unknownB64, unknown65.v.unknownB66, unknown67.v.unknownB68, unknown69.v.unknownB70)
													var_0_17 = var_0_16
													var_0_15 = uget_0_1.ImColor( var_0_16.GetVec4(var_0_17) )
													var_0_16 = var_0_15
													var_0_14 = argb_to_rgb( var_0_15.GetU32(var_0_16) )
													var_0_15 = sampGetPlayerNickname(unknown72)
													var_0_12 = string.format("{%06X}%s%s%s%s%s%s%s", var_0_14, var_0_15, IDS, HP, AR, LVL, Ping, DIST)
													RenderText[var_0_3] = var_0_12
												end 
											else
												--location 0665--0665 LOCATION-LOCATION_
												var_0_14 = argb_to_rgb( sampGetPlayerColor(unknown74) )
												var_0_15 = sampGetPlayerNickname(unknown76)
												var_0_12 = string.format("{%06X}%s%s%s%s%s%s%s", var_0_14, var_0_15, IDS, HP, AR, LVL, Ping, DIST)
												RenderText[var_0_3] = var_0_12
											end
											var_0_12 = 4294967295 --var_0_12 NUMBER-NUMBER
											var_0_11, var_0_12, var_0_13, var_0_14 = explode_argb(var_0_12)
										end
									end 
									var_0_19 = unknown6.v
									var_0_21 = var_0_11
									var_0_22 = var_0_12
									var_0_23 = var_0_13
									renderFontDrawText(unknown77, unknown78, unknown79.v, var_0_19,  join_argb(var_0_21, var_0_22, var_0_23, unknown80.v) )
								end
							end
						end
					end 
					var_0_4 = unknown6.v + unknown81.v --var_0_4 NUMBER-NUMBER
				end --location 0714, loops back to 0340-1
			end
		end --location 0715, loops back to 0210-1
		--jump to 0131 (if previous if statement is false) --0131 JMP-JMP
		until false or (previous if statement is true) --location 0717
		return
	end
	

function randomFunction	argb_to_rgb (INPUT_VAR_0_)
	var_1_2 = INPUT_VAR_0_
	var_1_3 = 16777215 --var_1_3 NUMBER-NUMBER
	return bit.band(var_1_2, var_1_3)
end


function randomFunction	explode_argb (INPUT_VAR_0_)
	var_2_3 = INPUT_VAR_0_
	var_2_4 = 24 --var_2_4 NUMBER-NUMBER
	var_2_2 = bit.rshift(var_2_3, var_2_4)
	var_2_3 = 255 --var_2_3 NUMBER-NUMBER
	var_2_1 = bit.band(var_2_2, var_2_3)
	var_2_4 = INPUT_VAR_0_
	var_2_5 = 16 --var_2_5 NUMBER-NUMBER
	var_2_3 = bit.rshift(var_2_4, var_2_5)
	var_2_4 = 255 --var_2_4 NUMBER-NUMBER
	var_2_2 = bit.band(var_2_3, var_2_4)
	until false or (previous if statement is true) --location 0019
	var_2_5 = INPUT_VAR_0_
	var_2_6 = 8 --var_2_6 NUMBER-NUMBER
	var_2_4 = bit.rshift(var_2_5, var_2_6)
	var_2_5 = 255 --var_2_5 NUMBER-NUMBER
	var_2_3 = bit.band(var_2_4, var_2_5)
	var_2_5 = INPUT_VAR_0_
	var_2_6 = 255 --var_2_6 NUMBER-NUMBER
	var_2_4 = bit.band(var_2_5, var_2_6)
	var_2_5 = var_2_2
	var_2_6 = var_2_3
	var_2_7 = var_2_4
	var_2_8 = var_2_1
	return var_2_5, var_2_6, var_2_7, var_2_8
end


function randomFunction	join_argb (INPUT_VAR_0_,INPUT_VAR_1_,INPUT_VAR_2_,INPUT_VAR_3_)
	var_3_4 = INPUT_VAR_2_
	var_3_6 = var_3_4
	var_3_8 = INPUT_VAR_1_
	var_3_9 = 8 --var_3_9 NUMBER-NUMBER
	var_3_5 = bit.bor(var_3_6,  bit.lshift(var_3_8, var_3_9) )
	var_3_4 = var_3_5
	var_3_6 = var_3_4
	var_3_8 = INPUT_VAR_0_
	var_3_9 = 16 --var_3_9 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0019
	var_3_5 = bit.bor(var_3_6,  bit.lshift(var_3_8, var_3_9) )
	var_3_4 = var_3_5
	var_3_6 = var_3_4
	var_3_8 = INPUT_VAR_3_
	var_3_9 = 24 --var_3_9 NUMBER-NUMBER
	var_3_5 = bit.bor(var_3_6,  bit.lshift(var_3_8, var_3_9) )
	var_3_4 = var_3_5
	return var_3_4
end


function randomFunction	var_19_1.onPlayerJoin (INPUT_VAR_0_,INPUT_VAR_1_,INPUT_VAR_2_,INPUT_VAR_3_)
	var_4_4 = 1 --var_4_4 NUMBER-NUMBER
	var_4_5 = 5 --var_4_5 NUMBER-NUMBER
	var_4_6 = 1 --var_4_6 NUMBER-NUMBER
	for var_4_7 = var_4_4,var_4_5,var_4_6 do --location 0004, loop ends at 0075-1
		for var_4_11, var_4_12 in ipairs(unknown82) do --var_4_8 FORTEST-FORTEST
			--jump to 0072 (if previous if statement is false) --0072 JMP-JMP
			var_4_14 = INPUT_VAR_3_
			var_4_13 = string.upper(var_4_14)
			var_4_15 = var_4_12
			var_4_14 = string.upper(var_4_15)
			if var_4_13 == var_4_14 then
			end -- maybe?
			until false or (previous if statement is true) --location 0019
			--jump to 0072 (if previous if statement is false) --0072 JMP-JMP
			LEN unhandled at 0024
			var_4_14 = unknown84 +  1 --var_4_14 NUMBER-NUMBER
			unknown83[var_4_14] = INPUT_VAR_0_
			if unknown85.v then
				--jump to 0072 (if previous if statement is false) --0072 JMP-JMP
				var_4_15 = "Список %d (%s): {FFFFFF}%s[%d] подключил" --strings longer than 40 characters get cut off, so check to see if there's more!
				var_4_16 = var_4_7
				var_4_18 = INPUT_VAR_3_
				var_4_19 = INPUT_VAR_0_
				var_4_14 = string.format(var_4_15, var_4_16, unknown86, var_4_18, var_4_19)
				var_4_16 = uget_4_0.ImColor.FromFloat4(unknown87.v.unknownB88, unknown89.v.unknownB90, unknown91.v.unknownB92, unknown93.v.unknownB94)
				var_4_17 = var_4_16
				var_4_15 = uget_4_0.ImColor( var_4_16.GetVec4(var_4_17) )
				var_4_16 = var_4_15
				sampAddChatMessage(var_4_14,  var_4_15.GetU32(var_4_16) )
			end
		end --end of a for loop
	end --location 0074, loops back to 0005-1
	return
end


function randomFunction	var_19_1.onPlayerQuit (INPUT_VAR_0_,INPUT_VAR_1_)
	var_5_2 = 1 --var_5_2 NUMBER-NUMBER
	var_5_3 = 5 --var_5_3 NUMBER-NUMBER
	var_5_4 = 1 --var_5_4 NUMBER-NUMBER
	for var_5_5 = var_5_2,var_5_3,var_5_4 do --location 0004, loop ends at 0077-1
		for var_5_9, var_5_10 in ipairs(unknown95) do --var_5_6 FORTEST-FORTEST
			--jump to 0074 (if previous if statement is false) --0074 JMP-JMP
			var_5_12 = var_5_10
			var_5_11 = tonumber(var_5_12)
			var_5_13 = INPUT_VAR_0_
			var_5_12 = tonumber(var_5_13)
			if var_5_11 == var_5_12 then
				--jump to 0074 (if previous if statement is false) --0074 JMP-JMP
				until false or (previous if statement is true) --location 0019
				var_5_13 = var_5_9
				table.remove(unknown96, var_5_13)
				if unknown97.v then
					--jump to 0074 (if previous if statement is false) --0074 JMP-JMP
					var_5_13 = "Список: %d (%s): {FFFFFF}%s[%d] покинул " --strings longer than 40 characters get cut off, so check to see if there's more!
					var_5_14 = var_5_5
					var_5_17 = INPUT_VAR_0_
					var_5_16 = sampGetPlayerNickname(var_5_17)
					var_5_17 = INPUT_VAR_0_
					var_5_19 = INPUT_VAR_1_ +  1 --var_5_19 NUMBER-NUMBER
					var_5_12 = string.format(var_5_13, var_5_14, unknown98, var_5_16, var_5_17, unknown99)
					var_5_14 = uget_5_0.ImColor.FromFloat4(unknown100.v.unknownB101, unknown102.v.unknownB103, unknown104.v.unknownB105, unknown106.v.unknownB107)
					var_5_15 = var_5_14
					var_5_13 = uget_5_0.ImColor( var_5_14.GetVec4(var_5_15) )
					var_5_14 = var_5_13
					sampAddChatMessage(var_5_12,  var_5_13.GetU32(var_5_14) )
				end 
			end
		end --end of a for loop
	end --location 0076, loops back to 0005-1
	return
end


function randomFunction	CreatZoneStats ()
	var_6_0 = {}
	var_6_1 = {}
	var_6_0[1] = var_6_1
	var_6_1 = {}
	var_6_0[2] = var_6_1
	var_6_1 = {}
	var_6_0[3] = var_6_1
	var_6_1 = {}
	var_6_0[4] = var_6_1
	var_6_1 = {}
	var_6_0[5] = var_6_1
	PlayerOnli = var_6_0
	var_6_0 = 0 --var_6_0 NUMBER-NUMBER
	var_6_2 = false --var_6_2 PRIMITIVE-PRIMITIVE
	var_6_1 = sampGetMaxPlayerId(var_6_2)
	var_6_2 = 1 --var_6_2 NUMBER-NUMBER
	for var_6_3 = var_6_0,var_6_1,var_6_2 do --location 0018, loop ends at 0056-1
		until false or (previous if statement is true) --location 0019
		var_6_5 = var_6_3
		var_6_4 = sampIsPlayerConnected(var_6_5)
		if var_6_4 then
			--jump to 0055 (if previous if statement is false) --0055 JMP-JMP
			var_6_4 = 1 --var_6_4 NUMBER-NUMBER
			var_6_5 = 5 --var_6_5 NUMBER-NUMBER
			var_6_6 = 1 --var_6_6 NUMBER-NUMBER
			for var_6_7 = var_6_4,var_6_5,var_6_6 do --location 0027, loop ends at 0055-1
				for var_6_11, var_6_12 in ipairs(unknown108) do --var_6_8 FORTEST-FORTEST
					--jump to 0052 (if previous if statement is false) --0052 JMP-JMP
					var_6_15 = var_6_3
					var_6_13 = string.upper( sampGetPlayerNickname(var_6_15) )
					var_6_15 = var_6_12
					var_6_14 = string.upper(var_6_15)
					if var_6_13 == var_6_14 then
						--jump to 0052 (if previous if statement is false) --0052 JMP-JMP
						LEN unhandled at 0049
						var_6_14 = unknown110 +  1 --var_6_14 NUMBER-NUMBER
						unknown109[var_6_14] = var_6_3
					end --end of a for loop
				end --location 0054, loops back to 0028-1
			end --location 0055, loops back to 0019-1
			return
		end
	end end --REVERSE ME--REVERSE ME

function randomFunction	getDistanceToPlayer (INPUT_VAR_0_,INPUT_VAR_1_)
	var_7_3 = INPUT_VAR_1_
	var_7_2, var_7_3, var_7_4 = getCharCoordinates(var_7_3)
	var_7_6 = INPUT_VAR_0_
	var_7_5, var_7_6, var_7_7 = getCharCoordinates(var_7_6)
	var_7_9 = var_7_2
	var_7_10 = var_7_3
	var_7_11 = var_7_4
	var_7_12 = var_7_5
	var_7_13 = var_7_6
	var_7_14 = var_7_7
	var_7_8 = getDistanceBetweenCoords3d(var_7_9, var_7_10, var_7_11, var_7_12, var_7_13, var_7_14)
	return var_7_8
end


function randomFunction	var_19_2.BeforeDrawFrame ()
	if not fontChanged then
		--jump to 0036 (if previous if statement is false) --0036 JMP-JMP
		var_8_0 = true --var_8_0 PRIMITIVE-PRIMITIVE
		fontChanged = var_8_0
		var_8_0 = uget_8_1.GetIO()
		var_8_1 = var_8_0.Fonts
		var_8_0 = var_8_0.Fonts.GetGlyphRangesCyrillic(var_8_1)
		var_8_0 = var_8_0
		var_8_0 = uget_8_1.GetIO()
		var_8_1 = var_8_0.Fonts
		until false or (previous if statement is true) --location 0019
		var_8_0.Fonts.Clear(var_8_1)
		var_8_0 = uget_8_1.GetIO()
		var_8_1 = var_8_0.Fonts
		var_8_3 = 20 --var_8_3 NUMBER-NUMBER
		var_8_2 = getFolderPath(var_8_3)
		var_8_2 = var_8_2 .. "\arialbd.ttf"
		var_8_3 = 14 --var_8_3 NUMBER-NUMBER
		var_8_4 = nil --var_8_4 PRIMITIVE-PRIMITIVE
		var_8_0.Fonts.AddFontFromFileTTF(var_8_1, var_8_2, var_8_3, var_8_4, uget_8_0)
	end
	return
end


function randomFunction	var_19_2.OnDrawFrame ()
	var_9_1 = false --var_9_1 PRIMITIVE-PRIMITIVE
	main_window_state.v = var_9_1
	var_9_1 = 300 --var_9_1 NUMBER-NUMBER
	wait(var_9_1)
	var_9_0 = thisScript()
	var_9_1 = var_9_0
	var_9_0.reload(var_9_1)
	var_9_1 = "{8c8c8c}Checker: {ffffff}Скрипт перезагр" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_9_2 = 4294967295 --var_9_2 NUMBER-NUMBER
	sampAddChatMessage(var_9_1, var_9_2)
	return
end


function someFunc10()
	var_10_0, var_10_1 = getScreenResolution()
	if main_window_state.v then
		--jump to 1017 (if previous if statement is false) --1017 JMP-JMP
		var_10_5 = var_10_0 /  2 --var_10_5 NUMBER-NUMBER
		var_10_6 = var_10_1 /  2 --var_10_6 NUMBER-NUMBER
		var_10_4 = uget_10_0.ImVec2(var_10_5, var_10_6)
		until false or (previous if statement is true) --location 0019
		var_10_7 = 0.5 --var_10_7 NUMBER-NUMBER
		var_10_8 = 0.5 --var_10_8 NUMBER-NUMBER
		uget_10_0.SetNextWindowPos(var_10_4, uget_10_0.Cond.FirstUseEver,  uget_10_0.ImVec2(var_10_7, var_10_8) )
		var_10_5 = 574 --var_10_5 NUMBER-NUMBER
		var_10_6 = 600 --var_10_6 NUMBER-NUMBER
		var_10_4 = uget_10_0.ImVec2(var_10_5, var_10_6)
		uget_10_0.SetNextWindowSize(var_10_4, uget_10_0.Cond.FirstUseEver)
		var_10_4 = u8("Настройки | Checker by Dima_Fax")
		uget_10_0.Begin(var_10_4, main_window_state)
		var_10_4 = 0 --var_10_4 NUMBER-NUMBER
		var_10_6 = 544 --var_10_6 NUMBER-NUMBER
		var_10_7 = 35 --var_10_7 NUMBER-NUMBER
		var_10_5 = uget_10_0.ImVec2(var_10_6, var_10_7)
		var_10_6 = true --var_10_6 PRIMITIVE-PRIMITIVE
		uget_10_0.BeginChild(var_10_4, var_10_5, var_10_6)
		if MainActive.v then
			--jump to 0064 (if previous if statement is false) --0064 JMP-JMP
			var_10_4 = u8("Выключить##v")
			if not var_10_4 then
			end -- maybe?
		else
			--location 0064--0064 LOCATION-LOCATION_
			var_10_4 = u8("Включить##v")
		end
		var_10_6 = 85 --var_10_6 NUMBER-NUMBER
		var_10_7 = 20 --var_10_7 NUMBER-NUMBER
		var_10_3 = uget_10_0.Button(var_10_4,  uget_10_0.ImVec2(var_10_6, var_10_7) )
		if var_10_3 then
			--jump to 0088 (if previous if statement is false) --0088 JMP-JMP
			var_10_4 = not MainActive.v
			MainActive.v = var_10_4
			var_10_4 = 0 --var_10_4 NUMBER-NUMBER
			var_10_5 = 0 --var_10_5 NUMBER-NUMBER
			var_10_6 = 0 --var_10_6 NUMBER-NUMBER
			var_10_7 = 1057 --var_10_7 NUMBER-NUMBER
			addOneOffSound(var_10_4, var_10_5, var_10_6, var_10_7)
			SaveToINI()
		end
		uget_10_0.SameLine()
		var_10_4 = u8("Сохранить настройки")
		var_10_6 = 150 --var_10_6 NUMBER-NUMBER
		var_10_7 = 20 --var_10_7 NUMBER-NUMBER
		var_10_3 = uget_10_0.Button(var_10_4,  uget_10_0.ImVec2(var_10_6, var_10_7) )
		if var_10_3 then
			--jump to 0119 (if previous if statement is false) --0119 JMP-JMP
			var_10_5 = "{8c8c8c}Checker: {FFFFFF}Настройки сохра" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_10_4 = string.format(var_10_5)
			var_10_5 = 16777215 --var_10_5 NUMBER-NUMBER
			sampAddChatMessage(var_10_4, var_10_5)
			var_10_4 = 0 --var_10_4 NUMBER-NUMBER
			var_10_5 = 0 --var_10_5 NUMBER-NUMBER
			var_10_6 = 0 --var_10_6 NUMBER-NUMBER
			var_10_7 = 1057 --var_10_7 NUMBER-NUMBER
			addOneOffSound(var_10_4, var_10_5, var_10_6, var_10_7)
			SaveToINI()
		end
		uget_10_0.SameLine()
		until false or (previous if statement is true) --location 0126
		var_10_4 = u8("Перезагрузить скрипт")
		var_10_6 = 150 --var_10_6 NUMBER-NUMBER
		var_10_7 = 20 --var_10_7 NUMBER-NUMBER
		var_10_3 = uget_10_0.Button(var_10_4,  uget_10_0.ImVec2(var_10_6, var_10_7) )
		if var_10_3 then
			--jump to 0139 (if previous if statement is false) --0139 JMP-JMP
			local randomFunction0 = function() end -- starts at  test.lua:0
			lua_thread.create(randomFunction0)
			uget_10_0.SameLine()
			var_10_4 = u8("Обновить списки")
			var_10_6 = 120 --var_10_6 NUMBER-NUMBER
			var_10_7 = 20 --var_10_7 NUMBER-NUMBER
			var_10_3 = uget_10_0.Button(var_10_4,  uget_10_0.ImVec2(var_10_6, var_10_7) )
			if var_10_3 then
				--jump to 0242 (if previous if statement is false) --0242 JMP-JMP
				var_10_3 = {}
				var_10_4 = {}
				var_10_3[1] = var_10_4
				var_10_4 = {}
				var_10_3[2] = var_10_4
				var_10_4 = {}
				var_10_3[3] = var_10_4
				var_10_4 = {}
				var_10_3[4] = var_10_4
				var_10_4 = {}
				var_10_3[5] = var_10_4
				PlayerList = var_10_3
				var_10_3 = 1 --var_10_3 NUMBER-NUMBER
				var_10_4 = 5 --var_10_4 NUMBER-NUMBER
				var_10_5 = 1 --var_10_5 NUMBER-NUMBER
				for var_10_6 = var_10_3,var_10_4,var_10_5 do --location 0170, loop ends at 0234-1
					var_10_11 = var_10_6
					var_10_8 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_11 .. ".txt"
					var_10_7 = io.open(var_10_8, "a")
					var_10_9 = var_10_7
					var_10_7.write(var_10_9, "")
					var_10_9 = var_10_7
					io.close(var_10_9)
					var_10_12 = var_10_6
					var_10_9 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_12 .. ".txt"
					var_10_8 = doesFileExist(var_10_9)
					if var_10_8 then
						--jump to 0233 (if previous if statement is false) --0233 JMP-JMP
						var_10_12 = var_10_6
						var_10_9 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_12 .. ".txt"
						var_10_8 = io.open(var_10_9, "r")
						var_10_10 = var_10_8
						var_10_9 = var_10_8.read(var_10_10, "*a")
						MessageIMG = var_10_9
						var_10_10 = MessageIMG
						var_10_11 =  MessageIMG.gmatch(var_10_10, "[^\r\n]+")
						--jump to 0227 (if previous if statement is false) --0227 JMP-JMP
						LEN unhandled at 0224
						var_10_14 = unknown112 +  1 --var_10_14 NUMBER-NUMBER
						unknown111[var_10_14] = var_10_12
					end --end of a for loop
					var_10_10 = var_10_8
					io.close(var_10_10)
				end --location 0233, loops back to 0171-1
				var_10_4 = ThrCreatZoneStats
				ThrCreatZoneStats.run(var_10_4)
				var_10_4 = "{8c8c8c}Checker: {ffffff}Все списки с ни" --strings longer than 40 characters get cut off, so check to see if there's more!
				var_10_5 = 4294967295 --var_10_5 NUMBER-NUMBER
				sampAddChatMessage(var_10_4, var_10_5)
				uget_10_0.EndChild()
				var_10_3 = 1 --var_10_3 NUMBER-NUMBER
				var_10_4 = 5 --var_10_4 NUMBER-NUMBER
				var_10_5 = 1 --var_10_5 NUMBER-NUMBER
				for var_10_6 = var_10_3,var_10_4,var_10_5 do --location 0248, loop ends at 1014-1
					var_10_11 = var_10_6
					var_10_7 = uget_10_0.CollapsingHeader( u8( string.format("Список %d (%s)", var_10_11, unknown113) ) )
					if var_10_7 then
						--jump to 1013 (if previous if statement is false) --1013 JMP-JMP
						uget_10_0.Separator()
						uget_10_0.Text( u8("Основные настройки:") )
						var_10_8 = u8("Включить/Выключить##")
						var_10_9 = var_10_6
						var_10_8 = var_10_8 .. var_10_9 .. ""
						var_10_7 = uget_10_0.Checkbox(var_10_8, unknown114)
						if var_10_7 then
							--jump to 0293 (if previous if statement is false) --0293 JMP-JMP
							var_10_8 = 0 --var_10_8 NUMBER-NUMBER
							var_10_9 = 0 --var_10_9 NUMBER-NUMBER
							var_10_10 = 0 --var_10_10 NUMBER-NUMBER
							var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
							addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
							SaveToINI()
							var_10_8 = u8("Чистый скриншот##")
							var_10_9 = var_10_6
							var_10_8 = var_10_8 .. var_10_9 .. ""
							var_10_7 = uget_10_0.Checkbox(var_10_8, unknown115)
							if var_10_7 then
								--jump to 0314 (if previous if statement is false) --0314 JMP-JMP
								var_10_8 = 0 --var_10_8 NUMBER-NUMBER
								var_10_9 = 0 --var_10_9 NUMBER-NUMBER
								var_10_10 = 0 --var_10_10 NUMBER-NUMBER
								var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
								addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
								SaveToINI()
								var_10_8 = u8("Отображать уровень##")
								var_10_9 = var_10_6
								var_10_8 = var_10_8 .. var_10_9 .. ""
								var_10_7 = uget_10_0.Checkbox(var_10_8, unknown116)
								if var_10_7 then
									--jump to 0335 (if previous if statement is false) --0335 JMP-JMP
									var_10_8 = 0 --var_10_8 NUMBER-NUMBER
									var_10_9 = 0 --var_10_9 NUMBER-NUMBER
									var_10_10 = 0 --var_10_10 NUMBER-NUMBER
									var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
									addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
									SaveToINI()
									var_10_8 = u8("Отображать ID##")
									var_10_9 = var_10_6
									var_10_8 = var_10_8 .. var_10_9 .. ""
									var_10_7 = uget_10_0.Checkbox(var_10_8, unknown117)
									if var_10_7 then
										--jump to 0356 (if previous if statement is false) --0356 JMP-JMP
										var_10_8 = 0 --var_10_8 NUMBER-NUMBER
										var_10_9 = 0 --var_10_9 NUMBER-NUMBER
										var_10_10 = 0 --var_10_10 NUMBER-NUMBER
										var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
										addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
										SaveToINI()
										var_10_8 = u8("Отображать жизни##")
										var_10_9 = var_10_6
										var_10_8 = var_10_8 .. var_10_9 .. ""
										var_10_7 = uget_10_0.Checkbox(var_10_8, unknown118)
										if var_10_7 then
											--jump to 0377 (if previous if statement is false) --0377 JMP-JMP
											var_10_8 = 0 --var_10_8 NUMBER-NUMBER
											var_10_9 = 0 --var_10_9 NUMBER-NUMBER
											var_10_10 = 0 --var_10_10 NUMBER-NUMBER
											var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
											addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
											SaveToINI()
											var_10_8 = u8("Отображать броню##")
											var_10_9 = var_10_6
											var_10_8 = var_10_8 .. var_10_9 .. ""
											var_10_7 = uget_10_0.Checkbox(var_10_8, unknown119)
											if var_10_7 then
												--jump to 0398 (if previous if statement is false) --0398 JMP-JMP
												var_10_8 = 0 --var_10_8 NUMBER-NUMBER
												var_10_9 = 0 --var_10_9 NUMBER-NUMBER
												var_10_10 = 0 --var_10_10 NUMBER-NUMBER
												var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
												addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
												SaveToINI()
												var_10_8 = u8("Отображать дистанцию##")
												var_10_9 = var_10_6
												var_10_8 = var_10_8 .. var_10_9 .. ""
												var_10_7 = uget_10_0.Checkbox(var_10_8, unknown120)
												if var_10_7 then
													--jump to 0419 (if previous if statement is false) --0419 JMP-JMP
													var_10_8 = 0 --var_10_8 NUMBER-NUMBER
													var_10_9 = 0 --var_10_9 NUMBER-NUMBER
													var_10_10 = 0 --var_10_10 NUMBER-NUMBER
													var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
													addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
													SaveToINI()
													var_10_8 = u8("Отображать пинг##")
													var_10_9 = var_10_6
													var_10_8 = var_10_8 .. var_10_9 .. ""
													var_10_7 = uget_10_0.Checkbox(var_10_8, unknown121)
													if var_10_7 then
														--jump to 0440 (if previous if statement is false) --0440 JMP-JMP
														var_10_8 = 0 --var_10_8 NUMBER-NUMBER
														var_10_9 = 0 --var_10_9 NUMBER-NUMBER
														var_10_10 = 0 --var_10_10 NUMBER-NUMBER
														var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
														addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
														SaveToINI()
														var_10_8 = u8("Отображать сообщение о подключении##")
														var_10_9 = var_10_6
														var_10_8 = var_10_8 .. var_10_9 .. ""
														var_10_7 = uget_10_0.Checkbox(var_10_8, unknown122)
														if var_10_7 then
															--jump to 0461 (if previous if statement is false) --0461 JMP-JMP
															var_10_8 = 0 --var_10_8 NUMBER-NUMBER
															var_10_9 = 0 --var_10_9 NUMBER-NUMBER
															var_10_10 = 0 --var_10_10 NUMBER-NUMBER
															var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
															addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
															SaveToINI()
															var_10_8 = u8("Отображать сообщение о отключении##")
															var_10_9 = var_10_6
															var_10_8 = var_10_8 .. var_10_9 .. ""
															var_10_7 = uget_10_0.Checkbox(var_10_8, unknown123)
															if var_10_7 then
																--jump to 0482 (if previous if statement is false) --0482 JMP-JMP
																var_10_8 = 0 --var_10_8 NUMBER-NUMBER
																var_10_9 = 0 --var_10_9 NUMBER-NUMBER
																var_10_10 = 0 --var_10_10 NUMBER-NUMBER
																var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
																addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
																SaveToINI()
																uget_10_0.Separator()
																uget_10_0.Text( u8("Настройки рендера:") )
																var_10_8 = 150 --var_10_8 NUMBER-NUMBER
																uget_10_0.PushItemWidth(var_10_8)
																var_10_8 = u8("Название шрифта (Сейчас: ")
																var_10_8 = var_10_8 .. unknown124 .. ")"
																var_10_7 = uget_10_0.InputText(var_10_8, unknown125)
																if var_10_7 then
																	--jump to 0519 (if previous if statement is false) --0519 JMP-JMP
																	var_10_9 = u8
																	var_10_8 = u8.decode(var_10_9, unknown127.v)
																	unknown126.v = var_10_8
																	var_10_8 = u8( string.format("Название списка (Сейчас: %s)", unknown128) )
																	var_10_7 = uget_10_0.InputText(var_10_8, unknown129)
																	if var_10_7 then
																		--jump to 0544 (if previous if statement is false) --0544 JMP-JMP
																		var_10_9 = u8
																		var_10_8 = u8.decode(var_10_9, unknown131.v)
																		unknown130.v = var_10_8
																		uget_10_0.PopItemWidth()
																		var_10_8 = 90 --var_10_8 NUMBER-NUMBER
																		uget_10_0.PushItemWidth(var_10_8)
																		var_10_8 = u8("Размер##")
																		var_10_9 = var_10_6
																		var_10_8 = var_10_8 .. var_10_9 .. ""
																		var_10_10 = 1 --var_10_10 NUMBER-NUMBER
																		var_10_11 = 10 --var_10_11 NUMBER-NUMBER
																		var_10_7 = uget_10_0.InputInt(var_10_8, unknown132, var_10_10, var_10_11)
																		if var_10_7 then
																			--jump to 0576 (if previous if statement is false) --0576 JMP-JMP
																			var_10_9 = 1 --var_10_9 NUMBER-NUMBER
																			var_10_10 = 40 --var_10_10 NUMBER-NUMBER
																			var_10_8 = LimitInputInt(var_10_9, var_10_10, unknown134.v)
																			unknown133.v = var_10_8
																			var_10_8 = u8("Отступ между строк##")
																			var_10_9 = var_10_6
																			var_10_8 = var_10_8 .. var_10_9 .. ""
																			var_10_10 = 1 --var_10_10 NUMBER-NUMBER
																			var_10_11 = 10 --var_10_11 NUMBER-NUMBER
																			var_10_7 = uget_10_0.InputInt(var_10_8, unknown135, var_10_10, var_10_11)
																			if var_10_7 then
																				--jump to 0601 (if previous if statement is false) --0601 JMP-JMP
																				var_10_9 = 1 --var_10_9 NUMBER-NUMBER
																				var_10_10 = 50 --var_10_10 NUMBER-NUMBER
																				var_10_8 = LimitInputInt(var_10_9, var_10_10, unknown137.v)
																				unknown136.v = var_10_8
																				var_10_8 = u8("Флаг##")
																				var_10_9 = var_10_6
																				var_10_8 = var_10_8 .. var_10_9 .. ""
																				var_10_10 = 1 --var_10_10 NUMBER-NUMBER
																				var_10_11 = 10 --var_10_11 NUMBER-NUMBER
																				var_10_7 = uget_10_0.InputInt(var_10_8, unknown138, var_10_10, var_10_11)
																				if var_10_7 then
																					--jump to 0626 (if previous if statement is false) --0626 JMP-JMP
																					var_10_9 = 1 --var_10_9 NUMBER-NUMBER
																					var_10_10 = 100 --var_10_10 NUMBER-NUMBER
																					var_10_8 = LimitInputInt(var_10_9, var_10_10, unknown140.v)
																					unknown139.v = var_10_8
																					uget_10_0.PopItemWidth()
																					var_10_8 = u8("Изменить позицию##")
																					var_10_9 = var_10_6
																					var_10_8 = var_10_8 .. var_10_9 .. ""
																					var_10_10 = 130 --var_10_10 NUMBER-NUMBER
																					var_10_11 = 20 --var_10_11 NUMBER-NUMBER
																					var_10_7 = uget_10_0.Button(var_10_8,  uget_10_0.ImVec2(var_10_10, var_10_11) )
																					if var_10_7 then
																						--jump to 0658 (if previous if statement is false) --0658 JMP-JMP
																						var_10_8 = false --var_10_8 PRIMITIVE-PRIMITIVE
																						main_window_state.v = var_10_8
																						var_10_8 = true --var_10_8 PRIMITIVE-PRIMITIVE
																						MoveList[var_10_6] = var_10_8
																						var_10_9 = "{8c8c8c}Checker: {ffffff}Перемести отобр" --strings longer than 40 characters get cut off, so check to see if there's more!
																						var_10_8 = string.format(var_10_9)
																						var_10_9 = 16777215 --var_10_9 NUMBER-NUMBER
																						sampAddChatMessage(var_10_8, var_10_9)
																						uget_10_0.Separator()
																						uget_10_0.Text( u8("Настройки цвета:") )
																						var_10_8 = 240 --var_10_8 NUMBER-NUMBER
																						uget_10_0.PushItemWidth(var_10_8)
																						var_10_8 = u8("Цвет названия списка##")
																						var_10_9 = var_10_6
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						uget_10_0.ColorEdit4(var_10_8, unknown141)
																						var_10_8 = u8("Цвет списка игроков##")
																						var_10_9 = var_10_6
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						uget_10_0.ColorEdit4(var_10_8, unknown142, uget_10_0.ColorEditFlags.NoAlpha)
																						var_10_8 = u8("Цвет списка игроков в зоне стрима##")
																						var_10_9 = var_10_6
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						uget_10_0.ColorEdit4(var_10_8, unknown143, uget_10_0.ColorEditFlags.NoAlpha)
																						var_10_8 = u8("Цвет списка игроков AFK##")
																						var_10_9 = var_10_6
																						until false or (previous if statement is true) --location 0717
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						uget_10_0.ColorEdit4(var_10_8, unknown144, uget_10_0.ColorEditFlags.NoAlpha)
																						var_10_8 = u8("Прозрачность списка##")
																						var_10_9 = var_10_6
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						var_10_10 = 1 --var_10_10 NUMBER-NUMBER
																						var_10_11 = 255 --var_10_11 NUMBER-NUMBER
																						uget_10_0.SliderInt(var_10_8, unknown145, var_10_10, var_10_11)
																						uget_10_0.PopItemWidth()
																						var_10_8 = u8("Цвет списка из clista##")
																						var_10_9 = var_10_6
																						var_10_8 = var_10_8 .. var_10_9 .. ""
																						var_10_7 = uget_10_0.Checkbox(var_10_8, unknown146)
																						if var_10_7 then
																							--jump to 0761 (if previous if statement is false) --0761 JMP-JMP
																							var_10_8 = 0 --var_10_8 NUMBER-NUMBER
																							var_10_9 = 0 --var_10_9 NUMBER-NUMBER
																							var_10_10 = 0 --var_10_10 NUMBER-NUMBER
																							var_10_11 = 1057 --var_10_11 NUMBER-NUMBER
																							addOneOffSound(var_10_8, var_10_9, var_10_10, var_10_11)
																							SaveToINI()
																							uget_10_0.Separator()
																							LEN unhandled at 0770
																							var_10_9 =  "Список ников [" .. unknown147 .. "]:"
																							uget_10_0.Text( u8(var_10_9) )
																							var_10_8 = var_10_6
																							var_10_10 = 230 --var_10_10 NUMBER-NUMBER
																							var_10_11 = 300 --var_10_11 NUMBER-NUMBER
																							var_10_9 = uget_10_0.ImVec2(var_10_10, var_10_11)
																							var_10_10 = true --var_10_10 PRIMITIVE-PRIMITIVE
																							uget_10_0.BeginChild(var_10_8, var_10_9, var_10_10)
																							if not unknown148 then
																								--jump to 0834 (if previous if statement is false) --0834 JMP-JMP
																								var_10_11 = var_10_6
																								var_10_8 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_11 .. ".txt"
																								var_10_7 = io.open(var_10_8, "r")
																								if not var_10_7 then
																									--jump to 0814 (if previous if statement is false) --0814 JMP-JMP
																									repeat
																									var_10_12 = var_10_6
																									var_10_9 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_12 .. ".txt"
																									var_10_8 = io.open(var_10_9, "r")
																									var_10_7 = var_10_8
																									--jump to 0799 (if previous if statement is false) --0799 JMP-JMP
																									until false or (previous if statement is true) --location 0814
																									var_10_9 = var_10_7
																									var_10_8 = var_10_7.read(var_10_9, "*a")
																									fileText = var_10_8
																									var_10_9 = fileText
																									var_10_10 =  fileText.gmatch(var_10_9, "[^\r\n]+")
																									--jump to 0831 (if previous if statement is false) --0831 JMP-JMP
																									var_10_14 = var_10_11
																									uget_10_0.Text( u8(var_10_14) )
																								end --end of a for loop
																								--jump to 0848 (if previous if statement is false) --0848 JMP-JMP
																								var_10_9 = var_10_6
																								var_10_8 =  "##" .. var_10_9 .. ""
																								var_10_11 = -0.1 --var_10_11 NUMBER-NUMBER
																								var_10_12 = -0.1 --var_10_12 NUMBER-NUMBER
																								uget_10_0.InputTextMultiline(var_10_8, unknown149,  uget_10_0.ImVec2(var_10_11, var_10_12) )
																								uget_10_0.EndChild()
																								var_10_8 = var_10_6 +  6 --var_10_8 NUMBER-NUMBER
																								var_10_10 = 230 --var_10_10 NUMBER-NUMBER
																								var_10_11 = 35 --var_10_11 NUMBER-NUMBER
																								var_10_9 = uget_10_0.ImVec2(var_10_10, var_10_11)
																								var_10_10 = true --var_10_10 PRIMITIVE-PRIMITIVE
																								uget_10_0.BeginChild(var_10_8, var_10_9, var_10_10)
																								if not unknown150 then
																									--jump to 0891 (if previous if statement is false) --0891 JMP-JMP
																									var_10_8 = u8("Редактировать список##")
																									var_10_9 = var_10_6
																									var_10_8 = var_10_8 .. var_10_9 .. ""
																									var_10_10 = 215 --var_10_10 NUMBER-NUMBER
																									var_10_11 = 20 --var_10_11 NUMBER-NUMBER
																									var_10_7 = uget_10_0.Button(var_10_8,  uget_10_0.ImVec2(var_10_10, var_10_11) )
																									if var_10_7 then
																										--jump to 1010 (if previous if statement is false) --1010 JMP-JMP
																										var_10_8 = true --var_10_8 PRIMITIVE-PRIMITIVE
																										EditNickList[var_10_6] = var_10_8
																										var_10_8 = u8(fileText)
																										unknown151.v = var_10_8
																										--jump to 1010 (if previous if statement is false) --1010 JMP-JMP
																										var_10_8 = u8("Сохранить список##")
																										var_10_9 = var_10_6
																										var_10_8 = var_10_8 .. var_10_9 .. ""
																										var_10_10 = 140 --var_10_10 NUMBER-NUMBER
																										var_10_11 = 20 --var_10_11 NUMBER-NUMBER
																										var_10_7 = uget_10_0.Button(var_10_8,  uget_10_0.ImVec2(var_10_10, var_10_11) )
																										if var_10_7 then
																											--jump to 0987 (if previous if statement is false) --0987 JMP-JMP
																											var_10_11 = var_10_6
																											var_10_8 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_11 .. ".txt"
																											var_10_7 = io.open(var_10_8, "w")
																											var_10_9 = var_10_7
																											var_10_11 = u8
																											var_10_7.write(var_10_9,  u8.decode(var_10_11, unknown152.v) )
																											var_10_9 = var_10_7
																											var_10_7.flush(var_10_9)
																											var_10_9 = var_10_7
																											var_10_7.close(var_10_9)
																											var_10_12 = var_10_6
																											var_10_9 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_12 .. ".txt"
																											var_10_8 = doesFileExist(var_10_9)
																											if var_10_8 then
																												--jump to 0980 (if previous if statement is false) --0980 JMP-JMP
																												var_10_9 = {}
																												PlayerList[var_10_6] = var_10_9
																												var_10_12 = var_10_6
																												var_10_9 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_10_12 .. ".txt"
																												var_10_8 = io.open(var_10_9, "r")
																												var_10_10 = var_10_8
																												var_10_9 = var_10_8.read(var_10_10, "*a")
																												MessageIMG = var_10_9
																												var_10_10 = MessageIMG
																												var_10_11 =  MessageIMG.gmatch(var_10_10, "[^\r\n]+")
																												--jump to 0974 (if previous if statement is false) --0974 JMP-JMP
																												LEN unhandled at 0971
																												var_10_14 = unknown154 +  1 --var_10_14 NUMBER-NUMBER
																												unknown153[var_10_14] = var_10_12
																											end --end of a for loop
																											var_10_10 = var_10_8
																											io.close(var_10_10)
																											var_10_9 = false --var_10_9 PRIMITIVE-PRIMITIVE
																											EditNickList[var_10_6] = var_10_9
																											var_10_9 = ThrCreatZoneStats
																											ThrCreatZoneStats.run(var_10_9)
																											var_10_8 = 153 --var_10_8 NUMBER-NUMBER
																											uget_10_0.SameLine(var_10_8)
																											var_10_8 = u8("Отмена##")
																											var_10_9 = var_10_6
																											var_10_8 = var_10_8 .. var_10_9 .. ""
																											var_10_10 = 70 --var_10_10 NUMBER-NUMBER
																											var_10_11 = 20 --var_10_11 NUMBER-NUMBER
																											var_10_7 = uget_10_0.Button(var_10_8,  uget_10_0.ImVec2(var_10_10, var_10_11) )
																											if var_10_7 then
																												--jump to 1010 (if previous if statement is false) --1010 JMP-JMP
																												var_10_8 = false --var_10_8 PRIMITIVE-PRIMITIVE
																												EditNickList[var_10_6] = var_10_8
																												uget_10_0.EndChild()
																											end --location 1013, loops back to 0249-1
																											uget_10_0.End()
																											return
																										end
																										
																										

function randomFunction	LimitInputInt (INPUT_VAR_0_,INPUT_VAR_1_,INPUT_VAR_2_)
	if INPUT_VAR_2_ < INPUT_VAR_0_ then
		--jump to 0004 (if previous if statement is false) --0004 JMP-JMP
		var_11_2 = INPUT_VAR_0_
	end
	if INPUT_VAR_1_ < var_11_2 then
		--jump to 0007 (if previous if statement is false) --0007 JMP-JMP
		var_11_2 = INPUT_VAR_1_
	end
	return var_11_2
end


function randomFunction	Register_CMD ()
	var_12_1 = not main_window_state.v
	main_window_state.v = var_12_1
	return
end


function randomFunction(INPUT_VAR_0_)
	var_13_2 = INPUT_VAR_0_
	var_13_1, var_13_2 = string.match(var_13_2, "(%d+)%s(%d+)")
	if var_13_1 == nil then
		--jump to 0010 (if previous if statement is false) --0010 JMP-JMP
		if var_13_2 ~= nil then
		end -- maybe?
	else
		--location 0010--0010 LOCATION-LOCATION_
		var_13_4 = var_13_1
		var_13_3 = tonumber(var_13_4)
		var_13_4 = 1 --var_13_4 NUMBER-NUMBER
		if var_13_4 <= var_13_3 then
			--jump to 0110 (if previous if statement is false) --0110 JMP-JMP
			var_13_4 = var_13_1
			var_13_3 = tonumber(var_13_4)
			until false or (previous if statement is true) --location 0019
			var_13_4 = 5 --var_13_4 NUMBER-NUMBER
			if var_13_3 <= var_13_4 then
				--jump to 0110 (if previous if statement is false) --0110 JMP-JMP
				var_13_4 = var_13_2
				var_13_3 = tonumber(var_13_4)
				var_13_4 = 0 --var_13_4 NUMBER-NUMBER
				if var_13_4 <= var_13_3 then
					--jump to 0102 (if previous if statement is false) --0102 JMP-JMP
					var_13_4 = var_13_2
					var_13_3 = tonumber(var_13_4)
					var_13_4 = 1000 --var_13_4 NUMBER-NUMBER
					if var_13_3 <= var_13_4 then
						--jump to 0102 (if previous if statement is false) --0102 JMP-JMP
						var_13_5 = var_13_2
						var_13_3 = sampIsPlayerConnected( tonumber(var_13_5) )
						if var_13_3 then
							--jump to 0091 (if previous if statement is false) --0091 JMP-JMP
							var_13_7 = var_13_2
							var_13_3 = string.format("\n%s",  sampGetPlayerNickname( tonumber(var_13_7) ) )
							var_13_6 = var_13_1
							var_13_5 = tonumber(var_13_6)
							var_13_7 = var_13_1
							var_13_6 = tonumber(var_13_7)
							LEN unhandled at 0060
							var_13_5 = unknown156 +  1 --var_13_5 NUMBER-NUMBER
							var_13_8 = var_13_2
							var_13_6 = sampGetPlayerNickname( tonumber(var_13_8) )
							unknown155[var_13_5] = var_13_6
							var_13_8 = var_13_1
							var_13_5 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_13_8 .. ".txt"
							var_13_4 = io.open(var_13_5, "a")
							var_13_6 = var_13_4
							var_13_7 = var_13_3
							var_13_4.write(var_13_6, var_13_7)
							var_13_6 = var_13_4
							io.close(var_13_6)
							var_13_6 = ThrCreatZoneStats
							ThrCreatZoneStats.run(var_13_6)
						else
							--location 0091--0091 LOCATION-LOCATION_
							var_13_5 = "{8c8c8c}Checker: {ffffff}Игрок под ID {8" --strings longer than 40 characters get cut off, so check to see if there's more!
							var_13_7 = var_13_2
							var_13_4 = string.format(var_13_5,  tonumber(var_13_7) )
							var_13_5 = 16777215 --var_13_5 NUMBER-NUMBER
							sampAddChatMessage(var_13_4, var_13_5)
						end
					end 
				else
					--location 0102--0102 LOCATION-LOCATION_
					var_13_5 = "{8c8c8c}Checker: {ffffff}ID игрока не мо" --strings longer than 40 characters get cut off, so check to see if there's more!
					var_13_4 = string.format(var_13_5)
					var_13_5 = 16777215 --var_13_5 NUMBER-NUMBER
					sampAddChatMessage(var_13_4, var_13_5)
				end
			end 
		else
			--location 0110--0110 LOCATION-LOCATION_
			var_13_5 = "{8c8c8c}Checker: {ffffff}№ списка не мож" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_13_4 = string.format(var_13_5)
			var_13_5 = 16777215 --var_13_5 NUMBER-NUMBER
			sampAddChatMessage(var_13_4, var_13_5)
		end 
	else
		--location 0118--0118 LOCATION-LOCATION_
		var_13_5 = "{8c8c8c}Checker: {ffffff}/cadd [№ списка" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_13_4 = string.format(var_13_5)
		var_13_5 = 16777215 --var_13_5 NUMBER-NUMBER
		sampAddChatMessage(var_13_4, var_13_5)
	end
	return
end


function randomFunction(INPUT_VAR_0_)
	var_14_2 = INPUT_VAR_0_
	var_14_1, var_14_2 = string.match(var_14_2, "(%d+)%s(%d+)")
	if var_14_1 == nil then
		--jump to 0010 (if previous if statement is false) --0010 JMP-JMP
		if var_14_2 ~= nil then
		end -- maybe?
	else
		--location 0010--0010 LOCATION-LOCATION_
		var_14_4 = var_14_1
		var_14_3 = tonumber(var_14_4)
		var_14_4 = 1 --var_14_4 NUMBER-NUMBER
		if var_14_4 <= var_14_3 then
			--jump to 0148 (if previous if statement is false) --0148 JMP-JMP
			var_14_4 = var_14_1
			var_14_3 = tonumber(var_14_4)
			until false or (previous if statement is true) --location 0019
			var_14_4 = 5 --var_14_4 NUMBER-NUMBER
			if var_14_3 <= var_14_4 then
				--jump to 0148 (if previous if statement is false) --0148 JMP-JMP
				var_14_4 = var_14_2
				var_14_3 = tonumber(var_14_4)
				var_14_4 = 0 --var_14_4 NUMBER-NUMBER
				if var_14_4 <= var_14_3 then
					--jump to 0140 (if previous if statement is false) --0140 JMP-JMP
					var_14_4 = var_14_2
					var_14_3 = tonumber(var_14_4)
					var_14_4 = 1000 --var_14_4 NUMBER-NUMBER
					if var_14_3 <= var_14_4 then
						--jump to 0140 (if previous if statement is false) --0140 JMP-JMP
						var_14_5 = var_14_2
						var_14_3 = sampIsPlayerConnected( tonumber(var_14_5) )
						if var_14_3 then
							--jump to 0129 (if previous if statement is false) --0129 JMP-JMP
							var_14_6 = var_14_2
							var_14_3 = string.format("\n%s",  sampGetPlayerNickname(var_14_6) )
							var_14_9 = var_14_1
							var_14_8 = tonumber(var_14_9)
							var_14_5 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_14_8 .. ".txt"
							var_14_4 = io.open(var_14_5, "r")
							var_14_6 = var_14_4
							var_14_5 = var_14_4.read(var_14_6, "*all")
							var_14_7 = var_14_4
							var_14_4.close(var_14_7)
							var_14_7 = var_14_5
							var_14_8 = var_14_3
							var_14_6 = string.gsub(var_14_7, var_14_8, "")
							var_14_5 = var_14_6
							var_14_11 = var_14_1
							var_14_10 = tonumber(var_14_11)
							var_14_7 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_14_10 .. ".txt"
							var_14_6 = io.open(var_14_7, "w")
							var_14_8 = var_14_6
							var_14_9 = var_14_5
							var_14_6.write(var_14_8, var_14_9)
							var_14_8 = var_14_6
							var_14_6.close(var_14_8)
							var_14_10 = var_14_1
							var_14_9 = tonumber(var_14_10)
							for var_14_10, var_14_11 in ipairs(unknown157) do --var_14_7 FORTEST-FORTEST
								--jump to 0122 (if previous if statement is false) --0122 JMP-JMP
								var_14_14 = var_14_2
								var_14_12 = string.upper( sampGetPlayerNickname(var_14_14) )
								var_14_14 = var_14_11
								var_14_13 = string.upper(var_14_14)
								if var_14_12 == var_14_13 then
									--jump to 0122 (if previous if statement is false) --0122 JMP-JMP
									var_14_15 = var_14_1
									var_14_14 = tonumber(var_14_15)
									var_14_14 = var_14_10
									table.remove(unknown158, var_14_14)
								end
							end --end of a for loop
							var_14_8 = ThrCreatZoneStats
							until false or (previous if statement is true) --location 0126
							ThrCreatZoneStats.run(var_14_8)
						else
							--location 0129--0129 LOCATION-LOCATION_
							var_14_5 = "{8c8c8c}Checker: {ffffff}Игрок под ID {8" --strings longer than 40 characters get cut off, so check to see if there's more!
							var_14_7 = var_14_2
							var_14_4 = string.format(var_14_5,  tonumber(var_14_7) )
							var_14_5 = 16777215 --var_14_5 NUMBER-NUMBER
							sampAddChatMessage(var_14_4, var_14_5)
						end
					end 
				else
					--location 0140--0140 LOCATION-LOCATION_
					var_14_5 = "{8c8c8c}Checker: {ffffff}ID игрока не мо" --strings longer than 40 characters get cut off, so check to see if there's more!
					var_14_4 = string.format(var_14_5)
					var_14_5 = 16777215 --var_14_5 NUMBER-NUMBER
					sampAddChatMessage(var_14_4, var_14_5)
				end
			end 
		else
			--location 0148--0148 LOCATION-LOCATION_
			var_14_5 = "{8c8c8c}Checker: {ffffff}№ списка не мож" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_14_4 = string.format(var_14_5)
			var_14_5 = 16777215 --var_14_5 NUMBER-NUMBER
			sampAddChatMessage(var_14_4, var_14_5)
			--jump to 0163 (if previous if statement is false) --0163 JMP-JMP
			var_14_5 = "{8c8c8c}Checker: {ffffff}/crem [№ списка" --strings longer than 40 characters get cut off, so check to see if there's more!
			var_14_4 = string.format(var_14_5)
			var_14_5 = 16777215 --var_14_5 NUMBER-NUMBER
			sampAddChatMessage(var_14_4, var_14_5)
		end
		return
	end
	
	

function someFunc15()
	var_15_1 = sampRegisterChatCommand
	local randomFunction1 = function() end -- starts at  test.lua:0
	var_15_1("checker", randomFunction1)
	var_15_1 = sampRegisterChatCommand
	local randomFunction2 = function() end -- starts at  test.lua:0
	var_15_1("cadd", randomFunction2)
	var_15_1 = sampRegisterChatCommand
	local randomFunction3 = function() end -- starts at  test.lua:0
	var_15_1("crem", randomFunction3)
	return
end


function randomFunction	LoadingINI ()
	var_16_1 =  "moonloader/config/Checker/" .. IP .. ""
	var_16_0 = doesDirectoryExist(var_16_1)
	if not var_16_0 then
		--jump to 0015 (if previous if statement is false) --0015 JMP-JMP
		var_16_1 =  "moonloader/config/Checker/" .. IP .. ""
		createDirectory(var_16_1)
	end
	until false or (previous if statement is true) --location 0019
	var_16_1 =  "moonloader/config/Checker/" .. IP .. "/Settings.ini"
	var_16_0 = doesFileExist(var_16_1)
	if not var_16_0 then
		--jump to 0031 (if previous if statement is false) --0031 JMP-JMP
		var_16_2 =  "Checker/" .. IP .. "/Settings.ini"
		uget_16_0.save(ini, var_16_2)
		var_16_0 = 1 --var_16_0 NUMBER-NUMBER
		var_16_1 = 5 --var_16_1 NUMBER-NUMBER
		var_16_2 = 1 --var_16_2 NUMBER-NUMBER
		for var_16_3 = var_16_0,var_16_1,var_16_2 do --location 0034, loop ends at 0098-1
			var_16_8 = var_16_3
			var_16_5 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_16_8 .. ".txt"
			var_16_4 = io.open(var_16_5, "a")
			var_16_6 = var_16_4
			var_16_4.write(var_16_6, "")
			var_16_6 = var_16_4
			io.close(var_16_6)
			var_16_9 = var_16_3
			var_16_6 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_16_9 .. ".txt"
			var_16_5 = doesFileExist(var_16_6)
			if var_16_5 then
				--jump to 0097 (if previous if statement is false) --0097 JMP-JMP
				var_16_9 = var_16_3
				var_16_6 =  "moonloader/config/Checker/" .. IP .. "/List " .. var_16_9 .. ".txt"
				var_16_5 = io.open(var_16_6, "r")
				var_16_7 = var_16_5
				var_16_6 = var_16_5.read(var_16_7, "*a")
				MessageIMG = var_16_6
				var_16_7 = MessageIMG
				var_16_8 =  MessageIMG.gmatch(var_16_7, "[^\r\n]+")
				--jump to 0091 (if previous if statement is false) --0091 JMP-JMP
				LEN unhandled at 0088
				var_16_11 = unknown160 +  1 --var_16_11 NUMBER-NUMBER
				unknown159[var_16_11] = var_16_9
			end --end of a for loop
			var_16_7 = var_16_5
			io.close(var_16_7)
		end --location 0097, loops back to 0035-1
		var_16_1 =  "moonloader/config/Checker/" .. IP .. "/Settings.ini"
		var_16_0 = doesFileExist(var_16_1)
		if var_16_0 then
			--jump to 1094 (if previous if statement is false) --1094 JMP-JMP
			var_16_0 = uget_16_1.ImBool(ini.Main.Active)
			MainActive = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.Active)
			var_16_0[1] = var_16_1
			until false or (previous if statement is true) --location 0126
			var_16_1 = uget_16_1.ImBool(ini.List2.Active)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.Active)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.Active)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.Active) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0148
			ListActive = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ClearScreeen)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ClearScreeen)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ClearScreeen)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ClearScreeen)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ClearScreeen) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0185
			ListScreenActive = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowLevel)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowLevel)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowLevel)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowLevel)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowLevel) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0222
			ListShowLevel = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowID)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowID)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowID)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowID)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowID) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0259
			ListShowID = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowHP)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowHP)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowHP)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowHP)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowHP) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0296
			ListShowHP = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowAR)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowAR)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowAR)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowAR)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowAR) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0333
			ListShowAR = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowDist)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowDist)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowDist)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowDist)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowDist) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0370
			ListShowDist = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ShowPing)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ShowPing)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ShowPing)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ShowPing)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ShowPing) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0407
			ListShowPing = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ConnectPlayersChat)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ConnectPlayersChat)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ConnectPlayersChat)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ConnectPlayersChat)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ConnectPlayersChat) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0444
			ListConnectPlayersChat = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.DisConnectPlayersChat)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.DisConnectPlayersChat)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.DisConnectPlayersChat)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.DisConnectPlayersChat)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.DisConnectPlayersChat) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0481
			ListDisConnectPlayersChat = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.FontsSize)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.FontsSize)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.FontsSize)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.FontsSize)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.FontsSize) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0518
			ListFontsSize = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.Flag)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.Flag)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.Flag)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.Flag)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.Flag) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0555
			ListFlag = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.IndentingLine)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.IndentingLine)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.IndentingLine)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.IndentingLine)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.IndentingLine) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0592
			ListIndentingLine = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.PosX)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.PosX)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.PosX)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.PosX)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.PosX) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0629
			ListPosX = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.PosY)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.PosY)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.PosY)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.PosY)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.PosY) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0666
			ListPosY = var_16_0
			var_16_0 = {}
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List1.ColorTitle) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[1] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List2.ColorTitle) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[2] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List3.ColorTitle) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[3] = var_16_1
			until false or (previous if statement is true) --location 0717
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List4.ColorTitle) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[4] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List5.ColorTitle) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) ) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0743
			ListColorTitle = var_16_0
			var_16_0 = {}
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List1.ColorSpisok) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[1] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List2.ColorSpisok) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[2] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List3.ColorSpisok) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[3] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List4.ColorSpisok) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[4] = var_16_1
			until false or (previous if statement is true) --location 0814
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List5.ColorSpisok) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) ) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0820
			ListColorSpisok = var_16_0
			var_16_0 = {}
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List1.ColorSpisokStream) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[1] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List2.ColorSpisokStream) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[2] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List3.ColorSpisokStream) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[3] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List4.ColorSpisokStream) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[4] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List5.ColorSpisokStream) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) ) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0897
			ListColorSpisokStream = var_16_0
			var_16_0 = {}
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List1.ColorSpisokAFK) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[1] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List2.ColorSpisokAFK) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[2] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List3.ColorSpisokAFK) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[3] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List4.ColorSpisokAFK) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) )
			var_16_0[4] = var_16_1
			var_16_2 = uget_16_1.ImColor( explode_argb(ini.List5.ColorSpisokAFK) )
			var_16_3 = var_16_2
			var_16_1 = uget_16_1.ImFloat4( var_16_2.GetFloat4(var_16_3) ) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 0974
			ListColorSpisokAFK = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImBool(ini.List1.ColorSpisokClist)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List2.ColorSpisokClist)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List3.ColorSpisokClist)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List4.ColorSpisokClist)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImBool(ini.List5.ColorSpisokClist) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 1011
			ListColorSpisokClist = var_16_0
			var_16_0 = {}
			var_16_1 = uget_16_1.ImInt(ini.List1.ColorSpisokTransparency)
			var_16_0[1] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List2.ColorSpisokTransparency)
			var_16_0[2] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List3.ColorSpisokTransparency)
			var_16_0[3] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List4.ColorSpisokTransparency)
			var_16_0[4] = var_16_1
			var_16_1 = uget_16_1.ImInt(ini.List5.ColorSpisokTransparency) --var_16_1 REPLACE-REPLACE
			TSETM unhandled at 1048
			ListColorSpisokTransparency = var_16_0
			var_16_0 = {}
			var_16_0[1] = ini.List1.ListName
			var_16_0[2] = ini.List2.ListName
			var_16_0[3] = ini.List3.ListName
			var_16_0[4] = ini.List4.ListName
			var_16_0[5] = ini.List5.ListName
			ListName = var_16_0
			var_16_0 = {}
			var_16_0[1] = ini.List1.Fonts
			var_16_0[2] = ini.List2.Fonts
			var_16_0[3] = ini.List3.Fonts
			var_16_0[4] = ini.List4.Fonts
			var_16_0[5] = ini.List5.Fonts
			FontName = var_16_0
			return
		end
	end end end --REVERSE ME--REVERSE ME--REVERSE ME

function randomFunction	SaveToINI ()
	ini.Main.Active = MainActive.v
	ini.List1.Active = ListActive.unknownB161.v
	ini.List2.Active = ListActive.unknownB162.v
	until false or (previous if statement is true) --location 0019
	ini.List3.Active = ListActive.unknownB163.v
	ini.List4.Active = ListActive.unknownB164.v
	ini.List5.Active = ListActive.unknownB165.v
	ini.List1.ClearScreeen = ListScreenActive.unknownB166.v
	ini.List2.ClearScreeen = ListScreenActive.unknownB167.v
	ini.List3.ClearScreeen = ListScreenActive.unknownB168.v
	ini.List4.ClearScreeen = ListScreenActive.unknownB169.v
	ini.List5.ClearScreeen = ListScreenActive.unknownB170.v
	ini.List1.ShowLevel = ListShowLevel.unknownB171.v
	ini.List2.ShowLevel = ListShowLevel.unknownB172.v
	ini.List3.ShowLevel = ListShowLevel.unknownB173.v
	ini.List4.ShowLevel = ListShowLevel.unknownB174.v
	ini.List5.ShowLevel = ListShowLevel.unknownB175.v
	ini.List1.ShowID = ListShowID.unknownB176.v
	ini.List2.ShowID = ListShowID.unknownB177.v
	ini.List3.ShowID = ListShowID.unknownB178.v
	ini.List4.ShowID = ListShowID.unknownB179.v
	ini.List5.ShowID = ListShowID.unknownB180.v
	until false or (previous if statement is true) --location 0126
	ini.List1.ShowHP = ListShowHP.unknownB181.v
	ini.List2.ShowHP = ListShowHP.unknownB182.v
	ini.List3.ShowHP = ListShowHP.unknownB183.v
	ini.List4.ShowHP = ListShowHP.unknownB184.v
	ini.List5.ShowHP = ListShowHP.unknownB185.v
	ini.List1.ShowAR = ListShowAR.unknownB186.v
	ini.List2.ShowAR = ListShowAR.unknownB187.v
	ini.List3.ShowAR = ListShowAR.unknownB188.v
	ini.List4.ShowAR = ListShowAR.unknownB189.v
	ini.List5.ShowAR = ListShowAR.unknownB190.v
	ini.List1.ShowDist = ListShowDist.unknownB191.v
	ini.List2.ShowDist = ListShowDist.unknownB192.v
	ini.List3.ShowDist = ListShowDist.unknownB193.v
	ini.List4.ShowDist = ListShowDist.unknownB194.v
	ini.List5.ShowDist = ListShowDist.unknownB195.v
	ini.List1.ShowPing = ListShowPing.unknownB196.v
	ini.List2.ShowPing = ListShowPing.unknownB197.v
	ini.List3.ShowPing = ListShowPing.unknownB198.v
	ini.List4.ShowPing = ListShowPing.unknownB199.v
	ini.List5.ShowPing = ListShowPing.unknownB200.v
	ini.List1.ConnectPlayersChat = ListConnectPlayersChat.unknownB201.v
	ini.List2.ConnectPlayersChat = ListConnectPlayersChat.unknownB202.v
	ini.List3.ConnectPlayersChat = ListConnectPlayersChat.unknownB203.v
	ini.List4.ConnectPlayersChat = ListConnectPlayersChat.unknownB204.v
	ini.List5.ConnectPlayersChat = ListConnectPlayersChat.unknownB205.v
	ini.List1.DisConnectPlayersChat = ListDisConnectPlayersChat.unknownB206.v
	ini.List2.DisConnectPlayersChat = ListDisConnectPlayersChat.unknownB207.v
	ini.List3.DisConnectPlayersChat = ListDisConnectPlayersChat.unknownB208.v
	ini.List4.DisConnectPlayersChat = ListDisConnectPlayersChat.unknownB209.v
	ini.List5.DisConnectPlayersChat = ListDisConnectPlayersChat.unknownB210.v
	if ListFontsBuff.unknownB211.v ~=  "" then
		--jump to 0321 (if previous if statement is false) --0321 JMP-JMP
		ini.List1.Fonts = ListFontsBuff.unknownB212.v
		ListFontsBuff.unknownB213.v = ""
		if ListFontsBuff.unknownB214.v ~=  "" then
			--jump to 0336 (if previous if statement is false) --0336 JMP-JMP
			ini.List2.Fonts = ListFontsBuff.unknownB215.v
			ListFontsBuff.unknownB216.v = ""
			if ListFontsBuff.unknownB217.v ~=  "" then
				--jump to 0351 (if previous if statement is false) --0351 JMP-JMP
				ini.List3.Fonts = ListFontsBuff.unknownB218.v
				ListFontsBuff.unknownB219.v = ""
				if ListFontsBuff.unknownB220.v ~=  "" then
					--jump to 0366 (if previous if statement is false) --0366 JMP-JMP
					ini.List4.Fonts = ListFontsBuff.unknownB221.v
					ListFontsBuff.unknownB222.v = ""
					if ListFontsBuff.unknownB223.v ~=  "" then
						--jump to 0381 (if previous if statement is false) --0381 JMP-JMP
						ini.List5.Fonts = ListFontsBuff.unknownB224.v
						ListFontsBuff.unknownB225.v = ""
						if ListNameBuff.unknownB226.v ~=  "" then
							--jump to 0396 (if previous if statement is false) --0396 JMP-JMP
							ini.List1.ListName = ListNameBuff.unknownB227.v
							ListNameBuff.unknownB228.v = ""
							if ListNameBuff.unknownB229.v ~=  "" then
								--jump to 0411 (if previous if statement is false) --0411 JMP-JMP
								ini.List2.ListName = ListNameBuff.unknownB230.v
								ListNameBuff.unknownB231.v = ""
								if ListNameBuff.unknownB232.v ~=  "" then
									--jump to 0426 (if previous if statement is false) --0426 JMP-JMP
									ini.List3.ListName = ListNameBuff.unknownB233.v
									ListNameBuff.unknownB234.v = ""
									if ListNameBuff.unknownB235.v ~=  "" then
										--jump to 0441 (if previous if statement is false) --0441 JMP-JMP
										ini.List4.ListName = ListNameBuff.unknownB236.v
										ListNameBuff.unknownB237.v = ""
										if ListNameBuff.unknownB238.v ~=  "" then
											--jump to 0456 (if previous if statement is false) --0456 JMP-JMP
											ini.List5.ListName = ListNameBuff.unknownB239.v
											ListNameBuff.unknownB240.v = ""
											ini.List1.FontsSize = ListFontsSize.unknownB241.v
											ini.List2.FontsSize = ListFontsSize.unknownB242.v
											ini.List3.FontsSize = ListFontsSize.unknownB243.v
											ini.List4.FontsSize = ListFontsSize.unknownB244.v
											ini.List5.FontsSize = ListFontsSize.unknownB245.v
											ini.List1.Flag = ListFlag.unknownB246.v
											ini.List2.Flag = ListFlag.unknownB247.v
											ini.List3.Flag = ListFlag.unknownB248.v
											ini.List4.Flag = ListFlag.unknownB249.v
											ini.List5.Flag = ListFlag.unknownB250.v
											ini.List1.IndentingLine = ListIndentingLine.unknownB251.v
											ini.List2.IndentingLine = ListIndentingLine.unknownB252.v
											ini.List3.IndentingLine = ListIndentingLine.unknownB253.v
											ini.List4.IndentingLine = ListIndentingLine.unknownB254.v
											ini.List5.IndentingLine = ListIndentingLine.unknownB255.v
											ini.List1.PosX = ListPosX.unknownB256.v
											ini.List2.PosX = ListPosX.unknownB257.v
											ini.List3.PosX = ListPosX.unknownB258.v
											ini.List4.PosX = ListPosX.unknownB259.v
											ini.List5.PosX = ListPosX.unknownB260.v
											ini.List1.PosY = ListPosY.unknownB261.v
											ini.List2.PosY = ListPosY.unknownB262.v
											ini.List3.PosY = ListPosY.unknownB263.v
											ini.List4.PosY = ListPosY.unknownB264.v
											ini.List5.PosY = ListPosY.unknownB265.v
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorTitle.unknownB266.v.unknownB267, ListColorTitle.unknownB268.v.unknownB269, ListColorTitle.unknownB270.v.unknownB271, ListColorTitle.unknownB272.v.unknownB273)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List1.ColorTitle = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorTitle.unknownB274.v.unknownB275, ListColorTitle.unknownB276.v.unknownB277, ListColorTitle.unknownB278.v.unknownB279, ListColorTitle.unknownB280.v.unknownB281)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List2.ColorTitle = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorTitle.unknownB282.v.unknownB283, ListColorTitle.unknownB284.v.unknownB285, ListColorTitle.unknownB286.v.unknownB287, ListColorTitle.unknownB288.v.unknownB289)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List3.ColorTitle = var_17_1
											until false or (previous if statement is true) --location 0717
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorTitle.unknownB290.v.unknownB291, ListColorTitle.unknownB292.v.unknownB293, ListColorTitle.unknownB294.v.unknownB295, ListColorTitle.unknownB296.v.unknownB297)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List4.ColorTitle = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorTitle.unknownB298.v.unknownB299, ListColorTitle.unknownB300.v.unknownB301, ListColorTitle.unknownB302.v.unknownB303, ListColorTitle.unknownB304.v.unknownB305)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List5.ColorTitle = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisok.unknownB306.v.unknownB307, ListColorSpisok.unknownB308.v.unknownB309, ListColorSpisok.unknownB310.v.unknownB311, ListColorSpisok.unknownB312.v.unknownB313)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List1.ColorSpisok = var_17_1
											until false or (previous if statement is true) --location 0814
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisok.unknownB314.v.unknownB315, ListColorSpisok.unknownB316.v.unknownB317, ListColorSpisok.unknownB318.v.unknownB319, ListColorSpisok.unknownB320.v.unknownB321)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List2.ColorSpisok = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisok.unknownB322.v.unknownB323, ListColorSpisok.unknownB324.v.unknownB325, ListColorSpisok.unknownB326.v.unknownB327, ListColorSpisok.unknownB328.v.unknownB329)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List3.ColorSpisok = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisok.unknownB330.v.unknownB331, ListColorSpisok.unknownB332.v.unknownB333, ListColorSpisok.unknownB334.v.unknownB335, ListColorSpisok.unknownB336.v.unknownB337)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List4.ColorSpisok = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisok.unknownB338.v.unknownB339, ListColorSpisok.unknownB340.v.unknownB341, ListColorSpisok.unknownB342.v.unknownB343, ListColorSpisok.unknownB344.v.unknownB345)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List5.ColorSpisok = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokStream.unknownB346.v.unknownB347, ListColorSpisokStream.unknownB348.v.unknownB349, ListColorSpisokStream.unknownB350.v.unknownB351, ListColorSpisokStream.unknownB352.v.unknownB353)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List1.ColorSpisokStream = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokStream.unknownB354.v.unknownB355, ListColorSpisokStream.unknownB356.v.unknownB357, ListColorSpisokStream.unknownB358.v.unknownB359, ListColorSpisokStream.unknownB360.v.unknownB361)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List2.ColorSpisokStream = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokStream.unknownB362.v.unknownB363, ListColorSpisokStream.unknownB364.v.unknownB365, ListColorSpisokStream.unknownB366.v.unknownB367, ListColorSpisokStream.unknownB368.v.unknownB369)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List3.ColorSpisokStream = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokStream.unknownB370.v.unknownB371, ListColorSpisokStream.unknownB372.v.unknownB373, ListColorSpisokStream.unknownB374.v.unknownB375, ListColorSpisokStream.unknownB376.v.unknownB377)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List4.ColorSpisokStream = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokStream.unknownB378.v.unknownB379, ListColorSpisokStream.unknownB380.v.unknownB381, ListColorSpisokStream.unknownB382.v.unknownB383, ListColorSpisokStream.unknownB384.v.unknownB385)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List5.ColorSpisokStream = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokAFK.unknownB386.v.unknownB387, ListColorSpisokAFK.unknownB388.v.unknownB389, ListColorSpisokAFK.unknownB390.v.unknownB391, ListColorSpisokAFK.unknownB392.v.unknownB393)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List1.ColorSpisokAFK = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokAFK.unknownB394.v.unknownB395, ListColorSpisokAFK.unknownB396.v.unknownB397, ListColorSpisokAFK.unknownB398.v.unknownB399, ListColorSpisokAFK.unknownB400.v.unknownB401)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List2.ColorSpisokAFK = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokAFK.unknownB402.v.unknownB403, ListColorSpisokAFK.unknownB404.v.unknownB405, ListColorSpisokAFK.unknownB406.v.unknownB407, ListColorSpisokAFK.unknownB408.v.unknownB409)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List3.ColorSpisokAFK = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokAFK.unknownB410.v.unknownB411, ListColorSpisokAFK.unknownB412.v.unknownB413, ListColorSpisokAFK.unknownB414.v.unknownB415, ListColorSpisokAFK.unknownB416.v.unknownB417)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List4.ColorSpisokAFK = var_17_1
											var_17_2 = uget_17_0.ImColor.FromFloat4(ListColorSpisokAFK.unknownB418.v.unknownB419, ListColorSpisokAFK.unknownB420.v.unknownB421, ListColorSpisokAFK.unknownB422.v.unknownB423, ListColorSpisokAFK.unknownB424.v.unknownB425)
											var_17_3 = var_17_2
											var_17_1 = uget_17_0.ImColor( var_17_2.GetVec4(var_17_3) )
											var_17_2 = var_17_1
											var_17_1 = var_17_1.GetU32(var_17_2)
											ini.List5.ColorSpisokAFK = var_17_1
											ini.List1.ColorSpisokClist = ListColorSpisokClist.unknownB426.v
											ini.List2.ColorSpisokClist = ListColorSpisokClist.unknownB427.v
											ini.List3.ColorSpisokClist = ListColorSpisokClist.unknownB428.v
											ini.List4.ColorSpisokClist = ListColorSpisokClist.unknownB429.v
											ini.List5.ColorSpisokClist = ListColorSpisokClist.unknownB430.v
											ini.List1.ColorSpisokTransparency = ListColorSpisokTransparency.unknownB431.v
											ini.List2.ColorSpisokTransparency = ListColorSpisokTransparency.unknownB432.v
											ini.List3.ColorSpisokTransparency = ListColorSpisokTransparency.unknownB433.v
											ini.List4.ColorSpisokTransparency = ListColorSpisokTransparency.unknownB434.v
											ini.List5.ColorSpisokTransparency = ListColorSpisokTransparency.unknownB435.v
											var_17_1 = renderCreateFont(ini.List1.Fonts, ini.List1.FontsSize, ini.List1.Flag)
											Font[1] = var_17_1
											var_17_1 = renderCreateFont(ini.List2.Fonts, ini.List2.FontsSize, ini.List2.Flag)
											Font[2] = var_17_1
											var_17_1 = renderCreateFont(ini.List3.Fonts, ini.List3.FontsSize, ini.List3.Flag)
											Font[3] = var_17_1
											var_17_1 = renderCreateFont(ini.List4.Fonts, ini.List4.FontsSize, ini.List4.Flag)
											Font[4] = var_17_1
											var_17_1 = renderCreateFont(ini.List5.Fonts, ini.List5.FontsSize, ini.List5.Flag)
											Font[5] = var_17_1
											var_17_0 = {}
											var_17_0[1] = ini.List1.ListName
											var_17_0[2] = ini.List2.ListName
											var_17_0[3] = ini.List3.ListName
											var_17_0[4] = ini.List4.ListName
											var_17_0[5] = ini.List5.ListName
											ListName = var_17_0
											var_17_0 = {}
											var_17_0[1] = ini.List1.Fonts
											var_17_0[2] = ini.List2.Fonts
											var_17_0[3] = ini.List3.Fonts
											var_17_0[4] = ini.List4.Fonts
											var_17_0[5] = ini.List5.Fonts
											FontName = var_17_0
											var_17_2 =  "Checker/" .. IP .. "/Settings.ini"
											uget_17_1.save(ini, var_17_2)
											return
										end
									end end end end end end end end end end --REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME--REVERSE ME

function randomFunction	apply_custom_style ()
	uget_18_0.SwitchContext()
	var_18_0 = uget_18_0.GetStyle()
	var_18_4 = 0 --var_18_4 NUMBER-NUMBER
	var_18_0.WindowRounding = var_18_4
	var_18_5 = 8 --var_18_5 NUMBER-NUMBER
	var_18_6 = 8 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	until false or (previous if statement is true) --location 0019
	var_18_0.WindowPadding = var_18_4
	var_18_5 = 0.5 --var_18_5 NUMBER-NUMBER
	var_18_6 = 0.5 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.WindowTitleAlign = var_18_4
	var_18_4 = 3 --var_18_4 NUMBER-NUMBER
	var_18_0.ChildWindowRounding = var_18_4
	var_18_4 = 0 --var_18_4 NUMBER-NUMBER
	var_18_0.FrameRounding = var_18_4
	var_18_5 = 8 --var_18_5 NUMBER-NUMBER
	var_18_6 = 4 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.ItemSpacing = var_18_4
	var_18_4 = 10 --var_18_4 NUMBER-NUMBER
	var_18_0.ScrollbarSize = var_18_4
	var_18_4 = 3 --var_18_4 NUMBER-NUMBER
	var_18_0.ScrollbarRounding = var_18_4
	var_18_4 = 10 --var_18_4 NUMBER-NUMBER
	var_18_0.GrabMinSize = var_18_4
	var_18_4 = 0 --var_18_4 NUMBER-NUMBER
	var_18_0.GrabRounding = var_18_4
	var_18_4 = 1 --var_18_4 NUMBER-NUMBER
	var_18_0.Alpha = var_18_4
	var_18_5 = 4 --var_18_5 NUMBER-NUMBER
	var_18_6 = 3 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.FramePadding = var_18_4
	var_18_5 = 4 --var_18_5 NUMBER-NUMBER
	var_18_6 = 4 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.ItemInnerSpacing = var_18_4
	var_18_5 = 0 --var_18_5 NUMBER-NUMBER
	var_18_6 = 0 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.TouchExtraPadding = var_18_4
	var_18_4 = 21 --var_18_4 NUMBER-NUMBER
	var_18_0.IndentSpacing = var_18_4
	var_18_4 = 6 --var_18_4 NUMBER-NUMBER
	var_18_0.ColumnsMinSpacing = var_18_4
	var_18_5 = 0.5 --var_18_5 NUMBER-NUMBER
	var_18_6 = 0.5 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.ButtonTextAlign = var_18_4
	var_18_5 = 22 --var_18_5 NUMBER-NUMBER
	var_18_6 = 22 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.DisplayWindowPadding = var_18_4
	var_18_5 = 4 --var_18_5 NUMBER-NUMBER
	var_18_6 = 4 --var_18_6 NUMBER-NUMBER
	var_18_4 = uget_18_0.ImVec2(var_18_5, var_18_6)
	var_18_0.DisplaySafeAreaPadding = var_18_4
	var_18_4 = true --var_18_4 PRIMITIVE-PRIMITIVE
	var_18_0.AntiAliasedLines = var_18_4
	var_18_4 = true --var_18_4 PRIMITIVE-PRIMITIVE
	var_18_0.AntiAliasedShapes = var_18_4
	var_18_4 = 1.25 --var_18_4 NUMBER-NUMBER
	var_18_0.CurveTessellationTol = var_18_4
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.Text] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.2 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.TextDisabled] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.WindowBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ChildWindowBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	until false or (previous if statement is true) --location 0126
	var_18_6 = 0.2 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.2 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.2 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.PopupBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.2 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.Border] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.2 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.BorderShadow] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.83 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.FrameBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.6 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.FrameBgHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.FrameBgActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.9 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.TitleBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.9 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.TitleBgCollapsed] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.9 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.TitleBgActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.39 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.24 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.55 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.39 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.MenuBarBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.43 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.43 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.43 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.39 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ScrollbarBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.83 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ScrollbarGrab] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.6 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ScrollbarGrabHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ScrollbarGrabActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.55 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.55 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.55 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.82 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ComboBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.CheckMark] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.SliderGrab] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.5 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.SliderGrabActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.83 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.Button] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.6 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ButtonHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ButtonActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.83 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.Header] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.6 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.HeaderHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.HeaderActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.83 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ResizeGrip] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.6 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ResizeGripHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.21 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.56 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.53 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ResizeGripActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.5 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.CloseButton] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.4 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.CloseButtonHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 1 --var_18_6 NUMBER-NUMBER
	var_18_7 = 1 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.3 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.CloseButtonActive] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.55 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.55 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.55 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.86 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.PlotLines] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.PlotLinesHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.55 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.55 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.55 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.55 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.PlotHistogram] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.4 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.23 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.55 --var_18_8 NUMBER-NUMBER
	var_18_9 = 1 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.PlotHistogramHovered] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0 --var_18_7 NUMBER-NUMBER
	var_18_8 = 1 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.35 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.TextSelectedBg] = var_18_5
	var_18_5 = uget_18_0.ImVec4
	var_18_6 = 0.25 --var_18_6 NUMBER-NUMBER
	var_18_7 = 0.04 --var_18_7 NUMBER-NUMBER
	var_18_8 = 0.04 --var_18_8 NUMBER-NUMBER
	var_18_9 = 0.35 --var_18_9 NUMBER-NUMBER
	var_18_5 = var_18_5(var_18_6, var_18_7, var_18_8, var_18_9)
	var_18_0.Colors[uget_18_0.Col.ModalWindowDarkening] = var_18_5
	return
end


function someFunc19()
	script_name("Checker")
	script_author("Dima_Fax")
	script_description("Чекер игроков онлайн")
	var_19_1 = 1 --var_19_1 NUMBER-NUMBER
	script_version_number(var_19_1)
	script_version("1.0.0")
	until false or (previous if statement is true) --location 0019
	script_dependencies("SAMPFUNCS", "SAMP.lua")
	require("lib.moonloader")
	require("lib.sampfuncs")
	var_19_0 = require("inicfg")
	var_19_1 = require("lib.samp.events")
	var_19_2 = require("imgui")
	var_19_3 = require("encoding")
	var_19_3.default = "CP1251"
	u8 = var_19_3.UTF8
	var_19_4 = {}
	var_19_5 = {}
	var_19_4[1] = var_19_5
	var_19_5 = {}
	var_19_4[2] = var_19_5
	var_19_5 = {}
	var_19_4[3] = var_19_5
	var_19_5 = {}
	var_19_4[4] = var_19_5
	var_19_5 = {}
	var_19_4[5] = var_19_5
	PlayerList = var_19_4
	var_19_4 = {}
	var_19_5 = {}
	var_19_4[1] = var_19_5
	var_19_5 = {}
	var_19_4[2] = var_19_5
	var_19_5 = {}
	var_19_4[3] = var_19_5
	var_19_5 = {}
	var_19_4[4] = var_19_5
	var_19_5 = {}
	var_19_4[5] = var_19_5
	PlayerOnli = var_19_4
	var_19_4 = {}
	RenderText = var_19_4
	var_19_4 = {} --to find out the contents of this table look inside the lua file
	TextReason = var_19_4
	var_19_4 = {} --to find out the contents of this table look inside the lua file
	MoveList = var_19_4
	var_19_4 = {} --to find out the contents of this table look inside the lua file
	EditNickList = var_19_4
	var_19_5 = false --var_19_5 PRIMITIVE-PRIMITIVE
	var_19_4 = var_19_2.ImBool(var_19_5)
	main_window_state = var_19_4
	var_19_4 = {}
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[1] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[2] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[3] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[4] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6) --var_19_5 REPLACE-REPLACE
	TSETM unhandled at 0098
	ListFontsBuff = var_19_4
	var_19_4 = {}
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[1] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[2] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[3] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[4] = var_19_5
	var_19_6 = 100 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6) --var_19_5 REPLACE-REPLACE
	TSETM unhandled at 0120
	ListNameBuff = var_19_4
	var_19_4 = {}
	var_19_6 = 17000 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	until false or (previous if statement is true) --location 0126
	var_19_4[1] = var_19_5
	var_19_6 = 17000 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[2] = var_19_5
	var_19_6 = 17000 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[3] = var_19_5
	var_19_6 = 17000 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6)
	var_19_4[4] = var_19_5
	var_19_6 = 17000 --var_19_6 NUMBER-NUMBER
	var_19_5 = var_19_2.ImBuffer(var_19_6) --var_19_5 REPLACE-REPLACE
	TSETM unhandled at 0142
	ListNickEdit = var_19_4
	local randomFunction4 = function() end -- starts at  test.lua:0
	main = randomFunction4
	local randomFunction5 = function() end -- starts at  test.lua:0
	argb_to_rgb = randomFunction5
	local randomFunction6 = function() end -- starts at  test.lua:0
	explode_argb = randomFunction6
	local randomFunction7 = function() end -- starts at  test.lua:0
	join_argb = randomFunction7
	local randomFunction8 = function() end -- starts at  test.lua:0
	var_19_1.onPlayerJoin = randomFunction8
	local randomFunction9 = function() end -- starts at  test.lua:0
	var_19_1.onPlayerQuit = randomFunction9
	local randomFunction10 = function() end -- starts at  test.lua:0
	CreatZoneStats = randomFunction10
	local randomFunction11 = function() end -- starts at  test.lua:0
	getDistanceToPlayer = randomFunction11
	var_19_4 = nil --var_19_4 PRIMITIVE-PRIMITIVE
	local randomFunction12 = function() end -- starts at  test.lua:0
	var_19_2.BeforeDrawFrame = randomFunction12
	local randomFunction13 = function() end -- starts at  test.lua:0
	var_19_2.OnDrawFrame = randomFunction13
	local randomFunction14 = function() end -- starts at  test.lua:0
	LimitInputInt = randomFunction14
	local randomFunction15 = function() end -- starts at  test.lua:0
	Register_CMD = randomFunction15
	local randomFunction16 = function() end -- starts at  test.lua:0
	LoadingINI = randomFunction16
	local randomFunction17 = function() end -- starts at  test.lua:0
	SaveToINI = randomFunction17
	local randomFunction18 = function() end -- starts at  test.lua:0
	apply_custom_style = randomFunction18
	apply_custom_style()
	return
end


