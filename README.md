# ICL
An Ingame Commandline Library for your Löve2D program.

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
