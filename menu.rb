    require_relative 'agenda'
    def menu
        conue = true
        puts "Você já tem uma agenda? S/N"
        escolha = gets.chomp
        if(escolha == "N" || escolha == "n")
            agenda = Agenda.new
            puts "Qual o nome da agenda que deseja criar?"
            nome_de_agenda = gets.chomp
        else
            puts "Qual o nome da agenda que deseja utilizar?"
            nome_de_agenda = gets.chomp
            agenda = Agenda.new
            agenda.carregar_agenda(nome_de_agenda)
        end
        while conue
            puts "\n MENU \n"
            puts "1 - Adicionar Contato"
            puts "2 - Listar Contatos"
            puts "3 - Salvar Contatos"
            puts "4 - Sair"
            opcao = gets.chomp.to_i

            case opcao
          
            when  1
                puts "Qual o nome do contato?"
                nome = gets.chomp
                puts "Qual o telefone do contato?"
                telefone = gets.chomp
                puts "Qual o email do contato?"
                email = gets.chomp
                agenda.adicionar_contato(Contato.new(nome, telefone, email))
            when 2
                puts agenda.listar_contatos
            when 3
                agenda.salvar_contatos(nome_de_agenda)
            when 4
                conue = false
            end 
              
              
        
        end
    end