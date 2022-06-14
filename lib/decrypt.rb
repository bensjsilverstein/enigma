require_relative './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]
decryption = enigma.decrypt(File.read(input).tr("\n", ""), "02715", "040895")
File.open(output, "w") do |file|
  file.write decryption[:decryption]
  puts "create #{output} with the key #{decryption[:key]} and date #{decryption[:date]}"
end
