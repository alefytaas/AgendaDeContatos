require_relative 'agenda'
require_relative 'contato'
agenda = Agenda.new

alefy = Contato.new("Alefy Almeida", "123456789", "w9nZS@example.com")
taisa = Contato.new("Taisa Almeida", "123456789", "w9nZS@example.com")

agenda.adicionar_contato(alefy)
agenda.adicionar_contato(taisa)
agenda.salvar_contatos("Alefy Almeida")
