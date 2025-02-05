local gfx <const> = playdate.graphics

-- "lazy people use the spritewithtext function but you cannot actually do much with it, eg bolder text etc", dixit teacher
--local spriteTitle = gfx.sprite.spriteWithText("Spaceships", 400, 240)
local spriteTitle = gfx.sprite.new()
local spriteButton = gfx.sprite.spriteWithText("Press A to start!", 400, 240)

-- Now: going manually through the steps that spriteWithText does automatically, in order to do a bigger and bolder title. START

gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))
-- create image
local imageSpriteTitle = gfx.image.new(200, 120)
-- draw text on the image, using "push and pop" approach
gfx.pushContext(imageSpriteTitle) -- this sets the mageSpriteTitle as the image thats being drawn into as of now (instead of e.g., the screen buffer). Every draw function we do as of now will be a draw function onto that image
gfx.drawTextAligned("Spaceship", 100, 60, kTextAlignment.center)
gfx.popContext() -- in order to release the context from the image above and to draw on the Playdate screen again
-- end create image

spriteTitle:setImage(imageSpriteTitle:scaledImage(2))

spriteTitle:moveTo(200, 100)
spriteButton:moveTo(200, 170)




-- recall: two functions below are global functions, you can call them from wherever you want. what we do below is quick and dirty but good enough for this first game
function showMenu()
    spriteTitle:add()
    spriteButton:add()
end

function hideMenu()
    spriteTitle:remove()
    spriteButton:remove()
end