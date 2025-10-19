local angle = 0
local width, height = 0,0
local moonshine = require 'moonshine'

function love.load()
    x,y,r = 400,400,100
    width, height = love.window.getDesktopDimensions()
    local mode_flags = {
        fullscreen = true,
        fullscreentype = "desktop",
        usedpiscale = true
    }
    canvas = love.graphics.newCanvas(width, height, { type = '2d', readable = true })
    love.window.setMode(width, height, mode_flags)
    love.window.width=width
    love.window.height=height
    effect = moonshine(moonshine.effects.glow).chain(moonshine.effects.glow).chain(moonshine.effects.scanlines)
    effect.glow.strength = 5
    effect.glow.min_luma = 0.2
    effect.scanlines.opacity = 0.3
    -- glowShader = love.graphics.newShader("glow.glsl")
end

function staticGraphic()
    love.graphics.setColor(0.1,0.1,0.1)
    love.graphics.rectangle("fill",0,0,width,height)
    love.graphics.setColor(245/255, 100/255 , 0)
    love.graphics.circle("line", width/2,height/2, r)
    love.graphics.rectangle("line",(width/2)-150,(height/2)-150,300,300)
    
    -- love.graphics.setColor(255, 255, 255)
    -- love.graphics.rectangle("fill",width/2,height/2,300,1)
end

function love.draw()
   effect(function()
    staticGraphic()
    love.graphics.push()
        love.graphics.translate(width/2, height/2)
        love.graphics.rotate(angle)
        love.graphics.translate(-(width/2),-(height/2))
        love.graphics.push() 
            love.graphics.translate(-150,0)
            love.graphics.setColor(245/255, 130/255 , 0)
            -- love.graphics.translate(width/2-150, height/2)
            love.graphics.rectangle("fill",width/2,height/2-2,140,4)
            love.graphics.circle("fill",(width/2)+150,height/2,4)
            love.graphics.rectangle("fill",(width/2)+160,height/2-2,140,4)
            -- love.graphics.translate(-(width/2)+150, -(height/2))
            
        love.graphics.pop()
    love.graphics.pop()
    end)

end

function love.update(dt)
    local joysticks = love.joystick.getJoysticks()
    if #joysticks>0 then
        local xaxis = joysticks[1]:getAxis(1)
        angle= -(xaxis*math.pi*0.3)
        print(angle)
    end
end    
