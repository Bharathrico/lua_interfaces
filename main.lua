local angle = 0

function love.load()
    x,y,r = 400,400,100
end

function love.draw()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    -- chillax=love.graphics.newFont("Chillax_Complete/Fonts/TTF/Chillax-Variable.ttf", 50)
    -- love.graphics.setFont(chillax)
    -- love.graphics.print("Hello world!!!",300,400)   
    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("line", x, y, r)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill",400,400,300,1)
    love.graphics.translate(400, 400)
    love.graphics.rotate(angle)
    love.graphics.translate(-400, -400)
    love.graphics.rectangle("fill",400,400,300,1)
end

function love.update(dt)
    angle = angle + 2*dt
    local joysticks = love.joystick.getJoysticks()
    if #joysticks>0 then
        local xaxis = joysticks[1]:getAxis(1)
        print(xaxis)
    end
end    