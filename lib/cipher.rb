class Cipher
  attr_reader :alphabet, :key, :shift
  def initialize
    # @a_key = 0
    # @b_key = 0
    # @c_key = 0
    # @d_key = 0
    # @a_offset = 0
    # @b_offset = 0
    # @c_offset = 0
    # @d_offset = 0
    @shift = Hash.new(0)
    @date = (Time.now).strftime("%d%m%y").to_i
    @alphabet = ("a".."z").to_a << " "
    @key = '%05d' % rand(10 ** 4)
  end

  def key_generator
    # key_string = '%05d' % rand(5 ** 5)
    # @key = key_string.chars.map {|num|num.to_i}
    @a_key = @key[0..1].to_i
    @b_key = @key[1..2].to_i
    @c_key = @key[2..3].to_i
    @d_key = @key[3..4].to_i
  end

  def offset_generator
    last_four_digits = (@date**2).to_s[-4..-1]
    @a_offset = last_four_digits[0].to_i
    @b_offset = last_four_digits[1].to_i
    @c_offset = last_four_digits[2].to_i
    @d_offset = last_four_digits[3].to_i
  end

  def shift_calculator
    key_generator
    offset_generator
    @shift = {
      :A => (@a_key + @a_offset),
      :B => (@b_key + @b_offset),
      :C => (@c_key + @c_offset),
      :D => (@d_key + @d_offset)}
  end
end
