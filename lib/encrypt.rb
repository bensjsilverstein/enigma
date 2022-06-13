require_relative './enigma'
enigma = Enigma.new
input = ARGV[0]
output = ARGV[1]
encryption = enigma.encrypt(File.read(input).tr("\n", ""), "02715", "040895")
File.open(output, "w") do |file|
  file.puts encryption[:encryption]
  puts "create #{output} with the key #{encryption[:key]} and date #{encryption[:date]}"
end
