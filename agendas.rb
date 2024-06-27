class Agendas
    def initialize
        @agendas = {}
    end

    def adicionar_agenda(agenda, nome_agenda)
        if(@agendas.key?(nome_agenda))
            puts "Agenda ja existe! Quer sobrescrever? (s/n)"
            escolha = gets.chomp
            if(escolha == "s")
                @agendas[nome_agenda] = agenda
            else
                puts "Escolha outro nome para a agenda!"
                nome_agenda = gets.chomp
                adicionar_agenda(agenda, nome_agenda)
            end
        
        else
            @agendas[nome_agenda] = agenda
        end
    end

end
