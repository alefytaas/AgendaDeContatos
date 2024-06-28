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

agenda3.adicionar_contato(alefy)
agenda3.adicionar_contato(taisa)
agenda3.salvar_contatos("Carne")

#recuperar agenda existente
teste = Agenda.new
teste.carregar_agenda("Carne")
puts teste.listar_contatos

