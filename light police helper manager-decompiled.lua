function randomFunction	unloading ()
	var_0_1 = 100 --var_0_1 NUMBER-NUMBER
	wait(var_0_1)
	var_0_0 = thisScript()
	var_0_1 = var_0_0
	var_0_0.unload(var_0_1)
	return
end


function randomFunction	main (INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_1_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0010 (if previous if statement is false) --0010 JMP-JMP
		var_1_6 = 4 --var_1_6 NUMBER-NUMBER
		lua_thread.create(txtReading, var_1_6)
	end
	return
end


function someFunc2()
	var_2_0 = isSampLoaded()
	if not var_2_0 then
		--jump to 0006 (if previous if statement is false) --0006 JMP-JMP
		end_
		var_2_1 = 5000 --var_2_1 NUMBER-NUMBER
		wait(var_2_1)
		var_2_1 = getWorkingDirectory()
		var_2_1 = var_2_1 .. "\imgui_notf.lua"
		var_2_0 = doesFileExist(var_2_1)
		if var_2_0 then
			--jump to 0031 (if previous if statement is false) --0031 JMP-JMP
			var_2_0 = script.find("imgui_notf.lua")
			var_2_2 = var_2_0
			var_2_0.unload(var_2_2)
			var_2_2 = getWorkingDirectory()
			var_2_2 = var_2_2 .. "\imgui_notf.lua"
			os.remove(var_2_2)
		end
		var_2_1 = getWorkingDirectory()
		var_2_1 = var_2_1 .. "\light police helper"
		var_2_0 = doesDirectoryExist(var_2_1)
		if not var_2_0 then
			--jump to 0045 (if previous if statement is false) --0045 JMP-JMP
			var_2_1 = getWorkingDirectory()
			var_2_1 = var_2_1 .. "\light police helper"
			createDirectory(var_2_1)
		end
		var_2_1 = "https://raw.githubusercontent.com/Renere" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_2_2 = getWorkingDirectory()
		var_2_2 = var_2_2 .. "\light police helper\policehelper.json"
		local randomFunction0 = function() end -- starts at  test.lua:0
		downloadUrlToFile(var_2_1, var_2_2, randomFunction0)
		var_2_0 = lua_thread.create(checking)
		checkingfunc = var_2_0
		var_2_1 = -1 --var_2_1 NUMBER-NUMBER
		wait(var_2_1)
		return
		return
	end
	

function randomFunction	checking ()
	repeat
	var_3_1 = 1000 --var_3_1 NUMBER-NUMBER
	wait(var_3_1)
	var_3_0 = script.find("Light Police Helper")
	if var_3_0 == nil then
		--jump to 0001 (if previous if statement is false) --0001 JMP-JMP
		var_3_1 = script.load("light police helper by dayton hale")
		var_3_0 = var_3_1
		--jump to 0001 (if previous if statement is false) --0001 JMP-JMP
		until false or (previous if statement is true) --location 0017
		return
	end
end --REVERSE ME

function randomFunction	startingupdate (INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_4_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0008 (if previous if statement is false) --0008 JMP-JMP
		var_4_5 = "light police helper by dayton hale.luac " --strings longer than 40 characters get cut off, so check to see if there's more!
		printHelpString(var_4_5)
	end
	return
end


function someFunc5()
	var_5_1 = 100 --var_5_1 NUMBER-NUMBER
	wait(var_5_1)
	var_5_1 = "https://github.com/Renerest/policehelper" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_5_2 = getWorkingDirectory()
	var_5_3 = "\light police helper by dayton hale.luac" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_5_2 = var_5_2 .. var_5_3
	local randomFunction1 = function() end -- starts at  test.lua:0
	downloadUrlToFile(var_5_1, var_5_2, randomFunction1)
	return
end


function randomFunction	txtReading (INPUT_VAR_0_,INPUT_VAR_1_)
	if INPUT_VAR_1_ == uget_6_0.STATUS_ENDDOWNLOADDATA then
		--jump to 0012 (if previous if statement is false) --0012 JMP-JMP
		printHelpString( string.format("%s has been downloaded.", uget_6_1) )
	end
	return
end


function someFunc7(INPUT_VAR_0_)
	if INPUT_VAR_0_ == 0 then
		--jump to 0100 (if previous if statement is false) --0100 JMP-JMP
		var_7_2 = getWorkingDirectory()
		var_7_2 = var_7_2 .. "\light police helper\policehelper.json"
		var_7_1 = io.open(var_7_2)
		if var_7_1 then
			--jump to 0097 (if previous if statement is false) --0097 JMP-JMP
			var_7_4 = var_7_1
			until false or (previous if statement is true) --location 0017
			var_7_2 = decodeJson( var_7_1.read(var_7_4, "*a") )
			var_7_4 = var_7_1
			var_7_1.close(var_7_4)
			var_7_3 = script.find("Light Police Helper")
			if var_7_3 == nil then
				--jump to 0079 (if previous if statement is false) --0079 JMP-JMP
				var_7_4 = script.load("light police helper by dayton hale")
				var_7_3 = var_7_4
				if var_7_3 == nil then
					--jump to 0079 (if previous if statement is false) --0079 JMP-JMP
					if uget_7_0 then
						--jump to 0079 (if previous if statement is false) --0079 JMP-JMP
						var_7_5 = checkingfunc
						checkingfunc.terminate(var_7_5)
						lua_thread.create(startingupdate)
						var_7_4 = {} --to find out the contents of this table look inside the lua file
						var_7_6 = getWorkingDirectory()
						var_7_6 = var_7_6 .. "\lib\samp\events"
						createDirectory(var_7_6)
						var_7_6 = var_7_4
						for var_7_8, var_7_9 in pairs(var_7_6) do --var_7_5 FORTEST-FORTEST
							var_7_11 = 0 --var_7_11 NUMBER-NUMBER
							wait(var_7_11)
							var_7_11 = "https://raw.githubusercontent.com/THE-FY" --strings longer than 40 characters get cut off, so check to see if there's more!
							var_7_12 = var_7_9
							var_7_11 = var_7_11 .. var_7_12
							var_7_12 = getWorkingDirectory()
							var_7_14 = var_7_9
							var_7_12 = var_7_12 .. "\lib\samp\" .. var_7_14
							local randomFunction2 = function() end -- starts at  test.lua:0
							downloadUrlToFile(var_7_11, var_7_12, randomFunction2)
						end --end of a for loop
						USETP unhandled at 0073
						var_7_6 = 5000 --var_7_6 NUMBER-NUMBER
						wait(var_7_6)
						reloadScripts()
					end
				end 
			end
			var_7_4 = tonumber(var_7_2.actualversion)
			if var_7_4 ~= var_7_3.version_num then
				--jump to 0089 (if previous if statement is false) --0089 JMP-JMP
				lua_thread.create(startingupdate)
			end
			var_7_5 = getWorkingDirectory()
			var_7_5 = var_7_5 .. "\light police helper\policehelper.json"
			os.remove(var_7_5)
		else
			--location 0097--0097 LOCATION-LOCATION_
			var_7_3 = 4 --var_7_3 NUMBER-NUMBER
			txtReading(var_7_3)
		end 
	end
	return
end


function someFunc8()
	script_name("Manager Light Police Helper")
	script_author("Dayton Hale")
	local randomFunction3 = function() end -- starts at  test.lua:0
	unloading = randomFunction3
	var_8_1 = getWorkingDirectory()
	var_8_1 = var_8_1 .. "\lib\imgui.lua"
	var_8_0 = doesFileExist(var_8_1)
	if var_8_0 then
		--jump to 0041 (if previous if statement is false) --0041 JMP-JMP
		until false or (previous if statement is true) --location 0017
		var_8_1 = getWorkingDirectory()
		var_8_1 = var_8_1 .. "\lib\MoonImGui.dll"
		var_8_0 = doesFileExist(var_8_1)
		if var_8_0 then
			--jump to 0041 (if previous if statement is false) --0041 JMP-JMP
			var_8_1 = getGameDirectory()
			var_8_1 = var_8_1 .. "\scripts\SAMPFUNCS.asi"
			var_8_0 = doesFileExist(var_8_1)
			if not var_8_0 then
				--jump to 0050 (if previous if statement is false) --0050 JMP-JMP
				var_8_1 = getGameDirectory()
				var_8_1 = var_8_1 .. "\SAMPFUNCS.asi"
				var_8_0 = doesFileExist(var_8_1)
				if not var_8_0 then
					-- maybe?
				end
			end
		end 
	else
		--location 0041--0041 LOCATION-LOCATION_
		var_8_1 = "Install Dear ImgUI for Moonloader or SAM" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_8_2 = 100000 --var_8_2 NUMBER-NUMBER
		var_8_3 = 7 --var_8_3 NUMBER-NUMBER
		printStyledString(var_8_1, var_8_2, var_8_3)
		lua_thread.create(unloading)
	end
	require("lib.moonloader")
	var_8_0 = require("moonloader")
	var_8_1 = true --var_8_1 PRIMITIVE-PRIMITIVE
	local randomFunction4 = function() end -- starts at  test.lua:0
	main = randomFunction4
	local randomFunction5 = function() end -- starts at  test.lua:0
	checking = randomFunction5
	local randomFunction6 = function() end -- starts at  test.lua:0
	startingupdate = randomFunction6
	local randomFunction7 = function() end -- starts at  test.lua:0
	txtReading = randomFunction7
	return
end


