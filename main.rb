require_relative 'agenda'
require_relative 'contato'
agenda = Agenda.new
agenda2 = Agenda.new
agenda3 = Agenda.new
#agenda.arquivos
alefy = Contato.new("Alefy Almeida", "123456789", "w9nZS@example.com")
taisa = Contato.new("Taisa Almeida", "123456789", "w9nZS@example.com")
#agenda.arquivos
agenda.adicionar_contato(alefy)
agenda.adicionar_contato(taisa)
agenda.salvar_contatos("Alefy Almeida")

agenda2.adicionar_contato(alefy)
agenda2.adicionar_contato(taisa)
agenda2.salvar_contatos("cuscuz")

agenda2.adicionar_contato(alefy)
agenda2.adicionar_contato(taisa)
agenda2.salvar_contatos("Carne")
#agenda.arquivos