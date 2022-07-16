local se = require("lib.samp.events")

local TAG = "[EV] {FFFFFF}"

local CLICK_FARM 	= false -- // Для фермы кликер по деревьях. По дефолту выключен
local CLICK_LOADER 	= false -- // Для грузчика кликер. По дефолту выключен

local TABLEID_LOADER = {}

function main() 
	if not isSampfuncsLoaded() or not isSampLoaded() then return end 
	while not isSampAvailable() do wait(200) end 
	
	local ip = sampGetCurrentServerAddress()
    if ip ~= "185.169.134.67" and ip ~= "185.169.134.68" and ip ~= "185.169.134.91" then
        thisScript():unload()
    end
	
	sampRegisterChatCommand(
		"eclick", 
		function(text)
			if text ~= nil and text ~= "" then
				if text == "farm" then
					CLICK_FARM = not CLICK_FARM
					if CLICK_FARM then
						printStringNow("CLICK FARM: ON", 1000)
					else
						printStringNow("CLICK FARM: OFF", 1000)
					end
				elseif text == "load" then
					CLICK_LOADER = not CLICK_LOADER
					if CLICK_LOADER then
						printStringNow("CLICK LOADER: ON", 1000)
					else
						printStringNow("CLICK LOADER: OFF", 1000)
					end
				else
					sampAddChatMessage(TAG .. "Используйте: /eclick [farm | load]", -1)
				end
			else
				sampAddChatMessage(TAG .. "Используйте: /eclick [farm | load]", -1)
			end
		end
	) 
	
	while true do wait(0)
		if CLICK_LOADER and #TABLEID_LOADER > 0 then
			lockPlayerControl(true)
			for key, val in pairs(TABLEID_LOADER) do
				if sampTextdrawIsExists(val["id"]) then
					local x, y, color = sampTextdrawGetLetterSizeAndColor(val["id"])
					if val["color"] == -4144960 then
						if key == 1 then
							local data = samp_create_sync_data('vehicle')
							data.upDownKeys = 65408 -- нажимаем на кнопочку W
							data.send()
						elseif key == 2 then
							local data = samp_create_sync_data('vehicle')
							data.upDownKeys = 128 -- нажимаем на кнопочку S
							data.send()
						elseif key == 3 then
							local data = samp_create_sync_data('vehicle')
							data.leftRightKeys = 65408 -- нажимаем на кнопочку A
							data.send()
						elseif key == 4 then
							local data = samp_create_sync_data('vehicle')
							data.leftRightKeys = 128 -- нажимаем на кнопочку D
							data.send()
						end
						wait(1000)
					end
				end
			end
			lockPlayerControl(false)
		end	
	end
end 

function se.onTextDrawSetString(id, text)
	local sizeX, sizeY, color = sampTextdrawGetLetterSizeAndColor(id)
	if CLICK_FARM then
		if text == "LD_BEAT:chit" and (color == -16742401 or color == -14013787) then
			lua_thread.create(
				function()
					wait(1000)
					sampSendClickTextdraw(id)
				end
			)
		end
	end
end

function se.onShowTextDraw(id, data)
	if CLICK_FARM then
		if (data.text == "LD_BEAT:chit" and (data.letterColor == -16742401 or data.letterColor == -14013787)) or (data.text == "‹3•Џ’_KOP3…HY" and data.letterColor == -15658735) then
			lua_thread.create(
				function()
					wait(1000)
					sampSendClickTextdraw(id)
				end
			)
		end
	end
	if CLICK_LOADER then
		if data.text == "" and (data.letterColor == -4144960 or data.letterColor == -14013787) then
			if #TABLEID_LOADER < 4 then
				table.insert(TABLEID_LOADER, {["id"] = id, ["color"] =  data.letterColor})
			elseif #TABLEID_LOADER == 4 then
				for key, val in pairs(TABLEID_LOADER) do
					if val["id"] == id then
						val["color"] = data.letterColor
 					end
				end
			end
		end
	end
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    -- from SAMP.Lua
    local raknet = require 'samp.raknet'
    require 'samp.synchronization'

    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
        passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
        aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
        trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
        unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
        bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
        spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    -- copy player's sync data to the allocated memory
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    -- function to send packet
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    -- metatable to access sync data and 'send' function
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end