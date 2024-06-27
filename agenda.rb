require_relative 'contato'
require_relative 'agendas'
class Agenda
    def initialize(identificador = nil)
        @contatos = []
        @nome_agendas = {}
        recupera_agendas
        if identificador != nil
            carregar_agenda(identificador)
        end
    end

    def adicionar_contato(contato)
        @contatos << contato
    
    end

    def listar_contatos
        puts "Contatos"
        @contatos.each do |contato|
            contato.to_s
        end 
    end

    def salvar_contatos(identificador)
        if(@nome_agendas.key?(identificador))
            puts "Encontramos uma agenda existente! Deseja substituir? S/N"
            escolha = gets.chomp
            if(escolha == "N" || escolha == "n")
                puts "Qual identificador para a agenda?"
                identificador = gets.chomp
                salvar_contatos(identificador)
            end
        end
                   
            nome_agenda = (0...5).map { ('a'..'z').to_a[rand(26)] }.join + ".txt"
            @nome_agendas[identificador] = nome_agenda
            File.open("./arquivos/" + nome_agenda, "w") do |f|
                @contatos.each do |contato|
                    f.puts contato
                end
            end

            salvar_agenda(identificador, nome_agenda)
        
    end

    def zerar_contatos
        @contatos = []
    end

    


    def arquivos
        limpar_arquivos
    end

    private
    def salvar_agenda(nome_agenda, agenda)
        exist = false
        agendas = "./arquivos/.agendas.txt"
    
        # Certifica-se de que o arquivo existe
        unless File.exist?(agendas)
            File.new(agendas, "w").close
        end
    
        # Ler o conteúdo do arquivo
        linhas = File.readlines(agendas)
    
        # Verificar e substituir linha, se existir
        linhas.map! do |linha|
            if linha.include?("#{nome_agenda} - agenda:")
                exist = true
                "Nome: #{nome_agenda} - agenda: #{agenda}\n"
            else
                linha
            end
        end
    
        # Adicionar uma nova linha se a agenda não existir
        unless exist
            linhas << "Nome: #{nome_agenda} - agenda: #{agenda}\n"
        end
    
        # Escrever o conteúdo de volta para o arquivo
        File.open(agendas, "w") do |f|
            f.puts(linhas)
        end
    end
    def carregar_contatos(nome_agenda)  #CARREGA OS CONTATOS DE UMA AGENDA ESCOLHIDA PARA O ARRAY @CONTATOS
        File.open("./arquivos/" + nome_agenda, "r") do |f|
            f.each_line do |contato|
                contato = contato.split(" - ", 3)
                cont = Contato.new(contato[0].sub("Nome: ", ""), contato[1].sub("Numero: ", ""), contato[2].sub("Email: ", ""))
                @contatos << cont
            end
        end

    end

    def limpar_arquivos #LIMPA ARQUIVOS ANTIGOS DE AGENDAS DESATUALIZADAS
        arquivos = Dir.glob("./arquivos/*")
        atuais = []
        @nome_agendas.each do |key, value|
            atuais << value
        end

        puts atuais
    end
    def recupera_agendas #RECUPERA PARA O HASH NOME_AGENDAS AS AGENDAS ATUALIZADAS

        if File.exist?("./arquivos/.agendas.txt") && File.zero?("./arquivos/.agendas.txt")
            File.open("./arquivos/.agendas.txt", "r") do |f|
                f.each_line do |agenda|
                    agenda = agenda.split(" - ", 2)
                    @nome_agendas[agenda[0].sub("Nome: ", "")] = agenda[1].sub("agenda: ", "")
                end
            end
        end
    end
    
    def carregar_agenda(identificador) #IDENTICA SE EXISTE A AGENDA E CHAMDA CARREGAR CONTATOS
        if(@nome_agendas.key?(identificador))
            carregar_contatos(@nome_agendas[identificador])
        else
            puts "Agenda nao encontrada"
        end
    end

    
end







