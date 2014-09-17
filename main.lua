require "Utils"
require "protagonista"

-- Inicializacion del Juego.
function love.load()
personajes = {}
-- Tal como he creado el juego,es necesaria una tabla para cada nuevo heroe que generemos
-- En la funcion generaHeroe el primer parametro sera esta tabla.
heroe = {}
antiheroe = {}

--De esta forma voy a crear un heroe generico.
hero = Heroe.new(450,300,100,20,4,2)
antihero = Heroe.new(200,200,100,20,4,2)

personajes[0] = hero
personajes[1] = antihero

hero.setMovimientoArriba("up")
hero.setMovimientoAbajo("down")
hero.setMovimientoDerecha("right")
hero.setMovimientoIzquierda("left")

--Vamos a cargar los temas que pueden sonar en el juego.
temazo = love.audio.newSource("resources/music/Deeper.ogg")
combate = love.audio.newSource("resources/music/AssaultOnMistCastle.ogg")
--Reproducimos el tema base.
--love.audio.play(temazo)
--a = string.format("%s",numeroAleatorio(1,12))
end

function love.update(dt)
  antihero.instanciaControles(dt)
  hero.instanciaControles(dt)
end

function love.draw()
   -- Vamos a dibujar un campo.
 love.graphics.setColor(0,255,0,255)
 love.graphics.rectangle("fill", 0, 465, 800, 150)
 
--Transparencia al color de la escena.
love.graphics.setColor(255, 255, 255, 255); 

--Voy mostrando las posiciones correspondientes a cada uno de los personajes.
for i=0,1,1 do
  love.graphics.draw(tilesetImage,personajes[i].animacion,personajes[i].x,personajes[i].y)
end


end