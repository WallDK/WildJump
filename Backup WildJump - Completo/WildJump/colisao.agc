function verificar_colisao()
    // Só verifica colisão se estiver jogando (estado 1)
    if estado_jogo = 1
        // Define forma de colisão para o personagem (apenas uma vez)
        if estaPulando = 1
            SetSpriteShape(spr_Persona_pulando, 3)
        else
            SetSpriteShape(spr_Persona_andando, 3)
        endif

        // Verifica colisão com cogumelo 1
        if spr_gumelo1 > 0 and GetSpriteExists(spr_gumelo1) = 1
            if estaPulando = 1
                if GetSpriteCollision(spr_Persona_pulando, spr_gumelo1) = 1
                    gameOverScreen()
                endif
            else
                if GetSpriteCollision(spr_Persona_andando, spr_gumelo1) = 1
                    gameOverScreen()
                endif
            endif
        endif
        
        // Verifica colisão com cogumelo 2
        if spr_gumelo2 > 0 and GetSpriteExists(spr_gumelo2) = 1
            if estaPulando = 1
                if GetSpriteCollision(spr_Persona_pulando, spr_gumelo2) = 1
                    gameOverScreen()
                endif
            else
                if GetSpriteCollision(spr_Persona_andando, spr_gumelo2) = 1
                    gameOverScreen()
                endif
            endif
        endif
    endif
endfunction

function gameOverScreen()
    estado_jogo = 3  // Muda para estado "game over"
    
    // Remove cogumelos da tela
    if GetSpriteExists(spr_gumelo1) = 1
        DeleteSprite(spr_gumelo1)
    endif
    spr_gumelo1 = 0
    
    if GetSpriteExists(spr_gumelo2) = 1
        DeleteSprite(spr_gumelo2)
    endif
    spr_gumelo2 = 0
    
    // Esconde sprites do personagem
    SetSpriteVisible(spr_Persona_andando, 0)
    SetSpriteVisible(spr_Persona_pulando, 0)
    
    // Esconde textos de pontuação
    SetTextVisible(txt_pontos, 0)
    SetTextVisible(txt_recorde, 0)
    
    // Mostra menu de game over
    if GetSpriteExists(spr_menu) = 1
        SetSpriteVisible(spr_menu, 1)
    endif
endfunction

function verificarInputMenu()
    // Se está no menu inicial
    if estado_jogo = 0
        if GetRawKeyPressed(13) = 1  // ENTER - Jogar novamente
            iniciarJogo()
        endif
        
        if GetRawKeyPressed(16) = 1  // SHIFT - Mostrar créditos
            mostrarCreditos()
        endif
        
        if GetRawKeyPressed(27) = 1  // ESC - Fechar jogo
            end
        endif
    endif
    
    // Se está nos créditos
    if estado_jogo = 4
        if GetRawKeyPressed(8) = 1  // BACKSPACE - Voltar ao menu principal
            esconderCreditos()
        endif
        
        if GetRawKeyPressed(27) = 1  // ESC - Fechar jogo
            end
        endif
    endif
    
    // Se está no game over
    if estado_jogo = 3
        if GetRawKeyPressed(13) = 1  // ENTER - Reiniciar jogo
            reiniciarJogo()
        endif
        
        if GetRawKeyPressed(8) = 1  // BACKSPACE - Voltar ao menu principal
            voltarAoMenuPrincipal()
        endif
        
        if GetRawKeyPressed(27) = 1  // ESC - Fechar jogo
            end
        endif
    endif
endfunction

function reiniciarJogo()
    // Reseta todas as variáveis do jogo
    estado_jogo = 1
    
    // Reset do personagem
    estaPulando = 0
    contadorPulos = 0
    velocidadeY = 0.0
    spr_Persona_andandoY = CHAO_Y
    
    // Reposiciona e mostra personagem
    SetSpritePosition(spr_Persona_andando, spr_Persona_andandoX, spr_Persona_andandoY)
    SetSpriteVisible(spr_Persona_andando, 1)
    SetSpriteVisible(spr_Persona_pulando, 0)
    
    // Esconde menu de game over
    if GetSpriteExists(spr_menu) = 1
        SetSpriteVisible(spr_menu, 0)
    endif
    
    // Reset da pontuação
    resetarPontuacao()
    
    // Mostra elementos do jogo
    mostrarElementosJogo()
endfunction

function voltarAoMenuPrincipal()
    // Esconde menu de game over
    if GetSpriteExists(spr_menu) = 1
        SetSpriteVisible(spr_menu, 0)
    endif
    
    // Remove cogumelos da tela se existirem
    if GetSpriteExists(spr_gumelo1) = 1
        DeleteSprite(spr_gumelo1)
    endif
    spr_gumelo1 = 0
    
    if GetSpriteExists(spr_gumelo2) = 1
        DeleteSprite(spr_gumelo2)
    endif
    spr_gumelo2 = 0
    
    // Reset das variáveis do personagem
    estaPulando = 0
    contadorPulos = 0
    velocidadeY = 0.0
    spr_Persona_andandoY = CHAO_Y
    
    // Esconde sprites do personagem
    SetSpriteVisible(spr_Persona_andando, 0)
    SetSpriteVisible(spr_Persona_pulando, 0)
    
    // Esconde textos de pontuação
    SetTextVisible(txt_pontos, 0)
    SetTextVisible(txt_recorde, 0)
    
    // Volta ao menu principal
    mostrarMenuInicial()
endfunction
