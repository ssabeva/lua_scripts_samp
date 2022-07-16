require ('moonloader')

function main()
	while true do wait(0)
		if isCharInAnyCar(PLAYER_PED) and not sampIsChatInputActive() and not sampIsDialogActive() and not sampIsCursorActive() then
			if isKeyDown(VK_DELETE) then
				addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0.0, -0.15, 0.0)
			elseif isKeyDown(VK_END) then
				addToCarRotationVelocity(storeCarCharIsInNoSave(PLAYER_PED), 0.0, 0.15, 0.0)
			end
		end
	end
end
