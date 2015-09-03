# ICL
An Ingame Commandline Library for your Löve2D program.
Ingame Commandline for Love2D [ICL] will give you full access to every global variable in your program ingame.

Note: This lib is still in development. Even though it is going to be finished soon it can and will be improved. For example       UI and more built in functions.

# Features
* `ICL` can help you debug your software without much effort.
* You can print a variable onto the commandline without a debugger. [Using icl:print()]
* You can make your own function to help you improve your experience with `ICL` easily.

# Setup
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

``` lua
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
```

List of other functions:
	
	Not really a list but..
	
	icl:print(input, mode)
	> icl:print() will print on the same line if mode ~= nil.


By the way don't type UTF-8 stuff into the command line.

# Usage
The first parameter of `icl:load()` is the key you can press to activate the console. The second one is the key that allows you to start to type in your commands. If the key is pressed, the well known "text bar" will show up(you'll understand what I mean). 
These 2 values are essential for this lib. If these 2 variables are not a string or not listed in the Löve2D key constants list(https://love2d.org/wiki/KeyConstant), `ICL` will not work.

The "name" and the "version" parameters, on the other hand, are not essential to run this library.

Now it's time to mess around!! You can type any type of lua code in this prompt. Don't worry the errors you cause won't affect the main software. It's protected!

You can try code like:

```lua
player.damage = 1000000000000000000
```

or use it for debugging

```lua
icl:print(player.x)
```

If you have any other questions, please contract me through `sosolol261@gmail.com`. I will gladly answer your question.

# Licence
This work is lcensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

	Attribution
	> You must attribute the work in the manner specified by the author or licensor.

	ShareAlike
	> The licensor permits others to distribute derivative works only under the same license or one compatible with the one that governs the licensor's work.
