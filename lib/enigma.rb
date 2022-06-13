require 'date'
require './lib/encryptor'
require './lib/decryptor'

class Enigma

  def encrypt(message, key, date)
    @encryption = Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date)
    @decryption = Decryptor.new(message, key, date).decrypt
  end



end
