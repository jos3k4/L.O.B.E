 Heroe = {}
    Heroe.new = function(posx,posy,spd,lf,atck,def)
        -- Defino constantes para los controles del personaje
        local CONTROL_MOV_ARRIBA = "w"
        local CONTROL_MOV_ABAJO = "s"
        local CONTROL_MOV_IZQUIERDA="a"
        local CONTROL_MOV_DERECHA="d"
      
        local self = {}

        self.x = posx
        self.y = posy
        self.speed = spd
        self.life = lf
        self.attack = atck
        self.defense = def
        
        -- Animaciones del personaje.
        
        tilesetImage = love.graphics.newImage("resources/images/human_base.png")


        local tileW, tileH = 16,20
        local tilesetW, tilesetH = tilesetImage:getWidth(), tilesetImage:getHeight()
        i = 0
  
        animacionArriba = {}
        animacionArriba[0] = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
        animacionArriba[1] = love.graphics.newQuad(16,  0, tileW, tileH, tilesetW, tilesetH)
        animacionArriba[2] = love.graphics.newQuad(32,  0, tileW, tileH, tilesetW, tilesetH)
  
        animacionAbajo = {}
        animacionAbajo[0] = love.graphics.newQuad(0,  36, tileW, tileH, tilesetW, tilesetH)
        animacionAbajo[1] = love.graphics.newQuad(16,  36, tileW, tileH, tilesetW, tilesetH)
        animacionAbajo[2] = love.graphics.newQuad(32,  36, tileW, tileH, tilesetW, tilesetH)

        self.animacion = animacionAbajo[0]
        
              self.animArriba = function()
                self.animacion = animacionArriba[0]
              end
              
              self.animAbajo = function()
                self.animacion = animacionAbajo[0]
              end

              self.instanciaControles = function(dt)
                 if love.keyboard.isDown(CONTROL_MOV_IZQUIERDA) then
                   self.x = self.x - self.speed*dt
                 elseif love.keyboard.isDown(CONTROL_MOV_DERECHA) then
                   self.x = self.x + self.speed*dt
                 elseif love.keyboard.isDown(CONTROL_MOV_ABAJO) then
                   self.y = self.y + self.speed*dt
                   self.animAbajo()
                 elseif love.keyboard.isDown(CONTROL_MOV_ARRIBA) then
                   self.y = self.y - self.speed*dt
                   self.animArriba()
                 end
              end
              
              --[[
               --Modo ataque
 if love.keyboard.isDown("c") then
   love.audio.stop(temazo)
   love.audio.play(combate)
   love.graphics.setColor(255,0,0,255)
   hero.desenfundada = true
 end--]]

        return self
    end