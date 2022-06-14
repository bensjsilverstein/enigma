require 'date'
require './lib/encryptor'

class Enigma
  include Rotatables, Shiftables

  def encrypt(message, key = key_generator, date = date_setup)
    @encryption = Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date = date_setup)
    @decryption = Encryptor.new(message, key, date).decrypt
  end

end
