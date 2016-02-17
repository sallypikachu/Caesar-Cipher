module SecretMessage
  def encrypt_message(message)
    message.tr(@key, @codec)
  end

  def decrypt_message(message)
    message.tr(@codec, @key)
  end
end

class CaesarCipher
  ALPHABET = ('a'..'z').to_a

  def initialize(shift)
    @key = 'a-zA-Z'
    @shifted = ALPHABET.rotate(shift).join
    @codec = @shifted + @shifted.upcase
  end

  include SecretMessage
end

class ComputerCipher
  ASCII = ('!'..'~').to_a

  def initialize(shift)
    @key = ASCII.join
    @codec = ASCII.rotate(shift).join
  end

  include SecretMessage
end

caesar = CaesarCipher.new(2)
puts caesar.encrypt_message("Hi Larry!")
puts caesar.decrypt_message(caesar.encrypt_message("Thanks for taking the time"))

computer = ComputerCipher.new(3)
puts computer.encrypt_message("to go through this interview process with me!")
puts computer.decrypt_message(computer.encrypt_message("Cypher!!"))
