require './lib/cipher'

RSpec.describe Cipher do

  it "exists" do
    cipher = Cipher.new
    expect(cipher).to be_a Cipher
  end

  it "has an alphabet" do
    cipher = Cipher.new
    expect(cipher.alphabet).to be_a Array
    expect(cipher.alphabet.size).to eq 27
  end

  it "can generate a random 5 digit number" do
    cipher = Cipher.new
    expect(cipher.key).to be_a String
    expect(cipher.key.length).to eq 5
  end

  it "can generate keys" do
    cipher = Cipher.new
    cipher.shift_calculator
    expect(cipher.shift_calculator).to be_a Hash
    expect(cipher.shift[:A]).to be_a Integer
  end

end
