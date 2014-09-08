require "Utils"


function generaHeroe(h,posx,posy,spd,lf,atck,def)
 -- Creamos una tabla como estructura
 h = {}
 h.x = posx    -- x,y establecemos las coordenadas
 h.y = posy
 h.speed = spd
 h.life = lf
 h.attack = atck
 h.defense = def
return h
end

function forjarArma(a,b)
arma.ataque = a
arma.tipo = b
return arma
end

-- Inicializacion del Juego.
function love.load()
personajes = {}
-- Tal como he creado el juego,es necesaria una tabla para cada nuevo heroe que generemos
-- En la funcion generaHeroe el primer parametro sera esta tabla.
heroe = {}
antiheroe = {}
--De esta forma voy a crear un heroe generico.
-- En un futuro lo ideal seria pasarle los parametros para asi generar en un momento dado el heroe que quiera.
hero = generaHeroe(hero,450,300,100,20,4,2)
antihero = generaHeroe(antiheroe,200,200,100,10,1,6)

personajes[0] = hero
personajes[1] = antihero

--Arma del heroe.
arma = {}
arma = forjarArma(100,"Espada de fuego")

-- Equipamos el arma al heroe.
hero.equipada = arma

-- Inicialmente el arma esta desenfundada.
hero.desenfundada = false

--Vamos a cargar los temas que pueden sonar en el juego.
temazo = love.audio.newSource("resources/music/Deeper.ogg")
combate = love.audio.newSource("resources/music/AssaultOnMistCastle.ogg")
--Reproducimos el tema base.
--love.audio.play(temazo)

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
  
  personajes[0].animacion = AnimacionArriba[0]
  personajes[1].animacion = AnimacionAbajo[0]
  --antihero.animacion = AnimacionAbajo[0]
 
 num = numeroAleatorio(1,12)
 a = string.format("%s",num)

end

function animacionArriba(heroe)
  if i == 2 then
      i = 0
  end  
heroe.animacion = AnimacionArriba[i]
  i = i + 1
end 


function love.update(dt)
  if love.keyboard.isDown("left") then
   personajes[0].x = personajes[0].x - personajes[0].speed*dt
 elseif love.keyboard.isDown("right") then
   personajes[0].x = personajes[0].x + personajes[0].speed*dt
 elseif love.keyboard.isDown("down") then
   personajes[0].y = personajes[0].y + personajes[0].speed*dt
   --animacionAbajo()
 elseif love.keyboard.isDown("up") then
   personajes[0].y = personajes[0].y - personajes[0].speed*dt
   animacionArriba(personajes[0])
 end
 
 --Modo ataque
 if love.keyboard.isDown("c") then
   love.audio.stop(temazo)
   love.audio.play(combate)
   love.graphics.setColor(255,0,0,255)
   hero.desenfundada = true
 end
 
end

function love.draw()
   -- let's draw some ground
 love.graphics.setColor(0,255,0,255)
 love.graphics.rectangle("fill", 0, 465, 800, 150)

 
if hero.desenfundada then
 love.graphics.print(hero.equipada.tipo, 100, 100)
end
--Transparencia al color de la escena.
love.graphics.setColor(255, 255, 255, 255); 

--Voy mostrando las posiciones correspondientes a cada uno de los personajes.
for i=0,1,1 do
  love.graphics.draw(tilesetImage,personajes[i].animacion,personajes[i].x,personajes[i].y)
end

love.graphics.print(a, 400, 300)

end