require './lib/encryptor'

RSpec.describe Encryptor do
  before :each do
    @encryptor = Encryptor.new("hello world", "02715", "040895")
    @decryptor = Encryptor.new("keder ohulw", "02715", "040895")
  end

  it "exists" do
    expect(@encryptor).to be_a Encryptor
  end

  it "has a message" do
    expect(@encryptor.message).to eq "hello world"
  end

  it "has a key" do
    expect(@encryptor.key).to eq "02715"
  end

  it "has a date" do
    expect(@encryptor.date).to eq "040895"
  end

  it "has an array of characters to shift to" do
    expect(@encryptor.alphabet).to be_a Array
    expect(@encryptor.alphabet.size).to eq 27
  end

  it "can encrypt" do
    expect(@encryptor.encrypt).to eq({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"})
  end

  it "can decrypt" do
    expect(@decryptor.decrypt).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"})
  end
  # ====== Shiftables Module tests(below) ======
  it "can generate a key" do
    expect(@encryptor.key_generator).to be_a(String)
    expect(@encryptor.key_generator.length).to eq(5)
  end

  it "can convert a date to an integer" do
    expect(@encryptor.date_setup).to be_a(String)
    expect(@encryptor.date_setup.size).to eq(6)
  end

  it "can calculate shifts" do
    expect(@encryptor.shift_calculator).to be_a Integer
  end

  # ====== Rotatables Module tests(below) ======
  it "has rotated alphabets for encryption" do
    expect(@encryptor.a_rotation).to be_a Hash
    expect(@encryptor.a_rotation.first).to eq(["a", "d"])
    expect(@encryptor.a_rotation.count).to eq(27)

    expect(@encryptor.b_rotation).to be_a Hash
    expect(@encryptor.b_rotation.first).to eq(["a", "a"])
    expect(@encryptor.b_rotation.count).to eq(27)

    expect(@encryptor.c_rotation).to be_a Hash
    expect(@encryptor.c_rotation.first).to eq(["a", "t"])
    expect(@encryptor.c_rotation.count).to eq(27)

    expect(@encryptor.d_rotation).to be_a Hash
    expect(@encryptor.d_rotation.first).to eq(["a", "u"])
    expect(@encryptor.d_rotation.count).to eq(27)
  end

  it "has rotated alphabets for decryption" do
    expect(@encryptor.reverse_a).to be_a Hash
    expect(@encryptor.reverse_a.first).to eq(["d", "a"])
    expect(@encryptor.reverse_a.count).to eq(27)

    expect(@encryptor.reverse_b).to be_a Hash
    expect(@encryptor.reverse_b.first).to eq(["a", "a"])
    expect(@encryptor.reverse_b.count).to eq(27)

    expect(@encryptor.reverse_c).to be_a Hash
    expect(@encryptor.reverse_c.first).to eq(["t", "a"])
    expect(@encryptor.reverse_c.count).to eq(27)

    expect(@encryptor.reverse_d).to be_a Hash
    expect(@encryptor.reverse_d.first).to eq(["u", "a"])
    expect(@encryptor.reverse_d.count).to eq(27)
  end


end
