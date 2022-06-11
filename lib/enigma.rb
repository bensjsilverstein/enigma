require 'date'

class Enigma

  def initialize
  end


  def encrypt(message, date = nil, key)
    encryption_hash = {
      [:message] = message
      [:date] = date
      [:key] = key}

  end



end
