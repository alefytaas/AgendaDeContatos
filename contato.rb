class Contato
    
  def initialize(nome, numero, email)
    @nome = nome
    @numero = numero
    @email = email
  end
def to_s
    "Nome: #{@nome} - Numero: #{@numero} - Email: #{@email}"
end



end
