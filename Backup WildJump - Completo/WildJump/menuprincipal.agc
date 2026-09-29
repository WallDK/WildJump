// Declarações globais
global estado_jogo as integer = 0
global menu_ativo as integer = 0

global img_menuprincipal as integer
global spr_menuprincipal as integer

function menuprincipal()
    img_menuprincipal = LoadImage("menu_principal.png")
    spr_menuprincipal = CreateSprite(img_menuprincipal)
    SetSpriteSize(spr_menuprincipal, 1280, 720)
    SetSpriteDepth(spr_menuprincipal, 1)
    SetSpriteVisible(spr_menuprincipal, 0)
endfunction

function inicializarMenu()
    // Define estado inicial
    estado_jogo = 0
    menu_ativo = 1
    
    // Mostra o menu inicial
    mostrarMenuInicial()
endfunction

function mostrarMenuInicial()
    // Mostra sprite de menu
    SetSpriteVisible(spr_menuprincipal, 1)
    
    // Esconde elementos do jogo
    esconderElementosJogo()
    
    estado_jogo = 0
    menu_ativo = 1
endfunction

function esconderMenuInicial()
    // Esconde sprite de menu
    SetSpriteVisible(spr_menuprincipal, 0)
    menu_ativo = 0
endfunction

function esconderElementosJogo()
    // Esconde personagem
    if GetSpriteExists(spr_Persona_andando) = 1
        SetSpriteVisible(spr_Persona_andando, 0)
    endif
    if GetSpriteExists(spr_Persona_pulando) = 1
        SetSpriteVisible(spr_Persona_pulando, 0)
    endif
    
    // Esconde inimigos
    if GetSpriteExists(spr_gumelo1) = 1
        SetSpriteVisible(spr_gumelo1, 0)
    endif
    if GetSpriteExists(spr_gumelo2) = 1
        SetSpriteVisible(spr_gumelo2, 0)
    endif
    
    // Esconde textos de pontuação
    if txt_pontos > 0
        SetTextVisible(txt_pontos, 0)
    endif
    if txt_recorde > 0
        SetTextVisible(txt_recorde, 0)
    endif
endfunction

function mostrarElementosJogo()
    // Mostra personagem
    SetSpriteVisible(spr_Persona_andando, 1)
    
    // Mostra textos de pontuação
    if txt_pontos > 0
        SetTextVisible(txt_pontos, 1)
    endif
    if txt_recorde > 0
        SetTextVisible(txt_recorde, 1)
    endif
endfunction

function iniciarJogo()
    estado_jogo = 1
    esconderMenuInicial()
    
    // RESET COMPLETO das variáveis de movimento - FORÇANDO posição correta
    estaPulando = 0
    contadorPulos = 0
    velocidadeY = 0.0
    spr_Persona_andandoY = CHAO_Y  // Força a posição correta
    
    // Posiciona EXPLICITAMENTE na posição correta
    SetSpritePosition(spr_Persona_andando, spr_Persona_andandoX, CHAO_Y)
    SetSpritePosition(spr_Persona_pulando, spr_Persona_andandoX, CHAO_Y)
    
    // Mostra personagem na posição correta
    SetSpriteVisible(spr_Persona_andando, 1)
    SetSpriteVisible(spr_Persona_pulando, 0)
    
    // Reset da pontuação
    resetarPontuacao()
    
    // Mostra elementos do jogo
    mostrarElementosJogo()
endfunction

function voltarAoMenu()
    estado_jogo = 0
    
    // Para qualquer movimento
    estaPulando = 0
    contadorPulos = 0
    velocidadeY = 0.0
    
    // Mostra menu inicial
    mostrarMenuInicial()
endfunction
