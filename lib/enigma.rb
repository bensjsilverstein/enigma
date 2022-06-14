require 'date'
require './lib/encryptor'

class Enigma
  include Rotatables, Shiftables

  def initialize

  end

  def encrypt(message, key = key_generator, date = date_setup)
    @encryption = Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key = key_generator, date = date_setup)
    @decryption = Encryptor.new(message, key, date).decrypt
  end

  def date_setup
    @date = (Time.now).strftime("%d%m%y")
  end



end
