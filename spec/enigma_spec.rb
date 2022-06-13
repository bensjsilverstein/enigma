require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma1 = Enigma.new
  end

  it "exists" do
    expect(@enigma1).to be_a Enigma
  end

  # it "can encrypt a message" do
  #   expect(@enigma1.encrypt("hello world", "02715", "040895")).to eq({
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895")}
  # end
end
