// Declarações globais
global pontos = 0
global recorde = 0
global tempoInicial = 0
global txt_pontos = 0
global txt_recorde = 0

function inicializarPontuacao()
    // Inicializa as variáveis de pontuação
    pontos = 0
    tempoInicial = GetMilliseconds()
    
    // Criar textos na tela
    txt_pontos = CreateText("Pontos: 0")
    SetTextPosition(txt_pontos, 1100, 50)
    SetTextSize(txt_pontos, 30)
    SetTextColor(txt_pontos, 255, 255, 255, 255)
    SetTextVisible(txt_pontos, 0) // Inicia invisível
    
    txt_recorde = CreateText("Recorde: " + Str(recorde))
    SetTextPosition(txt_recorde, 1100, 75)
    SetTextSize(txt_recorde, 25)
    SetTextColor(txt_recorde, 255, 255, 0, 255)
    SetTextVisible(txt_recorde, 0) // Inicia invisível
endfunction

function atualizarPontuacao()
    // Calcula pontos baseado no tempo (1 ponto por segundo aproximadamente)
    tempoAtual = GetMilliseconds()
    pontos = (tempoAtual - tempoInicial) / 1000
    
    // Atualiza o texto dos pontos na tela
    SetTextString(txt_pontos, "Pontos: " + Str(pontos))
    
    // Verifica se bateu o recorde
    if pontos > recorde
        recorde = pontos
        SetTextString(txt_recorde, "Recorde: " + Str(recorde))
    endif
endfunction

function resetarPontuacao()
    pontos = 0
    tempoInicial = GetMilliseconds()
    SetTextString(txt_pontos, "Pontos: 0")
endfunction
