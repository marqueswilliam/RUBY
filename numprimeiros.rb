soma = 0

puts "Numero: "
num = gets.to_i
puts "-------"
(1..num).each do |x|
	soma = soma + x
end
puts "#{soma}"