require './lib/shiftables'
require './lib/rotatables'

class Encryptor
  include Rotatables, Shiftables
  attr_reader :message, :key, :date, :alphabet

  def initialize(message, key = key_generator, date = date_setup)
    @message = message.downcase
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt
    message_array = @message.downcase.chars
    encrypted = message_array.each_with_index.map do |char,i|
      if i % 4 == 0
        char = a_rotation[char]
      elsif i % 4 == 1
        char = b_rotation[char]
      elsif i % 4 == 2
        char = c_rotation[char]
      elsif i % 4 == 3
        char = d_rotation[char]
      end
    end
    encrypted_hash = {:encryption => encrypted.join, :key => @key, :date => @date}
  end

  def decrypt
    encrypted_array = @message.downcase.chars
    message = encrypted_array.each_with_index.map do |char,i|
      if i % 4 == 0
        char = reverse_a[char]
      elsif i % 4 == 1
        char = reverse_b[char]
      elsif i % 4 == 2
        char = reverse_c[char]
      elsif i % 4 == 3
        char = reverse_d[char]
      end
    end
    decrypted_hash = {:decryption => message.join, :key => @key, :date => @date}
  end

end
