function randomFunction		main ()
	repeat
	var_0_1 = 0 --var_0_1 NUMBER-NUMBER
	wait(var_0_1)
	var_0_0 = isSampAvailable()
	if var_0_0 then
		--jump to 0001 (if previous if statement is false) --0001 JMP-JMP
		until false or (previous if statement is true) --location 0009
		var_0_1 = 100 --var_0_1 NUMBER-NUMBER
		wait(var_0_1)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} MemoryClea" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = 106729 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} Используйт" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = 106729 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} Используйт" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = 106729 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} Используйт" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = 106729 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} Используйт" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_0_2 = 106729 --var_0_2 NUMBER-NUMBER
		sampAddChatMessage(var_0_1, var_0_2)
		var_0_1 = "{6A5ACD}[MemoryClean]{FFFFFF} Спасибо за" --strings longer than 40 characters get cut off, so check to see if there's more!
		sampAddChatMessage(var_0_1)
		sampRegisterChatCommand("cln", CleanMemory)
		sampRegisterChatCommand("cmem", CheckMemory)
		sampRegisterChatCommand("smem", SetupMemory)
		sampRegisterChatCommand("mc", ScriptInfo)
		repeat
		var_0_1 = 10000 --var_0_1 NUMBER-NUMBER
		wait(var_0_1)
		var_0_1 = 9325748 --var_0_1 NUMBER-NUMBER
		var_0_2 = 4 --var_0_2 NUMBER-NUMBER
		var_0_3 = true --var_0_3 PRIMITIVE-PRIMITIVE
		var_0_0 = uget_0_0.read(var_0_1, var_0_2, var_0_3)
		var_0_1 = 309329920 --var_0_1 NUMBER-NUMBER
		if var_0_1 < var_0_0 then
			--jump to 0069 (if previous if statement is false) --0069 JMP-JMP
			BeforeWarning()
			var_0_1 = 300000 --var_0_1 NUMBER-NUMBER
			wait(var_0_1)
		end
		var_0_1 = 9325748 --var_0_1 NUMBER-NUMBER
		var_0_2 = 4 --var_0_2 NUMBER-NUMBER
		var_0_3 = true --var_0_3 PRIMITIVE-PRIMITIVE
		var_0_0 = uget_0_0.read(var_0_1, var_0_2, var_0_3)
		if uget_0_1.sett.megabytes < var_0_0 then
			--jump to 0051 (if previous if statement is false) --0051 JMP-JMP
			CleanMemory()
			--jump to 0051 (if previous if statement is false) --0051 JMP-JMP
			until false or (previous if statement is true) --location 0083
			return
		end
	end end --REVERSE ME--REVERSE ME

function randomFunction		CheckMemory ()
	var_1_2 = "{98FB98}Памяти используется{ffffff}: {98" --strings longer than 40 characters get cut off, so check to see if there's more!
	until false or (previous if statement is true) --location 0009
	var_1_5 = 9325748 --var_1_5 NUMBER-NUMBER
	var_1_6 = 4 --var_1_6 NUMBER-NUMBER
	var_1_7 = true --var_1_7 PRIMITIVE-PRIMITIVE
	var_1_4 = uget_1_0.read(var_1_5, var_1_6, var_1_7)
	var_1_4 = var_1_4 /  1048576 --var_1_4 NUMBER-NUMBER
	sampAddChatMessage( string.format(var_1_2,  math.ceil(var_1_4) ) )
	return
end


function randomFunction		CleanMemory ()
	var_2_1 = 5489920 --var_2_1 NUMBER-NUMBER
	var_2_2 = 2 --var_2_2 NUMBER-NUMBER
	var_2_3 = 2 --var_2_3 NUMBER-NUMBER
	var_2_4 = true --var_2_4 PRIMITIVE-PRIMITIVE
	var_2_5 = true --var_2_5 PRIMITIVE-PRIMITIVE
	var_2_0 = callFunction(var_2_1, var_2_2, var_2_3, var_2_4, var_2_5)
	until false or (previous if statement is true) --location 0009
	var_2_2 = 5490704 --var_2_2 NUMBER-NUMBER
	var_2_3 = 1 --var_2_3 NUMBER-NUMBER
	var_2_4 = 1 --var_2_4 NUMBER-NUMBER
	var_2_5 = true --var_2_5 PRIMITIVE-PRIMITIVE
	var_2_1 = callFunction(var_2_2, var_2_3, var_2_4, var_2_5)
	var_2_3 = 5488336 --var_2_3 NUMBER-NUMBER
	var_2_4 = 0 --var_2_4 NUMBER-NUMBER
	var_2_5 = 0 --var_2_5 NUMBER-NUMBER
	var_2_2 = callFunction(var_2_3, var_2_4, var_2_5)
	var_2_4 = 4247424 --var_2_4 NUMBER-NUMBER
	var_2_5 = 0 --var_2_5 NUMBER-NUMBER
	var_2_6 = 0 --var_2_6 NUMBER-NUMBER
	var_2_3 = callFunction(var_2_4, var_2_5, var_2_6)
	var_2_5 = 5489728 --var_2_5 NUMBER-NUMBER
	var_2_6 = 0 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0 --var_2_7 NUMBER-NUMBER
	var_2_4 = callFunction(var_2_5, var_2_6, var_2_7)
	var_2_6 = 7370608 --var_2_6 NUMBER-NUMBER
	var_2_7 = 0 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0 --var_2_8 NUMBER-NUMBER
	var_2_5 = callFunction(var_2_6, var_2_7, var_2_8)
	var_2_7 = 5904560 --var_2_7 NUMBER-NUMBER
	var_2_8 = 0 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0 --var_2_9 NUMBER-NUMBER
	var_2_6 = callFunction(var_2_7, var_2_8, var_2_9)
	var_2_8 = 5489824 --var_2_8 NUMBER-NUMBER
	var_2_9 = 0 --var_2_9 NUMBER-NUMBER
	var_2_10 = 0 --var_2_10 NUMBER-NUMBER
	var_2_7 = callFunction(var_2_8, var_2_9, var_2_10)
	var_2_9 = 5489216 --var_2_9 NUMBER-NUMBER
	var_2_10 = 0 --var_2_10 NUMBER-NUMBER
	var_2_11 = 0 --var_2_11 NUMBER-NUMBER
	var_2_8 = callFunction(var_2_9, var_2_10, var_2_11)
	var_2_10 = 4231328 --var_2_10 NUMBER-NUMBER
	var_2_11 = 0 --var_2_11 NUMBER-NUMBER
	var_2_12 = 0 --var_2_12 NUMBER-NUMBER
	var_2_9 = callFunction(var_2_10, var_2_11, var_2_12)
	var_2_11 = 4233056 --var_2_11 NUMBER-NUMBER
	var_2_12 = 0 --var_2_12 NUMBER-NUMBER
	var_2_13 = 0 --var_2_13 NUMBER-NUMBER
	var_2_10 = callFunction(var_2_11, var_2_12, var_2_13)
	var_2_12 = 4231696 --var_2_12 NUMBER-NUMBER
	var_2_13 = 0 --var_2_13 NUMBER-NUMBER
	var_2_14 = 0 --var_2_14 NUMBER-NUMBER
	var_2_11 = callFunction(var_2_12, var_2_13, var_2_14)
	var_2_13 = 4249536 --var_2_13 NUMBER-NUMBER
	var_2_14 = 1 --var_2_14 NUMBER-NUMBER
	var_2_15 = 1 --var_2_15 NUMBER-NUMBER
	var_2_16 = -1 --var_2_16 NUMBER-NUMBER
	var_2_12 = callFunction(var_2_13, var_2_14, var_2_15, var_2_16)
	var_2_14 = 4252896 --var_2_14 NUMBER-NUMBER
	var_2_15 = 0 --var_2_15 NUMBER-NUMBER
	var_2_16 = 0 --var_2_16 NUMBER-NUMBER
	var_2_13 = callFunction(var_2_14, var_2_15, var_2_16)
	var_2_15 = 7391568 --var_2_15 NUMBER-NUMBER
	var_2_16 = 0 --var_2_16 NUMBER-NUMBER
	var_2_17 = 0 --var_2_17 NUMBER-NUMBER
	var_2_14 = callFunction(var_2_15, var_2_16, var_2_17)
	var_2_16 = 4230320 --var_2_16 NUMBER-NUMBER
	var_2_17 = 0 --var_2_17 NUMBER-NUMBER
	until false or (previous if statement is true) --location 0083
	var_2_18 = 0 --var_2_18 NUMBER-NUMBER
	var_2_15 = callFunction(var_2_16, var_2_17, var_2_18)
	var_2_17 = 4252768 --var_2_17 NUMBER-NUMBER
	var_2_18 = 0 --var_2_18 NUMBER-NUMBER
	var_2_19 = 0 --var_2_19 NUMBER-NUMBER
	var_2_16 = callFunction(var_2_17, var_2_18, var_2_19)
	var_2_18 = 4225552 --var_2_18 NUMBER-NUMBER
	var_2_19 = 0 --var_2_19 NUMBER-NUMBER
	var_2_20 = 0 --var_2_20 NUMBER-NUMBER
	var_2_17 = callFunction(var_2_18, var_2_19, var_2_20)
	var_2_19 = 4240288 --var_2_19 NUMBER-NUMBER
	var_2_20 = 0 --var_2_20 NUMBER-NUMBER
	var_2_21 = 0 --var_2_21 NUMBER-NUMBER
	var_2_18 = callFunction(var_2_19, var_2_20, var_2_21)
	var_2_19, var_2_20, var_2_21 = getCharCoordinates(PLAYER_PED)
	var_2_23 = var_2_19
	var_2_24 = var_2_20
	requestCollision(var_2_23, var_2_24)
	var_2_23 = var_2_19
	var_2_24 = var_2_20
	var_2_25 = var_2_21
	loadScene(var_2_23, var_2_24, var_2_25)
	var_2_23 = "{6A5ACD}[MemoryClean]{FFFFFF} {98FB98}Оч" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_2_24 = 106729 --var_2_24 NUMBER-NUMBER
	sampAddChatMessage(var_2_23, var_2_24)
	return
end


function randomFunction		BeforeWarning ()
	var_3_1 = "{6A5ACD}[MemoryClean] {FFD700}Предупрежд" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_3_2 = 106729 --var_3_2 NUMBER-NUMBER
	sampAddChatMessage(var_3_1, var_3_2)
	return
end


function randomFunction		ScriptInfo ()
	var_4_1 = 565 --var_4_1 NUMBER-NUMBER
	var_4_2 = "{6A5ACD}[MemoryClean]{ffffff} Информация" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_4_3 = "{6A5ACD}MemoryClean{ffffff} - {FF6347}ав" --strings longer than 40 characters get cut off, so check to see if there's more!
	sampShowDialog(var_4_1, var_4_2, var_4_3, "Хорошо")
	return
end


function randomFunction		var_7_3.onSendDialogResponse (INPUT_VAR_0_,INPUT_VAR_1_,INPUT_VAR_2_)
	var_5_4 = sampGetCurrentServerName()
	var_5_5 = var_5_4
	var_5_4 = var_5_4.lower(var_5_5)
	var_5_5 = var_5_4
	until false or (previous if statement is true) --location 0009
	var_5_4 = var_5_4.match(var_5_5, "samp")
	if var_5_4 then
		--jump to 0020 (if previous if statement is false) --0020 JMP-JMP
		if INPUT_VAR_0_ == 0 then
			--jump to 0021 (if previous if statement is false) --0021 JMP-JMP
			var_5_4 = {} --to find out the contents of this table look inside the lua file
			var_5_4[1] = INPUT_VAR_0_
			var_5_4[2] = INPUT_VAR_1_
			var_5_4[3] = INPUT_VAR_2_
			return var_5_4
			--jump to 0021 (if previous if statement is false) --0021 JMP-JMP
			return
			return
		end
	end end --REVERSE ME--REVERSE ME

function randomFunction		SetupMemory (INPUT_VAR_0_)
	var_6_2 = INPUT_VAR_0_
	var_6_1 = tonumber(var_6_2)
	if var_6_1 ~= nil then
		--jump to 0019 (if previous if statement is false) --0019 JMP-JMP
		until false or (previous if statement is true) --location 0009
		var_6_4 = var_6_1 *  1048576 --var_6_4 NUMBER-NUMBER
		var_6_3 = math.ceil(var_6_4)
		uget_6_0.sett.megabytes = var_6_3
		uget_6_1.save(uget_6_0, "MemoryClean.ini")
	else
		--location 0019--0019 LOCATION-LOCATION_
		var_6_3 = "{6A5ACD}[MemoryClean]{FFFFFF} Не указано" --strings longer than 40 characters get cut off, so check to see if there's more!
		var_6_4 = 106729 --var_6_4 NUMBER-NUMBER
		sampAddChatMessage(var_6_3, var_6_4)
	end
	var_6_3 = "{6A5ACD}[MemoryClean]{ffffff} {98FB98}Ус" --strings longer than 40 characters get cut off, so check to see if there's more!
	var_6_4 = var_6_1
	var_6_3 = var_6_3 .. var_6_4 .. " мегабайт) {98FB98}успешна{ffffff}."
	var_6_4 = 106729 --var_6_4 NUMBER-NUMBER
	sampAddChatMessage(var_6_3, var_6_4)
	return
end


function someFunc7()
	script_author("Artemka_2018")
	script_authors("Artemka_2018")
	until false or (previous if statement is true) --location 0009
	script_name("MemoryClean")
	script_version("1.1")
	var_7_1 = 2 --var_7_1 NUMBER-NUMBER
	script_version_number(var_7_1)
	var_7_0 = require("memory")
	var_7_1 = require("inicfg")
	var_7_3 = nil --var_7_3 PRIMITIVE-PRIMITIVE
	var_7_2 = var_7_1.load(var_7_3, "MemoryClean.ini")
	var_7_3 = require("lib.samp.events")
	if var_7_2 == nil then
		--jump to 0035 (if previous if statement is false) --0035 JMP-JMP
		var_7_4 = {} --to find out the contents of this table look inside the lua file
		var_7_5 = {} --to find out the contents of this table look inside the lua file
		var_7_4.sett = var_7_5
		var_7_2 = var_7_4
		var_7_4 = {}
		var_7_4[1] = var_7_2.sett.megabytes
		var_7_6 = var_7_2
		var_7_1.save(var_7_6, "MemoryClean.ini")
		local randomFunction0 = function() end -- starts at  test.lua:0
		main = randomFunction0
		local randomFunction1 = function() end -- starts at  test.lua:0
		CheckMemory = randomFunction1
		local randomFunction2 = function() end -- starts at  test.lua:0
		CleanMemory = randomFunction2
		local randomFunction3 = function() end -- starts at  test.lua:0
		BeforeWarning = randomFunction3
		local randomFunction4 = function() end -- starts at  test.lua:0
		ScriptInfo = randomFunction4
		local randomFunction5 = function() end -- starts at  test.lua:0
		var_7_3.onSendDialogResponse = randomFunction5
		local randomFunction6 = function() end -- starts at  test.lua:0
		SetupMemory = randomFunction6
		return
	end
end --REVERSE ME

