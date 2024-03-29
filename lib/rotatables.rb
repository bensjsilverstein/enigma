module Rotatables

  def a_rotation
    shift_calculator
    Hash[@alphabet.zip(@alphabet.rotate(@a_shift))]
  end

  def b_rotation
    shift_calculator
    Hash[@alphabet.zip(@alphabet.rotate(@b_shift))]
  end

  def c_rotation
    shift_calculator
    Hash[@alphabet.zip(@alphabet.rotate(@c_shift))]
  end

  def d_rotation
    shift_calculator
    Hash[@alphabet.zip(@alphabet.rotate(@d_shift))]
  end

  def reverse_a
    a_rotation.invert
  end

  def reverse_b
    b_rotation.invert
  end

  def reverse_c
    c_rotation.invert
  end

  def reverse_d
    d_rotation.invert
  end
end
