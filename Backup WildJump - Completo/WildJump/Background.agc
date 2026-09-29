// Declarações globais
global img_background as integer
global spr_background1 as integer
global spr_background2 as integer

global fundoX1 as float = 0.0
global fundoX2 as float = 1280.0
global velocidadeFundo as float = 8.0  // Reduzida velocidade

function background()
    img_background = LoadImage("Selva_Background.jpg")

    spr_background1 = CreateSprite(img_background)
    SetSpriteSize(spr_background1, 1280, 720)
    SetSpritePosition(spr_background1, fundoX1, 0)
    SetSpriteDepth(spr_background1, 20) 

    spr_background2 = CreateSprite(img_background)
    SetSpriteSize(spr_background2, 1280, 720)
    SetSpritePosition(spr_background2, fundoX2, 0)
    SetSpriteDepth(spr_background2, 20)
endfunction

function movimento_background()
    // Só move o fundo se estiver jogando
    if estado_jogo <> 1 then exitfunction
    
    fundoX1 = fundoX1 - velocidadeFundo
    fundoX2 = fundoX2 - velocidadeFundo

    // Reposiciona fundo1 se saiu da tela
    if fundoX1 <= -1280.0
        fundoX1 = fundoX2 + 1280.0
    endif

    // Reposiciona fundo2 se saiu da tela
    if fundoX2 <= -1280.0
        fundoX2 = fundoX1 + 1280.0
    endif

    SetSpritePosition(spr_background1, fundoX1, 0)
    SetSpritePosition(spr_background2, fundoX2, 0)
endfunction
