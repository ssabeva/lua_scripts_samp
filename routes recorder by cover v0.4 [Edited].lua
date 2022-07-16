require "lib.sampfuncs"
require "lib.moonloader"
local inicfg = require "inicfg"
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = "CP1251"
local utf8 = encoding.UTF8
local config =
	inicfg.load(
	{
		setting = {
			activationKey = 96,
			recordingKey = 110,
			recordingDelay = 200,
			radius = 5,
			angle = 5,
			color = "FF00FF",
			warnings = true,
			gas = true,
			gaskey = 10,
			panickey = 163,
			force = true,
			forcekey = 2,
			additionalspeed = 0,
			points = true,
			diffrence = 1,
			brakes = true,
			stateloop = false,
			markerkey = 90,
			markerdelay = 20000,
			gaspower = 255,
			brakepower = 255,
			steerleftpower = 128,
			steerrightpower = 128,
			backpower = 64,
			warningsvolume = 10,
			skip = false,
			dialogs = false,
			console = false,
			chat = false,
			looptimer = 0,
			adapt = true,
			skipbutton = 67,
			dialogpause = true,
			dialogpausetime = 3000,
			speedskipvalue = 10,
			smartskipvalue = 10,
			silentmode = false
		}
	},
	"[routes recorder] settings"
)
local myImgui = {
	windows = {status = {main = imgui.ImBool(false)}, size = {main = {X = 300.0, Y = 175.0}}},
	textBuffer = {
		setting = {
			recordingDelay = imgui.ImBuffer(tostring(config.setting.recordingDelay), 256),
			recordingKey = imgui.ImBuffer(tostring(config.setting.recordingKey), 256),
			activationKey = imgui.ImBuffer(tostring(config.setting.activationKey), 256),
			radius = imgui.ImBuffer(tostring(config.setting.radius), 256),
			angle = imgui.ImBuffer(tostring(config.setting.angle), 256),
			color = imgui.ImBuffer(tostring(config.setting.color), 7),
			warnings = imgui.ImBool(config.setting.warnings),
			gas = imgui.ImBool(config.setting.gas),
			gaskey = imgui.ImBuffer(tostring(config.setting.gaskey), 256),
			panickey = imgui.ImBuffer(tostring(config.setting.panickey), 256),
			force = imgui.ImBool(config.setting.force),
			forcekey = imgui.ImBuffer(tostring(config.setting.forcekey), 256),
			additionalspeed = imgui.ImBuffer(tostring(config.setting.additionalspeed), 256),
			points = imgui.ImBool(config.setting.points),
			diffrence = imgui.ImBuffer(tostring(config.setting.diffrence), 256),
			brakes = imgui.ImBool(config.setting.brakes),
			stateloop = imgui.ImBool(config.setting.stateloop),
			markerkey = imgui.ImBuffer(tostring(config.setting.markerkey), 256),
			markerdelay = imgui.ImBuffer(tostring(config.setting.markerdelay), 256),
			gaspower = imgui.ImBuffer(tostring(config.setting.gaspower), 256),
			brakepower = imgui.ImBuffer(tostring(config.setting.brakepower), 256),
			steerleftpower = imgui.ImBuffer(tostring(config.setting.steerleftpower), 256),
			steerrightpower = imgui.ImBuffer(tostring(config.setting.steerrightpower), 256),
			backpower = imgui.ImBuffer(tostring(config.setting.backpower), 256),
			warningsvolume = imgui.ImBuffer(tostring(config.setting.warningsvolume), 256),
			skip = imgui.ImBool(config.setting.skip),
			dialogs = imgui.ImBool(config.setting.dialogs),
			console = imgui.ImBool(config.setting.console),
			chat = imgui.ImBool(config.setting.chat),
			looptimer = imgui.ImBuffer(tostring(config.setting.looptimer), 256),
			adapt = imgui.ImBool(config.setting.adapt),
			skipbutton = imgui.ImBuffer(tostring(config.setting.skipbutton), 256),
			dialogpause = imgui.ImBool(config.setting.dialogpause),
			dialogpausetime = imgui.ImBuffer(tostring(config.setting.dialogpausetime), 256),
			speedskipvalue = imgui.ImBuffer(tostring(config.setting.speedskipvalue), 256),
			smartskipvalue = imgui.ImBuffer(tostring(config.setting.smartskipvalue), 256),
			silentmode = imgui.ImBool(config.setting.silentmode)
		}
	},
	selectedItem = {routes = imgui.ImInt(0)}
}
local statuses = {reload, pause, stop}
local other = {workType, tick = 0, location}
local panic = false

function warning()
	lua_thread.create(
		function()
			for a = 1, 5 do
				lua_thread.create(
					function()
						for a = 1, tonumber(config.setting.warningsvolume) do
							addOneOffSound(0.0, 0.0, 0.0, 1057)
						end
					end
				)
				wait(300)
			end
		end
	)
end

function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then
		return
	end
	while not isSampAvailable() do
		wait(0)
	end
	apply_custom_style()
	check_and_create_directories()
	lua_thread.create(route_record_or_reproduction)
	while true do
		wait(0)
		if markervalue and config.setting.markerdelay then
			local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
			local time = os.clock() * 1000
			local endtime = os.clock() * 1000 + tonumber(config.setting.markerdelay) + ping
			repeat
				wait(0)
				press_brake()
				time = os.clock() * 1000
			until time > endtime
			markervalue = false
		end
		if dialogvalue and config.setting.dialogpause then
			local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
			local time = os.clock() * 1000
			local endtime = os.clock() * 1000 + tonumber(config.setting.dialogpausetime) + ping
			repeat
				wait(0)
				press_brake()
				time = os.clock() * 1000
			until time > endtime
			dialogvalue = false
		end
		if isKeyJustPressed(tonumber(config.setting.panickey)) then
			if panic == false then
				statuses.pause = true
				panic = true
			else
				other.workType = "reproduction"
				statuses.pause = false
				panic = false
			end
		end
		if
			not (sampIsChatInputActive() and not config.setting.chat) and
				not (sampIsDialogActive() and not config.setting.dialogs) and
				not (isSampfuncsConsoleActive() and not config.setting.console)
		 then
			if isKeyJustPressed(config.setting.activationKey) then
				myImgui.windows.status.main.v = not myImgui.windows.status.main.v
			end
		end
		imgui.Process = myImgui.windows.status.main.v
		if statuses.reload then
			imgui.Process = false
			wait(0)
			thisScript():reload()
		end
	end
end

function route_record_or_reproduction()
	while true do
		wait(0)
		if other.workType ~= "reproduction" and other.workType == "record" then
			if
				not (sampIsChatInputActive() and not config.setting.chat) and
					not (sampIsDialogActive() and not config.setting.dialogs) and
					not (isSampfuncsConsoleActive() and not config.setting.console)
			 then
				if isKeyJustPressed(config.setting.recordingKey) then
					local file = open_file("w")
					if file then
						if not config.setting.silentmode then
						sampAddChatMessage("The creation of a new route has begun.", "0x" .. config.setting.color .. "")
						end
						repeat
							wait(0)
							if isCharInAnyCar(PLAYER_PED) then
								car = storeCarCharIsInNoSave(PLAYER_PED)
								posX, posY, _ = getCarCoordinates(car)
								speed = getCarSpeed(car)
								if other.location == "incar" then
									if
										isKeyDown(tonumber(config.setting.forcekey)) and
											not (sampIsChatInputActive() and not config.setting.chat) and
											not (sampIsDialogActive() and not config.setting.dialogs) and
											not (isSampfuncsConsoleActive() and not config.setting.console)
									 then
										file:write(
											"{" ..
												posX ..
													"}:{" ..
														posY ..
															"}:{" ..
																speed + tonumber(config.setting.additionalspeed) ..
																	"}:{nil}\n"
										)
										printStringNow(
											"~r~Forced Recording ~y~X: " ..
												math.floor(posX) ..
													" Y: " .. math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
											1000
										)
										wait(tonumber(config.setting.recordingDelay))
									end
									if
										isKeyDown(tonumber(config.setting.markerkey)) and
											not (sampIsChatInputActive() and not config.setting.chat) and
											not (sampIsDialogActive() and not config.setting.dialogs) and
											not (isSampfuncsConsoleActive() and not config.setting.console)
									 then
										file:write(
											"{" ..
												posX ..
													"}:{" ..
														posY ..
															"}:{" ..
																speed + tonumber(config.setting.additionalspeed) ..
																	"}:{marker}\n"
										)
										printStringNow(
											"~p~Marker Recording ~y~X: " ..
												math.floor(posX) ..
													" Y: " .. math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
											1000
										)
										wait(tonumber(config.setting.recordingDelay) + 1000)
									end
								end
							end
							local time = os.clock() * 1000
							if
								time - other.tick > tonumber(config.setting.recordingDelay) and
									config.setting.force == true
							 then
								if other.location == "incar" then
									if isCharInAnyCar(PLAYER_PED) then
										local car = storeCarCharIsInNoSave(PLAYER_PED)
										local posX, posY, _ = getCarCoordinates(car)
										local speed = getCarSpeed(car)
										if not config.setting.skip then 
										if speed <= tonumber(config.setting.speedskipvalue) then
											printStringNow(
												"~r~Skipping X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
												1000
											)
											else
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	tonumber(speed) + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(tonumber(speed)) .. "",
												1000
											)
										end
										else
										if speed<tonumber(config.setting.smartskipvalue) then
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	tonumber(config.setting.smartskipvalue) + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " ~g~SPEED: " .. math.floor(tonumber(config.setting.smartskipvalue)) .. "",
												1000
											)
											else
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	speed + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
												1000
											)
										end
										end
									else
										break
									end
								else
									local posX, posY, _ = getCharCoordinates(PLAYER_PED)
									if isButtonPressed(PLAYER_HANDLE, 14) then
										file:write("{" .. posX .. "}:{" .. posY .. "}:{nil}:{jump}\n")
										while isButtonPressed(PLAYER_HANDLE, 14) do
											wait(0)
										end
										wait(600)
									end
									if time - other.tick > tonumber(config.setting.recordingDelay) then
										if isButtonPressed(PLAYER_HANDLE, 16) then
											file:write("{" .. posX .. "}:{" .. posY .. "}:{sprint}:{nil}\n")
										else
											file:write("{" .. posX .. "}:{" .. posY .. "}:{nil}:{nil}\n")
										end
										printStringNow(
											"Recording ~y~X: " .. math.floor(posX) .. " Y: " .. math.floor(posY) .. "",
											1000
										)
									end
								end
								other.tick = os.clock() * 1000
							end
						until isKeyJustPressed(config.setting.recordingKey) and
							not (sampIsChatInputActive() and not config.setting.chat) and
							not (sampIsDialogActive() and not config.setting.dialogs) and
							not (isSampfuncsConsoleActive() and not config.setting.console)
						if not config.setting.silentmode then
						sampAddChatMessage("Recording completed successfully.", "0x" .. config.setting.color .. "")
						end
						file:close()
						other.location = ""
					end
				end
			end
		elseif other.workType == "reproduction" then
			local data = read_route_information()
			if data then
				for key, value in pairs(data) do
					local posX, posY, sprintOrSpeed, jump = value:match("{(.*)}:{(.*)}:{(.*)}:{(.*)}")
					if posX and posY and sprintOrSpeed and jump then
						if isCharInAnyCar(playerPed) then
							lasthealth = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
						end
						repeat
							wait(0)
							if isCharInAnyCar(playerPed) then
								if
									config.setting.warnings and
										getCarHealth(storeCarCharIsInNoSave(PLAYER_PED)) < lasthealth
								 then
									warning()
									printStyledString("~r~YOUR VEHICLE IS TAKING DAMAGE", 3000, 6)
									lasthealth = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
								end
							end
							draw_line(tonumber(posX), tonumber(posY))
							if other.location == "incar" then
								local car = storeCarCharIsInNoSave(PLAYER_PED)
								if jump == "marker" then
								markervalue=true
								end
								if key % 2 > 0 then
									local carPosX, carPosY, carPosZ = getCarCoordinates(car)
									turning_mechanism(tonumber(posX), tonumber(posY), carPosX, carPosY, car)
									if getCarSpeed(car) < sprintOrSpeed + tonumber(config.setting.diffrence) then
										press_gas()
									else
										if config.setting.brakes then
											setGameKeyState(16, tonumber(config.setting.backpower * -1)) -- s key simulation
										else
											press_brake()
										end
									end
								else
									break
								end
							else
								setGameKeyState(1, -128)
								set_camera_pos_unfix(tonumber(posX), tonumber(posY))
								if sprintOrSpeed == "sprint" then
									setGameKeyState(16, 255)
								elseif jump == "jump" then
									setGameKeyState(16, 0)
									setGameKeyState(14, 255)
								end
							end
							if statuses.pause then
								repeat
									wait(0)
								until not statuses.pause or statuses.stop
								statuses.pause = false
							end
							if statuses.stop or other.location == "incar" and not isCharInAnyCar(PLAYER_PED) then
								statuses.stop = true
								break
							end
						until locateCharOnFoot2d(
							PLAYER_PED,
							tonumber(posX),
							tonumber(posY),
							tonumber(config.setting.radius),
							tonumber(config.setting.radius),
							false
						) or
							locateCharInCar2d(
								PLAYER_PED,
								tonumber(posX),
								tonumber(posY),
								tonumber(config.setting.radius),
								tonumber(config.setting.radius),
								false
							) or
							isKeyDown(tonumber(config.setting.skipbutton))
						if statuses.stop then
							statuses.stop = false
							break
						end
					end
				end
				if config.setting.stateloop then
					local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
					local time = os.clock() * 1000
					local looptime = os.clock() * 1000 + tonumber(config.setting.looptimer) + ping
					if tonumber(config.setting.looptimer) ~= 0 then
					if not config.setting.silentmode then
						sampAddChatMessage(
							"Will resume in " .. tostring(config.setting.looptimer) .. "ms.",
							"0x" .. config.setting.color
						)
					end
					end
					repeat
						wait(0)
						time = os.clock() * 1000
					until time > looptime
				end
				if config.setting.stateloop == false then
					other.location = ""
					other.workType = ""
					repeat
						wait(0)
						press_brake()
					until getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED)) <= 1
				end
			else
				if not config.setting.silentmode then
				sampAddChatMessage("Route not found.", "0x" .. config.setting.color .. "")
				end
				other.workType = ""
			end
		end
	end
end

function turning_mechanism(posX, posY, carPosX, carPosY, car)
	if not dialogvalue then
		local heading =
			math.rad(getHeadingFromVector2d(posX - carPosX, posY - carPosY) + math.abs(getCarHeading(car) - 360.0))
		local heading = getHeadingFromVector2d(math.deg(math.sin(heading)), math.deg(math.cos(heading)))
		if heading > 180.0 and 360 - tonumber(config.setting.angle) > heading then
			setGameKeyState(0, tonumber(config.setting.steerleftpower * -1))
		else
			if heading > tonumber(config.setting.angle) and 180.0 >= heading then
				setGameKeyState(0, tonumber(config.setting.steerrightpower))
			else
				setGameKeyState(0, 0)
			end
		end
	end
end

function press_gas()
	if not dialogvalue then
		writeMemory(0xB73458 + 0x20, 1, tonumber(config.setting.gaspower), false)
	end
end

function press_brake()
	if not dialogvalue then
		writeMemory(0xB73458 + 0xC, 1, tonumber(config.setting.brakepower), false)
	end
end

function set_camera_pos_unfix(posX, posY)
	local cPosX, cPosY, cPosZ = getActiveCameraCoordinates()
	setCameraPositionUnfixed(0.0, (getHeadingFromVector2d(posX - cPosX, posY - cPosY) - 90.0) / 57.2957795)
end

function draw_line(posX, posY)
	if config.setting.points then
		local chPosX, chPosY, chPosZ = getCharCoordinates(PLAYER_PED)
		local wPosX, wPosY = convert3DCoordsToScreen(posX, posY, chPosZ)
		local wPosX1, wPosY1 = convert3DCoordsToScreen(chPosX, chPosY, chPosZ)
		renderDrawLine(wPosX1, wPosY1, wPosX, wPosY, 2, "0xFF" .. config.setting.color .. "")
		renderDrawPolygon(wPosX, wPosY, 10, 10, 14, 0.0, "0x7F" .. config.setting.color .. "")
		renderDrawPolygon(wPosX1, wPosY1, 10, 10, 14, 0.0, "0x7F" .. config.setting.color .. "")
	end
end

function read_route_information()
	local file = open_file("r")
	if file then
		local data = {}
		for line in file:lines() do
			table.insert(data, line)
		end
		file:close()
		return data
	end
end

function open_file(mode)
	if isCharInAnyCar(PLAYER_PED) then
		if other.workType == "reproduction" then
		end
		other.location = "incar"
		return io.open("moonloader/routes recorder/route ¹" .. myImgui.selectedItem.routes.v .. "/incar/data.txt", mode)
	else
		if other.workType == "reproduction" then
		end
		return io.open(
			"moonloader/routes recorder/route ¹" .. myImgui.selectedItem.routes.v .. "/onfoot/data.txt",
			mode
		)
	end
end

function check_and_create_directories()
	if not doesDirectoryExist("moonloader/routes recorder") then
		createDirectory("moonloader/routes recorder")
	end
	for i = 0, 12 do
		if not doesDirectoryExist("moonloader/routes recorder/route ¹" .. i .. "") then
			createDirectory("moonloader/routes recorder/route ¹" .. i .. "")
		end
		if not doesDirectoryExist("moonloader/routes recorder/route ¹" .. i .. "/onfoot") then
			createDirectory("moonloader/routes recorder/route ¹" .. i .. "/onfoot")
		end
		if not doesDirectoryExist("moonloader/routes recorder/route ¹" .. i .. "/incar") then
			createDirectory("moonloader/routes recorder/route ¹" .. i .. "/incar")
		end
	end
end

function change_menu_status()
	myImgui.windows.status.main.v = not myImgui.windows.status.main.v
end

function imgui.OnDrawFrame()
	if myImgui.windows.status.main.v then
		local posX, posY = get_window_position(myImgui.windows.size.main.X, myImgui.windows.size.main.Y)
		imgui.SetNextWindowPos(imgui.ImVec2(posX, posY), imgui.Cond.Appearing, imgui.ImVec2(0.0, 0.0))
		imgui.Begin("Routes recorder | by cover v0.4 [Edited]", myImgui.windows.status.main)
		if not imgui.CollapsingHeader(utf8 "Menu") then
			imgui.PushItemWidth(90.0)
			imgui.SetCursorPosX(105.5)
			imgui.Combo(
				"##routesList",
				myImgui.selectedItem.routes,
				{
					utf8 "Route ¹0",
					utf8 "Route ¹1",
					utf8 "Route ¹2",
					utf8 "Route ¹3",
					utf8 "Route ¹4",
					utf8 "Route ¹5",
					utf8 "Route ¹6",
					utf8 "Route ¹7",
					utf8 "Route ¹8",
					utf8 "Route ¹9",
					utf8 "Route ¹10",
					utf8 "Route ¹11",
					utf8 "Route ¹12"
				}
			)
			imgui.PopItemWidth()
			imgui.SetCursorPosX(57.0)
			if imgui.Button(utf8 "Pause", imgui.ImVec2(60.0, 20.0)) and other.workType == "reproduction" then
				statuses.pause = true
			end
			imgui.SameLine(121.0)
			if imgui.Button(utf8 "Play", imgui.ImVec2(60.0, 20.0)) then
				if not statuses.pause then
					other.workType = "reproduction"
				else
					statuses.pause = false
				end
			end
			imgui.SameLine(185.0)
			if imgui.Button(utf8 "Stop", imgui.ImVec2(60.0, 20.0)) and other.workType == "reproduction" then
				other.workType = ""
				statuses.stop = true
			end
			imgui.SetCursorPosX(94.0)
			if
				imgui.Button(utf8 "Record new route", imgui.ImVec2(117.0, 20.0)) and other.workType ~= "record" and
					other.workType ~= "reproduction"
			 then
				other.workType = "record"
				myImgui.windows.status.main.v = false
				if not config.setting.silentmode then
				sampAddChatMessage(
					"Press the record button to start or stop recording.",
					"0x" .. config.setting.color .. ""
				)
				end
			end
			imgui.SetCursorPosX(108.5)
			if imgui.Button(utf8 "Reload script", imgui.ImVec2(90.0, 20.0)) then
				statuses.reload = true
			end
		end
		if imgui.CollapsingHeader(utf8 "Settings") then
			--[[			if imgui.CollapsingHeader(utf8 "Key settings") then
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X+250, myImgui.windows.size.main.Y),
				imgui.Cond.Always
			)
		else
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 650),
				imgui.Cond.Always
			)
		end]]
			if not config.setting.adapt then
				imgui.SetWindowSize(
					imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 885),
					imgui.Cond.Always
				)
			else
				imgui.SetWindowSize(
					imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 125),
					imgui.Cond.Always
				)
			end
			imgui.SetCursorPosX(94.0)
			if imgui.Button(utf8 "Apply & save", imgui.ImVec2(117.0, 20.0)) then
				check_and_apply_or_save_new_data(true)
			end
			imgui.PushItemWidth(70.0)
			imgui.InputText(utf8 "Main hex color", myImgui.textBuffer.setting.color)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Additional speed", myImgui.textBuffer.setting.additionalspeed)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Warnings volume", myImgui.textBuffer.setting.warningsvolume)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Recording key", myImgui.textBuffer.setting.recordingKey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Save gas key", myImgui.textBuffer.setting.gaskey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Manual key", myImgui.textBuffer.setting.forcekey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Marker key", myImgui.textBuffer.setting.markerkey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Pause key", myImgui.textBuffer.setting.panickey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Menu key", myImgui.textBuffer.setting.activationKey)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Marker delay", myImgui.textBuffer.setting.markerdelay)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Recording delay", myImgui.textBuffer.setting.recordingDelay)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Dialog pause delay", myImgui.textBuffer.setting.dialogpausetime)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Smart speed skip value", myImgui.textBuffer.setting.smartskipvalue)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Speed skip value", myImgui.textBuffer.setting.speedskipvalue)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Skip button", myImgui.textBuffer.setting.skipbutton)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Loop timer", myImgui.textBuffer.setting.looptimer)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Free angle", myImgui.textBuffer.setting.angle)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Diffrence", myImgui.textBuffer.setting.diffrence)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Radius", myImgui.textBuffer.setting.radius)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Gas power", myImgui.textBuffer.setting.gaspower)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Brake power", myImgui.textBuffer.setting.brakepower)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Left steer power", myImgui.textBuffer.setting.steerleftpower)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Right steer power", myImgui.textBuffer.setting.steerrightpower)
			imgui.PushItemWidth(35.0)
			imgui.PopItemWidth()
			imgui.InputText(utf8 "Back away power", myImgui.textBuffer.setting.backpower)
			imgui.Checkbox("Damage warnings", myImgui.textBuffer.setting.warnings)
			imgui.Checkbox("Adaptive size", myImgui.textBuffer.setting.adapt)
			imgui.Checkbox("Smart speed skip", myImgui.textBuffer.setting.skip)
			imgui.Checkbox("Dialog pause", myImgui.textBuffer.setting.dialogpause)
			imgui.Checkbox("Silent mode", myImgui.textBuffer.setting.silentmode)
			imgui.Checkbox("Back away", myImgui.textBuffer.setting.brakes)
			imgui.Checkbox("Save gas", myImgui.textBuffer.setting.gas)
			imgui.Checkbox("Points", myImgui.textBuffer.setting.points)
			imgui.Checkbox("Auto", myImgui.textBuffer.setting.force)
			imgui.Checkbox("Loop", myImgui.textBuffer.setting.stateloop)
			--imgui.CollapsingHeader(utf8 "Misc settings")
			imgui.Checkbox("Dialogs", myImgui.textBuffer.setting.dialogs)
			imgui.Checkbox("Console", myImgui.textBuffer.setting.console)
			imgui.Checkbox("Chat", myImgui.textBuffer.setting.chat)
		else
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y),
				imgui.Cond.Always
			)
		end
		imgui.End()
	end
end

function get_window_position(sizeX, sizeY)
	resX, resY = getScreenResolution()
	posX = (resX / 2) - (sizeX / 2)
	if not config.setting.adapt then
		posY = (resY / 2) - (sizeY * 3.0325)
	else
		posY = (resY / 2) - (sizeY / 2)
	end
	return posX, posY
end

function check_and_apply_or_save_new_data(save)
	local number = myImgui.textBuffer.setting.recordingDelay.v:match("%d+")
	if
		number and myImgui.textBuffer.setting.activationKey.v ~= "" and myImgui.textBuffer.setting.recordingKey.v ~= "" and
			myImgui.textBuffer.setting.radius.v ~= "" and
			myImgui.textBuffer.setting.angle.v ~= "" and
			myImgui.textBuffer.setting.color.v ~= "" and
			myImgui.textBuffer.setting.gaskey.v ~= "" and
			myImgui.textBuffer.setting.panickey.v ~= "" and
			myImgui.textBuffer.setting.forcekey.v ~= "" and
			myImgui.textBuffer.setting.additionalspeed.v ~= "" and
			myImgui.textBuffer.setting.diffrence.v ~= "" and
			myImgui.textBuffer.setting.markerkey.v ~= "" and
			myImgui.textBuffer.setting.markerdelay.v ~= "" and
			myImgui.textBuffer.setting.gaspower.v ~= "" and
			myImgui.textBuffer.setting.brakepower.v ~= "" and
			myImgui.textBuffer.setting.steerleftpower.v ~= "" and
			myImgui.textBuffer.setting.steerrightpower.v ~= "" and
			myImgui.textBuffer.setting.backpower.v ~= "" and
			myImgui.textBuffer.setting.warningsvolume.v ~= "" and
			myImgui.textBuffer.setting.looptimer.v ~= "" and
			myImgui.textBuffer.setting.skipbutton.v ~= "" and
			myImgui.textBuffer.setting.dialogpausetime.v ~= "" and
			myImgui.textBuffer.setting.speedskipvalue.v ~= "" and
			myImgui.textBuffer.setting.smartskipvalue.v ~= ""
	 then
		config.setting.activationKey = myImgui.textBuffer.setting.activationKey.v
		config.setting.recordingKey = myImgui.textBuffer.setting.recordingKey.v
		config.setting.recordingDelay = number
		config.setting.radius = myImgui.textBuffer.setting.radius.v
		config.setting.angle = myImgui.textBuffer.setting.angle.v
		config.setting.color = myImgui.textBuffer.setting.color.v
		config.setting.warnings = myImgui.textBuffer.setting.warnings.v
		config.setting.gas = myImgui.textBuffer.setting.gas.v
		config.setting.gaskey = myImgui.textBuffer.setting.gaskey.v
		config.setting.panickey = myImgui.textBuffer.setting.panickey.v
		config.setting.force = myImgui.textBuffer.setting.force.v
		config.setting.forcekey = myImgui.textBuffer.setting.forcekey.v
		config.setting.additionalspeed = myImgui.textBuffer.setting.additionalspeed.v
		config.setting.points = myImgui.textBuffer.setting.points.v
		config.setting.diffrence = myImgui.textBuffer.setting.diffrence.v
		config.setting.brakes = myImgui.textBuffer.setting.brakes.v
		config.setting.stateloop = myImgui.textBuffer.setting.stateloop.v
		config.setting.markerkey = myImgui.textBuffer.setting.markerkey.v
		config.setting.markerdelay = myImgui.textBuffer.setting.markerdelay.v
		config.setting.gaspower = myImgui.textBuffer.setting.gaspower.v
		config.setting.brakepower = myImgui.textBuffer.setting.brakepower.v
		config.setting.steerleftpower = myImgui.textBuffer.setting.steerleftpower.v
		config.setting.steerrightpower = myImgui.textBuffer.setting.steerrightpower.v
		config.setting.backpower = myImgui.textBuffer.setting.backpower.v
		config.setting.warningsvolume = myImgui.textBuffer.setting.warningsvolume.v
		config.setting.skip = myImgui.textBuffer.setting.skip.v
		config.setting.dialogs = myImgui.textBuffer.setting.dialogs.v
		config.setting.console = myImgui.textBuffer.setting.console.v
		config.setting.chat = myImgui.textBuffer.setting.chat.v
		config.setting.looptimer = myImgui.textBuffer.setting.looptimer.v
		config.setting.adapt = myImgui.textBuffer.setting.adapt.v
		config.setting.skipbutton = myImgui.textBuffer.setting.skipbutton.v
		config.setting.dialogpause = myImgui.textBuffer.setting.dialogpause.v
		config.setting.dialogpausetime = myImgui.textBuffer.setting.dialogpausetime.v
		config.setting.speedskipvalue = myImgui.textBuffer.setting.speedskipvalue.v
		config.setting.smartskipvalue = myImgui.textBuffer.setting.smartskipvalue.v
		config.setting.silentmode = myImgui.textBuffer.setting.silentmode.v
		if save then
			local newData = {
				setting = {
					activationKey = config.setting.activationKey,
					recordingKey = config.setting.recordingKey,
					recordingDelay = config.setting.recordingDelay,
					radius = config.setting.radius,
					angle = config.setting.angle,
					color = config.setting.color,
					warnings = config.setting.warnings,
					gas = config.setting.gas,
					gaskey = config.setting.gaskey,
					panickey = config.setting.panickey,
					force = config.setting.force,
					forcekey = config.setting.forcekey,
					additionalspeed = config.setting.additionalspeed,
					points = config.setting.points,
					diffrence = config.setting.diffrence,
					brakes = config.setting.brakes,
					stateloop = config.setting.stateloop,
					markerkey = config.setting.markerkey,
					markerdelay = config.setting.markerdelay,
					gaspower = config.setting.gaspower,
					brakepower = config.setting.brakepower,
					steerleftpower = config.setting.steerleftpower,
					steerrightpower = config.setting.steerrightpower,
					backpower = config.setting.backpower,
					warningsvolume = config.setting.warningsvolume,
					skip = config.setting.skip,
					dialogs = config.setting.dialogs,
					console = config.setting.console,
					chat = config.setting.chat,
					looptimer = config.setting.looptimer,
					adapt = config.setting.adapt,
					skipbutton = config.setting.skipbutton,
					dialogpause = config.setting.dialogpause,
					dialogpausetime = config.setting.dialogpausetime,
					speedskipvalue = config.setting.speedskipvalue,
					smartskipvalue = config.setting.smartskipvalue,
					silentmode = config.setting.silentmode
				}
			}
			if inicfg.save(newData, "[routes recorder] settings") then
			if not config.setting.silentmode then
				sampAddChatMessage("Settings successfully saved.", "0x" .. config.setting.color .. "")
			end
			end
		end
	else
		if not config.setting.silentmode then
		sampAddChatMessage("Set value is invalid.", "0x" .. config.setting.color .. "")
		end
	end
end

function apply_custom_style()
	imgui.SwitchContext()
	imgui.GetIO().MouseDoubleClickTime = 0.1
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	style.WindowRounding = 5.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.FrameRounding = 2.5
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 20
	style.ScrollbarRounding = 5.0
	style.GrabMinSize = 10.0
	style.GrabRounding = 5.0
	colors[clr.WindowBg] = ImVec4(0.025, 0.025, 0.025, 0.90)
	colors[clr.ComboBg] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.Border] = ImVec4(0.125, 0.125, 0.125, 0.50)
	colors[clr.FrameBg] = ImVec4(0.11, 0.11, 0.11, 1.00)
	colors[clr.TitleBg] = ImVec4(0.10, 0.10, 0.10, 1.00)
	colors[clr.TitleBgActive] = ImVec4(0.10, 0.10, 0.10, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(0.10, 0.10, 0.10, 0.50)
	colors[clr.Button] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.2, 0.2, 0.2, 1.00)
	colors[clr.Header] = ImVec4(0.125, 0.125, 0.125, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.1, 0.1, 0.1, 1.0)
	colors[clr.ScrollbarGrab] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.CheckMark] = ImVec4(0.75, 0.75, 0.75, 1.00)
	colors[clr.SliderGrab] = ImVec4(0.15, 0.15, 0.15, 0.50)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.20, 0.20, 0.20, 1.00)
	colors[clr.TextSelectedBg] = ImVec4(0.125, 0.125, 0.125, 1.00)
	colors[clr.ResizeGrip] = ImVec4(0.125, 0.125, 0.125, 0.70)
	colors[clr.ResizeGripHovered] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.ResizeGripActive] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.CloseButton] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.CloseButtonHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.CloseButtonActive] = ImVec4(0.20, 0.20, 0.20, 1.00)
end

local s1, sp = pcall(require, "lib.samp.events")

function sp.onShowDialog(dialogId, style, title, button1, button2, text)
	if config.setting.dialogpause then
		dialogvalue = true
	end
end
