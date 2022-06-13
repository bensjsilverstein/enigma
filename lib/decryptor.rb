require './lib/shiftable'

class Decryptor
  include Shiftable
  attr_reader :message, :key, :date, :shift, :alphabet, :a_shift, :b_shift, :c_shift, :d_shift

  def initialize(encrypted_message, key, date = date_setup)
    @encrypted_message = encrypted_message.downcase
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @a_shift = a_shift
    @b_shift = b_shift
    @c_shift = c_shift
    @d_shift = d_shift
    @decrypted_hash = {}
  end

  def date_setup
    @date = (Time.now).strftime("%d%m%y")
  end

  def decrypt
    encrypted_array = @encrypted_message.downcase.chars
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
    @encrypted_hash = {:decryption => message.join, :key => @key, :date => @date}
  end

  def shift_calculator
    last_four_digits = (@date.to_i**2).to_s[-4..-1]
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


end
