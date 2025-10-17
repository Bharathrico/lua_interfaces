local angle = 0
local width, height = 0,0

function love.load()
    x,y,r = 400,400,100
    width, height = 1470, 956
    print(width, height)
    local mode_flags = {
        fullscreen = true,
        fullscreentype = "desktop",
        usedpiscale = true
    }
    love.window.setMode(width, height, mode_flags)
    love.window.width=width
    love.window.height=height
end

function staticGraphic()
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("line", width/2,height/2, r)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill",width/2,height/2,300,1)
end


function love.draw()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    -- chillax=love.graphics.newFont("Chillax_Complete/Fonts/TTF/Chillax-Variable.ttf", 50)
    -- love.graphics.setFont(chillax)
    -- love.graphics.print("Hello world!!!",300,400)   
    staticGraphic()
    love.graphics.translate(width/2, height/2)
    love.graphics.rotate(angle)
    love.graphics.translate(-(width/2), -(height/2))
    love.graphics.rectangle("fill",width/2,height/2,300,1)
end

function love.update(dt)
    
    local joysticks = love.joystick.getJoysticks()
    if #joysticks>0 then
        local xaxis = joysticks[1]:getAxis(1)
        if xaxis>0 then
            angle = xaxis*math.pi
        elseif xaxis<0 then
            angle = xaxis*math.pi
        else
            angle = 0
        end
    end
end    
