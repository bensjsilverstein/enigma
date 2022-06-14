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
    expect(@encryptor.alphabet.size).to eq 27
  end

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

  it "has an alphabet" do
    expect(@encryptor.alphabet).to be_a Array
    expect(@encryptor.alphabet.size).to eq 27
  end

  it "can generate a random 5 digit number" do
    expect(@encryptor.key).to be_a String
    expect(@encryptor.key.length).to eq 5
  end

  it "can encrypt" do
    # require "pry"; binding.pry
    expect(@encryptor.encrypt).to eq({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"})
  end

  it "can decrypt" do
    # require "pry"; binding.pry
    expect(@decryptor.decrypt).to eq({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"})
  end

end
