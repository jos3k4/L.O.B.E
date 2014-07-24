require("AnAL")

function love.load()
 
 -- Estos son los valores de mi heroe.
 hero = {} -- Creamos una tabla como estructura
 hero.x = 300    -- x,y establecemos las coordenadas
 hero.y = 450
 hero.speed = 100
 
--Arma del heroe.
espada = {}
espada.ataque = 100
espada.tipo = "Espada Hielo"

arco = {}
arco.ataque = 200
arco.tipo = "Arco de luz"

-- Equipamos el arma al heroe.
hero.equipada = espada
-- Inicialmente el arma esta desenfundada.
desenfundada = false
--Banda sonora
temazo = love.audio.newSource("resources/music/Deeper.ogg")
combate = love.audio.newSource("resources/music/AssaultOnMistCastle.ogg")
love.audio.play(temazo)


--Descompongo el Spritesheet en fragmentos.

tilesetImage = love.graphics.newImage("resources/images/human_base.png")

  local tileW, tileH = 16,20
  local tilesetW, tilesetH = tilesetImage:getWidth(), tilesetImage:getHeight()
   i = 0
  
  AnimacionArriba = {}
  AnimacionArriba[0] = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  AnimacionArriba[1] = love.graphics.newQuad(16,  0, tileW, tileH, tilesetW, tilesetH)
  AnimacionArriba[2] = love.graphics.newQuad(32,  0, tileW, tileH, tilesetW, tilesetH)
  
  AnimacionAbajo = {}
  AnimacionAbajo[0] = love.graphics.newQuad(0,  36, tileW, tileH, tilesetW, tilesetH)
  AnimacionAbajo[1] = love.graphics.newQuad(16,  36, tileW, tileH, tilesetW, tilesetH)
  AnimacionAbajo[2] = love.graphics.newQuad(32,  36, tileW, tileH, tilesetW, tilesetH)
  
  Animacion = AnimacionArriba[0]
  
  anim = newAnimation(tilesetImage, 16, 20, 0.1, 0)
 
end

function animacionArriba()
  if i == 2 then
      i = 0
  end  

Animacion = AnimacionArriba[i]
  
  i = i + 1
end 


function animacionAbajo()
  if i == 2 then
      i = 0
  end  

Animacion = AnimacionAbajo[i]
  
  i = i + 1
end 

function love.update(dt)
  if love.keyboard.isDown("left") then
   hero.x = hero.x - hero.speed*dt
 elseif love.keyboard.isDown("right") then
   hero.x = hero.x + hero.speed*dt
 elseif love.keyboard.isDown("down") then
   hero.y = hero.y + hero.speed*dt
   animacionAbajo()
 elseif love.keyboard.isDown("up") then
   hero.y = hero.y - hero.speed*dt
   animacionArriba()
 elseif love.keyboard.isDown("2") then
   hero.equipada = arco
 elseif love.keyboard.isDown("1") then
   hero.equipada = espada
 end
 
 --Modo ataque
 if love.keyboard.isDown("c") then
   love.audio.stop(temazo)
   love.audio.play(combate)
   love.graphics.setColor(255,0,0,255)
   desenfundada = true
 end
 
end

function love.draw()
   -- let's draw some ground
 love.graphics.setColor(0,255,0,255)
 love.graphics.rectangle("fill", 0, 465, 800, 150)

 
 if desenfundada then
 love.graphics.print(hero.equipada.tipo, 100, 100)
end
--Transparencia al color de la escena.
love.graphics.setColor(255, 255, 255, 255); 
love.graphics.draw(tilesetImage,Animacion,hero.x,hero.y)

end