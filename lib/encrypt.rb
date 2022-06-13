require_relative './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
key_input = ARGV[2]
date_input = ARGV[3]
decryption = enigma.decrypt(File.read(input).tr("\n", ""), key_input, date_input)
File.open(output, "w") do |file|
  file.puts decryption[:decryption]
  puts "create #{output} with the key #{decryption[:key]} and date #{decryption[:date]}"
end
