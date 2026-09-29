// Declarações globais
global img_menu as integer
global spr_menu as integer
global img_creditos as integer
global spr_creditos as integer

function menu()
    img_menu = LoadImage("menu.png")
    spr_menu = CreateSprite(img_menu)
    SetSpritePosition(spr_menu, 400, 150) 
    SetSpriteSize(spr_menu, 450, 450)
    SetSpriteVisible(spr_menu, 0)
endfunction

function creditos()
    img_creditos = LoadImage("creditos.jpg")  
    spr_creditos = CreateSprite(img_creditos)
    SetSpriteSize(spr_creditos, 1280, 720)
    SetSpritePosition(spr_creditos, 0, 0)
    SetSpriteDepth(spr_creditos, 1)  
    SetSpriteVisible(spr_creditos, 0) 
endfunction

function mostrarCreditos()
    // Esconde menu principal
    SetSpriteVisible(spr_menuprincipal, 0)
    
    // Mostra tela de créditos
    SetSpriteVisible(spr_creditos, 1)
    
    // Muda estado para créditos
    estado_jogo = 4 
endfunction

function esconderCreditos()
    // Esconde tela de créditos
    SetSpriteVisible(spr_creditos, 0)
    
    // Volta ao menu principal
    mostrarMenuInicial()
endfunction
