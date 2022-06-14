module Shiftables

  def key_generator
    ('%05d' % rand(10 ** 4))
  end

  def date_setup
    @date = (Time.now).strftime("%d%m%y")
  end

  def key_calculator
    @a_key = @key[0..1].to_i
    @b_key = @key[1..2].to_i
    @c_key = @key[2..3].to_i
    @d_key = @key[3..4].to_i
  end

  def offset_calculator
    last_four_digits = (@date.to_i**2).to_s[-4..-1]
    @a_offset = last_four_digits[0].to_i
    @b_offset = last_four_digits[1].to_i
    @c_offset = last_four_digits[2].to_i
    @d_offset = last_four_digits[3].to_i
  end

  def shift_calculator
    key_calculator
    offset_calculator
    @a_shift = @a_key + @a_offset
    @b_shift = @b_key + @b_offset
    @c_shift = @c_key + @c_offset
    @d_shift = @d_key + @d_offset
  end

end
