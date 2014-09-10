-- Modulo que gestiona el control del personaje.
function controlarPersonaje(dt)
  if love.keyboard.isDown("left") then
   personajes[0].x = personajes[0].x - personajes[0].speed*dt
 elseif love.keyboard.isDown("right") then
   personajes[0].x = personajes[0].x + personajes[0].speed*dt
 elseif love.keyboard.isDown("down") then
   personajes[0].y = personajes[0].y + personajes[0].speed*dt
   --animacionAbajo()
 elseif love.keyboard.isDown("up") then
   personajes[0].y = personajes[0].y - personajes[0].speed*dt
  -- animacionArriba(personajes[0])
 end
end