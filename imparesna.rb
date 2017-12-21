puts "Numero: "
num = gets.to_i()
parada = 0
impares = 0
puts "-------"

until parada == num
	impares += 1
	if impares % 2 == 0
		#pass

	else
		puts impares
		parada += 1
	end
end