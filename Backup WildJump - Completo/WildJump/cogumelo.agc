// Declarações globais
global spr_gumelo1 as integer = 0
global spr_gumelo2 as integer = 0
global img_gumelo as integer

function cogu_init()
    img_gumelo = LoadImage("cogumelo.png")
endfunction

function criar_cogu(index as integer)
    x_spawn# = GetDeviceWidth() + Random(0, 200)
    y_spawn# = 450

    if index = 1
        // Remove cogumelo anterior se existir
        if GetSpriteExists(spr_gumelo1) = 1
            DeleteSprite(spr_gumelo1)
        endif
        
        spr_gumelo1 = CreateSprite(img_gumelo)
        SetSpriteSize(spr_gumelo1, 150, 300)
        SetSpritePosition(spr_gumelo1, x_spawn#, y_spawn#)
        SetSpriteShape(spr_gumelo1, 3)
        SetSpriteDepth(spr_gumelo1, 10)
        SetSpriteAnimation(spr_gumelo1, 383, 1021, 4)
        PlaySprite(spr_gumelo1, 10, 1, 1, 4)
    endif

    if index = 2
        // Remove cogumelo anterior se existir
        if GetSpriteExists(spr_gumelo2) = 1
            DeleteSprite(spr_gumelo2)
        endif
        
        spr_gumelo2 = CreateSprite(img_gumelo)
        SetSpriteSize(spr_gumelo2, 150, 300)
        SetSpritePosition(spr_gumelo2, x_spawn#, y_spawn#)
        SetSpriteShape(spr_gumelo2, 3)
        SetSpriteDepth(spr_gumelo2, 10)
        SetSpriteAnimation(spr_gumelo2, 383, 1021, 4)
        PlaySprite(spr_gumelo2, 10, 1, 1, 4)
    endif
endfunction

function atualizar_cogumelos()
    // Só atualiza cogumelos se estiver jogando
    if estado_jogo <> 1 then exitfunction
    
    // Cogumelo 1
    if spr_gumelo1 > 0 and GetSpriteExists(spr_gumelo1) = 1
        x1# = GetSpriteX(spr_gumelo1)
        SetSpritePosition(spr_gumelo1, x1# - 12, 450)
        if x1# < -200
            DeleteSprite(spr_gumelo1)
            spr_gumelo1 = 0
        endif
    else
        // Chance de criar novo cogumelo
        if Random(0, 300) < 3
            criar_cogu(1)
        endif
    endif

    // Cogumelo 2
    if spr_gumelo2 > 0 and GetSpriteExists(spr_gumelo2) = 1
        x2# = GetSpriteX(spr_gumelo2)
        SetSpritePosition(spr_gumelo2, x2# - 12, 450)
        if x2# < -200
            DeleteSprite(spr_gumelo2)
            spr_gumelo2 = 0
        endif
    else
        // Chance de criar novo cogumelo
        if Random(0, 250) < 3
            criar_cogu(2)
        endif
    endif
endfunction
