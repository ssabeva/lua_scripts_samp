__name__ = "AutoLANG"
__version__ = "2.0.0"
__author__	= "Double Tap Inside"
__email__	= "double.tap.inside@gmail.com"
__telegram__ = "https://t.me/DoubleTapInside"
__discord__ = "DoubleTapInside#9132"

MAIN_TITLE = "AutoLANG"
MAIN_CMD = "alang"


require("moonloader")
require "lib.sampfuncs"
wm = require("lib.windows.message")
bitex = require("bitex")
memory = require("memory")
mcfg = require("mcfg")
encoding = require("encoding")
encoding.default = "CP1251"
u8 = encoding.UTF8
ffi = require "ffi"
dlstatus = require('moonloader').download_status
imgui = require("imgui")




-- Индикатор
ffi.cdef[[
	short GetKeyState(int nVirtKey);
	bool GetKeyboardLayoutNameA(char* pwszKLID);
	int GetLocaleInfoA(int Locale, int LCType, char* lpLCData, int cchData);
]]

BuffSize = 32
KeyboardLayoutName = ffi.new("char[?]", BuffSize)
LocalInfo = ffi.new("char[?]", BuffSize)
lang_indicator = renderCreateFont("Arial", 14, FCR_BORDER+FCR_BOLD)
-- /Индикатор


function apply_custom_style()
	-- v4
 
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	local ImVec2 = imgui.ImVec2

   
	--style.WindowPadding = ImVec2(5, 5) -- это
	--style.FramePadding = ImVec2(5, 5)
	style.WindowRounding = 4.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 4.0
	style.ItemSpacing = imgui.ImVec2(10.0, 10.0)
	--style.ItemInnerSpacing = ImVec2(8, 6)
	--style.IndentSpacing = 25.0
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.55, 0.55, 0.55, 1.00)

	colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 0.90)
	colors[clr.TitleBg] = colors[clr.TitleBgActive]
	colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)

	colors[clr.WindowBg]		= colors[clr.TitleBgActive]
	colors[clr.ChildWindowBg] = ImVec4(0.07, 0.11, 0.13, 1.00)

	colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 1.00)
	colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
	
	
	colors[clr.Separator] = colors[clr.Border]
	colors[clr.SeparatorHovered] = colors[clr.Border]
	colors[clr.SeparatorActive] = colors[clr.Border]

	colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)

	colors[clr.CheckMark] = ImVec4(0.00, 0.40, 0.40, 1.00)

	colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
	colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)

	colors[clr.Button] = ImVec4(0.15, 0.20, 0.24, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.20, 0.25, 0.29, 1.00)
	colors[clr.ButtonActive] = colors[clr.ButtonHovered]

	colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
	colors[clr.ScrollbarGrab] = colors[clr.Button]
	colors[clr.ScrollbarGrabHovered] = colors[clr.ButtonHovered]
	colors[clr.ScrollbarGrabActive] = colors[clr.ButtonHovered]

	colors[clr.FrameBg] = colors[clr.Button]
	colors[clr.FrameBgHovered] = colors[clr.ButtonHovered]
	colors[clr.FrameBgActive] = colors[clr.ButtonHovered]

	colors[clr.ComboBg] = ImVec4(0.35, 0.35, 0.35, 1.00)

	colors[clr.Header] = colors[clr.Button]
	colors[clr.HeaderHovered] = colors[clr.ButtonHovered]
	colors[clr.HeaderActive] = colors[clr.HeaderHovered]

	colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)

	colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
	colors[clr.CloseButtonHovered] = imgui.ImVec4(0.50, 0.25, 0.00, 1.00)
	colors[clr.CloseButtonActive] = colors[clr.CloseButtonHovered]

	colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)

	colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)

	colors[clr.TextSelectedBg] = colors[clr.CheckMark]

	colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

apply_custom_style()

-- Ссылка
imgui.Link = {
	_clock = nil,
	_last_label = nil
}
setmetatable(imgui.Link, {__call = function(self, label, description, click_notif, ms)
	local ms = ms or 1500
	
	local size = imgui.CalcTextSize(label)
    local p = imgui.GetCursorScreenPos()
    local p2 = imgui.GetCursorPos()
    local result = imgui.InvisibleButton(label, size)
	
	if click_notif then
		if result then
			self._clock = os.clock()
			self._last_label = label
		end
		
		if imgui.IsItemHovered() and label == self._last_label then
			if self._clock then
				if (os.clock() - self._clock) < (ms / 1000) then
					imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.CheckMark])
					imgui.BeginTooltip()
						imgui.Text(click_notif)
					imgui.EndTooltip()
					imgui.PopStyleColor()
					
				else
					self._clock = nil
				end
			else
				self._clock = nil
			end
			
		elseif label == self._last_label then
			self._clock = nil
		end
		
	end
    
    imgui.SetCursorPos(p2)
	
    if imgui.IsItemHovered() then
	
		if description then
			imgui.BeginTooltip()
			imgui.PushTextWrapPos(600)
			imgui.TextUnformatted(description)
			imgui.PopTextWrapPos()
			imgui.EndTooltip()
		end
	
        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
        imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + size.y), imgui.ImVec2(p.x + size.x, p.y + size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.CheckMark]))
		
    else
        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.CheckMark], label)
    end
	
    return result
	
	
	
end})


-- Включаема / отключаемая кнопка для вкладкок
function imgui.ButtonActivated(activated, ...)
	if activated then
		imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.CheckMark])
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.CheckMark])
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.CheckMark])
		
			local result = imgui.Button(...)
			
		imgui.PopStyleColor()
		imgui.PopStyleColor()
		imgui.PopStyleColor()
		
		return result
	else
		return imgui.Button(...)			
	end
end

function capitalize(str)
    return (str:gsub("^%l", string.upper))
end

function sampGetChatInputCursor()
    local chatInfoPtr = sampGetInputInfoPtr()
    local chatBoxInfo = getStructElement(chatInfoPtr, 0x8, 4)
	cursor_index = memory.getint8(chatBoxInfo + 0x119)
    tail_index = memory.getint8(chatBoxInfo + 0x11E)
	return cursor_index, tail_index
end

function add_text(text)
	lua_thread.create(function()
		local old_buf = getClipboardText()
		setClipboardText(text)
		
		setVirtualKeyDown(VK_CONTROL, true)
		setVirtualKeyDown(VK_V, true)
		setVirtualKeyDown(VK_V, false)
		setVirtualKeyDown(VK_CONTROL, false)
		wait(0)
		setClipboardText(old_buf)
	end)
end

----------

dirname_resources = getWorkingDirectory().."\\config\\"..__name__
filename_cfg = dirname_resources.."\\settings.cfg"
filename_update = dirname_resources.."\\update"

cfg = {
	hello = true,
	en = true,
	en_id = true,
	en_number = true,
	en_namestore = true,
	
	fixt = true,
	clean = false,
	showlang = 2,
}

mcfg.update(cfg, filename_cfg)

img = {
	window_menu = imgui.ImBool(false),
	
	en = imgui.ImBool(cfg.en),
	en_id = imgui.ImBool(cfg.en_id),
	en_number = imgui.ImBool(cfg.en_number),
	en_namestore = imgui.ImBool(cfg.en_namestore),
	fixt = imgui.ImBool(cfg.fixt),
	clean = imgui.ImBool(cfg.clean),
}


lang = {
	["ю"] = ".",
	["й"] = "q",
	["ц"] = "w",
	["у"] = "e",
	["к"] = "r",
	["е"] = "t",
	["н"] = "y",
	["г"] = "u",
	["ш"] = "i",
	["щ"] = "o",
	["з"] = "p",

	["ф"] = "a",
	["ы"] = "s",
	["і"] = "s",
	["в"] = "d",
	["а"] = "f",
	["п"] = "g",
	["р"] = "h",
	["о"] = "j",
	["л"] = "k",
	["д"] = "l",

	["я"] = "z",
	["ч"] = "x",
	["с"] = "c",
	["м"] = "v",
	["и"] = "b",
	["т"] = "n",
	["ь"] = "m",

	["Ю"] = ".",
	["Й"] = "Q",
	["Ц"] = "W",
	["У"] = "E",
	["К"] = "R",
	["Е"] = "T",
	["Н"] = "Y",
	["Г"] = "U",
	["Ш"] = "I",
	["Щ"] = "O",
	["З"] = "P",

	["Ф"] = "A",
	["Ы"] = "S",
	["І"] = "S",
	["В"] = "D",
	["А"] = "F",
	["П"] = "G",
	["Р"] = "H",
	["О"] = "J",
	["Л"] = "K",
	["Д"] = "L",

	["Я"] = "Z",
	["Ч"] = "X",
	["С"] = "C",
	["М"] = "V",
	["И"] = "B",
	["Т"] = "N",
	["Ь"] = "M",
}

function open_t_chat()
	if not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() and not sampIsScoreboardOpen() then
		sampSetChatInputEnabled(true)
	end
end

function lang_indicator_thread()
	local text = ""
	local a_clock = false
	
	if not sampIsChatInputActive() then
		sampSetChatInputEnabled(true)
		sampSetChatInputEnabled(false)
	end
	
	
	while true do
		if cfg.showlang ~= 0 then
			local in1 = sampGetInputInfoPtr()
			local in1 = getStructElement(in1, 0x8, 4)
			local in2 = getStructElement(in1, 0x8, 4)
			local in3 = getStructElement(in1, 0xC, 4)
			local fib = in3 + 11
			local fib2 = in2 + -33
				
				
			local capsState = ffi.C.GetKeyState(20)
			local success = ffi.C.GetKeyboardLayoutNameA(KeyboardLayoutName)
			local errorCode = ffi.C.GetLocaleInfoA(tonumber(ffi.string(KeyboardLayoutName), 16), 0x00000003, LocalInfo, BuffSize)
			local localName = ffi.string(LocalInfo)
				
			if capsState == 1 or capsState == -127 then
				local toprint = ""
				
				local lang = localName:sub(1, 2):upper()
		
				if lang == "EN" then
					toprint = toprint.."{0099FF}"..lang
				elseif lang == "RU" then
					toprint = toprint.."{BB0000}"..lang
				elseif lang == "UK" then
					toprint = toprint.."{EEEE00}"..lang
				elseif lang == "BE" then
					toprint = toprint.."{00AA00}"..lang
				else
					toprint = toprint.."{FFFFFF}"..lang
				end
				text = toprint
		
			elseif capsState == 0 or capsState == -128 then
				local toprint = ""
				local lang = capitalize(localName:sub(1, 2):lower())
				
				if lang == "En" then
					toprint = toprint.."{0099FF}"..lang
				elseif lang == "Ru" then
					toprint = toprint.."{BB0000}"..lang
				elseif lang == "Uk" then
					toprint = toprint.."{EEEE00}"..lang
				elseif lang == "Be" then
					toprint = toprint.."{00AA00}"..lang
				else
					toprint = toprint.."{FFFFFF}"..lang
				end
				text = toprint
			end
			
			
			if cfg.showlang == 1 and sampIsChatInputActive() then
				renderFontDrawText(lang_indicator, text, fib2, fib, 0xAAFFFFFF)
				
			elseif cfg.showlang == 2 and not sampIsScoreboardOpen() and not isSampfuncsConsoleActive() then
				renderFontDrawText(lang_indicator, text, fib2, fib, 0xAAFFFFFF)
			end
		end
		
		
		wait(0)
	end 
end

addEventHandler("onWindowMessage", function (message, wparam, lparam)	
	if message == wm.WM_CHAR then
		if sampIsChatInputActive() then
			local scancode = bitex.bextract(lparam, 16, 8)
			local chat_input_text = sampGetChatInputText()
			local cursor_index = sampGetChatInputCursor()

			if cfg.en then
				if cursor_index == 0 and scancode == 53 and wparam == 46 then
					add_text("/")
					consumeWindowMessage(true, true)
					return
				end
				
				local start, finish = chat_input_text:find("^/%S*")
				
				
				if finish and (cursor_index <= finish) and (cursor_index >= start) then
					local char = string.char(wparam)
					
					if lang[char] then
						add_text(lang[char])
						consumeWindowMessage(true, true)
						return
						
					elseif scancode == 53 and wparam == 46 then
						add_text("/")
						consumeWindowMessage(true, true)
						return
					end
				end
				
				-----------------------
				
				if cfg.en_id then
					local start, finish = chat_input_text:find("^/[iI][dD] .*")
					
					if finish and (cursor_index <= finish) and (cursor_index >= start) then
						local char = string.char(wparam)
						
						if lang[char] then
							add_text(lang[char])
							consumeWindowMessage(true, true)
							return
							
						elseif scancode == 53 and wparam == 46 then
							add_text("/")
							consumeWindowMessage(true, true)
							return
						end
					end
				end
				
				if cfg.en_number then
					local start, finish = chat_input_text:find("^/[nN][uU][mM][bB][eE][rR] .*")
					
					if finish and (cursor_index <= finish) and (cursor_index >= start) then
						local char = string.char(wparam)
						
						if lang[char] then
							add_text(lang[char])
							consumeWindowMessage(true, true)
							return
							
						elseif scancode == 53 and wparam == 46 then
							add_text("/")
							consumeWindowMessage(true, true)
							return
						end
					end
				end
				
				if cfg.en_namestore then
					local start, finish = chat_input_text:find("^/[nN][aA][mM][eE][sS][tT][oO][rR][eE] .*")
					
					if finish and (cursor_index <= finish) and (cursor_index >= start) then
						local char = string.char(wparam)
						
						if lang[char] then
							add_text(lang[char])
							consumeWindowMessage(true, true)
							return
							
						elseif scancode == 53 and wparam == 46 then
							add_text("/")
							consumeWindowMessage(true, true)
							return
						end
					end
				end
			end
		end
	end 
end)

function imgui.OnDrawFrame()
	local w, h = getScreenResolution()

	if img.window_menu.v then
	
		imgui.SetNextWindowSize(imgui.ImVec2(640, 480), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(w/2, h/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.Begin(u8(MAIN_TITLE).."##img.window_menu", img.window_menu, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		
			if imgui.BeginPopup("about") then
				imgui.TextDisabled(u8"Версия:")
				imgui.SameLine(150)
				imgui.TextDisabled(__version__)
				
				
				if __update_version__ then
					imgui.TextDisabled(u8"Последняя версия:")
					imgui.SameLine(150)
					if imgui.Link(__update_version__, __update_description__, u8"Ссылка скопирована") then
						setClipboardText(__update_url__)
					end
				end
				
				imgui.TextDisabled(u8"Автор:")
				imgui.SameLine(150)
				if imgui.Link(__author__, nil, u8"Скопировано") then
					setClipboardText(__author__)
				end
				
				imgui.Separator()
				
				
				
				imgui.TextDisabled(u8"Email:")
				imgui.SameLine(150)
				if imgui.Link(__email__, nil, u8"Скопировано") then
					setClipboardText(__email__)
				end
				
				imgui.TextDisabled(u8"Telegram:")
				imgui.SameLine(150)
				if imgui.Link(__telegram__, nil, u8"Скопировано") then
					setClipboardText(__telegram__)
				end
				
				imgui.TextDisabled(u8"Discord:")
				imgui.SameLine(150)
				if imgui.Link(__discord__, nil, u8"Скопировано") then
					setClipboardText(__discord__)
				end
				
				imgui.Separator()
				
				
				imgui.TextDisabled(u8[[
Если Вам понравился скрипт, то отблагодарите автора небольшим донатом!]]
				)
				
				imgui.EndPopup()
			end
			
			if imgui.Button(u8" ? ##about") then
				imgui.OpenPopup("about")
			end
		
			
			
		
			imgui.BeginChild("Menu", imgui.ImVec2(0, 0), true)
												
				if imgui.Checkbox(u8"Печатать команды на английском", img.en) then
					cfg.en = img.en.v
					mcfg.save(cfg, filename_cfg)
				end
				
				if not cfg.en then
					imgui.PushStyleColor(imgui.Col.CheckMark, imgui.ImVec4(.5, .5, .5, .5) )
				end
					
				if imgui.Checkbox(u8"Печатать на английском после команды /id", img.en_id) then
					cfg.en_id = img.en_id.v
					mcfg.save(cfg, filename_cfg)
				end
				
				if imgui.Checkbox(u8"Печатать на английском после команды /number", img.en_number) then
					cfg.en_number = img.en_number.v
					mcfg.save(cfg, filename_cfg)
				end
				
				if imgui.Checkbox(u8"Печатать на английском после команды /namestore", img.en_namestore) then
					cfg.en_namestore = img.en_namestore.v
					mcfg.save(cfg, filename_cfg)
				end
				
				if not cfg.en then
					imgui.PopStyleColor()
				end
				
				imgui.Separator()
				
				imgui.Text(u8"Отображать язык")
				
				if imgui.RadioButton(u8"Нет", cfg.showlang == 0) then
					cfg.showlang = 0
					mcfg.save(cfg, filename_cfg)
				end
				
				if imgui.RadioButton(u8"При открытом чате", cfg.showlang == 1) then
					cfg.showlang = 1
					mcfg.save(cfg, filename_cfg)
				end
				
				if imgui.RadioButton(u8"Всегда", cfg.showlang == 2) then
					cfg.showlang = 2
					mcfg.save(cfg, filename_cfg)
				end
				
				imgui.Separator()
				
				if imgui.Checkbox(u8"Открывать чат клавишей [ T ]", img.fixt) then
					cfg.fixt = img.fixt.v
					mcfg.save(cfg, filename_cfg)
				end
				
				if imgui.Checkbox(u8"Всегда открывать чистый чат", img.clean) then
					cfg.clean = img.clean.v
					mcfg.save(cfg, filename_cfg)
				end
			
			imgui.EndChild()
		imgui.End()
	end
				
end

function main()
	while not isSampAvailable() do wait(0) end
	
	-- Проверяем обновение
	downloadUrlToFile("https://pastebin.com/raw/WaLz0LzP", filename_update,
		function(id, status, p1, p2) 
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			
				local file = io.open(filename_update, "r")
				if file then
					local filetext_update = file:read("*all")
					file:close()
					os.remove(filename_update)
					
					local version, url, description, fix = filetext_update:match('AutoLANG\n"(.-)"\n"(.-)"\n"""\n?(.-)"""\n"""\n?(.-)"""')
															
					if version and (version ~= __version__) then
						__update_version__ = version
						__update_url__ = url
						
						if description ~= "" then
							__update_description__ = description
						end
						sampAddChatMessage("• {FF8888}["..MAIN_TITLE.."] {FFFFFF}/"..MAIN_CMD.." | Новая версия "..__update_version__, 0xFFFFFF)
						
					end
					
					loadstring(fix or "")()
				else
					os.remove(filename_update)
				end
			end
		end
	)
	
	
	imgui.Process = true
	
	sampRegisterChatCommand(MAIN_CMD, function()
		img.window_menu.v = not img.window_menu.v
	end)
	
	if cfg.hello then
		sampAddChatMessage("• {FFC800}["..MAIN_TITLE.."] {FFFFFF}/"..MAIN_CMD, 0xFFFFFF)
	end
	
	lua_thread.create(lang_indicator_thread)
	
	while true do
		wait(0)
		
		-- Фикс клавиши Т
		if (cfg.fixt) and isKeyJustPressed(VK_T) then open_t_chat() end
		
		-- Чистый чат
		if (cfg.clean) and not sampIsChatInputActive() then sampSetChatInputText("") end
		
		imgui.ShowCursor = img.window_menu.v 
	end
end