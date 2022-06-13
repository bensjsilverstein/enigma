require './lib/shiftable'

class Encryptor
  include Shiftable
  attr_reader :message, :key, :date, :shift, :alphabet, :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(message, key = key_generator, date = date_to_number)
    @message = message
    @key = key
    @date = date.to_i
    @alphabet = ("a".."z").to_a << " "
    @a_shift = a_shift
    @b_shift = b_shift
    @c_shift = c_shift
    @d_shift = d_shift
    @encrypted_hash = {}
  end

  def key_generator
    ('%05d' % rand(10 ** 4))
  end

  def date_to_number
    @date = (Time.now).strftime("%d%m%y").to_i
    require "pry"; binding.pry
  end

  def shift_calculator
    last_four_digits = (@date**2).to_s[-4..-1]
    @a_key = @key[0..1].to_i
    @b_key = @key[1..2].to_i
    @c_key = @key[2..3].to_i
    @d_key = @key[3..4].to_i
    @a_offset = last_four_digits[0].to_i
    @b_offset = last_four_digits[1].to_i
    @c_offset = last_four_digits[2].to_i
    @d_offset = last_four_digits[3].to_i

    @a_shift = @a_key + @a_offset
    @b_shift = @b_key + @b_offset
    @c_shift = @c_key + @c_offset
    @d_shift = @d_key + @d_offset
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
    @encrypted_hash = {:encryption => encrypted.join, :key => @key, :date => @date}
  end

end
