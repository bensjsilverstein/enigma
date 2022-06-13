require 'date'
require './lib/encryptor'

class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    @encrption = Encryptor.new(message, key, date).encrypt
  end



end
