local angle = 0
local width, height = 0,0

function love.load()
    x,y,r = 400,400,100
    width, height = love.window.getDesktopDimensions()
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
    love.graphics.rectangle("line",(width/2)-150,(height/2)-150,300,300)
    -- love.graphics.setColor(255, 255, 255)
    -- love.graphics.rectangle("fill",width/2,height/2,300,1)
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
    love.graphics.setColor(0, 255, 255)
    love.graphics.push()
        love.graphics.translate(-150,0)
        love.graphics.rectangle("fill",width/2,height/2,140,1)
        love.graphics.circle("fill",(width/2)+150,height/2,10)
        love.graphics.rectangle("fill",(width/2)+160,height/2,140,1)
    love.graphics.pop()
end

function love.update(dt)
    
    local joysticks = love.joystick.getJoysticks()
    if #joysticks>0 then
        print("yes")
        local xaxis = joysticks[1]:getAxis(1)
        if xaxis>0 then
            angle = xaxis*math.pi*0.5
        elseif xaxis<0 then
            angle = xaxis*math.pi*0.5
        else
            angle = 0
        end
    end
end    
