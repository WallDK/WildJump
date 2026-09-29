SetErrorMode(2)
SetWindowTitle("WildJump")
SetWindowSize(1280, 720, 0)
SetWindowAllowResize(1)
SetScissor(0, 0, 1280, 720)

SetVirtualResolution(1280, 720)
SetOrientationAllowed(1, 1, 1, 1)
SetSyncRate(60, 0)
SetScissor(0, 0, 0, 0)

#include "Persona.agc"
#include "Background.agc"
#include "cogumelo.agc"
#include "menu.agc"
#include "colisao.agc"
#include "menuprincipal.agc"
#include "pontuacao.agc"

// Inicializar sistemas
background()
menu()
creditos()
Personagem()
cogu_init()
menuprincipal()
inicializarPontuacao()

// Inicializar jogo no menu principal
inicializarMenu()

do
    // Verifica ESC em qualquer momento para fechar o jogo
    if GetRawKeyPressed(27) = 1  // ESC
        end
    endif
    
    // MENU INICIAL
    if estado_jogo = 0
        verificarInputMenu()
        
    // JOGANDO
    elseif estado_jogo = 1
        atualizarPontuacao()
        movimentacao()
        movimento_background()
        atualizar_cogumelos() 
        verificar_colisao()
        
    // GAME OVER
    elseif estado_jogo = 3
        verificarInputMenu()
        
    // CRÉDITOS
    elseif estado_jogo = 4
        verificarInputMenu()
    endif
    
    Sync()
loop
