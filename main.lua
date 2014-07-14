function love.load()
whale = love.graphics.newImage("resources/images/whale.png")
end

function love.draw()
love.graphics.draw(whale, 20, 20)
end