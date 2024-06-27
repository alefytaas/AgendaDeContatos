require_relative 'contato'
require_relative 'agendas'
class Agenda
    def initialize(identificador = nil)
        @contatos = []
        @nome_agendas = {}
        recupera_agendas
        if identificador != nil
            carregar_agendas(identificador)
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
            puts "Identificador já existente! Deseja deseja substituir? S/N"
            escolha = gets.chomp

            return
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

    

    def carregar_agendas(identificador)
        if(@nome_agendas.key?(identificador))
            carregar_contatos(@nome_agendas[identificador])
        else
            puts "Agenda nao encontrada"
        end
    end

    private
    def salvar_agenda( nome_agenda, agenda)
        agendas = "./arquivos/.agendas.txt"
        if File.exist?(agendas)
            if File.zero?(agendas)
                File.open(agendas, "w") do |f|
                   f.puts "Nome: #{nome_agenda} - agenda: #{agenda}"
                end
            else
                File.open(agendas, "a") do |f|
                   f.puts "Nome: #{nome_agenda} - agenda: #{agenda}"
                end

            end
        else
            File.open(agendas, "w") do |f|
                f.puts "Nome: #{nome_agenda} - agenda: #{agenda}"
            end
        end

    end
    def carregar_contatos(nome_agenda)
        File.open("./arquivos/" + nome_agenda, "r") do |f|
            f.each_line do |contato|
                contato = contato.split(" - ", 3)
                cont = Contato.new(contato[0].sub("Nome: ", ""), contato[1].sub("Numero: ", ""), contato[2].sub("Email: ", ""))
                @contatos << cont
            end
        end

    end
    def recupera_agendas
        if File.exist?("./arquivos/.agendas.txt")
            File.open("./arquivos/.agendas.txt", "r") do |f|
                f.each_line do |agenda|
                    agenda = agenda.split(" - ", 2)
                    @nome_agendas[agenda[0].sub("Nome: ", "")] = agenda[1].sub("agenda: ", "")
                end
            end
        end
    end
        
    
end







