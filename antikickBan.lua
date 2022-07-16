sampev = require("lib.samp.events")

function onReceivePacket(id, bitStream)
	if(id == 32) then
		return false
	end
end
function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if text:match("‚ы были кикнуты за подозрение в читерстве") then
		return false
    end
end