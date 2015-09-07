--[[
Ingame Commandline for Love2D [ICL]

List of functions(main):

	icl:load(keyToActivateCommandLine, keyToStartTyping, name, version)
	> Loads all the variables or other stuff used in this library.

	icl:draw()
	> Draws all the stuff.

	icl:keypressed(key)
	> Gets all the keyboard input(execept for the text).

	icl:textinput(text)
	> Gets the text input.

Copy the functions into the main.lua file. It should look something like this:

require("icl")

function love.load()
	icl:load("f1", "f2", "Doge Simulator", "1123.1.1.4")
end

function love.draw()
	icl:draw()
end

function love.keypressed(key)
	icl:keypressed(key)
end

function love.textinput(t)
	icl:textinput(t)
end

List of other functions:
	
	icl:print(input, mode)
	> icl:print() will print on the same line if mode ~= nil.
	
	help()
	> Gives you help.

	exit()
	> Closes this software.

	and so on...

By the way don't type UTF-8 stuff into the command line.


LICENCE
This work is lcensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

	Attribution
	> You must attribute the work in the manner specified by the author or licensor.

	ShareAlike
	> The licensor permits others to distribute derivative works only under the same license or one compatible with the one that governs the licensor's work.
]]--

icl = {}
local lines = {}

-- locals

local function execute(input)
	if input ~= "" then
		input = loadstring(input)
		local success, err = pcall(input)

		if not success then
			icl:print(err, 1)
		else
			-- execute
		end
	end
end

-- commands

function help()
	icl:print("icl:print() : Outputs <input> on the commandline.")
	icl:print("exit() : Closes this software.")
	icl:print("full() : Changes console size to window size.")
	icl:print("reset() : Resets size")
end

function exit()
	love.event.quit()
end

function full()
	icl.w = love.window.getWidth()
	icl.h = love.window.getHeight()
end

function reset()
	icl.w = 750
	icl.h = 247
end

function icl:print(input, mode)
	if input ~= "" then
		if mode == nil then
			lines[#lines + 1] = input
		else
			lines[#lines] = lines[#lines].." : "..input
		end
	end
end

-- globals

function icl:load(keyAc, keyTxt, name, ver)
	-- Checking
	if ver == nil then
		ver = "Stable Release"
	end
	if name == nil then
		name = "My Game"
	end
	if type(keyAc) ~= "string" then
		error("Expected string value in parameter #1. Got "..type(keyAc).."." , 2)
	end
	if type(keyTxt) ~= "string" then
		error("Expected string value in parameter #2. Got "..type(keyTxt)..".", 2)
	end

	-- Variables
	self.keyAc = keyAc
	self.keyTxt = keyTxt

	self.active = false
	self.txtactive = false
	self.x = 0
	self.y = 0
	self.w = 750
	self.h = 247

	self.inputLine = ""
	self.seperator = "======================================"

	self.font = love.graphics.newFont()
	self.barcount = 0

	-- Lines
	lines[1] = "Welcome to "..name.." v."..ver
	lines[2] = "Enter \"help()\" to get the list of commands."
	lines[3] = self.seperator
end

function icl:keypressed(key)
	if key == self.keyAc then
		self.active = not self.active
	end
	if key == self.keyTxt and self.active then
		self.txtactive = not self.txtactive
	end
	if key == "return" and self.active and self.txtactive then
		icl:print(self.inputLine)
		execute(self.inputLine)
		self.inputLine = ""
	end
	if key == "backspace" and self.active and self.txtactive then
		self.inputLine = self.inputLine:sub(1, -2)
		self.barcount = 0
	end
end

function icl:textinput(char)
	if self.active and self.txtactive then
		self.inputLine = self.inputLine..char
		self.barcount = 0
	end
end

function icl:draw()
	if self.active then
		-- The rectangles
		love.graphics.setColor(0, 0, 0, 150)
		love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
		love.graphics.rectangle("fill", self.x, self.y + self.h - 22, self.w, 22)		-- 15 is the inputbox size

		-- The text
		love.graphics.setColor(255, 255, 255, 150)
		love.graphics.setFont(self.font)
		for i = 1, #lines do
			local y = (self.y + self.h) - 20 * ((#lines - i) + 1) - 22
			love.graphics.print(lines[i], self.x + 10, y)
		end	
		love.graphics.print(self.inputLine, self.x + 10, self.y + self.h - 17)

		-- The bar after the line
		if self.txtactive then
			if self.barcount < 45 then
				love.graphics.print("|", self.x + 9 + self.font:getWidth(self.inputLine), self.y + self.h - 19)
			end
			if self.barcount > 90 then
				self.barcount = 0
			end
			self.barcount = self.barcount + 1
		end
	end
end
