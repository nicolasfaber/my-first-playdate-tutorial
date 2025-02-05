local gfx <const> = playdate.graphics



-- alt+z for word wrap in VSCode
--[[what the below actually does: it takes the gfx.sprite "blueprint", which is basically just a table with the functions for gfx.sprite, and it makes sure that "Player" which is now also a table you are able to call, has the same functions  ]]
class("Player").extends(gfx.sprite)

local imageSpritePlayer = gfx.image.new("assets/ship") -- naming convention: what is it? it is an image. What is it an image of? It is an image of a sprite. What is it a sprite of? It is a sprite of a Player.
local velocity = 0

function Player:init() -- N.B. Player:init() is the same as saying Player.init(self). Literally the same, we could also have written the latter one. But just to stick to our object-oriented approach we are gonna stick to using colon

    -- create the Player
    Player.super.init(self, imageSpritePlayer) -- we need to tell the Player to initialize. Btw: Player.super is the same as saying gfx.sprite

    self:moveTo(300,160) -- this puts the ship in the middle of the screen
    velocity = 0
    
end

function Player:update()
    -- update every frame
    
    Player.super.update(self) -- the reason you cannot do Player.super:update() is in Lua when you do a colon, you actually pass the same object that is calling, see min 12m00 of Tutorial 3. You want to pass the instance here, and NOT the blueprint

    local crankPosition = playdate.getCrankPosition()
    -- print(crankPosition)
    self:setRotation(crankPosition)

    if playdate.buttonIsPressed(playdate.kButtonA) then
        velocity = 5
    else
        velocity = 0
    end

    local crankPositionRadians = math.rad(crankPosition)
    local vX, vY = velocity * math.cos(crankPositionRadians), velocity * math.sin(crankPositionRadians)
    self:moveBy(vX, vY)

    if self.x < -10 then
        self:moveTo(410, self.y)
    elseif self.x > 410 then
        self:moveTo(-10, self.y)
    end

    if self.y < -10 then
        self:moveTo(self.x, 250)
    elseif self.y > 250 then
        self:moveTo(self.x, -10)
    end

    
end