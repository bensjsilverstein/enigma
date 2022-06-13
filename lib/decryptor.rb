class Decryptor
  include Shiftable

  def initialize(encrypted_message, key, date = date_to_number)
    @encrypted_message = encrypted_message
    @key = key
    @date = date.to_i
    @alphabet = ("a".."z").to_a << " "
    @a_shift = a_shift
    @b_shift = b_shift
    @c_shift = c_shift
    @d_shift = d_shift
    @decrypted_hash = {}
  end

  def date_to_number
    @date = (Time.now).strftime("%d%m%y").to_i
    require "pry"; binding.pry
  end

  def decrypt
    encrypted_array = @encrypted_message.downcase.chars
    message = encrypted_array.each_with_index.map do |char,i|
      if i % 4 == 0
        char = @a_decrypt_hash[char]
      elsif i % 4 == 1
        char = @b_decrypt_hash[char]
      elsif i % 4 == 2
        char = @c_decrypt_hash[char]
      elsif i % 4 == 3
        char = @d_decrypt_hash[char]
      end
    end
    @encrypted_hash = {:encryption => message.join, :key => @key, :date => @date}
  end


end
