require './lib/decryptor'

RSpec.describe Decryptor do
  before :each do
    @decryptor = Decryptor.new("hello world", "02715", "040895")
  end

  it "exists" do
    expect(@decryptor).to be_a Decryptor
  end

  it "can generate a key" do
    expect(@decryptor.key_generator).to be_a(String)
    expect(@decryptor.key_generator.length).to eq(5)
  end

  it "can convert a date to an integer" do
    expect(@decryptor.date_to_number).to be_a(Integer)
    expect(@decryptor.date_to_number.length).to eq(8)
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
    expect(@decryptor.encrypt).to eq({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => 40895})
    end




end
@decryptor
