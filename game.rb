#coding:utf-8

# 1 - pedra
# 2 - papel
# 3 - tesoura

# @ -> variável de instancia
@auxJogador = 0
@auxAdversario = 0

# $ -> variável global
# @@ -> variável de classe (estática)
# sem nenhum desses símbolos, são variaveis locais

# método da regra do jogo
def jogo opcJogador, opcAdversario
    # verifica se opcJogador e opcAdversario são iguais. 
    # quando se usa "?", faz sentido o valor de retorno como boolean
    if opcJogador.eql? opcAdversario
        puts "EmpatE"
    # verificando se a opcJogador está incluso dentro do vetor [1,2,3]
    elsif [1,2,3].include? opcJogador
        if opcJogador == 1 && opcAdversario == 3
            puts "GANHOU"
            # caso não tivesse esse "@" tanto aqui quanto lá em cima,
            # o Ruby identificaria como um novo objeto,
            # mesmo possuindo o mesmo nome.
            @auxJogador += 1
        elsif opcJogador == 2 && opcAdversario == 1
            puts "GANHOU"
            @auxJogador += 1
        elsif opcJogador == 3 && opcAdversario == 2
            puts "GANHOU"
            @auxJogador += 1
        else
            puts "perdeu"
            @auxAdversario += 1
        end
    else 
        puts"invalido"
    end
end

# metodo para verificar ganhador
def verificaGanhador
    if @auxAdversario == 2
        puts 'Voce Perdeu a melhor de tres'
        true
    elsif @auxJogador == 2
        puts 'Voce Ganhou a melhor de tres'
        true
    end
end

# método para escrever a opção do jogador de número para algo mais fácil
def escrevaOpcao(codigo)
    case codigo
    when 1
        opcao = "pedra"
    when 2
        opcao = "papel"
    when 3
        opcao = "tesoura"
    end
    opcao
end

# mostra as opções para o jogador fazer sua escolha
def escreverOpcoes
    # iteração do array ["pedra","papel","tesoura"] usando indices
    # entre "|" (elemento, indice), são chamadas de variaveis de bloco (Google it! :D)
    # para tanto, poderiam ter qualquer nome
    ["pedra","papel","tesoura"].each_with_index { |elemento,indice|
        puts "#{indice + 1} : #{elemento}"
    }
end

# MainGame!
loop do
    puts
    puts
    escreverOpcoes
    puts "Escolha sua opcao:"
    
    opcJogador = gets.chomp.to_i until [1,2,3].include? opcJogador

    opcAdversario = rand(3) + 1

    puts "Opcao do jogador   : " << escrevaOpcao(opcJogador)
    puts "Opcao do adversario: #{escrevaOpcao(opcAdversario)}"

    jogo opcJogador.to_i, opcAdversario.to_i
    # poderia ser assim:
    # if verificaGanhador
    #       break
    # end
    break if verificaGanhador
end	
