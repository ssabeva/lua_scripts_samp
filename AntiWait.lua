local memory = require "memory"

function main()
  repeat wait(0) until isCharDead(PLAYER_PED)
  memory.fill(0x442AD0 + 0x248, 0x90, 0x6)
	while true do
		wait(0)
	end
end
