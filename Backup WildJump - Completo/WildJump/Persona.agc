// Declarações globais
global img_Persona_andando as integer
global spr_Persona_andando as integer

global img_Persona_pulando as integer
global spr_Persona_pulando as integer

global spr_Persona_andandoX as integer = 100
global spr_Persona_andandoY as float = 450.0
global CHAO_Y as float = 450.0

global velocidadeY as float = 0.0
global estaPulando as integer = 0
global contadorPulos as integer = 0

function Personagem()
    // Inicializar as variáveis ANTES de criar os sprites
    spr_Persona_andandoY = CHAO_Y
    
    // Sprite andando
    img_Persona_andando = LoadImage("persona_andando.png")
    spr_Persona_andando = CreateSprite(img_Persona_andando)
    SetSpriteSize(spr_Persona_andando, 180, 250)
    SetSpritePosition(spr_Persona_andando, spr_Persona_andandoX, spr_Persona_andandoY)
    SetSpriteAnimation(spr_Persona_andando, 477, 660, 3)
    PlaySprite(spr_Persona_andando, 8, 1, 1, 3)  
    SetSpriteVisible(spr_Persona_andando, 0)

    // Sprite pulando
    img_Persona_pulando = LoadImage("persona_pulando.png")
    spr_Persona_pulando = CreateSprite(img_Persona_pulando)
    SetSpriteSize(spr_Persona_pulando, 150, 230)
    SetSpritePosition(spr_Persona_pulando, spr_Persona_andandoX, spr_Persona_andandoY)
    SetSpriteAnimation(spr_Persona_pulando, 505, 804, 3)
    SetSpriteVisible(spr_Persona_pulando, 0)
    StopSprite(spr_Persona_pulando)
endfunction

function movimentacao()
    // Só permite movimento se estiver jogando
    if estado_jogo <> 1 then exitfunction
    
    // Aplicar gravidade quando estiver pulando
    if estaPulando = 1
        velocidadeY = velocidadeY + 1.2
        spr_Persona_andandoY = spr_Persona_andandoY + velocidadeY
        
        // Atualiza posição do sprite pulando
        SetSpritePosition(spr_Persona_pulando, spr_Persona_andandoX, spr_Persona_andandoY)
        
        // Verifica se tocou o chão
        if spr_Persona_andandoY >= CHAO_Y
            spr_Persona_andandoY = CHAO_Y
            velocidadeY = 0.0
            estaPulando = 0
            contadorPulos = 0
            
            // Volta para sprite de andar
            SetSpriteVisible(spr_Persona_andando, 1)
            SetSpriteVisible(spr_Persona_pulando, 0)
            StopSprite(spr_Persona_pulando)
        endif
    endif
    
    // Detecta pulo (SPACE BAR) - só se não estiver pulando ou permitir duplo pulo
    if GetRawKeyPressed(32) = 1 and contadorPulos < 2
        velocidadeY = -22.0 
        estaPulando = 1
        contadorPulos = contadorPulos + 1
        
        // Troca para sprite de pulo
        SetSpriteVisible(spr_Persona_andando, 0)
        SetSpriteVisible(spr_Persona_pulando, 1)
        PlaySprite(spr_Persona_pulando, 6, 1, 1, 3) 
    endif
    
    // Atualiza posição do sprite de andar apenas se não estiver pulando
    if estaPulando = 0
        SetSpritePosition(spr_Persona_andando, spr_Persona_andandoX, spr_Persona_andandoY)
    endif
endfunction
