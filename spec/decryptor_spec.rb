require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
    @decryptor = Decryptor.new("keder ohulw", "02715", "040895")
  end

  it "exists" do
    expect(@decryptor).to be_a Decryptor
  end

  it "can convert a date to an integer" do
    expect(@decryptor.date_setup).to be_a(String)
    expect(@decryptor.date_setup.size).to eq(6)
  end

  it "can calculate shifts" do
    expect(@decryptor.shift_calculator).to be_a Integer
  end

  it "has an alphabet" do
    expect(@decryptor.alphabet).to be_a Array
    expect(@decryptor.alphabet.size).to eq 27
  end

  it "can generate a random 5 digit number" do
    expect(@decryptor.key).to be_a String
    expect(@decryptor.key.length).to eq 5
  end

  it "can encrypt" do
    # require "pry"; binding.pry
    expect(@decryptor.decrypt).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"})
    end




end
