require 'date'
require './lib/encryptor'
require './lib/decryptor'

class Enigma

  def encrypt(message, key = key_generator, date = date_setup)
    @encryption = Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key = key_generator, date = date_setup)
    @decryption = Decryptor.new(message, key, date).decrypt
  end

  def date_setup
    @date = (Time.now).strftime("%d%m%y")
  end



end
