module Rotatables

  def a_rotation
    shift_calculator
    @a_alpha_hash = Hash[@alphabet.zip(@alphabet.rotate(@a_shift))]
  end

  def b_rotation
    shift_calculator
    @b_alpha_hash = Hash[@alphabet.zip(@alphabet.rotate(@b_shift))]
  end

  def c_rotation
    shift_calculator
    @c_alpha_hash = Hash[@alphabet.zip(@alphabet.rotate(@c_shift))]
  end

  def d_rotation
    shift_calculator
    @d_alpha_hash = Hash[@alphabet.zip(@alphabet.rotate(@d_shift))]
  end

  def reverse_a
    @a_decrypt_hash = a_rotation.invert
  end

  def reverse_b
    @b_decrypt_hash = b_rotation.invert
  end

  def reverse_c
    @c_decrypt_hash = c_rotation.invert
  end

  def reverse_d
    @d_decrypt_hash = d_rotation.invert
  end

end
