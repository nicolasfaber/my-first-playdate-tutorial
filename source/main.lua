-- CONTINUE AT MIN 1 of Tutorial 3.5

import "CoreLibs/object" -- external libraries, i.e. from Playdate SDK
import "CoreLibs/sprites"
import "CoreLibs/graphics"

-- below: my own libraries i.e. from my file system
import "sprites"
import "menu" -- underneath sprites

-- All comments not tagged as NF come from Tutorial 2: https://www.youtube.com/watch?v=RUEGGXtdV-Q&list=PLOwxD0-Wm6RxpebFlh_-SgcTkBwLTUEN-&index=2&ab_channel=Franchovy 
-- both references below speed up the game a little bit, and the code

local gfx <const> = playdate.graphics -- local reference to graphics
local sprite <const> = gfx.sprite -- local reference to sprite

local player = Player() -- Recall small p vs capital P; what we are doing here is calling the init() function inside the Player class

--  this is our Playdate init function which runs at the beginning of our code
local function init()
    player:add() -- this adds the player to the screen.

    showMenu()
end

function playdate.update()
    sprite.update() -- if one uses a dot, i.e. ".", instead of a colon, i.e., ":" (see above), --> this updates *every* sprite in the game instead of just the one instance

    if playdate.buttonJustPressed(playdate.kButtonA) then
        hideMenu()    
    end
end

--[[ 
init only runs once, however playdate.update() runs every frame. If the game runs at 30 frames per second (fps) 
it is gonna be called 30 times per second. If you do too much within playdate.update(), it is going to slow down your game though
 ]]
 init()

 print("Experimental feature!!!")