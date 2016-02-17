require 'pry'

def encrypt_message(key, message)
  encrypted_message = ''
  message.split("").each do |letter|
    encrypted_message += (letter.ord + key).chr
  end
  encrypted_message
end

puts encrypt_message(1, "Hi. My name is Sally!")
