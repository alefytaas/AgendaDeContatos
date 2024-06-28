require_relative 'contato'
class Agenda
    def initialize()
        @contatos = []
        @nome_agendas = {}
    end

    def adicionar_contato(contato)
        if is_email_valid?(contato.email) && is_nome_pessoa?(contato.nome) && is_contato?(contato.numero)
        @contatos << contato
        else
            puts "Existe algum dado incorreto"
        end
    
    end

    def listar_contatos
        puts "Contatos"
        @contatos.each do |contato|
            contato
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

    def zerar_agendas
        @contatos = []
        carregar_agenda("cuscuz")
    end

    def carregar_agenda(identificador)
        recupera_agendas #IDENTICA SE EXISTE A AGENDA E CHAMDA CARREGAR CONTATOS
        if(@nome_agendas.key?(identificador))
            puts @nome_agendas[identificador]
            carregar_contatos(@nome_agendas[identificador])
        else
            puts "Agenda nao encontrada"
        end
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
                caminho = ("./arquivos/" + linha.delete_prefix("Nome: #{nome_agenda} - agenda: "))
                File.delete(caminho.delete_suffix("\n"))
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
        File.open("./arquivos/" + nome_agenda.delete_suffix("\n"), "r") do |f|
            f.each_line do |contat|
                contat = contat.split(" - ", 3)
                cont = Contato.new(contat[0].sub("Nome: ", ""), contat[1].sub("Numero: ", ""), contat[2].sub("Email: ", ""))
                adicionar_contato(cont)
            end
        end

    end

    def limpar_arquivos #LIMPA ARQUIVOS ANTIGOS DE AGENDAS DESATUALIZADAS
        arquivos = Dir.glob("./arquivos/*")
        atuais = []
        zerar_agendas
        recupera_agendas

        @nome_agendas.each do |key, value|
            atuais << "./arquivos/" + value 
        end
        puts "atuais"
        puts atuais
        puts "arquivos"
        puts arquivos
        arquivos.each do |arquivo|
            if !atuais.include?(arquivo)
                File.delete(arquivo)
            end
        end

    end
    def recupera_agendas #RECUPERA PARA O HASH NOME_AGENDAS AS AGENDAS ATUALIZADAS

        if File.exist?("./arquivos/.agendas.txt") && !File.zero?("./arquivos/.agendas.txt")
            File.open("./arquivos/.agendas.txt", "r") do |f|
                f.each_line do |agenda|
                    agenda = agenda.split(" - ", 2)
                    
                    @nome_agendas[agenda[0].sub("Nome: ", "")] = agenda[1].sub("agenda: ", "")
                    #puts @nome_agendas
                end
            end
        end
    end
    
    
    REGEX_PATTERN = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/
def is_email_valid? email
    if email =~REGEX_PATTERN
        true
    else
        false
    end
end
def is_nome_pessoa? nome
    if nome =~ /\A[a-zA-ZÀ-ú]+(?: [a-zA-ZÀ-ú]+)*\z/
        true
    else
        false
    end
end

def is_contato? telefone
    if telefone =~ /\A(?:\+?55)? ?(?:\(\d{2}\) ?)?(?:\d{4,5}-?\d{4})\z/
        true
    else
        false
    end
end
    

    
end







