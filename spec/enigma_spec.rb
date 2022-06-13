require './lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma1 = Enigma.new
  end

  it "exists" do
    expect(@enigma1).to be_a Enigma
  end

  it "can encrypt a message" do
    expect(@enigma1.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"})
  end

  it "can decrypt a message" do
    expect(@enigma1.decrypt("keder ohulw", "02715", "040895")).to eq({
      decryption: "hello world",
      key: "02715",
      date: "040895"})
  end

  it "can encrypt a message without being given" do
    encryption = @enigma1.encrypt("hello world", "02715")
    expect(encryption).to be_a(Hash)
    expect(encryption[:key]).to eq("02715")
    expect(encryption[:date]).to eq((Time.now).strftime("%d%m%y"))
  end
end
